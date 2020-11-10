<?php

namespace App\Controllers\User;

use App\Controllers\UserController;
use App\Services\Auth;
use App\Services\Config;
use App\Models\{
    Node,
    User,
    Relay
};
use App\Utils\{
    URL,
    Tools,
    Radius,
    DatatablesHelper
};
use Slim\Http\{
    Request,
    Response
};
use Psr\Http\Message\ResponseInterface;

/**
 *  User NodeController
 */
class NodeController extends UserController
{
    /**
     * @param Request   $request
     * @param Response  $response
     * @param array     $args
     */
    public function node($request, $response, $args): ResponseInterface
    {
        $user        = $this->user;
        $nodes       = Node::where('type', 1)->orderBy('node_class')->orderBy('name')->get();
        $relay_rules = Relay::where('user_id', $this->user->id)->orwhere('user_id', 0)->orderBy('id', 'asc')->get();

        if (!Tools::is_protocol_relay($user)) {
            $relay_rules = [];
        }

        $db = new DatatablesHelper();
        $infoLogs = $db->query('SELECT * FROM ( SELECT * FROM `ss_node_info` WHERE log_time > ' . (time() - 300) . ' ORDER BY id DESC LIMIT 999999999999 ) t GROUP BY node_id ORDER BY id DESC');
        $onlineLogs = $db->query('SELECT * FROM ( SELECT * FROM `ss_node_online_log` WHERE log_time > ' . (time() - 300) . ' ORDER BY id DESC LIMIT 999999999999 ) t GROUP BY node_id ORDER BY id DESC');

        $array_nodes = [];
        $nodes_muport = [];

        foreach ($nodes as $node) {
            if ($user->is_admin == 0 && $node->node_group != $user->node_group && $node->node_group != 0) {
                continue;
            }

            if ($node->sort == 9) {
                $mu_user             = User::where('port', '=', $node->server)->first();
                $mu_user->obfs_param = $this->user->getMuMd5();
                $nodes_muport[]      = ['server' => $node, 'user' => $mu_user];
                continue;
            }

            $array_node               = [];
            $array_node['raw_node']   = $node;
            $array_node['id']         = $node->id;
            $array_node['class']      = $node->node_class;
            $array_node['name']       = $node->name;
            $array_node['sort']       = $node->sort;
            $array_node['info']       = $node->info;
            $array_node['mu_only']    = $node->mu_only;
            $array_node['group']      = $node->node_group;

            if ($node->sort == 13) {
                $server = Tools::ssv2Array($node->server);
                $array_node['server'] = $server['add'];
            } else {
                $array_node['server'] = $node->getServer();
            }

            $regex = $_ENV['flag_regex'];
            $matches = [];
            preg_match($regex, $node->name, $matches);
            if (isset($matches[0])) {
                $array_node['flag'] = $matches[0] . '.png';
            } else {
                $array_node['flag'] = 'unknown.png';
            }

            $array_node['online_user'] = 0;

            foreach ($onlineLogs as $log) {
                if ($log['node_id'] != $node->id) {
                    continue;
                }
                if (in_array($node->sort, array(0, 7, 8, 10, 11, 12, 13, 14))) {
                    $array_node['online_user'] = $log['online_user'];
                } else {
                    $array_node['online_user'] = -1;
                }
                break;
            }

            // check node status
            // 0: new node; -1: offline; 1: online
            $node_heartbeat = $node->node_heartbeat + 300;
            $array_node['online'] = -1;
            if (!in_array($node->sort, array(0, 7, 8, 10, 11, 12, 13, 14)) || $node_heartbeat == 300) {
                $array_node['online'] = 0;
            } elseif ($node_heartbeat > time()) {
                $array_node['online'] = 1;
            }

            $array_node['latest_load'] = -1;
            foreach ($infoLogs as $log) {
                if ($log['node_id'] == $node->id) {
                    $array_node['latest_load'] = (explode(' ', $log['load']))[0] * 100;
                    break;
                }
            }

            $array_node['traffic_used'] = (int) Tools::flowToGB($node->node_bandwidth);
            $array_node['traffic_limit'] = (int) Tools::flowToGB($node->node_bandwidth_limit);
            if ($node->node_speedlimit == 0.0) {
                $array_node['bandwidth'] = 0;
            } elseif ($node->node_speedlimit >= 1024.00) {
                $array_node['bandwidth'] = round($node->node_speedlimit / 1024.00, 1) . 'Gbps';
            } else {
                $array_node['bandwidth'] = $node->node_speedlimit . 'Mbps';
            }

            $array_node['traffic_rate'] = $node->traffic_rate;
            $array_node['status']       = $node->status;

            $array_nodes[] = $array_node;
        }

        return $response->write(
            $this->view()
                ->assign('nodes', $array_nodes)
                ->assign('nodes_muport', $nodes_muport)
                ->assign('relay_rules', $relay_rules)
                ->assign('relay_rule', null)
                ->assign('tools', new Tools())
                ->assign('user', $user)
                ->assign('class_left_days', floor((strtotime($this->user->class_expire)-time())/86400)+1)->assign('time', date("Y-m-d H:i:s",time()))
                ->registerClass('URL', URL::class)
                ->display('user/node.tpl')
        );
    }

    public function nodeOld($request, $response, $args)
    {
        $user = Auth::getUser();
        $region = $request->getParam('country');
        $describe = $request->getParam('tag');

        function country_code($code){
            $index = array('us'=>'美国',
                'ca' => '加拿大',
                'hk'=>'香港',
                'nl'=>'荷兰',
                'sg'=>'新加坡',
                'jp'=>'日本',
                'ro'=>'罗马',
                'cn'=>'回国',
                'au'=>'澳大利亚',
                'id'=>'印尼',
                'tw'=>'台湾',
                'ph'=>'菲律宾',
                'mo'=>'澳门',
                'ru'=>'俄罗斯',
                'kr'=>'韩国',
                'my'=>'马来西亚',
                'de'=>'德国',
                'fr'=>'法国',
                'gb'=>'英国',
                'in'=>'印度',
                'vn'=>'越南');
            $name = $index[$code];
            if (empty($name)) {
                return null;
            }
            return $name;
        }



        if ($describe == '') {
            $describe = 'all';
        }
        if ($region == '') {
            $region = 'all';
        } else {
            $region = country_code($region);
        }
        $nodes = Node::where('type', 1)->orderBy('node_class')->get();
        $relay_rules = Relay::where('user_id', $this->user->id)->orwhere('user_id', 0)->orderBy('id', 'asc')->get();
        if (!Tools::is_protocol_relay($user)) {
            $relay_rules = array();
        }

        $array_nodes = array();
        $nodes_muport = array();
        $db = new DatatablesHelper();
        $infoLogs = $db->query('SELECT * FROM ( SELECT * FROM `ss_node_info` WHERE log_time > ' . (time() - 300) . ' ORDER BY id DESC LIMIT 999999999999 ) t GROUP BY node_id ORDER BY id DESC');
        $onlineLogs = $db->query('SELECT * FROM ( SELECT * FROM `ss_node_online_log` WHERE log_time > ' . (time() - 300) . ' ORDER BY id DESC LIMIT 999999999999 ) t GROUP BY node_id ORDER BY id DESC');

        foreach ($nodes as $node) {
            if ($user->is_admin == 0 && $node->node_group != $user->node_group && $node->node_group != 0) {
                continue;
            }
            if ($node->sort == 9) {
                $mu_user = User::where('port', '=', $node->server)->first();
                $mu_user->obfs_param = $this->user->getMuMd5();
                $nodes_muport[] = array('server' => $node, 'user' => $mu_user);
                continue;
            }
            if ($region !== 'all' || $describe !== 'all') {
                if (strpos($node->name,$region) === false and strpos($node->info,$describe) === false) {
                    continue;
                }
            }

            $array_node = array();

            $array_node['id']=$node->id;
            $array_node['class']=$node->node_class;
            $array_node['name']=$node->name;
            if ($node->sort == 13) {
                $server = Tools::ssv2Array($node->server);
                $array_node['server'] = $server['add'];
            } else {
                $array_node['server'] = $node->server;
            }
            $array_node['sort']=$node->sort;
            $array_node['info']=$node->info;
            $array_node['mu_only']=$node->mu_only;
            $array_node['group']=$node->node_group;

            $array_node['raw_node'] = $node;
            $regex = Config::get('flag_regex');
            $matches = array();
            preg_match($regex, $node->name, $matches);
            if (isset($matches[0])) {
                $array_node['flag'] = $matches[0] . '.png';
            } else {
                $array_node['flag'] = 'unknown.png';
            }

            $sort = $array_node['sort'];
            $array_node['online_user'] = 0;

            foreach ($onlineLogs as $log) {
                if ($log['node_id'] != $node->id) {
                    continue;
                }
                if (in_array($sort, array(0, 7, 8, 10, 11, 12, 13))) {
                    $array_node['online_user'] = $log['online_user'];
                } else {
                    $array_node['online_user'] = -1;
                }
                break;
            }

            // check node status
            // 0: new node; -1: offline; 1: online
            $node_heartbeat = $node->node_heartbeat + 300;
            $array_node['online'] = -1;
            if (!in_array($sort, array(0, 7, 8, 10, 11, 12, 13)) || $node_heartbeat == 300 ) {
                $array_node['online'] = 0;
            } elseif ($node_heartbeat > time()) {
                $array_node['online'] = 1;
            }

            $array_node['latest_load'] = -1;
            foreach ($infoLogs as $log) {
                if ($log['node_id'] == $node->id) {
                    $array_node['latest_load'] = (explode(' ', $log['load']))[0] * 100;
                    break;
                }
            }

            $array_node['traffic_used'] = (int)Tools::flowToGB($node->node_bandwidth);
            $array_node['traffic_limit'] = (int)Tools::flowToGB($node->node_bandwidth_limit);
            if ($node->node_speedlimit == 0.0) {
                $array_node['bandwidth'] = 0;
            } elseif ($node->node_speedlimit >= 1024.00) {
                $array_node['bandwidth'] = round($node->node_speedlimit / 1024.00, 1) . 'Gbps';
            } else {
                $array_node['bandwidth'] = $node->node_speedlimit . 'Mbps';
            }

            $array_node['traffic_rate'] = $node->traffic_rate;
            $array_node['status'] = $node->status;

            $array_nodes[] = $array_node;
        }
        return $this->view()
            ->assign('nodes', $array_nodes)
            ->assign('nodes_muport', $nodes_muport)
            ->assign('relay_rules', $relay_rules)
            ->assign('relay_rule', null)
            ->assign('tools', new Tools())
            ->assign('user', $user)
            ->assign('class_left_days', floor((strtotime($this->user->class_expire)-time())/86400)+1)->assign('time', date("Y-m-d H:i:s",time()))
            ->registerClass('URL', URL::class)
            ->display('user/node.tpl');
    }

    /**
     * @param Request   $request
     * @param Response  $response
     * @param array     $args
     */
    public function nodeAjax($request, $response, $args): ResponseInterface
    {
        $id           = $args['id'];
        $point_node   = Node::find($id);
        $prefix       = explode(' - ', $point_node->name);
        return $response->write(
            $this->view()
                ->assign('point_node', $point_node)
                ->assign('prefix', $prefix[0])
                ->assign('id', $id)
                ->display('user/nodeajax.tpl')
        );
    }

    /**
     * @param Request   $request
     * @param Response  $response
     * @param array     $args
     */
    public function nodeInfo($request, $response, $args)
    {
        $user          = $this->user;
        $id            = $args['id'];
        $mu            = $request->getQueryParams()['ismu'];
        $relay_rule_id = $request->getQueryParams()['relay_rule'];
        $node          = Node::find($id);
        if ($node == null) {
            return null;
        }

        switch ($node->sort) {
            case 0:
                if ((($user->class >= $node->node_class && ($user->node_group == $node->node_group || $node->node_group == 0)) || $user->is_admin) && ($node->node_bandwidth_limit == 0 || $node->node_bandwidth < $node->node_bandwidth_limit)) {
                    return $this->view()->assign('node', $node)->assign('user', $user)
                        ->assign('mu', $mu)->assign('relay_rule_id', $relay_rule_id)
                        ->registerClass('URL', URL::class)
                        ->display('user/nodeinfo.tpl');
                }
                break;
            case 1:
                if ($user->class >= $node->node_class && ($user->node_group == $node->node_group || $node->node_group == 0)) {
                    $email = $this->user->email;
                    $email = Radius::GetUserName($email);
                    $json_show = 'VPN 信息<br>地址：' . $node->server . '<br>' . '用户名：' . $email . '<br>密码：' . $this->user->passwd . '<br>支持方式：' . $node->method . '<br>备注：' . $node->info;

                    return $this->view()->assign('json_show', $json_show)->display('user/nodeinfovpn.tpl');
                }
                break;
            case 2:
                if ($user->class >= $node->node_class && ($user->node_group == $node->node_group || $node->node_group == 0)) {
                    $email = $this->user->email;
                    $email = Radius::GetUserName($email);
                    $json_show = 'SSH 信息<br>地址：' . $node->server . '<br>' . '用户名：' . $email . '<br>密码：' . $this->user->passwd . '<br>支持方式：' . $node->method . '<br>备注：' . $node->info;

                    return $this->view()->assign('json_show', $json_show)->display('user/nodeinfossh.tpl');
                }
                break;
            case 5:
                if ($user->class >= $node->node_class && ($user->node_group == $node->node_group || $node->node_group == 0)) {
                    $email = $this->user->email;
                    $email = Radius::GetUserName($email);

                    $json_show = 'Anyconnect 信息<br>地址：' . $node->server . '<br>' . '用户名：' . $email . '<br>密码：' . $this->user->passwd . '<br>支持方式：' . $node->method . '<br>备注：' . $node->info;

                    return $this->view()->assign('json_show', $json_show)->display('user/nodeinfoanyconnect.tpl');
                }
                break;
            case 10:
                if ((($user->class >= $node->node_class && ($user->node_group == $node->node_group || $node->node_group == 0)) || $user->is_admin) && ($node->node_bandwidth_limit == 0 || $node->node_bandwidth < $node->node_bandwidth_limit)) {
                    return $this->view()->assign('node', $node)->assign('user', $user)->assign('mu', $mu)->assign('relay_rule_id', $relay_rule_id)->registerClass('URL', URL::class)->display('user/nodeinfo.tpl');
                }
                break;
            case 13:
                if ((($user->class >= $node->node_class && ($user->node_group == $node->node_group || $node->node_group == 0)) || $user->is_admin) && ($node->node_bandwidth_limit == 0 || $node->node_bandwidth < $node->node_bandwidth_limit)) {
                    return $this->view()->assign('node', $node)->assign('user', $user)->assign('mu', $mu)->assign('relay_rule_id', $relay_rule_id)->registerClass('URL', URL::class)->display('user/nodeinfo.tpl');
                }
                break;
            default:
                echo '微笑';
        }
    }
}

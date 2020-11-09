<?php

/*

	   ____   U  ___ u   U  ___ u   _
	U /"___|   \/"_ \/    \/"_ \/  |"|
	\| | u     | | | |    | | | |U | | u
	 | |/__.-,_| |_| |.-,_| |_| | \| |/__
	  \____|\_)-\___/  \_)-\___/   |_____|
	 _// \\      \\         \\     //  \\
	(__)(__)    (__)       (__)   (_")("_)


	  by @悟空 https://t.me/Cool_WuKong

*/


####### 主题版本 #######
$Cool_Config['Cool_js_version'] = 'v1'; 		// 可随便写，每次获得最新授权文件就改变这个值进行强制缓存刷新，避免旧的浏览器缓存继续生效
$Cool_Config['theme_style_color'] = 'cyan';		// 主题配色选项，可选择：purple（紫色）、red（红色）、cyan（青色）、green（绿色）、dark（黑色）
$Cool_Config['layout_typer'] = 'rightVertical';		// 主题布局样式，可选：rightVertical 或 Horizontal

####### 首页 #######
$Cool_Config['subscribe_type'] = ['ss','ssr','v2ray'];    // 'ss','ssr','v2ray' 选择网站支持的代理协议，会影响复制订阅链接和一键导入按钮的显示，若无ss，则不显示相关ss订阅


$Cool_Config['show_share'] = true;   // 是否显示共享账号
$Cool_Config['share_account'] = [    // 一个array为一个共享账号
    'ID 1' => [
        array(
            'account' => 'Wukong',	//帐号
            'passwd' => 'Wukong',	//密码
            'class' => 3			//用户等级要求

        )
    ],
];


####### 会员注册 #######
$Cool_Config['enable_register_email_restrict'] = false;    // 设置为true时，会限制注册时使用的邮箱后缀
$Cool_Config['register_email_white_list'] = ['@outlook.com','@163.com','@126.com','@yeah.net','@foxmail.com','@qq.com','@gmail.com'];   // 注册邮箱后缀白名单，仅在上面的设置为true时生效
$Cool_Config['register_email_black_list'] = ['@bcaoo.com','@chacuo.net','@tmpmail.net','@tmail.ws','@tmpmail.org','@moimoi.re','@bccto.me','@027168.com','@disbox.org','@linshiyouxiang.net','@t.odmail.cn','@tmails.net','@moakt.co','@moakt.ws','@disbox.net','@bareed.ws'];   // 注册邮箱后缀黑名单


####### 商店 #######
$Cool_Config['enable_shop_trail'] = true;   // 商店是否显示新用户试用计划,只有在用户等级小于等于0的情况下才会显示
$Cool_Config['shop_trail_shopid'] = '4';   // 试用计划的商品ID

$Cool_Config['plan_1_enable'] = true;    // 是否显示第一个商品计划
$Cool_Config['plan_1_name'] = '月付';    // 第一个商品计划的名字

$Cool_Config['plan_2_enable'] = true;    // 是否显示第二个商品计划
$Cool_Config['plan_2_name'] = '半年付';    // 第二个商品计划的名字

$Cool_Config['plan_3_enable'] = true;    // 是否显示第三个商品计划
$Cool_Config['plan_3_name'] = '年付';    // 第三个商品计划的名字

$Cool_Config['plan_4_enable'] = false;    // 是否显示第四个商品计划
$Cool_Config['plan_4_name'] = '定制';  // 第四个商品计划的名字

$Cool_Config['shops_price'] = [			//最多可设置四个商品计划，在这里需要你设置对应的商品ID，每个商品计划可自行配置
  'plan_1' => [				//代表第一个商品计划，如果未开启第一个计划，请删除这段代码
    'p1_price_1'=>'1',		//代表第一个商品计划中的商品id
    'p1_price_2'=>'',
    'p1_price_3'=>''
	],
  'plan_2' => [
    'p2_price_1'=>'2',
    'p2_price_2'=>'',
    'p2_price_3'=>''
	],
  'plan_3' => [
    'p3_price_1'=>'3',
    'p3_price_2'=>'',
    'p3_price_3'=>''
	]
];


$Cool_Config['shop_enable_traffic_package'] = true;   // 商店是否显示流量叠加包的选项（仅在用户购买过商品后才会显示）
$Cool_Config['shop_traffic_package'] = '0.5';		// 1G 流量多少元

$Cool_Config['quantit_show'] = true; 			// 商店是否显示按量付费的选项
$Cool_Config['quantit_money'] = '1'; 			// 每使用1G流量扣多少元
$Cool_Config['quantit_class'] = '1'; 			// 按量等级设置
$Cool_Config['quantit_connector'] = '2';		// 按量设备数
$Cool_Config['quantit_speedlimit'] = '100.00'; 	// 按量端口速率 格式100.00


####### 通用设置 #######
$Cool_Config['enable_telegram_button'] = true;    		// 是否显示侧边栏 Telegram 按钮
$Cool_Config['telegram_group_link'] = '##';   			// Telegram 按钮的链接
$Cool_Config['enable_tencent_button'] = false;    		// 是否显示侧边栏 QQ群 按钮
$Cool_Config['tencent_group_link'] = '##';   			// QQ 按钮的链接


####### 在线客服系统 #######
// Crisp客服 配置
$Cool_Config['enable_crisp'] = false;   // 是否启用 Crisp 在线客服系统 https://crisp.chat
$Cool_Config['enable_crisp_outside'] = false;   // 是否对未登录的用户也启用 Crisp，设置为 false 的话，着陆页和登录/注册等页面不会显示 Crisp，同时对 Chatra 也是生效的
$Cool_Config['crisp_wesite_id'] = '';    // Crisp 的网站ID，格式为 '18b46e92-eb21-76d3-bfb7-8f2ae9adba64'

// Chatra客服 配置
$Cool_Config['enable_chatra'] = false;    // 是否启用 Chatra 在线客服系统 https://chatra.io
$Cool_Config['chatra_id'] = '';    // Chatra 的 ChatraID，可以在 Chatra 提供的网站代码里找到


####### 节点列表 #######
$Cool_Config['show_node_load'] = true;  		// 是否显示节点的负载
$Cool_Config['show_online_user'] = true;		// 是否显示节点的在线人数
$Cool_Config['show_node_traffic_rate'] = true;  // 是否显示节点的流量倍率
$Cool_Config['show_node_speedlimit'] = true;	// 是否显示节点的限速

$Cool_Config['show_welfare_nodes'] = true;  // 是否显示公益节点
$Cool_Config['show_one_nodes'] = true;  	// 是否显示VIP1 节点
$Cool_Config['show_two_nodes'] = true;  	// 是否显示VIP2 节点
$Cool_Config['show_three_nodes'] = true;  	// 是否显示VIP3 节点

$Cool_Config['show_node_select'] = true;		// 是否开启节点筛选
$Cool_Config['node_select'] = [  				// 节点标签，一个array为一个标签，若不开启节点筛选则无效
    array(
    	'id' => '2',							// 序号，从2开始，按递增的顺序填写即可
      	'label' => 'IPLC',						// 节点标签，通过节点备注来识别
    ),
    array(
    	'id' => '3',
      	'label' => 'Netflix',
    ),
    array(
    	'id' => '4',
      	'label' => 'Game',
    )

];

/*
'美国'=>'us'	'香港'=>'hk'	'荷兰'=>'nl'
'新加'=>'sg'	'日本'=>'jp'	'罗马'=>'ro'
'回国'=>'cn'	'中国'=>'cn'	'澳大'=>'au'
'台湾'=>'tw'	'菲律'=>'ph'	'澳门'=>'mo'
'俄罗'=>'ru'	'韩国'=>'kr'	'马来'=>'my'
'德国'=>'de'	'英国'=>'gb'	'法国'=>'fr'
'越南'=>'vn'	'印度'=>'in'	'印尼'=>'id'
*/
$Cool_Config['node_label'] = [  				// 节点页面国家选择项，一个array代表一个国家，需输入英文缩写及中文，上面有对应表
    array(
    	'en' => 'hk',							// 英文缩写
      	'label' => '香港',						// 中文
    ),
    array(
    	'en' => 'tw',
      	'label' => '台湾',
    ),
    array(
        'en' => 'ca',
        'label' => '加拿大',
    ),
    array(
    	'en' => 'us',
      	'label' => '美国',
    ),
    array(
    	'en' => 'jp',
      	'label' => '日本',
    ),
    array(
    	'en' => 'kr',
      	'label' => '韩国',
    ),
    array(
    	'en' => 'de',
      	'label' => '德国',
    ),
    array(
    	'en' => 'fr',
      	'label' => '法国',
    ),
    array(
    	'en' => 'ru',
      	'label' => '俄罗斯',
    ),
    array(
    	'en' => 'cn',
      	'label' => '回国',
    )

];


####### 节点设置 #######
$Cool_Config['show_protocol'] = true;   // 是否允许用户自定义混淆和协议
$Cool_Config['show_method'] = true;    // 是否允许用户自定义加密方式
$Cool_Config['show_reset_port'] = true;   // 是否允许用户重置端口设置，.config.php里的 port_price （重置端口价格）为负数则不显示的。
$Cool_Config['show_specify_port'] = true;   // 是否显示重置端口设置，.config.php里的 port_price_specify （钦定端口价格）为负数的话是不会显示的。


?>

<!DOCTYPE html>
<html lang="zh-CN">
 <head> 
  <title>Shadowrocket 使用教程 — {$config['appName']}</title> 
  <meta charset="UTF-8" /> 
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no" />
 </head>
 <body>
   {include file='user/header_info.tpl'} 
  <!-- 开始:3:页中 --> 
     <!-- 开始:3:页中 --> 
     <div class="kt-body kt-grid__item kt-grid__item--fluid kt-grid kt-grid--hor kt-grid--stretch" id="kt_body"> 
      <div class="kt-content kt-content--fit-top  kt-grid__item kt-grid__item--fluid kt-grid kt-grid--hor" id="kt_content"> 
       <!-- 开始:4:副标题 --> 
       <div class="kt-subheader kt-grid__item" id="kt_subheader"> 
        <div class="kt-container "> 
         <!-- 开始:5:副标题名称 --> 
         <div class="kt-subheader__main"> 
          <h3 class="kt-subheader__title" id="subtitle">Shadowrocket 使用教程</h3> 
         </div> 
         <!-- 结束:5:副标题名称 --> 
        </div> 
       </div> 
       <!-- 结束:4:副标题 --> 
       <!-- pjax --> 
       <div id="pjax_fluid"> 
        <!-- 开始:4:内容 --> 
        <div class="kt-container kt-grid__item kt-grid__item--fluid" id="user_tutorial"> 
         <div class="row"> 
          <div class="col"> 
           <div class="kt-portlet shadow"> 
            <div class="kt-portlet__body"> 
             <h2 class="card-title kt-font-shadowrocket font-weight-bold mt-5 mb-5" id="1">〇.&nbsp;&nbsp;&nbsp;前言</h2> 
             <div class="row"> 
              <div class="col-sm-12 col-md-12 col-lg-7"> 
               <p>Shadowrocket是一款基于规则的网络调试工具，具有性能高和稳定好、使用流畅，功能多样的特点，只占用最少的系统资源，全盘接管所有的连接，根据规则来进行处理，让你无忧无虑。独有的场景模式，方便根据不同需求自动切换配置及节点。</p> 
               <p>由于App Store中国区禁止上架VPN类所有软件，所以该软件仅在美区、港区等非国区App Store可下载，并且该软件是收费软件，为开发者收取。 <br />本站对符合要求的会员提供已购买该软件的Apple ID共享账号进行下载，有条件建议自行搜索相关教程注册非国区账号购买该软件以支持开发者。</p> 
              </div> 
              <div class="col-sm-12 col-md-12 col-lg-5"> 
               <a class="image-popup-no-margins" href="/theme/metron/media/tutorial/ios/shadowrocket/shadowrocket.jpg" data-lightbox="windows-clashr"> <img class="mt-3 shadow" style="width:100%" src="/theme/metron/media/tutorial/ios/shadowrocket/shadowrocket.jpg" /></a> 
              </div> 
             </div> 
             <h2 class="card-title kt-font-shadowrocket font-weight-bold mt-5 mb-5" id="1">1.&nbsp;&nbsp;&nbsp;通过 App Store 安装客户端</h2> 
             <div class="row"> 
              <div class="col-sm-12 col-md-12 col-lg-7">
             {if $magic_config['ios_share'] == true && $user->class >= $magic_config['ios_share_level'] }
                   <div class="alert alert-primary" role="alert"> 
                    <div class="alert-text mt-3"> 
                     <h4 class="alert-heading">共享账号</h4> 
                     <hr /> 
                     <p class="mb-2">Shadowrocket为App Store商店付费软件，在此给 <code>Lv.{$magic_config['ios_share_level']}及以上会员</code> 提供账号</p>
                                                              {foreach $magic_config['ios_share_account'] as $class_name => $class}  <td>
                                                                    <h4>{$class_name}</h4>
                                                                      {foreach $class as $account}
                                                                           <p>
                                                                                账号: <a href="##" style="color:white" class="copy-text" data-clipboard-text="{$account['account']}">{$account['account']}</a><br>
                                                                                密码: <a href="##" style="color:white" class="copy-text" data-clipboard-text="{$account['passwd']}">*********(点击复制)</a>
                                                                            </p>
                                                                      {/foreach}
                                                                {/foreach} 
                    </div> 
                   </div>
              {else}
                   <div class="alert alert-primary" role="alert"> 
                    <div class="alert-text mt-3"> 
                     <h4 class="alert-heading">您的等级不支持查看共享账号</h4> 
                     <hr /> 
                     <p class="mb-2">Shadowrocket为App Store商店付费软件，为防止频繁登录而导致被封号，共享账号仅对 <code>Lv.{$magic_config['ios_share_level']}及以上会员</code> 提供。<br /> 当您成为 <code>Lv.{$magic_config['ios_share_level']}及以上会员</code> 时(不包括试用会员)，该页面会自动显示共享账号。<br /> 您可通过其他渠道进行安装下载Shadowrocket，具体可至搜索引擎搜索资源。</p> 
                    </div> 
                   </div>
              {/if}
               <p class="mb-2">打开手机<code>设置</code> -&gt; <code>iTunes Store 与 App Store</code> -&gt;使用 <code>非国区 Apple ID </code>登录</p> 
               <p class="mb-2">登录成功后 App Store 会切换对应的语言，在搜索框输入 <code>Shadowrocket</code> 进行安装</p> 
               <p class="mb-2">安装完成可正常打开app后 打开手机<code>设置</code> -&gt; <code>iTunes Store 与 App Store</code> 退出共享账号，安装完成后不再需要Appe ID，所以请不要保留在手机登录。</p> 
              </div> 
              <div class="col-sm-12 col-md-12 col-lg-5"> 
               <a class="image-popup-no-margins" href="/theme/metron/media/tutorial/ios/shadowrocket/mini/01.jpg" data-lightbox="windows-clashr"> <img class="mt-3 shadow" style="width:100%" src="/theme/metron/media/tutorial/ios/shadowrocket/mini/01.jpg" /></a> 
              </div> 
             </div> 
             <h2 class="card-title kt-font-shadowrocket font-weight-bold mt-5 mb-5" id="2">2.&nbsp;&nbsp;&nbsp;添加节点订阅</h2> 
             <div class="row"> 
              <div class="col-sm-12 col-md-12 col-lg-7"> 
               <button type="button" class="btn btn-pill btn-shadowrocket mb-4" href="##" onclick="importSublink('shadowrocket')">&nbsp;&nbsp;<i class="metron-shadowrocket"></i>一键导入节点配置到 Shadowrocket</button> 
               <p class="mb-2">点击上方按钮一键导入节点配置到Shadowrocket</p> 
               <p class="mb-2">如果导入后没有显示节点，请重启Shadowrocket</p> 
               <p class="mb-2">点击底栏的 <code>设置</code> -&gt; <code>服务器订阅</code> -&gt; 启用 <code>打开时更新</code><br />这样以后每次打开客户端都会自动更新最新节点</p> 
              </div> 
              <div class="col-sm-12 col-md-12 col-lg-5"> 
               <a class="image-popup-no-margins" href="/theme/metron/media/tutorial/ios/shadowrocket/mini/02.png" data-lightbox="windows-clashr"> <img class="mt-3 shadow" style="width:100%" src="/theme/metron/media/tutorial/ios/shadowrocket/mini/02.png" /></a> 
              </div> 
             </div> 
             <hr /> 
             <h2 class="card-title kt-font-shadowrocket font-weight-bold mt-5 mb-5" id="3">3.&nbsp;&nbsp;&nbsp;添加规则配置</h2> 
             <div class="row"> 
              <div class="col-sm-12 col-md-12 col-lg-7"> 
               <button type="button" class="btn btn-pill btn-shadowrocket copy-text mb-4" data-clipboard-text="https://raw.githubusercontent.com/Hackl0us/Surge-Rule-Snippets/master/LAZY_RULES/Shadowrocket.conf"><i class="fa fa-copy"></i>&nbsp;&nbsp;复制配置链接</button> 
               <p class="mb-2">点击底栏的<code>配置</code>，选择<code>添加配置</code>，<code>粘贴上面复制的配置链接</code>，<code>下载</code></p> 
               <p class="mb-2">随后点击 远程文件中新增的配置文件地址，在弹出的菜单中选择第二个<code>使用配置</code></p> 
               <p class="mb-2">此时 APP 会自动开始下载配置并应用配置。</p> 
              </div> 
              <div class="col-sm-12 col-md-12 col-lg-5"> 
               <a class="image-popup-no-margins" href="/theme/metron/media/tutorial/ios/shadowrocket/mini/03.png" data-lightbox="windows-clashr"> <img class="mt-3 shadow" style="width:100%" src="/theme/metron/media/tutorial/ios/shadowrocket/mini/03.png" /></a> 
              </div> 
             </div> 
             <hr /> 
             <h2 class="card-title kt-font-shadowrocket font-weight-bold mt-5 mb-5" id="3">3.&nbsp;&nbsp;&nbsp;开启代理</h2> 
             <div class="row"> 
              <div class="col-sm-12 col-md-12 col-lg-7"> 
               <p class="mb-2"><code>回到首页</code>，点击进入<code>全局路由</code>将其更改为 <code>配置</code></p> 
               <p class="mb-2">在节点列表中选择节点，小黄点表示当前选择的节点</p> 
               <p class="mb-2">点击最顶上的开关开启代理<br />如果是首次开启会弹出VPN文件的应用，务必点击<code>Allow</code>并验证</p> 
              </div> 
              <div class="col-sm-12 col-md-12 col-lg-5"> 
               <a class="image-popup-no-margins" href="/theme/metron/media/tutorial/ios/shadowrocket/mini/04.png" data-lightbox="windows-clashr"> <img class="mt-3 shadow" style="width:100%" src="/theme/metron/media/tutorial/ios/shadowrocket/mini/04.png" /></a> 
              </div> 
             </div> 
             <div class="kt-divider mt-5 mb-5"> 
              <span></span> 
              <span>常 见 问 题</span> 
              <span></span> 
             </div> 
            </div> 
           </div> 
          </div> 
         </div> 
        </div> 
     <!-- 结束:4:内容 --> 
    </div>
   </div>
  </div>
         {include file='user/footer.tpl'}  
 </body>
</html>
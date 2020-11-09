<!DOCTYPE html>
<html lang="zh-CN">
 <head> 
  <title>Clash使用教程 — {$config['appName']}</title> 
  <meta charset="UTF-8" /> 
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no" />
 </head>
 <body>
   {include file='user/header_info.tpl'} 
  <!-- 开始:3:页中 --> 
  <div class="kt-body kt-grid__item kt-grid__item--fluid kt-grid kt-grid--hor kt-grid--stretch" id="kt_body"> 
   <div class="kt-content kt-content--fit-top  kt-grid__item kt-grid__item--fluid kt-grid kt-grid--hor" id="kt_content"> 
    <!-- 开始:4:副标题 --> 
    <div class="kt-subheader kt-grid__item" id="kt_subheader"> 
     <div class="kt-container "> 
      <!-- 开始:5:副标题名称 --> 
      <div class="kt-subheader__main"> 
       <h3 class="kt-subheader__title" id="subtitle">Clash for Windows 使用教程</h3> 
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
          <h2 class="card-title kt-font-clash font-weight-bold mt-5 mb-5" id="1">〇.&nbsp;&nbsp;&nbsp;前言</h2> 
          <div class="row"> 
           <div class="col-sm-12 col-md-12 col-lg-7"> 
            <p><code>Clash</code>是一款用 Go语言 开发的支持 Linux/MacOS/Windows/Android 等多平台的代理工具，支持 ss/v2ray（不支持 ssr），支持规则分流（类似于 Surge 的配置）。</p> 
            <p>使用该客户端可同时支持 {$config["appName"]} 提供的SS节点和V2Ray节点。</p> 
            <p>由于客户端长期更新中可能出现界面或功能与教程不符，我们建议您把本教程仅作为参考，具体需要根据自己使用过程中熟悉了解。</p> 
            <code>Clash 最好使用Windows 64位系统，32位系统请选用其他客户端</code> 
           </div> 
           <div class="col-sm-12 col-md-12 col-lg-5"> 
            <a class="image-popup-no-margins" href="/theme/metron/media/tutorial/windows/clashr/clashr.png" data-lightbox="windows-clashr"> <img class="mt-3 shadow" style="width:100%" src="/theme/metron/media/tutorial/windows/clashr/clashr.png" /></a> 
           </div> 
          </div> 
          <hr /> 
          <h2 class="card-title kt-font-clash font-weight-bold mt-5 mb-5" id="1">1.&nbsp;&nbsp;&nbsp;下载安装客户端</h2> 
          <div class="row"> 
           <div class="col-sm-12 col-md-12 col-lg-7"> 
            <a href="/client-download/Clash-Windows.7z" class="btn btn-pill btn-clash mb-4">&nbsp;&nbsp;<i class="metron-clash"></i>下载客户端</a> 
            <p class="mb-2">下载后双击打开 <code>.exe</code> 后戳的文件进行自动安装</p> 
            <p class="mb-2">安装过程可能不会显示，如果你电脑已安装旧版本，请先卸载再安装</p> 
            <p class="mb-2">双击桌面 <code>Clash</code> 图标开始运行程序</p> 
           </div> 
           <div class="col-sm-12 col-md-12 col-lg-5"> 
            <a class="image-popup-no-margins" href="/theme/metron/media/tutorial/windows/clashr/mini/01.jpg" data-lightbox="windows-clashr"> <img class="mt-3 shadow" style="width:100%" src="/theme/metron/media/tutorial/windows/clashr/mini/01.jpg" /></a> 
           </div> 
          </div> 
          <hr /> 
          <h2 class="card-title kt-font-clash font-weight-bold mt-5 mb-5" id="2">2.&nbsp;&nbsp;&nbsp;导入包含规则和节点的配置文件</h2> 
          <div class="row"> 
           <div class="col-sm-12 col-md-12 col-lg-7"> 
            <button type="button" class="btn btn-pill btn-clash mb-4" href="##" onclick="importSublink('clashr')">&nbsp;&nbsp;<i class="metron-clash"></i>一键导入节点配置到 Clash</button> 
            <p class="mb-2">点击上方按钮一键导入节点配置到Clash</p> 
            <p class="mb-2">导入成功后， <code>Profiles</code> 界面会多出一个配置选项卡</p> 
            <p class="mb-2">点击选中刚刚导入的配置选项卡</p> 
            <p class="mb-2">如果弹出配置错误提示，请重启客户端并重新选中刚刚导入的配置</p> 
           </div> 
           <div class="col-sm-12 col-md-12 col-lg-5"> 
            <a class="image-popup-no-margins" href="/theme/metron/media/tutorial/windows/clashr/mini/02.jpg" data-lightbox="windows-clashr"> <img class="mt-3 shadow" style="width:100%" src="/theme/metron/media/tutorial/windows/clashr/mini/02.jpg" /></a> 
           </div> 
          </div> 
          <hr /> 
          <h2 class="card-title kt-font-clash font-weight-bold mt-5 mb-5" id="3">3.&nbsp;&nbsp;&nbsp;选择节点</h2> 
          <div class="row"> 
           <div class="col-sm-12 col-md-12 col-lg-7"> 
            <p class="mb-2">点击 <code>Profiles</code> 选项切换到代理节点界面</p> 
            <div class="kt-divider mt-1 mb-1"> 
             <span></span> 
             <span>配置规则详解</span> 
             <span></span> 
            </div> 
            <p class="mb-2"><span class="font-weight-bold">代理模式：</span>默认代理常见的国外网站，可选 <code>SS节点</code> 或 <code>V2R节点</code></p> 
            <p class="mb-2"><span class="font-weight-bold">SS节点：</span>如果 代理模式 选择 SS节点 ，就在 SS节点 下选择节点。</p> 
            <p class="mb-2"><span class="font-weight-bold">V2R节点：</span>如果 代理模式 选择 V2R节点 ，就在 V2R节点 下选择节点。</p> 
            <p class="mb-2"><span class="font-weight-bold">国内网站：</span>代理常见的国内网站，可选 <code>DIRECT（不代理）</code>、或者走 <code>代理模式</code> 、或者选择节点；一般情况下保持 <code>DIRECT</code> 即可。</p> 
            <p class="mb-2"><span class="font-weight-bold">其他网站：</span>规则以外的其他国外网站，按需求选择 <code>DIRECT（不代理）</code>、或者 <code>代理模式</code> 即可。</p> 
            <p class="mb-2"><span class="font-weight-bold">国内媒体：</span>代理常见的国内视频媒体网站，例如爱奇艺等；一般情况下保持 <code>DIRECT</code> 即可。</p> 
            <p class="mb-2"><span class="font-weight-bold">国际媒体：</span>代理常见的国外视频媒体网站，例如Netflix等。</p> 
            <p class="mb-2">Clash节点测速使用模拟真实连接进行测试，所以节点的延迟都会显示非常高，不是线路的问题，不必太过于纠结。延迟不等于速度~请不要使用延迟来判断节点的速度快慢~</p> 
           </div> 
           <div class="col-sm-12 col-md-12 col-lg-5"> 
            <a class="image-popup-no-margins" href="/theme/metron/media/tutorial/windows/clashr/mini/03.jpg" data-lightbox="windows-clashr"> <img class="mt-3 shadow" style="width:100%" src="/theme/metron/media/tutorial/windows/clashr/mini/03.jpg" /></a> 
           </div> 
          </div> 
          <hr /> 
          <h2 class="card-title kt-font-clash font-weight-bold mt-5 mb-5" id="4">4.&nbsp;&nbsp;&nbsp;开启代理</h2> 
          <div class="row"> 
           <div class="col-sm-12 col-md-12 col-lg-7"> 
            <p class="mb-2">点击 <code>General</code> 选项切换到通用界面</p> 
            <p class="mb-2">打开 <code>System Proxy</code> 开关；其他保持默认即可。</p> 
            <p class="mb-2">一切准备就绪~~~</p> 
           </div> 
           <div class="col-sm-12 col-md-12 col-lg-5"> 
            <a class="image-popup-no-margins" href="/theme/metron/media/tutorial/windows/clashr/mini/04.jpg" data-lightbox="windows-clashr"> <img class="mt-3 shadow" style="width:100%" src="/theme/metron/media/tutorial/windows/clashr/mini/04.jpg" /></a> 
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
<!DOCTYPE html>
<html lang="zh-CN">
 <head> 
  <title>用户中心 — {$config['appName']}</title> 
  <meta charset="UTF-8" /> 
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no" /> 
  <link href="https://cdn.jsdelivr.net/gh/addarmy/theme-assets@2.2/metron/css/fonts.css?family=Poppins:300,400,500,600,700" rel="stylesheet" /> 
  <link href="https://cdn.jsdelivr.net/gh/addarmy/theme-assets@2.2/metron/css/plugins.css" rel="stylesheet" type="text/css" /> 
  <link href="https://cdn.jsdelivr.net/gh/addarmy/theme-assets@2.2/metron/css/style.css" rel="stylesheet" type="text/css" /> 
  <link href="https://cdn.jsdelivr.net/gh/addarmy/theme-assets@2.2/metron/fonts/client/metron-icon.css" rel="stylesheet" /> 
  <!-- ico --> 
  <link rel="shortcut icon" href="/theme/metron/media/logos/favicon.ico" /> 
  <style type="text/css" media="screen and (min-width: 1025px)">
                          .body-imgbg {
                              background-image: url(https://cdn.jsdelivr.net/gh/addarmy/theme-assets@2.2/metron/media/bg/bg-01-300.jpg);
                              background-position: center top;
                              background-size: 100% 285px;
                          }
  </style> 
 </head> 
 <body id="page-body" class="body-imgbg kt-page--loading-enabled kt-page--loading kt-quick-panel--right kt-demo-panel--right kt-offcanvas-panel--right kt-header--fixed kt-header--minimize-menu kt-header-mobile--fixed kt-subheader--enabled kt-subheader--transparent kt-page--loading"> 
  <div class="loader" style="display: none;"> 
   <div class="dot"></div> 
   <div class="dot"></div> 
   <div class="dot"></div> 
   <div class="dot"></div> 
   <div class="dot"></div> 
  </div> 
  <!-- 开始:1:页面 --> 
  <!-- 开始:2:移动端导航栏 --> 
  <div id="kt_header_mobile" class="kt-header-mobile  kt-header-mobile--fixed "> 
   <div class="kt-header-mobile__logo"> 
    <a href="/user"> <img alt="Logo" src="/theme/metron/media/logos/logo-b-150x32.png" /> </a> 
   </div> 
   <div class="kt-header-mobile__toolbar"> 
    <button class="kt-header-mobile__toolbar-toggler" id="kt_header_mobile_toggler"><span></span></button> 
    <button class="kt-header-mobile__toolbar-topbar-toggler" id="kt_header_mobile_topbar_toggler"><i class="flaticon-more-1"></i></button> 
   </div> 
  </div> 
  <!-- 结束:2:移动端导航栏 --> 
  <!-- 开始:2:主框架--> 
  <div class="kt-grid kt-grid--hor kt-grid--root"> 
   <div class="kt-grid__item kt-grid__item--fluid kt-grid kt-grid--ver kt-page"> 
    <div class="kt-grid__item kt-grid__item--fluid kt-grid kt-grid--hor kt-wrapper" id="kt_wrapper"> 
     <!-- 开始:3:导航栏 --> 
     <div id="kt_header" class="kt-header  kt-header--fixed" data-ktheader-minimize="on"> 
      <div class="kt-container "> 
       <!-- 开始:4:logo --> 
       <div class="kt-header__brand   kt-grid__item" id="kt_header_brand"> 
        <a class="kt-header__brand-logo" href="/user"> <img alt="Logo" src="/theme/metron/media/logos/logo-128x19.png" class="kt-header__brand-logo-default" /> <img alt="Logo" src="/theme/metron/media/logos/logo-b-150x32.png" class="kt-header__brand-logo-sticky" /> </a> 
       </div> 
       <!-- 结束:4:logo --> 
       <!-- 开始:4:功能菜单 --> 
       <button class="kt-header-menu-wrapper-close" id="kt_header_menu_mobile_close_btn"><i class="la la-close"></i></button> 
       <div class="kt-header-menu-wrapper kt-grid__item kt-grid__item--fluid" id="kt_header_menu_wrapper"> 
        <div id="kt_header_menu" class="kt-header-menu kt-header-menu-mobile "> 
         <ul class="kt-menu__nav" id="kt_header_menu_ul"> 
          <!-- 开始:5:主要功能 --> 
          <li class="kt-menu__item kt-menu__item--submenu kt-menu__item--rel" data-ktmenu-submenu-toggle="click" aria-haspopup="true"> <a data-pjax="" href="/user" class="kt-menu__link"> <span class="kt-menu__link-text"><i class="fa fa-home"></i><strong>&nbsp;首页</strong></span> </a> </li> 
          <li class="kt-menu__item kt-menu__item--submenu kt-menu__item--rel" data-ktmenu-submenu-toggle="click" aria-haspopup="true"> <a data-pjax="" href="/user/code" class="kt-menu__link"> <span class="kt-menu__link-text"><i class="fa fa-wallet"></i><strong>&nbsp;钱包</strong></span> </a> </li> 
          <li class="kt-menu__item kt-menu__item--submenu kt-menu__item--rel" data-ktmenu-submenu-toggle="click" aria-haspopup="true"> <a data-pjax="" href="/user/shop" class="kt-menu__link"> <span class="kt-menu__link-text"><i class="fa fa-cart-plus"></i><strong>&nbsp;商店</strong></span> </a> </li> 
          <li class="kt-menu__item kt-menu__item--submenu kt-menu__item--rel" data-ktmenu-submenu-toggle="click" aria-haspopup="true"> <a data-pjax="" href="/user/node" class="kt-menu__link"> <span class="kt-menu__link-text"><i class="fa fa-globe-americas"></i><strong>&nbsp;节点列表</strong></span> </a> </li> 
          <!-- 结束:5:主要功能 --> 
         </ul> 
        </div> 
       </div> 
       <!-- 结束:4:功能菜单 --> 
       <!-- 开始:4:菜单Topbar --> 
       <div class="kt-header__topbar kt-grid__item"> 
        <!-- 开始:5:用户通知 --> 
        <!--<div class="kt-header__topbar-item dropdown">
                                                  <div class="kt-header__topbar-wrapper" data-toggle="dropdown" data-offset="10px,0px">
                                                      <span class="kt-header__topbar-icon kt-pulse kt-pulse--light">
                                                          <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1" class="kt-svg-icon">
                                                              <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                                  <rect x="0" y="0" width="24" height="24" />
                                                                  <path d="M2.56066017,10.6819805 L4.68198052,8.56066017 C5.26776695,7.97487373 6.21751442,7.97487373 6.80330086,8.56066017 L8.9246212,10.6819805 C9.51040764,11.267767 9.51040764,12.2175144 8.9246212,12.8033009 L6.80330086,14.9246212 C6.21751442,15.5104076 5.26776695,15.5104076 4.68198052,14.9246212 L2.56066017,12.8033009 C1.97487373,12.2175144 1.97487373,11.267767 2.56066017,10.6819805 Z M14.5606602,10.6819805 L16.6819805,8.56066017 C17.267767,7.97487373 18.2175144,7.97487373 18.8033009,8.56066017 L20.9246212,10.6819805 C21.5104076,11.267767 21.5104076,12.2175144 20.9246212,12.8033009 L18.8033009,14.9246212 C18.2175144,15.5104076 17.267767,15.5104076 16.6819805,14.9246212 L14.5606602,12.8033009 C13.9748737,12.2175144 13.9748737,11.267767 14.5606602,10.6819805 Z" fill="#000000" opacity="0.3" />
                                                                  <path d="M8.56066017,16.6819805 L10.6819805,14.5606602 C11.267767,13.9748737 12.2175144,13.9748737 12.8033009,14.5606602 L14.9246212,16.6819805 C15.5104076,17.267767 15.5104076,18.2175144 14.9246212,18.8033009 L12.8033009,20.9246212 C12.2175144,21.5104076 11.267767,21.5104076 10.6819805,20.9246212 L8.56066017,18.8033009 C7.97487373,18.2175144 7.97487373,17.267767 8.56066017,16.6819805 Z M8.56066017,4.68198052 L10.6819805,2.56066017 C11.267767,1.97487373 12.2175144,1.97487373 12.8033009,2.56066017 L14.9246212,4.68198052 C15.5104076,5.26776695 15.5104076,6.21751442 14.9246212,6.80330086 L12.8033009,8.9246212 C12.2175144,9.51040764 11.267767,9.51040764 10.6819805,8.9246212 L8.56066017,6.80330086 C7.97487373,6.21751442 7.97487373,5.26776695 8.56066017,4.68198052 Z" fill="#000000" />
                                                              </g>
                                                          </svg>
                                                          <span class="kt-pulse__ring"></span>
                                                      </span>
                                                      <span class="kt-badge kt-badge--light"></span>
                                                  </div>
                                                  <div class="dropdown-menu dropdown-menu-fit dropdown-menu-right dropdown-menu-anim dropdown-menu-xl">
                                                      <form>
                                                          <div class="kt-head kt-head--skin-dark kt-head--fit-x kt-head--fit-b" style="background-image: url(/theme/metron/media/misc/bg-1.jpg)">
                                                              <h3 class="kt-head__title">
                                                                  用户通知
                                                                  &nbsp;
                                                                  <span class="btn btn-success btn-sm btn-bold btn-font-md">23 new</span>
                                                              </h3>
                                                              <ul class="nav nav-tabs nav-tabs-line nav-tabs-bold nav-tabs-line-3x nav-tabs-line-success kt-notification-item-padding-x" role="tablist">
                                                                  <li class="nav-item">
                                                                      <a class="nav-link active show" data-toggle="tab" href="#topbar_notifications_notifications" role="tab" aria-selected="true">信息</a>
                                                                  </li>
                                                              </ul>
                                                          </div>
                                                          <div class="tab-content">
                                                              <div class="tab-pane active show" id="topbar_notifications_notifications" role="tabpanel">
                                                                  <div class="kt-notification kt-margin-t-10 kt-margin-b-10 kt-scroll" data-scroll="true" data-height="300" data-mobile-height="200">
                                                                      <a href="#" class="kt-notification__item" data-toggle="modal" data-target="#traffic_package_modal">
                                                                          <div class="kt-notification__item-icon">
                                                                              <i class="flaticon2-drop kt-font-info"></i>
                                                                          </div>
                                                                          <div class="kt-notification__item-details">
                                                                              <div class="kt-notification__item-title kt-font-danger">
                                                                                  您的可用流量已不足5GB
                                                                              </div>
                                                                              <div class="kt-notification__item-time">
                                                                                  点击购买流量包
                                                                              </div>
                                                                          </div>
                                                                      </a>
                                                                      <a data-pjax href="/user/shop" class="kt-notification__item">
                                                                          <div class="kt-notification__item-icon">
                                                                              <i class="flaticon2-box-1 kt-font-brand"></i>
                                                                          </div>
                                                                          <div class="kt-notification__item-details">
                                                                              <div class="kt-notification__item-title">
                                                                                  您的会员计划已到期
                                                                              </div>
                                                                              <div class="kt-notification__item-time">
                                                                                  7天未签到或使用账号将被删除
                                                                              </div>
                                                                          </div>
                                                                      </a>
                                                                  </div>
                                                              </div>
                                                          </div>
                                                      </form>
                                                  </div>
                                              </div>--> 
        <!-- 结束:5:用户通知 --> 
        <!-- 开始:5:快捷侧面板 --> 
        <!--<div class="kt-header__topbar-item kt-header__topbar-item--quick-panel" data-toggle="kt-tooltip" title="Quick panel" data-placement="right">
                                                  <div class="kt-header__topbar-wrapper" data-toggle="dropdown" data-offset="10px,0px">
                                                      <span class="kt-header__topbar-icon" id="kt_quick_panel_toggler_btn">
                                                          <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1" class="kt-svg-icon">
                                                              <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                                  <rect x="0" y="0" width="24" height="24" />
                                                                  <rect fill="#000000" x="4" y="4" width="7" height="7" rx="1.5" />
                                                                  <path d="M5.5,13 L9.5,13 C10.3284271,13 11,13.6715729 11,14.5 L11,18.5 C11,19.3284271 10.3284271,20 9.5,20 L5.5,20 C4.67157288,20 4,19.3284271 4,18.5 L4,14.5 C4,13.6715729 4.67157288,13 5.5,13 Z M14.5,4 L18.5,4 C19.3284271,4 20,4.67157288 20,5.5 L20,9.5 C20,10.3284271 19.3284271,11 18.5,11 L14.5,11 C13.6715729,11 13,10.3284271 13,9.5 L13,5.5 C13,4.67157288 13.6715729,4 14.5,4 Z M14.5,13 L18.5,13 C19.3284271,13 20,13.6715729 20,14.5 L20,18.5 C20,19.3284271 19.3284271,20 18.5,20 L14.5,20 C13.6715729,20 13,19.3284271 13,18.5 L13,14.5 C13,13.6715729 13.6715729,13 14.5,13 Z" fill="#000000" opacity="0.3" />
                                                              </g>
                                                          </svg>
                                                      </span>
                                                  </div>
                                              </div>--> 
        <!-- 结束:5:快捷侧面板 --> 
        <!-- 开始:5:用户头像 --> 
        <div class="kt-header__topbar-item kt-header__topbar-item--user"> 
         <div class="kt-header__topbar-wrapper" data-toggle="dropdown" data-offset="10px,0px"> 
          <span class="kt-header__topbar-welcome">Hi,</span> 
          <span class="kt-header__topbar-username">{$user->user_name}</span> 
          <img alt="Pic" src="https://gravatar.loli.net/avatar/40ca1dcb1d9a587609118ef048f591f4?&amp;d=monsterid" class="kt-header__topbar-icon" /> 
         </div> 
         <div class="dropdown-menu dropdown-menu-fit dropdown-menu-right dropdown-menu-anim dropdown-menu-xl shadow"> 
          <div class="kt-user-card kt-user-card--skin-dark kt-notification-item-padding-x" style="background-image: url(/theme/metron/media/misc/bg-1.jpg)"> 
           <div class="kt-user-card__avatar"> 
            <img class="kt-badge kt-badge--lg kt-badge--rounded kt-badge--bold kt-font-success" alt="Pic" src="https://gravatar.loli.net/avatar/40ca1dcb1d9a587609118ef048f591f4?&amp;d=monsterid" /> 
           </div> 
           <div class="kt-user-card__name">
             {$user->user_name} 
           </div> 
           <!--div class="kt-user-card__badge">
                               <span class="btn btn-success btn-sm btn-bold btn-font-md">新信息</span>
                            </div--> 
          </div> 
          <div class="kt-notification"> 
           <a data-pjax="" href="/user/code" class="kt-notification__item"> 
            <div class="kt-notification__item-icon"> 
             <i class="flaticon-price-tag kt-font-danger"></i> 
            </div> 
            <div class="kt-notification__item-details"> 
             <div class="kt-notification__item-title kt-font-bold">
               我的钱包 
             </div> 
             <div class="kt-notification__item-time">
               预存余额、充值记录、购买记录等 
             </div> 
            </div> </a> 
           <div class="kt-notification__custom kt-space-between"> 
            <a href="/user/logout" class="btn btn-label btn-label-brand btn-sm btn-bold">退出登录</a> 
           </div> 
          </div> 
         </div> 
        </div> 
        <!-- 结束:5:用户头像 --> 
       </div> 
       <!-- 开始:4:菜单Topbar --> 
      </div> 
     </div> 
     <!-- 结束:3:导航栏 --> 
     <!-- 开始:3:页中 --> 
     <div class="kt-body kt-grid__item kt-grid__item--fluid kt-grid kt-grid--hor kt-grid--stretch" id="kt_body"> 
      <div class="kt-content kt-content--fit-top  kt-grid__item kt-grid__item--fluid kt-grid kt-grid--hor" id="kt_content"> 
       <!-- 开始:4:副标题 --> 
       <div class="kt-subheader kt-grid__item" id="kt_subheader"> 
        <div class="kt-container "> 
         <!-- 开始:5:副标题名称 --> 
         <div class="kt-subheader__main"> 
          <h3 class="kt-subheader__title" id="subtitle">用户中心</h3> 
         </div> 
         <!-- 结束:5:副标题名称 --> 
        </div> 
       </div> 
       <!-- 结束:4:副标题 --> 
       <div class="kt-container  kt-grid__item kt-grid__item--fluid" id="user_index_newuser"> 
        <div class="row"> 
         <div class="col"> 
          <div class="kt-portlet kt-portlet--fluid  kt-portlet--border-bottom-brand shadow"> 
           <div class="kt-portlet__head kt-portlet__head--noborder"> 
            <div class="kt-portlet__head-label"> 
             <h3 class="kt-portlet__head-title kt-font-primary"></h3> 
            </div> 
           </div> 
           <div class="kt-portlet__body"> 
            <div class="card-body"> 
             <h1 class="font-weight-bold text-center mb-2">👋 欢迎您，{$user->user_name}</h1> 
             <br /> 
             <h3 class="font-weight-bold text-center mb-2">当您处于该界面时，说明您还<span class="text-danger">未激活账号</span>!</h3> 
             <h3 class="font-weight-bold text-center mb-2">您需要<span class="text-danger">购买套餐</span>方可激活，按下方步骤<span class="text-danger">成功购买后</span>将解锁各种功能</h3> 
             <h3 class="font-weight-bold text-center mb-2">本站目前仅支持 <span class="text-danger">SSR</span> 和 <span class="text-danger">V2Ray</span></h3> 
             <h3> <br /><br /> 
              <div class="row"> 
               <div class="col-12 col-lg-8 offset-lg-2"> 
                <div class="bg-steps"> 
                 <div class="bg-step bg-step-info on" onclick="location='/user/code'"> 
                  <div class="bg-step-icon"> 
                   <i class="fa fa-yen-sign"></i> 
                  </div> 
                  <div class="bg-step-label">
                    前往钱包进行充值余额 
                  </div> 
                 </div> 
                 <div class="bg-step bg-step-info on" onclick="location='/user/shop'"> 
                  <div class="bg-step-icon"> 
                   <i class="fa fa-shopping-cart"></i> 
                  </div> 
                  <div class="bg-step-label">
                    前往商店进行购买套餐 
                  </div> 
                 </div> 
                 <div class="bg-step bg-step-info"> 
                  <div class="bg-step-icon"> 
                   <i class="fa fa-book"></i> 
                  </div> 
                  <div class="bg-step-label">
                    下载客户端并按教程使用 
                  </div> 
                 </div> 
                </div> 
               </div> 
              </div> </h3> 
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
   </div>
   {include file='user/footer.tpl'}  
  </div>
 </body>
</html>
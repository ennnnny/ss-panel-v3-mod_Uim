<!DOCTYPE html>
<html lang="zh-CN">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no">
        <title>支付结果 &mdash; {$config["appName"]}</title>
        <!-- ico -->
        <link rel="shortcut icon" href="/favicon.ico" />
      
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.8.2/css/all.min.css">
        <link rel="stylesheet" type="text/css" href="/theme/cool/assets/vendors/css/vendors.min.css">
        <link rel="stylesheet" type="text/css" href="/theme/cool/assets/css/components.css">
    	<link rel="stylesheet" type="text/css" href="/theme/cool/assets/css/bootstrap.css">
	    <link rel="stylesheet" type="text/css" href="/theme/cool/assets/css/bootstrap-extended.css">
	    <link rel="stylesheet" type="text/css" href="/theme/cool/assets/css/components.css">
	    <link rel="stylesheet" type="text/css" href="/theme/cool/assets/css/cool.css">
	    <link rel="stylesheet" type="text/css" href="/theme/cool/assets/css/notify.css">
      
        {if $magic_config['enable_crisp'] == true && $magic_config['enable_crisp_outside'] == true}
        	{include file='crisp.tpl'}
        {/if}
      
        {if $magic_config['enable_chatra'] == true && $magic_config['enable_crisp_outside'] == true}
        	{include file='chatra.tpl'}
        {/if}
        
        <script>
            var isWeixin = function () {
            var ua = navigator.userAgent.toLowerCase();
            return ua.match(/MicroMessenger/i) == "micromessenger";
            };
            if (isWeixin() == true) {
                $('body').html('<h5 style="margin:20px">不支持在微信内访问<br>请点击右上角菜单<br>选择浏览器打开</h5>')
            }
        </script>
    </head>

	<!-- BEGIN: Body-->
	
	<body class="vertical-layout vertical-menu-modern 1-column  navbar-floating footer-static bg-full-screen-image  blank-page blank-page  pace-done" data-open="click" data-menu="vertical-menu-modern" data-col="1-column"><div class="pace  pace-inactive"><div class="pace-progress" data-progress-text="100%" data-progress="99" style="transform: translate3d(100%, 0px, 0px);">
	  <div class="pace-progress-inner"></div>
	</div>
	<div class="pace-activity"></div></div>
	    <!-- BEGIN: Content-->
	    <div class="app-content content">
	        <div class="content-overlay"></div>
	        <div class="header-navbar-shadow"></div>
	        <div class="content-wrapper">
	            <div class="content-header row">
	            </div>
	            <div class="content-body">
	                <!-- maintenance -->
	                <section class="row flexbox-container">
	                    <div class="col-xl-7 col-md-8 col-12 d-flex justify-content-center">
	                        <div class="card auth-card bg-transparent shadow-none rounded-0 mb-0 w-100">
	                            <div class="card-content">
	                                <div class="card-body text-center">
	                                    <img src="/theme/cool/assets/images/card_payment_online_1.svg" class="img-fluid align-self-center" style="width:40rem"><br /><br />
	                                    {if ($success == 1)}
	                                    	<h1 class="font-large-2 my-2"><trans oldtip="You are not authorized!" tyle="">已充值成功 {$money} </trans></h1>
	                                	{else}
	                                    	<h2>正在处理您的支付，请您稍等。<br /><br />此页面会自动刷新，或者您可以选择关闭此页面，余额将自动到账</h2>
							            	<script>
						                    setTimeout('window.location.reload()', 5000);
						                	</script>
						                {/if}
										<a class="btn btn-primary btn-lg mt-2 waves-effect waves-light" href="/user/code"><trans oldtip="Back to Home" newtip="回到家" style="">前往我的背包 👉</trans></a>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </section>
	                <!-- maintenance end -->
	
	            </div>
	        </div>
	    </div>
	    <!-- END: Content-->
	
	
	    <!-- BEGIN: Vendor JS-->
	    <script src="/theme/cool/assets/js/vendors.min.js"></script>
	    <!-- BEGIN Vendor JS-->
	
	    <!-- BEGIN: Page Vendor JS-->
	    <!-- END: Page Vendor JS-->
	
	    <!-- BEGIN: Theme JS-->
	    <script src="/theme/cool/assets/js/core/app-menu.js"></script>
	    <script src="/theme/cool/assets/js/core/app.js"></script>
	    <script src="/theme/cool/assets/js/scripts/components.js"></script>
	    <!-- END: Theme JS-->
	
	    <!-- BEGIN: Page JS-->
	    <!-- END: Page JS-->
	
	
	<!-- END: Body-->

</body>
</html>
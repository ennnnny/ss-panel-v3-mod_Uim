<!DOCTYPE html>
  <html lang="zh-CN">
   <head> 
    <title>我的钱包 — {$config["appName"]}</title>
    
   {include file='user/header.tpl'} 
    <!-- BEGIN: Content-->
    <div class="app-content content">
        <div class="content-overlay"></div>
        <div class="header-navbar-shadow"></div>
        <div class="content-wrapper">
            <div class="content-header row">
                <div class="content-header-left col-md-9 col-12 mb-2">
                    <div class="row breadcrumbs-top">
                        <div class="col-12">
                            <h2 class="content-header-title float-left mb-0">我的钱包</h2>
                            <div class="breadcrumb-wrapper col-12">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/user">Home</a>
                                    </li>
                                    <li class="breadcrumb-item"><a href="/user/code">My wallet</a>
                                    </li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="content-body">
                <div class="card card-hero">
                  <div class="card-header" style="border-radius: 3px;box-shadow: 0 2px 6px #d7d8dc;border: none;">
                    <div class="card-icon">
                      <i class="fa fa-jpy"></i>
                    </div>
                    <h4>¥ {$user->money}</h4>
                    <div class="card-description">账号可用余额</div>
                    <div class="mt-3">
                      <a href="#" id="top-up" class="btn btn-outline-white mr-1 mb-1 waves-effect waves-light">
                        <i class="feather icon-credit-card"></i> 在线充值
                      </a>
                    	<a href="#" class="btn btn-outline-white mr-1 mb-1 waves-effect waves-light" data-toggle="modal" data-target="#Recharge-code">
							<i class="fa fa-barcode"></i> 充值码充值
                    	</a>
                    </div>
                  </div>
                </div>
                <section>
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4>充值记录</h4>
                                </div>
                                <div class="card-content">
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table add-rows">
                                                <thead>
								                  <tr>
								                    <th>ID</th>
								                    <th>代码</th>
													<th>类型</th>
													<th>操作</th>
													<th>使用时间</th>
								                  </tr>
                                                </thead>
                                                <tbody>
													{if count($codes) == 0}
									                    <tr>
									                      <td colspan="5"><strong>无充值记录</strong></td>
									                    </tr>
									                {else}
													{foreach $codes as $code}
									                  <tr>
									                    <td class="badge-dot mr-4"><i class="bg-warning"></i>#{$code->id}</td>
									                    <td>{$code->code}</td>
									                    {if $code->type==-1}
									                        <td>金额充值</td>
									                    {/if}
									                    {if $code->type==10001}
									                        <td>流量充值</td>
									                    {/if}
									                    {if $code->type==10002}
									                        <td>用户续期</td>
									                    {/if}
									                    {if $code->type>=1&&$code->type<=10000} 
														    <td>等级续期 - 等级{$code->type}</td>
									                     {/if}
														{if $code->type==-1}
									                        <td>充值 {$code->number} 元</td>
									                    {/if}
									                    {if $code->type==10001}
									                        <td>充值 {$code->number} GB 流量</td>
									                    {/if}
									                    {if $code->type==10002}
									                        <td>延长账户有效期 {$code->number} 天</td>
									                    {/if}
									                    {if $code->type>=1&&$code->type<=10000}
														    <td>延长等级有效期 {$code->number} 天</td>
									                    {/if}
									                    <td>{$code->usedatetime}</td>
									                  </tr>
													{/foreach}
													{/if}
                                                </tbody>
                                            </table>
	                                        <div class="pagination-render float-right">
						                      {$codes->render()}
						                    </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section>
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4>套餐记录</h4>
                                </div>
                                <div class="card-content">
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table add-rows">
                                                <thead>
								                  <tr>
								                    <th>ID</th>
								                    <th>商品名称</th>
								                    <th>价格</th>
								                    <th>购买时间</th>
								                    <th>续费时间</th>
								                    <th>续费时重置流量</th>
								                    <th>操作</th>
								                  </tr>
                                                </thead>
                                                <tbody>
													{if count($shops) == 0}
									                    <tr>
									                      <td colspan="7"><strong>无购买记录</strong></td>
									                    </tr>
									                {else}
													{foreach $shops as $shop}
									                  <tr>
									                    <td class="badge-dot mr-4"><i class="bg-warning"></i>#{$shop->id}</td>
									                    {if $shop->shop()->id == 0}
									                    <td>{$shop->coupon}</td>
									                    {else}
									                    <td>{$shop->shop()->name}</td>
									                    {/if}
									                    <td>¥{$shop->price}</td>
									                    <td>{date('Y-m-d H:i:s', $shop->datetime)}</td>
									                    {if $shop->renew==0}
									                        <td>不自动续费</td>
									                    {else}
									                        <td>在 {$shop->renew_date()} 续费</td>
									                    {/if}
									
									                    {if $shop->shop()->auto_reset_bandwidth==0}
									                        <td>不自动重置</td>
									                    {else}
									                        <td>自动重置</td>
									                    {/if}
									                    <td>
									                        {if $shop->renew==0}
									                            无操作
									                        {else}
									                            <a href="javascript:void(0);" onClick="delete_modal_show('{$shop->id}')" class="btn btn-sm btn-primary">关闭自动续费</a>
									                        {/if}
									                    </td>
									                  </tr>
													{/foreach}
													{/if}
                                                </tbody>
                                            </table>
                                        <div class="pagination-render float-right">
					                      {$shops->render()}
					                    </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
			<div id="topup-page" class="main-content" style="display: none">
		        <section class="section">
		        	<div class="section-body">
		            	<div class="row">
		            		<div class="col-12">
	                    		<div class="card">
	                        		<div class="card-header">
										<div class="section-header">
						            		<div class="section-header-back">
						            			<a id="back-to-main" href="##" class="btn btn-icon"><i class="fa fa-arrow-left"></i></a>
						            		</div>
							        	</div>
			                        </div>
			                        <div class="card-content">
										<div class="card-body">
											{if $pmw!==''} {$pmw} {/if} 
										</div>
			                        </div>
			                    </div>
			                  </div>
				            </div>
				        </div>
				    </div>    
		        </section>
		    </div>
		    
				<!-- 充值码 -->
				<div class="modal fade" tabindex="-1" role="dialog" id="Recharge-code">
					<div class="modal-dialog modal-dialog-centered modal-dialog-centered modal-dialog-scrollable" role="document">
					  <div class="modal-content">
					    <div class="modal-header">
					      <h5 class="modal-title">使用充值码</h5>
					      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					        <span aria-hidden="true">&times;</span>
					      </button>
					    </div>
					    <div class="modal-body">
					      <div class="form-group">
					        <label>请输入充值码</label>
					        <input id="pay_code" type="text" class="form-control">
					      </div>
					    </div>
					    <div class="modal-footer bg-whitesmoke br">
					      <button type="button" class="btn btn-primary" onclick="codeTopup()">充值</button>
					      <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
					    </div>
					  </div>
					</div>
				</div>
				
				<!-- f2fpay -->
				{if $config['payment_system'] == 'f2fpay' || $config['payment_system'] == 'f2fpay_payjs'}
					<div class="modal fade" tabindex="-1" role="dialog" id="f2fpay-modal">
						<div class="modal-dialog" role="document">
							<div class="modal-dialog" role="document">
							  <div class="modal-content">
							    <div class="modal-header">
							      <h5 class="modal-title">{if $config['payment_system'] == 'f2fpay'}打开支付宝，扫码支付{else}扫码支付{/if}</h5>
							      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
							        <span aria-hidden="true">&times;</span>
							      </button>
							    </div>
							    <div class="modal-body">
							      <div id="qrarea" style="text-align: center"></div>
							    </div>
							    <div class="modal-footer bg-whitesmoke br">
							      <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
							    </div>
							  </div>
							</div>
						</div>
					</div>
				{/if}
				
				<!-- Payjs -->
				{if $config['payment_system'] == 'payjs'}
					<div class="modal fade" tabindex="-1" role="dialog" id="wxpay-modal">
						<div class="modal-dialog" role="document">
							<div class="modal-dialog" role="document">
							  <div class="modal-content">
							    <div class="modal-header">
							      <h5 class="modal-title">打开微信，扫码支付</h5>
							      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
							        <span aria-hidden="true">&times;</span>
							      </button>
							    </div>
							    <div class="modal-body">
							      <div id="qrarea" style="text-align: center"></div>
							    </div>
							    <div class="modal-footer bg-whitesmoke br">
							      <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
							    </div>
							  </div>
							</div>
						</div>
					</div>
				{/if}
				
				
        		{if $config['payment_system'] == 'idtpay'}
				   <div class="modal fade" id="dialog-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"> 
				    <div class="modal-dialog modal-sm modal-dialog-centered" role="document"> 
				     <div class="modal-content"> 
				      <div class="modal-header"> 
				       <h5 class="modal-title kt-font-boldest" id="dialog-title"></h5> 
				      </div> 
				      <div class="modal-body"> 
				       <p class="display-5" id="dialog-msg"></p> 
				      </div> 
				      <!--<div class="modal-footer">
				             <button type="button" class="btn btn-secondary" data-dismiss="modal" id="dialog-ok">知道了</button>
				      </div>--> 
				     </div> 
				    </div> 
				   </div> 
				  </div>
				{/if}
           </div>
        </div>
				
    <!-- END: Content-->

    <!-- BEGIN: Footer-->
		{include file='user/footer.tpl'}
    <!-- END: Footer-->
   
  	<script>
		$(document).ready(function(e) {
		    $("#top-up").click(function(e) {
		    	$(".content-body").toggle();
		        $(".main-content").toggle();
		    });
		    $("#back-to-main").click(function(e) {
		    	$(".content-body").toggle();
		        $(".main-content").toggle();
		    });
		});
	</script>

</body>
<!-- END: Body-->

</html>
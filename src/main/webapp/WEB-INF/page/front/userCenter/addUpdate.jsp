<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
  <head>
    <meta charset="utf-8" />
    <title>用户中心</title>
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />    
    
    <link href="${sod}/staticfile/front/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${sod}/staticfile/front/css/bootstrap-responsive.min.css" rel="stylesheet" />
    
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600" rel="stylesheet" />
    <link href="${sod}/staticfile/front/css/font-awesome.css" rel="stylesheet" />
    
    <link href="${sod}/staticfile/front/css/adminia.css" rel="stylesheet" />
    <link href="${sod}/staticfile/front/css/adminia-responsive.css" rel="stylesheet" />
    
    
    <link href="${sod}/staticfile/front/css/pages/plans.css" rel="stylesheet" />

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
	<script>
        /* 打开一个新页面：调用时不加第二个参数 add by tony */
        function formSubmit (url,sTarget){
            document.forms[0].target = sTarget
            document.forms[0].action = url;
            document.forms[0].submit();
            return true;
        }
    </script>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <style type="text/css">
	  .control-label {
		  padding-top: 10px;
		  vertical-align: middle
	  }
	  .input-large {
		  -webkit-box-sizing:border-box;

		  height: 20px;
		  padding: 4px;
		  margin: 10px 0;
		  vertical-align: middle;
		  line-height: 20px;
	  }
	  .controls {
		  line-height: 40px;
	  }
	  .control-group {

		  line-height: 34px;
	  }

  </style>
  </head>

<body>
<%@include file="header.jsp"%>	





<div id="content">
	
	<div class="container">
		
		<div class="row">

			<div class="span3">

				<div class="account-container">

					<div class="account-avatar">
						<a href="${pageContext.request.contextPath}/front/userCenter/toIndex"><img src="${sod}/staticfile/front/images/headshot.png" alt="" class="thumbnail" /></a>
					</div> <!-- /account-avatar -->

					<div class="account-details">

						<span class="account-name" style="padding-top: 20px; font-size: 150%;">${user.username}</span>







					</div> <!-- /account-details -->

				</div> <!-- /account-container -->

				<hr />

				<ul id="main-nav" class="nav nav-tabs nav-stacked">
					<li >
						<a href="${pageContext.request.contextPath}/front/userCenter/toIndex">
							<i class="icon-th-list"></i>
							账号信息
						</a>
					</li>
					<li >
						<a href="${pageContext.request.contextPath}/front/userCenter/toFavor">
							<i class="icon-home"></i>
							收藏列表
						</a>
					</li>

					<li class="active">
						<a href="${pageContext.request.contextPath}/front/userCenter/toAddress">
							<i class="icon-pushpin"></i>
							收货地址
						</a>
					</li>

					<li >
						<a href="${pageContext.request.contextPath}/front/userCenter/toOrderList">
							<i class="icon-th-list"></i>
							我的订单
						</a>
					</li>



				</ul>

				<hr />



				<br />

			</div> <!-- /span3 -->
			
			
			
			<div class="span9">
				
				<h1 class="page-title">
					<i class="icon-th-large"></i>
					收货地址
				</h1>
				
				
				<div class="row">
					
					<div class="span9">
				
						<div class="widget">
							
							<div class="widget-header">
								<h3>修改地址</h3>
							</div> <!-- /widget-header -->
									
							<div class="widget-content">
								
								
								
								<div class="tabbable">
						

						<br />
						
							<div class="tab-content">

								
								<div >
									<form id="edit-profile2" class="form-horizontal" method="post" >

											<input type="hidden"  name="addId" value="${userAddress.addId}"/>
											

											<div class="control-group">
												<label class="control-label"  for="addInfo">收货地址</label>
												<div class="controls">
													<input type="text" class="input-large" name="addInfo" id="addInfo" value="${userAddress.addInfo}" />
													
												</div>
											</div>
											<div class="control-group">
												<label class="control-label"  for="addRemark">备注</label>
												<div class="controls">
													<input type="text" class="input-large" name="addRemark" id="addRemark" value="${userAddress.addRemark}" />
												</div>
											</div>



										<div class="control-group">
											<label class="control-label"  >默认地址</label>
											<div class="controls">
												<input type="radio"  name="addState" value="1" <c:if test="${userAddress.addState == '1'}">checked="checked"</c:if>  />是
												<input type="radio"  name="addState" value="0" <c:if test="${userAddress.addState == '0'}">checked="checked"</c:if> />否
											</div>
										</div>
											
																						
											
											
											

											
											<br />
											
											<div class="form-actions">
												<button type="submit" onclick="formSubmit('updateAddress','_self');this.blur();" class="btn btn-primary">确定</button> <a href="${pageContext.request.contextPath}/front/userCenter/toAddress"  class="btn">
												取消
											</a>
											</div>
										</fieldset>
									</form>
								</div>
								
							</div>
						  
						  
						</div>
								
								
								
								
								
								
								
								
							</div> <!-- /widget-content -->
							
						</div> <!-- /widget -->
						
					</div> <!-- /span9 -->
					
				</div> <!-- /row -->
				
				
				
				
				
				
				
				
				
			</div> <!-- /span9 -->
			
			
		</div> <!-- /row -->
		
	</div> <!-- /container -->
	
</div> <!-- /content -->
					
	
<div id="footer">
	
	<div class="container">				
		<hr />
		<p>&copy; 2012 Go Ideate.</p>
	</div> <!-- /container -->
	
</div> <!-- /footer -->


    

<!-- Le javascript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="${sod}/staticfile/front/js/jquery-1.7.2.min.js"></script>


<script src="${sod}/staticfile/front/js/bootstrap.js"></script>

  </body>
</html>

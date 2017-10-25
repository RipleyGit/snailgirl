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
    
    <link href="${sod}/staticfile/front/css/pages/dashboard.css" rel="stylesheet" />


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
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>

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
					<i class="icon-home"></i>
					收货地址					
				</h1>
				
				
				
				
				
				
				
				<div class="widget widget-table">
										
					<div class="widget-header">
						<i class="icon-th-list"></i>
						<h3>我的地址</h3>
					</div> <!-- /widget-header -->
					
					<div class="widget-content">
					<form name="aform" method="post">
						<table class="table table-striped table-bordered">
							<thead>
								<tr>
									
									<th>地址名称</th>

									<th>地址修改</th>

									<th>地址删除</th>
								</tr>
							</thead>
							
							<tbody class="favor">
								<tr hidden="hidden">
									<td colspan="3"><input   name="userId" value="${user.userId}"/></td>
								</tr>
								<c:forEach items="${userAddressList}" var="a" varStatus="status">
									<tr hidden="hidden">
										<td colspan="3"><input   name="addId" value="${a.addId}"/></td>
									</tr>
								<tr>

									<td>${a.addInfo}</td>
									<td class="action-td">

										<a href="${pageContext.request.contextPath}/front/userCenter/toUpdateAddress?addId=${a.addId}" style="padding-top: 10px;" class="btn btn-small">
											<i class="icon-edit"></i>
										</a>
									</td>
									<td class="action-td">
															
										<a href="${pageContext.request.contextPath}/front/userCenter/toDeleteAddress?addId=${a.addId}" style="padding-top: 10px;" class="btn btn-small">
											<i class="icon-remove"></i>
										</a>
									</td>
								</tr>
								</c:forEach>
								<tr>
									<%--<td colspan="2"><input type="text" name="addInfo"style="height: 25px;"></td>--%>
									<td colspan="3"  style="text-align: center; vertical-align: middle;"><a  href="${pageContext.request.contextPath}/front/userCenter/addCreate" style="padding-top: 10px;" class="btn btn-small">
											<i class="icon-plus"></i>
										</a>
										<%--<input type="button" onclick="formSubmit('addAddress','_self');this.blur();" value="添加地址" >--%>

									</td>
								</tr>
								
							</tbody>
						</table>
					</form>
					</div> <!-- /widget-content -->
					
				</div> <!-- /widget -->
				
			</div>
				
				
				
			
			
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
<script src="${sod}/staticfile/front/js/excanvas.min.js"></script>
<script src="${sod}/staticfile/front/js/jquery.flot.js"></script>
<script src="${sod}/staticfile/front/js/jquery.flot.pie.js"></script>
<script src="${sod}/staticfile/front/js/jquery.flot.orderBars.js"></script>
<script src="${sod}/staticfile/front/js/jquery.flot.resize.js"></script>


<script src="${sod}/staticfile/front/js/bootstrap.js"></script>
<script src="${sod}/staticfile/front/js/charts/bar.js"></script>

  </body>
</html>

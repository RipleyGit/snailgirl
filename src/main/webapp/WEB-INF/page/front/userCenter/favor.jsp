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
					<li class="active">
						<a href="${pageContext.request.contextPath}/front/userCenter/toFavor">
							<i class="icon-home"></i>
							收藏列表
						</a>
					</li>

					<li >
						<a href="${pageContext.request.contextPath}/front/userCenter/toAddress">
							<i class="icon-pushpin"></i>
							收货地址
						</a>
					</li>

					<li>
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
					收藏列表					
				</h1>
				
				
				
				
				
				
				
				<div class="widget widget-table">
										
					<div class="widget-header">
						<i class="icon-th-list"></i>
						<h3>美食收藏</h3>
					</div> <!-- /widget-header -->
					
					<div class="widget-content">
					
						<table class="table table-striped table-bordered">
							<thead>
								<tr>
									
									<th style="text-align:center; vertical-align: middle;">美食图片</th>
									<th style="text-align:center; vertical-align: middle;">美食名称</th>
									<th style="text-align:center; vertical-align: middle;">美食价格</th>
									<th style="text-align:center; vertical-align: middle;">立即购买</th>
									
								</tr>
							</thead>
							
							<tbody class="favor">
							<c:forEach items="${favorList}" var="f" varStatus="status">
								<tr>

									<td style="width: 50px; height: 50px;"><img style="width:100%;height: 100%" src="${f.product.prodImg}"></td>
									<td style="width: 50%; height: 50%; text-align:center; vertical-align: middle;">${f.product.prodName}</td>
									<td style="width: 10%; height: 10%; text-align:center; vertical-align: middle;">${f.product.prodPrice}</td>
									<td style="text-align:center; vertical-align: middle;">
										<a href="${pageContext.request.contextPath}/toviewProd?prodId=${f.product.prodId}"  class="btn">
											购买
										</a>
									</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					
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

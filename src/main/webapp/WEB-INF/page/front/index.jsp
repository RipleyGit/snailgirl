﻿<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Home</title>
<link href="${sod}/staticfile/front/css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="${sod}/staticfile/front/js/jquery-1.7.2.min.js"></script>
<!-- Custom Theme files -->
<link href="${sod}/staticfile/front/css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--webfont-->

<!--Animation-->
<script src="${sod}/staticfile/front/js/wow.min.js"></script>
<link href="${sod}/staticfile/front/css/animate.css" rel='stylesheet' type='text/css' />
<script>
	new WOW().init();
</script>
<script type="text/javascript" src="${sod}/staticfile/front/js/move-top.js"></script>
<script type="text/javascript" src="${sod}/staticfile/front/js/easing.js"></script>
<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},1200);
				});
			});

            $(function(){
                $("#search_btn").click(function(){
                    var search=$("#search_input").val();

                    window.location.href="${sod}/prod/prodListBySearch?search="+search;
                })
            })

		</script>
</head>
<body>
    <!-- header-section-starts -->
	<%@include file="head.jsp"%>

		<div class="banner wow fadeInUp" data-wow-delay="0.4s" id="Home">
		    <div class="container">
				<div class="banner-info">
					<div class="banner-info-head text-center wow fadeInLeft" data-wow-delay="0.5s">
						<h1>全国超过5000家餐厅！</h1>
						<div class="line">
							<h2>吃你想吃</h2>
						</div>
					</div>
					<div class="form-list wow fadeInRight" data-wow-delay="0.5s">
						
						  <ul class="navmain" >
							<form action="" method="post">
							<li style="width:40%; margin-left:300px;"><span>Foot Name</span>
							 <input type="text" class="text"  name="search" placeholder="Swagath Grand" id="search_input" />
							</li>

							</form>
						  </ul>

						</div>
					<!-- start search-->
					<div class="srch"><button id="search_btn"></button></div>

		
					
				</div>
			</div>
		</div>
	</div>
	<!-- header-section-ends -->

	<!-- content-section-starts -->
	<div class="content">
		<div class="ordering-section" id="Order">
			<div class="container">
				<div class="ordering-section-head text-center wow bounceInRight" data-wow-delay="0.4s">
					<h3>点餐从未如此简单</h3>
					<div class="dotted-line">
						<h4>只  需  三  步 </h4>
					</div>
				</div>
				<div class="ordering-section-grids">
					<div class="col-md-3 ordering-section-grid">
						<div class="ordering-section-grid-process wow fadeInRight" data-wow-delay="0.4s"">
							<i class="one"></i><br>
							<i class="two-icon"></i>
							<p>选择 <span>您的食物</span></p>
							<label></label>
						</div>
					</div>
					<div class="col-md-3 ordering-section-grid">
						<div class="ordering-section-grid-process wow fadeInRight" data-wow-delay="0.4s"">
							<i class="two"></i><br>
							<i class="three-icon"></i>
							<p>确认  <span>您的订单</span></p>
							<label></label>
						</div>
					</div>
					<div class="col-md-3 ordering-section-grid">
						<div class="ordering-section-grid-process wow fadeInRight" data-wow-delay="0.4s"">
							<i class="three"></i><br>
							<i class="four-icon"></i>
							<p>享受   <span>您的用餐时间</span></p>
							
						</div>
					</div>
					
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
		<div class="special-offers-section">
			<div class="container">
				<div class="special-offers-section-head text-center dotted-line">
					<h4>每 日 推 荐</h4>
				</div>
				<div class="special-offers-section-grids">
				 <div class="m_3"><span class="middle-dotted-line"> </span> </div>
				   <div class="container">
					  <ul id="flexiselDemo3">
						<li>
							<div class="offer">
								<div class="offer-image">	
									<img src="../../staticfile/back/products/caitu/6.jpg" class="img-responsive" alt=""/>
								</div>
								<div class="offer-text">
									<h4>发丝响骨</h4>
									<p>香香脆脆，好吃又爽口</p>
									<input type="button" onclick="location.href='/prod/prodListBySearch?search=发丝响骨'" value="吃我吧">
									<span></span>
								</div>
								<div class="clearfix"></div>
							</div>
						</li>
						  <li>
							  <div class="offer">
								  <div class="offer-image">
									  <img src="../../staticfile/back/products/caitu/8.jpg" class="img-responsive" alt=""/>
								  </div>
								  <div class="offer-text">
									  <h4>香辣鸭拐</h4>
									  <p>香香辣辣，刺激味蕾</p>
									  <input type="button"  onclick="location.href='/prod/prodListBySearch?search=香辣鸭拐'" value="吃我吧">
									  <span></span>
								  </div>
								  <div class="clearfix"></div>
							  </div>
						  </li>
						  <li>
							  <div class="offer">
								  <div class="offer-image">
									  <img src="../../staticfile/back/products/caitu/12.jpg" class="img-responsive" alt=""/>
								  </div>
								  <div class="offer-text">
									  <h4>泡藕带炒鸡胗</h4>
									  <p>清脆解油腻，下酒必备</p>
									  <input type="button" onclick="location.href='/prod/prodListBySearch?search=泡藕带炒鸡胗'" value="吃我吧">
									  <span></span>
								  </div>
								  <div class="clearfix"></div>
							  </div>
						  </li>
						  <li>
							  <div class="offer">
								  <div class="offer-image">
									  <img src="../../staticfile/back/products/caitu/16.jpg" class="img-responsive" alt=""/>
								  </div>
								  <div class="offer-text">
									  <h4>捞菜炒脆肚</h4>
									  <p>肚片香脆还有捞菜的酸甜</p>
									  <input type="button" onclick="location.href='/prod/prodListBySearch?search=捞菜炒脆肚'" value="吃我吧">
									  <span></span>
								  </div>
								  <div class="clearfix"></div>
							  </div>
						  </li>
						  <li>
							  <div class="offer">
								  <div class="offer-image">
									  <img src="../../staticfile/back/products/caitu/19.jpg" class="img-responsive" alt=""/>
								  </div>
								  <div class="offer-text">
									  <h4>兔沾水兔</h4>
									  <p>鲜嫩的兔肉配上果蔬美味又健康</p>
									  <input type="button" onclick="location.href='/prod/prodListBySearch?search=兔沾水兔'"  value="吃我吧">
									  <span></span>
								  </div>
								  <div class="clearfix"></div>
							  </div>
						  </li>
						
					 </ul>
				 <script type="text/javascript">
					$(window).load(function() {
						
						$("#flexiselDemo3").flexisel({
							visibleItems: 3,
							animationSpeed: 1000,
							autoPlay: false,
							autoPlaySpeed: 3000,    		
							pauseOnHover: true,
							enableResponsiveBreakpoints: true,
							responsiveBreakpoints: { 
								portrait: { 
									changePoint:480,
									visibleItems: 1
								}, 
								landscape: { 
									changePoint:640,
									visibleItems: 2
								},
								tablet: { 
									changePoint:768,
									visibleItems: 3
								}
							}
						});
						
					});
				    </script>
				    <script type="text/javascript" src="${sod}/staticfile/front/js/jquery.flexisel.js"></script>
				</div>
			</div>
		</div>
		</div>
		<%--<div class="popular-restaurents" id="Popular-Restaurants">
			<div class="container">
				<div class="col-md-4 top-restaurents">
					<div class="top-restaurent-head">
						<h3>私 人 厨 房</h3>
					</div>
					<div class="top-restaurent-grids">
						<div class="top-restaurent-logos">
							<div class="res-img-1 wow bounceIn" data-wow-delay="0.4s">
								<img src="${sod}/staticfile/front/images/restaurent-1.jpg" class="img-responsive" alt="" />
							</div>
							<div class="res-img-2 wow bounceIn" data-wow-delay="0.4s">
							    <img src="${sod}/staticfile/front/images/restaurent-2.jpg" class="img-responsive" alt="" />
							</div>
							<div class="res-img-1 wow bounceIn" data-wow-delay="0.4s">
							    <img src="${sod}/staticfile/front/images/restaurent-3.jpg" class="img-responsive" alt="" />
							</div>
							<div class="res-img-2 wow bounceIn" data-wow-delay="0.4s">
							    <img src="${sod}/staticfile/front/images/restaurent-4.jpg" class="img-responsive" alt="" />
							</div>
							<div class="res-img-1 nth-grid1 wow bounceIn" data-wow-delay="0.4s">
							    <img src="${sod}/staticfile/front/images/restaurent-5.jpg" class="img-responsive" alt="" />
							</div>
							<div class="res-img-2 nth-grid1 wow bounceIn" data-wow-delay="0.4s">
							    <img src="${sod}/staticfile/front/images/restaurent-6.jpg" class="img-responsive" alt="" />
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
				<div class="col-md-8 top-cuisines">
					<div class="top-cuisine-head">
						<h3>热 门 食 物</h3>
					</div>
					<div class="top-cuisine-grids">
						<div class="top-cuisine-grid wow bounceIn" data-wow-delay="0.4s">
						    <a href=""><img src="${sod}/staticfile/front/images/cuisine1.jpg" class="img-responsive" alt="" /> </a>
							<label>Cuisine Name</label>
					    </div>
						
						<div class="clearfix"></div>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<div class="service-section">
			<div class="service-section-top-row">
				<div class="container">
					<div class="service-section-top-row-grids wow bounceInLeft" data-wow-delay="0.4s">
					<div class="col-md-3 service-section-top-row-grid1">
						<h3>Enjoy Exclusive Food Order any of these</h3>
					</div>
					<div class="col-md-2 service-section-top-row-grid2">
						<ul>
							<li><i class="arrow"></i></li>
							<li class="lists">Party Orders</li>
						</ul>
						<ul>
							<li><i class="arrow"></i></li>
							<li class="lists">Home Made Food</li>
						</ul>
						<ul>
							<li><i class="arrow"></i></li>
							<li class="lists"> Diet Food </li>
						</ul>
					</div>
					<div class="col-md-5 service-section-top-row-grid3">
						<img src="${sod}/staticfile/front/images/lunch.png" class="img-responsive" alt="" />
					</div>
					<div class="col-md-2 service-section-top-row-grid4 wow swing animated" data-wow-delay= "0.4s">
						<input type="submit" value="马上订餐">
					</div>
					<div class="clearfix"></div>
					</div>
				</div>
			</div>--%>
			<div class="service-section-bottom-row">
				<div class="container">
					<div class="col-md-4 service-section-bottom-grid wow bounceIn "data-wow-delay="0.2s">
						<div class="icon">
							<img src="${sod}/staticfile/front/images/icon1.jpg" class="img-responsive" alt="" />
						</div>
						<div class="icon-data">
							<h4>服务保证</h4>
							<p>客户至上 用心服务 </p>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="col-md-4 service-section-bottom-grid wow bounceIn "data-wow-delay="0.2s">
						<div class="icon">
							<img src="${sod}/staticfile/front/images/icon2.jpg" class="img-responsive" alt="" />
						</div>
						<div class="icon-data">
							<h4>支付安全</h4>
							<p>安全便捷 快速下单 </p>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="col-md-4 service-section-bottom-grid wow bounceIn "data-wow-delay="0.2s">
						<div class="icon">
							<img src="${sod}/staticfile/front/images/icon3.jpg" class="img-responsive" alt="" />
						</div>
						<div class="icon-data">
							<h4>跟踪订单</h4>
							<p>火速配送，万里追踪 </p>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- content-section-ends -->
	<!-- footer-section-starts -->

	<%@include file="foot.jsp"%>

</body>
</html>
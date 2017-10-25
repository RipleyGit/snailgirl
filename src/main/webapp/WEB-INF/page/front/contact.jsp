<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>contact</title>
<%@include file="base.jsp"%>
</head>
<body>
    <!-- header-section-starts -->
	<%@include file="head.jsp"%>
	<!-- header-section-ends -->
	<div class="contact-section-page">
		<div class="contact-head">
		    <div class="container">
				<h3>联系我们</h3>
				
			</div>
		</div>
		<div class="contact_top">
			 		<div class="container">
			 			<div class="col-md-6 contact_left wow fadeInRight" data-wow-delay="0.4s">
			 				<h4>意见表</h4>
			 				<p>欢迎对我们的服务及菜品提出宝贵意见，我们将为您尽快处理。一切以客户为中心以提升客户价值、提高客户满意度为出发点! 开拓、创新,立足市场求发展;优质、高效,用心服务为用户</p>
							  <form action="/user/submitAdvise">
								 <div class="form_details">
					                 <input type="text" class="text" value="Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name';}">
									 <input type="text" class="text" value="Email Address" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email Address';}">
									 <input type="text" class="text" value="Subject" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Subject';}">
									 <textarea value="Message" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Message';}">Message</textarea>
									 <div class="clearfix"> </div>
									 <div class="sub-button wow swing animated" data-wow-delay= "0.4s">
									 	<input name="submit" type="submit" value="发送">
									 </div>
						          </div>
						       </form>
					         </div>
					        <div class="col-md-6 company-right wow fadeInLeft" data-wow-delay="0.4s">
					        	<div class="contact-map">
			
		</div>
      
	  <div class="company-right">
					        	<div class="company_ad">
							     		<h3>其他方式</h3>
							     		
			      						<address>
											 <p>邮箱:<a href="mail-to: info@example.com">info@display.com</a></p>
											 <p>电话:  +255 55 55 777</p>
									   		<p>28-7-169, 2nd Ave South</p>
									   		<p>Saskabush, SK   S7M 1T6</p>
									 	 	
							   			</address>
							   		</div>
									</div>	
									<div class="follow-us">
										<h3>欢迎关注</h3>
										<a href="#"><i class="facebook"></i></a>
										<a href="#"><i class="twitter"></i></a>
										<a href="#"><i class="google-pluse"></i></a>
									</div>
			
							
							 </div>
						</div>
					</div>
           
	</div>
	<!-- footer-section-starts -->
	<%@include file="foot.jsp"%>

</body>
</html>
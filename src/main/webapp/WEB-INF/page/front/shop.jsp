<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Popular-restaurent</title>
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

				$('.buybtn').click(function(){
					window.open("order111.html");
				});
				$(".updatePnum").blur(function () {
                    var pId = this.id;
                    var oldValue = $(this).attr("oldvalue")
				    <!-- 检验输入参数是否合法 -->
                    var reg = /^[1-9][0-9]*$/;

					var pnum = $(this).val();

                    if(!reg.test(pnum)){
                        alert("您输入的购买数量不合法!");
                        $(this).val(oldValue);
                        return;
                    }
					window.location.href="/buyIt?pnum="+pnum+"&pId="+pId;
                });
				$("#subbtn").click(function(){
                    var totalmoney = $(this).val();
                    window.location.href="/createorderitem?totalmoney="+totalmoney;
				});
			});
		</script>
</head>
<body>
    <!-- header-section-starts -->
	<%@include file="head.jsp"%>
	<!-- header-section-ends -->
	<!-- content-section-starts -->
	<div class="table-responsive m-t">
						<!-- 购物车 -->
                        <table class="table invoice-table">
                            <thead>
                                <tr>
                                    <th>菜名</th>
                                    <th>数量</th>
                                    <th>单价</th>
                                    <th>总价</th>
                                </tr>
                            </thead>
							<c:set var="totalmoney" value="0"/>
                            <tbody>

							<c:forEach items="${prods}" var="entry">
								<c:if test="${entry.value > 0}">
                                <tr>
                                    <td>
                                        <div><strong>${entry.key.prodName}</strong>
                                        </div>
                                    </td>
                                    <td>
										<input type="text" size="2" class="updatePnum" oldvalue="${entry.value}" id="${entry.key.prodId}" value="${entry.value}"/>
									</td>
                                    <td>￥${entry.key.prodPrice}</td>
                                    <td>￥${entry.key.prodPrice * entry.value}</td>
                                </tr>
								</c:if>
								<c:set var="totalmoney" value="${totalmoney + entry.key.prodPrice * entry.value}"></c:set>
							</c:forEach>
                    <!-- /table-responsive -->

                    <table class="table invoice-total" align="center">
                        <tbody>
                            <tr>
                                <td><strong>总价：</strong>
                                </td>
                                <td>￥${totalmoney}</td>
								<td><button class="btn btn-primary" id="subbtn" value="${totalmoney}"><i class="fa fa-dollar"></i> 去付款</button></td>
                            </tr>
                        </tbody>
                    </table>

                    <div class="well m-t"><strong>注意：</strong> 请在30日内完成付款，否则订单会自动取消。
					</div>


    <!-- content-section-ends -->
	<!-- footer-section-starts -->
	<%@include file="foot.jsp"%>

</body>
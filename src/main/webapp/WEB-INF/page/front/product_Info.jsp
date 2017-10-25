<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>商品展示</title>
    <link href="${sod}/staticfile/front/css/bootstrap.css" rel='stylesheet' type='text/css' />
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${ sod }/staticfile/front/js/jquery-1.7.2.min.js"></script>
    <!-- Custom Theme files -->
    <link href="${sod}/staticfile/front/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <!-- Custom Theme files -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!--webfont-->

    <!--Animation-->
    <script src="${sod}/staticfile/front/js/wow.min.js"></script>
    <link href="${sod}/staticfile/front/css/animate.css" rel='stylesheet' type='text/css' />
    <link href="${sod}/staticfile/front/css/prodInfo.css" rel="stylesheet" type="text/css">
    <script>
        new WOW().init();
    </script>
    <script type="text/javascript" src="${sod}/staticfile/front/js/move-top.js"></script>
    <script type="text/javascript" src="${sod}/staticfile/front/js/easing.js"></script>
    <script>
        /* 文档就绪函数,在整个html文档加载完之后立即执行 */
        $(function(){
            /* 为"减号(-)"添加点击事件, 实现点击"减号"将购买数量减1 */
            $("#delNum").click(function(){
                var $buyNumInp =  $("#buyNumInp");
                //获取输入框内的购买数量
                var buyNum = $buyNumInp.val();

                if(buyNum>1){//购买数量不能小于1
                    //减1再存入输入框
                    $buyNumInp.val(parseInt(buyNum)-1);
                }
            });
            /* 为"加号(+)"添加点击事件, 实现点击"加号"将购买数量加1 */
            $("#addNum").click(function(){
                var $buyNumInp =  $("#buyNumInp");
                //获取输入框内的购买数量
                var buyNum = $buyNumInp.val();
                //减1再存入输入框
                $buyNumInp.val(parseInt(buyNum)+1);
            });

            /* 为购买数量输入框添加失去焦点事件
             * 当输入失去焦点时, 检查购买数量是否合法
             * 购买数量必须是 大于0的整数
             * 正则表达式为: /^[1-9][0-9]*$/
             */
            $("#buyNumInp").blur(function(){
                //正则: 大于0的整数
                var reg = /^[1-9][0-9]*$/;
                //获取购买数量
                var buyNum = $(this).val();
                if(!reg.test(buyNum)){
                    alert("您输入的购买数量不合法!");
                    $(this).val(1);
                    return;
                }
            });

            $(".add_cart_but").click(function () {
                var pnum = $("#buyNumInp").val();
                $.post("/updateCart/${prod.prodId}/"+pnum,function () {
                    window.location.href="${sod}/prod/ProductListByType?page=1&prodType=";
                })
            });

        });

    </script>

</head>
<body>
<!-- header-section-starts -->
<%@include file="head.jsp"%>

<div id="warp">
    <div id="left">
        <div id="left_top">
            <!-- 商品的图片 -->
            <img src="${sod}/${prod.prodImg}" width="700px" height="600px"/>
        </div>
    </div>
        <div id="right">
            <div id="right_top">
                <span id="prodName">美食名称 : ${ prod.prodName }<br/></span>
                <br>
                <span id="prodDes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;美食介绍 : ${ prod.prodDes }<br/></span>
            </div>
            <div id="right_middle">
				<span id="right_middle_span">
					SnailGirl 价：
				<span class="prodPrice">￥${ prod.prodPrice }
				<br/>
			    运&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;费：不存在运费哦<br />
			    服&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;务：由SnailGirl负责送餐，并提供售后服务<br />
			    购买数量：
	            <a href="javascript:void(0)" id="delNum" onclick="">-</a>
	            <input type="text" id="buyNumInp" name="pnum" oldBuyNum="1" value="1">
		        <a href="javascript:void(0)" id="addNum" onclick="">+</a>
            </div>
            <div id="right_bottom">
                <input type="hidden" name="pId" value="${ prod.prodId }"/>
               <input class="add_cart_but" type="submit" value="添加订单"/>
            </div>
        </div>

</div>


<!-- content-section-ends -->
<!-- footer-section-starts -->

<%@include file="foot.jsp"%>

</body>
</html>
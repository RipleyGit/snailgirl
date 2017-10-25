<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<title>login page</title>

	<link href="${sod}/staticfile/front/css/bootstrap.css" rel='stylesheet' type='text/css' />
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="${sod}/staticfile/front/js/jquery.min.js"></script>
	<!-- Custom Theme files -->
	<link href="${sod}/staticfile/front/css/style.css" rel="stylesheet" type="text/css" media="all" />
	<!-- Custom Theme files -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	<!--webfont-->

	<!--Animation-->
	<script src="${sod}/staticfile/front/js/wow.min.js"></script>
	<link href="${sod}/staticfile/front/css/animate.css" rel='stylesheet' type='text/css' />

	<script src="${sod}/staticfile/front/js/jquery-validation-1.14.0/lib/jquery.js"></script>
	<script src="${sod}/staticfile/front/js/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
	<script src="${sod}/staticfile/front/js/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>

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
	</script>

	<script>
        $(function(){
            $("input[name='username']").blur(function(){
                var name=$(this).val();
                $.post("checkName",{"name":name},function (result) {
                    if(result!=null && result!="") {
                        alert(result);
                    }

                });
            });
        })


        $().ready(function() {
            // 在键盘按下并释放及提交后验证提交表单
            $(".loginForm").validate({
                errorPlacement: function(error, element) {
                    error.appendTo(element.parent());
                },
                rules: {
                    password: {
                        required: true,
                        minlength:5
                    },
                    repassword: {
                        required: true,
                        minlength: 5
                    }
                },
                errorElement: "span",
                messages: {
                    password: {
                        required: "请输入密码",
                        minlength: "密码长度不能小于5个字母"
                    },
                    repassword: {
                        required: "请输入确认密码",
                        minlength: "确认密码长度不能小于5个字母",
                        equalTo:'#password'
                    }
                }
            });
        });


	</script>
	<style>
		input.error { border: 1px solid red; }
		label.error {
			padding-left: 16px;
			padding-bottom: 2px;
			font-weight: bold;
			color: #EA5200;
		}
	</style>
	<style>
		.error{
			color: red;
			align-content: center;
		}
	</style>
</head>
<body>
<%@include file="head.jsp"%>
<div class="content">
	<div class="container">
		<div class="login-page">
			<div class="dreamcrub">
				<ul class="breadcrumbs">
					<li class="home">
						<a href="${sod}/home/index" title="Go to Home Page">用户</a>&nbsp;
						<span>&gt;</span>
					</li>
					<li class="women">
						修改密码
					</li>
				</ul>
				<ul class="previous">
					<li><a href="javascript:history.go(-1)" >返回上一页</a></li>
				</ul>
				<div class="clearfix"></div>
			</div>
			<div class="account_grid">
				<div class="col-md-6 login-left wow fadeInLeft" data-wow-delay="0.4s">
					<h3>客户</h3>
					<br>田螺姑娘欢迎您的回来</br>
					<br>感谢您对我们的支持和信任。</br>
					<br/>
					<br/>
				</div>

				<div class="col-md-6 login-right wow fadeInRight" data-wow-delay="0.4s">
					<h3>请修改密码</h3>
					<c:if test="${param.error != null}">
						<p style="color: red;size: 12px">
							您的账号或密码错误!!!
						</p>
					</c:if>
					<c:if test="${errorInfo!=null&&errorInfo!=''}">
						<div style="color: red;size: 12px" id="errorInfo1">${errorInfo}</div>
					</c:if>
					<div style="color:red; size:12px" id="msg"></div>
					<form action="${sod}/user/updatePassword" class="loginForm" method="post">
						<input type="hidden" name="userId" value="${userId}">
						<div class="user-name">
							<label for="user" >请输入新密码：<i class="am-icon-user"></i></label>
							<input type="password" name="password" id="user" placeholder="请输新入密码" style="width: 180px">
						</div>
						<div class="user-pass" >
							<label for="password" >请再次输入密码：<i class="am-icon-lock"></i></label>
							<input type="password" name="repassword" id="password" placeholder="请再次输入新密码" style="margin-left: 12px;width: 190px">
						</div>
						<input type="submit" value="修改&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"/>
					</form>
				</div>

			</div>
		</div>
	</div>

	<%@include file="recommend.jsp"%>
	<div class="clearfix"></div>

	<%@include file="foot.jsp"%>


</body>
</html>
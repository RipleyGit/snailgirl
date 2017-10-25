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

            $("#forgetbtn").click(function () {
				alert("验证邮件，已发送至您的邮箱，请及时查收并更改密码");
            })
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
                    username: {
                        required: true,
                    },
                    password: {
                        required: true,
                        minlength: 5
                    }
                },
                errorElement: "span",
                messages: {
                    username: {
                        required: "请输入用户名",
                        minlength: "用户名必需由两个字母组成"
                    },
                    password: {
                        required: "请输入密码",
                        minlength: "密码长度不能小于5个字母"
                    }
                }
            });

            $("#forgetbtn").click(function () {
				var username = $("#user").val();
				window.location.href="/user/checkUpdatePassword?username="+username;
            })
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
						<a href="${sod}/home/index" title="Go to Home Page">主页</a>&nbsp;
						<span>&gt;</span>
					</li>
					<li class="women">
						登入
					</li>
				</ul>
				<ul class="previous">
					<li><a href="javascript:history.go(-1)" >返回上一页</a></li>
				</ul>
				<div class="clearfix"></div>
			</div>
			<div class="account_grid">
				<div class="col-md-6 login-left wow fadeInLeft" data-wow-delay="0.4s">
					<h3>新客户</h3>
					<br>在我们商店创建一个帐户，可以更便捷地结帐，存储</br>
					<br>多个送货地址，查看和跟踪您的订单及更多的操作。</br>
					<br/>
					<br/>
					<a class="acount-btn" href="${sod}/user/register">创建新账户</a>
				</div>



				<div class="col-md-6 login-right wow fadeInRight" data-wow-delay="0.4s">
					<h3>请登录</h3>
					<br>如果您有我们的帐户，请登录。</br>
					<c:if test="${param.error != null}">
						<p style="color: red;size: 12px">
							您的账号或密码错误!!!
						</p>
					</c:if>
					<c:if test="${errorInfo!=null&&errorInfo!=''}">
						<div style="color: red;size: 12px" id="errorInfo1">${errorInfo}</div>
					</c:if>
					<div style="color:red; size:12px" id="msg"></div>
					<form action="${sod}/login/toLogin" class="loginForm" method="post">
						<div class="user-name">
							<label for="user" >请输入用户名：<i class="am-icon-user"></i></label>
							<input type="text" name="username" id="user" placeholder="请输入用户名" style="width: 180px">
						</div>
						<div class="user-pass" >
							<label for="password" >请输入密码：<i class="am-icon-lock"></i></label>
							<input type="password" name="password" id="password" placeholder="请输入密码" style="margin-left: 12px;width: 190px">
						</div>

						<input type="submit" value="登陆&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"/>
						<a id="forgetbtn"><font style="font-family: Microsoft YaHei"> 忘记密码</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
						<%--<input type="submit" id="forgetbtn" value="忘记密码&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"/>--%>
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
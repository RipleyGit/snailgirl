<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Register</title>
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
<link href="${sod}/staticfile/front/css/register.css" rel='stylesheet' type='text/css' />
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
	<!--jQuery-validation-->
	<script src="${sod}/staticfile/front/js/jquery-validation-1.14.0/lib/jquery.js"></script>
	<script src="${sod}/staticfile/front/js/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
	<script src="${sod}/staticfile/front/js/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>



	<script>
        $(function(){

            $("#SendVer").click(function () {
                var tele = $("#telephone").val();
                $.post("${sod}/user/SendVer",{"tele":tele});
                alert("验证码已发送");
            })

            $("input[name='username']").blur(function(){

                $(this).attr("oldvalue",this.value);
                var name=$(this).val();

                $.post("checkUserName",{"name":name},function (result) {
                    if(result!=null && result!="") {
                        alert(result);
                    }
                });

            });
        })

        // 手机号码验证
        jQuery.validator.addMethod("isMobile", function(value, element) {
            var length = value.length;
            var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;
            return this.optional(element) || (length == 11 && mobile.test(value));
        }, "请正确填写您的手机号码");
        // 手机号码验证
        jQuery.validator.addMethod("isEamil", function(value, element) {
            var length = value.length;
            var email = /^\w+@\w+(\.\w+)+$/;
            return this.optional(element) || email.test(value);
        }, "请正确填写您的邮箱");
        /**
		 * jqery validate 注册验证
         */
        $().ready(function() {
            // 在键盘按下并释放及提交后验证提交表单
            $(".registForm").validate({
                errorPlacement: function(error, element) {
                    error.appendTo(element.parent());
                },
                rules: {
                    username: {
                        required: true,
                        minlength: 2
                    },
                    address: {
                        required: true,
                    },
                    telephone: {
                        required : true,
                        minlength : 11,
                        isMobile : true
                    },
                    eamil: {
                        required: true,
                        isEamil:true
                    },
                    password: {
                        required: true,
                        minlength: 5
                    },
                    confirm_password: {
                        required: true,
                        equalTo:'#password',
                        minlength: 5
                    }

                },
                errorElement: "span",
                messages: {
                    username: {
                        required: "请输入用户名",
                        minlength: "用户名必需由两个字母组成"
                    },
                    address: {
                        required: "请输入收货地址",
                        minlength: "长度不能小于6个字符"
                    },
                    telephone: {
                        required : "请输入手机号",
                        minlength : "确认手机不能小于11个字符",
                        isMobile : "请正确填写您的手机号码"
					},
                    eamil: {
                        required: '请输入电子邮件',
                        isEamil: '请检查电子邮件的格式'
                    },
                    password: {
                        required: "请输入密码",
                        minlength: "密码长度不能小于6个字母"
                    },
                    confirm_password: {
                        required: "请输入确认密码",
                        minlength: "密码长度不能小于6个字母"
                    }
                }
            });
        });

	</script>
	<style>
		#SendVer{
			display: inline;
			border: solid #EBEBEB;
			background-color: #EBEBEB;
			width: 56px;
			height: 100px;
		}

	</style>
</head>
<body>
    <!-- header-section-starts -->
	<%@include file="head.jsp"%>
	<!-- header-section-ends -->
	<!-- content-section-starts -->
	<div class="content">
	<div class="main">
	   <div class="container">
		  <div class="register">
			  <c:if test="${msg!=null&&msg!=''}">
			        <span style="color: red;margin-left: 30%">${msg}</span>
			  </c:if>
					 <form action="/user/saveUser" method="post" class="registForm">
						 <h3>个人资料</h3>

						 <div class="user-pass">
							 <label for="user" >账号名称：<i class="am-icon-user"></i></label>
							 <input type="text" name="username" id="user" placeholder="请输入账号名称" >

						 </div>
						 <br/>
						 <div class="user-pass" >
							 <label for="address" >收货地址：<i class="am-icon-lock"></i></label>
							 <input type="text" name="address" id="address" placeholder="请输入收货地址">

						 </div>
						 <div class="user-pass" >
							 <label for="telephone" >电话号码：<i class="am-icon-lock"></i></label>
							 <input type="text" name="telephone" id="telephone" placeholder="请输入电话号码">

						 </div>
						 <div class="user-pass" >
							 <label for="eamil" >邮箱地址：<i class="am-icon-lock"></i></label>
							 <input type="text" name="eamil" id="eamil" placeholder="请输入邮箱地址">

						 </div>
						 <div class="user-pass" >
							 <label for="password" >输入密码：<i class="am-icon-lock"></i></label>
							 <input type="password" name="password" id="password" placeholder="请输入密码">

						 </div>
						 <div class="user-pass" >
							 <label for="confirm_password" >确认密码：<i class="am-icon-lock"></i></label>
							 <input type="password" name="confirm_password" id="confirm_password" placeholder="请输入确认密码">

						 </div>
						 <div class="user-pass" >
							 <label for="confirm_ver" >验证码：<i class="am-icon-lock"></i></label>
							 &nbsp;&nbsp;<input type="text" name="verstr" id="confirm_ver"  placeholder="请输入验证码">
							 <div class="btnpass" id="SendVer" >发送验证码</div>
						 </div>
						 <br/>
						 <input class="btn-pass" type="submit" value="注册&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"/>

					 </form>
		  </div>
	      </div>
		   </div>
	     </div>

		<%@include file="recommend.jsp"%>
<div class="clearfix"></div>

	<!-- content-section-ends -->
	<!-- footer-section-starts -->
	<%@include file="foot.jsp"%>


</body>
</html>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2017/10/20
  Time: 9:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=utf-8" language="java" %>
<html>
<!--此为注册成功页面-->
<head>
    <title>Title</title>
    <%@include file="base.jsp"%>
</head>
<body>
<%@include file="head.jsp"%>
<br/>
<br/>
<br/>
<div class="container" style="margin-left: 30%;">
    <img src="${sod}/staticfile/front/images/loginsucess.png"/>
</div>
<script>
    function jumpurl(){
        location='http://localhost:8090/login/toLogin';
    }
    setTimeout('jumpurl()',3000);
</script>
<%@include file="foot.jsp"%>
</body>
</html>

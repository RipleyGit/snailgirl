<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="header">
	<div class="container">
		<div class="top-header">
			<div class="logo">
				<a href="${pageContext.request.contextPath}/home/index"><img src="${sod}/staticfile/front/images/logo.png" class="img-responsive" alt="" /></a>
			</div>
			<div class="queries">
				<p>客服电话<span>1800-0000-7777 </span><label>(11AM to 11PM)</label></p>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<div class="menu-bar">
		<div class="container">
			<div class="top-menu">
				<ul>
					<li class="active"><a href="/home/index">主页</a></li>|
					<li><a href="/prod/ProductListByType?page=1&prodType=">菜单</a></li>|
					<li><a href="/prod/ProductListByType?page=1&prodType=粤菜">粤菜</a></li>|
					<li><a href="/prod/ProductListByType?page=1&prodType=川菜">川菜</a></li>|
					<li><a href="/prod/ProductListByType?page=1&prodType=湘菜">湘菜</a></li>|
					<li><a href="/prod/ProductListByType?page=1&prodType=京菜">京菜</a></li>|
					<li><a href="/home/toContact">联系我们</a></li>
					<div class="clearfix"></div>
				</ul>
			</div>

			<div class="login-section">
				<ul>
					<c:if test="${empty user}">
					<li><a href="/login/toLogin">登录</a>  </li> |
					<li><a href="/user/register">注册</a> </li>
					</c:if>
					<c:if test="${not empty user}">
						<li><a href="${pageContext.request.contextPath}/front/userCenter/toIndex">客户中心</a></li>  |
						<li><a href="${pageContext.request.contextPath}/front/userCenter/logout">注销</a>  </li>
					</c:if>
					<div class="clearfix"></div>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header class="header-main">
	
	<div class="d-flex align-items-center mt-4">
		<div class="main-logo-container col-5 d-flex justify-content-center">
			<h1 class="main-logo">Monstagram</h1>
		</div>
		<div class="search-box-container col-4 d-flex align-items-center">
			<input type="text" class="search-box form-control text-center" placeholder="검색">
			<span class="search-icon"><i class="fas fa-search"></i></span>
		</div>
		<div class="btn-box col-2 d-flex justify-content-between">
			<div class="home-button-container"><button type="button" id="homeBtnHeader"><a href="/feed/main_view" class="homeBtnHeaderLink"><i class="fas fa-home fa-2x"></i></a></button></div>
			<div class="like-button-container"><button type="button" id="likeBtnHeader"><a href="#" class= "likeBtnHeaderLink"><i class="far fa-heart fa-2x"></i></a></button></div>
			<div class="user-btn-container">
				<c:if test="${not empty userName }">
					<b>${userName }</b>님 <a href="/user/sign_out" class="ml-3"><b>로그아웃</b></a>
				</c:if>
				<c:if test="${empty userName }">
					<b><a href="/user/signin_view" class="ml-3"><b>로그인</b></a>
				</c:if>
			</div>
		</div>
	</div>
	<hr>
</header>


</body>
</html>
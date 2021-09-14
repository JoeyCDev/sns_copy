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
<header>
	<div class="d-flex justify-content-end mr-3">
		<c:if test="${not empty userName }">
			${userName } <b class="ml-3">로그아웃</b>
		</c:if>
	</div>
</header>

</body>
</html>
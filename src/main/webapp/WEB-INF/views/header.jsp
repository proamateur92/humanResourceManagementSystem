<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	<link rel="stylesheet" href="${contextPath }/resources/2/bootstrap.min.css">
</head>
<body>
	<div class="mb-3 bg-secondary mx-5">
		<div class="float-left">
			<h3><a href="/hrm/index.do">PINO SOFT</a></h3>
		</div>
		<div class="float-right">
			<a href="#" class="mr-2">입력하기</a>
			<a href="#">조회하기</a>
		</div>
	</div>
</body>
</html>
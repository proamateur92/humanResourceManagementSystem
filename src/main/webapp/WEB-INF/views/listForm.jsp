<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>직원리스트</title>
</head>
<body>

<table border="2">
	<tr>
		<td>사번</td>
		<td>이름</td>
		<td>주민번호</td>
		<td>핸드폰번호</td>
		<td>이메일</td>
		<td>아이디</td>
	</tr>
<c:forEach var="insa" items="${list}">
	<tr>
		<td>${insa.sabun }</td>
		<td>${insa.name }</td>
		<td>${insa.reg_no }</td>
		<td>${insa.hp }</td>
		<td>${insa.email }</td>
		<td>${insa.id }</td>
	</tr>
</c:forEach>
</table>

</body>
</html>
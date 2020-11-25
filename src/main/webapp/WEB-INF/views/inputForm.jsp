<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Custom Theme files -->
<link href="${pageContext.request.contextPath}/resources/style.css" rel="stylesheet" type="text/css" media="all" />
<script>
	function button1(){
		location.href="/";
	}
</script>
<title>작성 폼</title>
</head>
<body>
	<!-- main -->
		<h1>직원상세정보</h1>
				<form action="/inputForm" method="post">
					<table id="t">
						<tr>
							<td rowspan="6"><input type="button" value="사진올리기"></td>
							<td>사번 <input type="text"></td>
							<td>한글성명<input type="text" name="name"></td>
							<td>영문성명<input type="text" name="eng_name"></td>
						</tr>
						<tr>
	 						<td>아이디<input type="text" name="id"></td>
							<td>비밀번호<input type="text" name="pwd"></td>
							<td>비밀번호 확인<input type="text" id="pwd"></td>
						</tr>
						<tr>
							<td>이메일<input type="text" name="email"></td>
							<td>주민등록번호<input type="text" name="reg_no"></td>
							<td>핸드폰번호<input type="text" name="hp"></td>
						</tr>
						<tr>
							<td>연령<input type="text" name="age"></td>
							<td>직종체크<input type="text" name="major"></td>
							<td>성별<input type="text" name="gender"></td>
						</tr>
						<tr>
							<td>주소<input type="text" name="add1" placeholder="우편번호"></td>
							<td><input type="text" name="add2" placeholder="주소"></td>
							<td><input type="text" name="add3" placeholder="세부주소"></td>
						</tr>
						<tr>
							<td>직위<input type="text" name="rank"></td>
							<td>부서<input type="text" name="dept"></td>
							<td>연봉<input type="text" name="sal" placeholder="(만원)"></td>
						</tr>
						<tr>
							<td>입사구분<input type="text" name="join_check"></td>
							<td>최종학력<input type="text" name="school"></td>
							<td>투입여부<input type="text" name="input_check"></td>
							<td>군필여부<input type="text" name="mil_check"></td>
						</tr>
						<tr>
							<td>군별<input type="text" name="mil_kind"></td>
							<td>계급<input type="text" name="mil_rank"></td>
							<td>입영일자<input type="text" name="mil_date1"></td>
							<td>전역일자<input type="text" name="mil_date2"></td>
						</tr>
						<tr>
							<td>KOSA등록<input type="text" name="kosa_reg"></td>
							<td>KOSA등급<input type="text" name="kosa_rank"></td>
							<td>입사일자<input type="text" name="enter_date"></td>
							<td>퇴사일자<input type="text" name="leave_date"></td>
						</tr>
						<tr>
							<td>사업자번호<input type="text" name="mil_check"></td>
							<td>업체명<input type="text" name="mil_check"></td>
							<td>사업자등록증<input type="text" name="mil_check"></td>
							<td><input type="button" value="미리보기"></td>
							<td><input type="button" value="등록"></td>
						</tr>
						<tr>
							<td colspan="2" rowspan="2">자기소개<input type="text" name="introduce"></td>
							<td>이력서<input type="text" name="mil_check"></td>
							<td><input type="button" value="다운"></td>
							<td><input type="button" value="파일업로드"></td>
						</tr>
					</table>
					
					<input type="button" value="전화면" onclick="button1();">
					<input type="submit" value="등록">
				</form>
					
</body>
</html>
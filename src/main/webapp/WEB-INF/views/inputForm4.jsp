<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>

 <title>작성 폼</title>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.2/jquery.modal.min.js" integrity="sha512-ztxZscxb55lKL+xmWGZEbBHekIzy+1qYKHGZTWZYH1GUwxy0hiA18lW6ORIMj4DHRgvmP/qGcvqwEyFFV7OYVQ==" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> <!-- datepicker -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- Custom fonts for this template -->
<link href="../resources/1/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<script src="${contextPath }/resources/validator.js"></script>
<link type="text/css" rel="stylesheet" href="${contextPath }/resources/style.css">

<style type="text/css">
td {
text-align: left;
}

	td {
				padding: 20px;
			}
	.profile_photo, #profile_image, #cmp_preview {
		text-align: center;
	}
</style>
</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
					PINOSOFT
					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">
						<div class="topbar-divider d-none d-sm-block"></div>
					</ul>

				</nav>
				<!-- End of Topbar -->
                    
					<h1>직원등록정보</h1>
				<form class="input" action="/inputForm" method="post" enctype="multipart/form-data">
				<p align="right">
					<input type="button" value="전화면" id="mainView">
					<input type="submit" id="submit" value="등록">
					<input type="reset" value="재작성">
				</p>
					<table>
						<tr>
							<td rowspan="6" class="profile_photo">
								<div id="image_preview">
								<img src="../resources/img/unknown.png" style="width: 150px; height: 150px;" class="img-profile"><br>
								</div>
								<input type="file" id="profile_image">
								<input type="hidden" name="profile_image">
							</td>
							<td>*사번 <input type="text" disabled="disabled"></td>
							<td>*한글성명<input type="text" name="name" id="name"></td>
							<td>영문성명<input type="text" name="eng_name" id="eng_name"></td>
						</tr>
						<tr>
	 						<td>*아이디<input type="text" name="id" id="id"></td>
							<td>*비밀번호<input type="text" name="pwd_input" id="pwd_input" ></td>
							<input type="hidden" name="pwd" id="pwd" >
							<td>비밀번호 확인<input type="text" id="pwd_ck_input" name="pwd_ck_input"></td>
							<input type="hidden" id="pwd_ck">
						</tr>
						<tr>
							<td>*이메일<input type="text" name="email" id="email">@
							<input type="hidden" id="email2" name="email2">
							<input type="text" id="emaila" style="width:150px" disabled="true" value="선택하세요.">
							<br>
							<select name="emailCheck" id="emailCheck">
									<option value="선택" selected>--선택--</option>
									<option value="gmail.com">gmail.com</option>
									<option value="naver.com">naver.com</option>
									<option value="0">직접입력</option>
							</select>
							</td>
							<td>*주민등록번호<input type="text" name="reg_no_input" id="reg_no_input" maxlength="14"></td>
							<input type="hidden" name="reg_no" id="reg_no">
							<td>*핸드폰번호<input type="text" name="hp" id="hp" maxlength="13" onKeyup="hpNumber(this)"></td>
						</tr>
						<tr>
							<td>연령<input type="text" name="years" id="years" readonly placeholder="자동기입"></td>
							<td class="option">직종체크<select name="job_type">
									<option value="" selected>--선택--</option>
										<c:forEach var="com" items="${comList }">
											<c:if test="${com.gubun eq 4}">
												<option value="${com.code }">${com.name }</option>
											</c:if>
										</c:forEach>
								</select>
							</td>
							<td>성별
								<select name="sex">
									<option value="" selected>--선택--</option>
										<c:forEach var="com" items="${comList }">
											<c:if test="${com.gubun eq 1}">
												<option value="${com.code }">${com.name }</option>
											</c:if>
										</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td colspan="3">
								주소<input type="text" name="zip" id="zip" placeholder="우편번호" readonly>
								<input type="button" value="주소검색" id="addCheck"> 
								<input type="text" name="addr1" placeholder="주소" readonly>
								<input type="text" name="addr2" placeholder="세부주소">
							</td>
						</tr>
						<tr>
							<td>직위<select name="pos_gbn_code">
									<option value="" selected>--선택--</option>
										<c:forEach var="com" items="${comList }">
											<c:if test="${com.gubun eq 3}">
												<option value="${com.code }">${com.name }</option>
											</c:if>
										</c:forEach>
								</select>
							</td>
							<td>부서<select name="dept_code">
									<option value="" selected>--선택--</option>
										<c:forEach var="com" items="${comList }">
											<c:if test="${com.gubun eq 5}">
												<option value="${com.code }">${com.name }</option>
											</c:if>
										</c:forEach>
								</select>
							</td>
							<td>연봉<input type="text" name="salary" id="salary"  style="text-align:right;" placeholder="(만원)"></td>
						</tr>
						<tr>
							<td>입사구분<select name="join_gbn_code">
									<option value="" selected>--선택--</option>
										<c:forEach var="com" items="${comList }">
											<c:if test="${com.gubun eq 6}">
												<option value="${com.code }">${com.name }</option>
											</c:if>
										</c:forEach>
								</select>
							</td>
							<td>최종학력<select name=gart_level>
									<option value="" selected>--선택--</option>
										<c:forEach var="com" items="${comList }">
											<c:if test="${com.gubun eq 7}">
												<option value="${com.code }">${com.name }</option>
											</c:if>
										</c:forEach>
								</select>
							</td>
							<td>투입여부<select name="put_yn">
									<option value="" selected>--선택--</option>
										<c:forEach var="com" items="${comList }">
											<c:if test="${com.gubun eq 8}">
												<option value="${com.code }">${com.name }</option>
											</c:if>
										</c:forEach>
								</select>
							</td>
							<td>군필여부
								<select name="mil_yn" id="mil_yn">
									<option value="" selected>--선택--</option>
										<c:forEach var="com" items="${comList }">
											<c:if test="${com.gubun eq 2}">
												<option value="${com.code }">${com.name }</option>
											</c:if>
										</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
								<input type="hidden" name="mil_type" id="mil_type">
							<td>군별<select name="mil_type_val" id="mil_type_val">
									<option value="0" selected>--선택--</option>
										<c:forEach var="com" items="${comList }">
											<c:if test="${com.gubun eq 9}">
												<option value="${com.code }">${com.name }</option>
											</c:if>
										</c:forEach>
								</select>
							</td>
								<input type="hidden" name="mil_level" id="mil_level">
							<td>계급<select name="mil_level_val" id="mil_level_val">
									<option value="" selected>--선택--</option>
										<c:forEach var="com" items="${comList }">
											<c:if test="${com.gubun eq 10}">
												<option value="${com.code }">${com.name }</option>
											</c:if>
										</c:forEach>
								</select>
							</td>
							<td>입영일자<input type="text" name="mil_startdate" id="datepicker1" readonly></td>
							<td>전역일자<input type="text" name="mil_enddate" id="datepicker2" readonly></td>
						</tr>
						<tr>
							<td>KOSA등록<select name="kosa_reg_yn" id="kosa_reg_yn">
									<option value="" selected>--선택--</option>
										<c:forEach var="com" items="${comList }">
											<c:if test="${com.gubun eq 11}">
												<option value="${com.code }">${com.name }</option>
											</c:if>
										</c:forEach>
								</select>
							</td>
							<input type="hidden" name="kosa_class_code">
							<td>KOSA등급<select name="kosa_class_code_val" id="kosa_class_code_val">
									<option value="" selected>--선택--</option>
										<c:forEach var="com" items="${comList }">
											<c:if test="${com.gubun eq 12}">
												<option value="${com.code }">${com.name }</option>
											</c:if>
										</c:forEach>
								</select>
							</td>
							<td>*입사일자<input type="text" name="join_day" id="datepicker3" readonly></td>
							<td>퇴사일자<input type="text" name="retire_day" id="datepicker4" readonly></td>
						</tr>
						<tr>
							<td>사업자번호<input type="text" name="cmp_reg_no" id="cmp_reg_no" maxlength="12"></td>
							<td>업체명<input type="text" name="crm_name"></td>
							<td>사업자등록증<input type="text" readonly name="cmp_org_name"></td>
							<input type="hidden" name="cmp_reg_image">
							<td><input type="button" id="openCmp" class='btn btn-xs btn-success' value="미리보기" data-toggle="modal" data-target="#cmpModal">
							<input type="file" id="cmp_reg_image" value="등록"></td>
						</tr>
						<tr>
							<td colspan="2" rowspan="2">자기소개<textarea name="self_intro" style="width:600px; height:25px;" placeholder="100자 내외로 적으시오"></textarea></td>
							<td>이력서<input type="text" readonly name="carrier_org_name"></td>
							<input type="hidden" name="carrier">
							<td><input type="button" id="openCarrier" class='btn btn-xs btn-success' data-toggle='modal' data-target='#carrierModal'value="미리보기"><input type="file" id="carrier" value="업로드"></td>
						</tr>
					</table>
					
					
				</form>
            </div>
           </div>
          </div>
            <!-- End of Main Content -->
            <!-- 모달 시작 -->
			<div id="modal" class="searchModal">
				<div class="search-modal-content">
					<div class="page-header">
					<h1>사업자등록증</h1>
					</div>
						<div class="row">
							<div class="col-sm-12">
								<div class="row">
									<div class="col-sm-12">
										<div id="cmp_preview">
											<img src="../resources/img/no_content.png" class="cmp-thumbnail cmp-profile"><br>
										</div>
									</div>
								</div>
							</div>
						</div>
						<hr>
							<div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" id="close">
								<span class="pop_bt modalCloseBtn" style="font-size: 13pt;">
									닫기
								</span>
							</div>
				</div>
			</div>
			<div id="modal_1" class="searchModal1">
				<div class="search-modal-content1">
					<div class="page-header">
					<h1>이력서</h1>
					</div>
						<div class="row">
							<div class="col-sm-12">
								<div class="row">
									<div class="col-sm-12">
										<div id="cmp_preview">
											<img src="../resources/img/no_content.png" class="carrier-thumbnail cmp-profile"><br>
										</div>
									</div>
								</div>
							</div>
						</div>
						<hr>
							<div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" id="close_1">
								<span class="pop_bt modalCloseBtn" style="font-size: 13pt;">
									닫기
								</span>
							</div>
				</div>
			</div>
			<!-- 모달 끝 -->
	<link href="../resources/1/css/sb-admin-2.min.css" rel="stylesheet">
</body>

</html>
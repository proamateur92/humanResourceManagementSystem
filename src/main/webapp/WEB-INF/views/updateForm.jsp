<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>

<title>수정 폼</title>

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

<script>
	$j(document).ready(function(){
		$j('#update').click(function(){
				  	var name = $j("[name=name]").val();
					var id = $j("[name=id]").val();
					var pwd = $j("[name=pwd_input]").val();
					var hp = $j("[name=hp]").val();
					var email = $j("[name=email]").val();
					var reg_no = $j("[name=reg_no]").val();
					var pwd_ck_input = $j("[name=pwd_ck_input]").val();
					var email2 = $j("[name=email2]").val();
					var addr2 = $j("[name=addr2]").val();
					var salary = $j("[name=salary]").val();
					var join_day = $j("[name=join_day]").val();
					var zip = $j("[name=zip]").val();
					var addr1 = $j("[name=addr1]").val();
					var addr2 = $j("[name=addr2]").val();

					// mil이 n일때 값 옮기기
					var mil_level_val = $j("[name=mil_level_val]").val();
					var mil_type_val = $j("[name=mil_type_val]").val();
					
					if(mil_level_val != "" ){
						$j("[name=mil_level]").val(mil_level_val);
					}
					if(mil_level_val != "" ){
						$j("[name=mil_type]").val(mil_type_val);
					}
					
					//kosa등급 값 옮기기
					var kosa_class_code_val = $j("[name=kosa_class_code_val]").val();
					if(kosa_class_code_val != "" ){
						$j("[name=kosa_class_code]").val(kosa_class_code_val);
					}

					// 연봉의 컴마 지우기
					if($j("[name=salary]").val() != "" ){
						var salCheck = salary.replace(/[^\d]+/g, "");
						$j("[name=salary]").val(salCheck);
					}
					
					//우편번호와 연봉의 값이 없을때
					if($j("[name=salary]").val() == "" ){
						$j("[name=salary]").val(0);
					}
				  	if($j("[name=zip]").val() == "" ){
						$j("[name=zip]").val(0);
					}			
				  	
				  	//입력된 아이디 비번 확인
					console.log('pwd: ' + pwd);
					console.log('id: ' + id);
					
					if(name == ''){
						window.alert("이름을 입력해 주세요.");
						return false;
					}
					if(id == ''){
						window.alert("아이디를 입력해 주세요.");
						return false;
					}
					if(pwd_input == ''){
						window.alert("비밀번호를 입력해 주세요.");
						return false;
					}
					if(pwd_ck_input == ''){
						window.alert("비밀번호를 확인해주세요.");
						return false;
					}
					if(hp == ''){
						window.alert("핸드폰번호를 입력해 주세요.");
						return false;
					}
					if(email == '' || email2 == '선택하세요.' || email2 == '선택' ){
						window.alert("이메일을 입력해 주세요.");
						return false;
					}
					if(reg_no == ''){
						window.alert("주민등록번호를 입력해 주세요.");
						return false;
					}
					if(join_day == ''){
						window.alert("입사일자를 입력해 주세요.");
						return false;
					}
					if(zip != 0 && addr2 == ''){
						window.alert("세부 주소를 입력해 주세요.");
						return false;
					}
			
			var param = $j("form[name=updateForm]").serialize();
			console.log(param);
			
			$j.ajax({
				url: "/updateForm",
				type: "post",
				data: param,
				
				success : function(data){
					if(data==1){
						alert("수정성공");
						window.location.href = "/updateForm?sabun="+$j('#sabun').val();
					} else{
						alert("수정실패");
					}
				},
				error : function(XHR, status, error) {
					alert('데이터 전달이 올바르지 않습니다.');
				}
			});
		});
	});

</script>

<style type="text/css">
	td {
	text-align: left;
	}
			
	td {
				padding: 20px;
			}
	.profile_photo, #profile_image {
		text-align: center;
	}
	
	.ui-datepicker { width: 17em; padding: .2em .2em 0; display: none; font-size: 20px;}

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
                    
					<h1>직원상세정보</h1>
				<form class="update" name="updateForm" method="post" enctype="multipart/form-data">
					<table>
						<tr>
							<td rowspan="6" class="profile_photo">
								<div id="image_preview">
								<img src="../resources/img/unknown.png" style="width: 150px; height: 150px;" class="img-profile"><br>
								</div>
								<input type="file" id="profile_image">
								<input type="hidden" name="profile_image">
							</td>
							<td>*사번 <input type="text" id="sabun1" name="sabun1" disabled="disabled" value="${insaInfo.sabun }"></td>
							<input type="hidden" id="sabun" name="sabun" value="${insaInfo.sabun }">
							<td>*한글성명<input type="text" name="name" id="name" value="${insaInfo.name }"></td>
							<td>영문성명<input type="text" name="eng_name" id="eng_name" value="${insaInfo.eng_name }"></td>
						</tr>
						<tr>
	 						<td>*아이디<input type="text" name="id1" id="id1" disabled value="${insaInfo.id }"></td>
							<input type="hidden" id="id" name="id" value="${insaInfo.id }">
							<td>*비밀번호<input type="text" name="pwd_input" id="pwd_input" value="${insaInfo.pwd }"></td>
							<input type="hidden" name="pwd" id="pwd" >
							<td>비밀번호 확인<input type="text" id="pwd_ck_input" name="pwd_ck_input" value="${insaInfo.pwd }"></td>
							<input type="hidden" id="pwd_ck">
						</tr>
						<tr>
							<td>*이메일<input type="text" name="email" id="email" value="${newEmail1 }">@
							<input type="hidden" id="email2" name="email2">
							<input type="text" id="emaila" style="width:150px" disabled value="${newEmail2 }">
							<br>
							<select name="emailCheck" id="emailCheck">
									<option value="선택" selected>--선택--</option>
									<option value="gmail.com">gmail.com</option>
									<option value="naver.com">naver.com</option>
									<option value="0">직접입력</option>
							</select>
							</td>
							<td>*주민등록번호<input type="text" name="reg_no_input" id="reg_no_input" disabled value="${insaInfo.reg_no }"></td>
							<input type="hidden" name="reg_no" id="reg_no" value="${insaInfo.reg_no }">
							<td>*핸드폰번호<input type="text" name="hp" id="hp" maxlength="13" onKeyup="hpNumber(this)" value="${insaInfo.hp }"></td>
						</tr>
						<tr>
							<td>연령<input type="text" name="years" id="years" value="${insaInfo.years }" readonly></td>
							<td>직종체크<select name="job_type">
										<c:choose>
												<c:when test="${empty insaInfo.job_type}">
													<option value="">--선택--</option>
														<c:forEach var="com" items="${comList }">
													<c:if test="${com.gubun eq 4}">
														<option value="${com.code }">${com.name }</option>
													</c:if>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<option value="">--선택--</option>
														<c:forEach var="com" items="${comList }">
													<c:if test="${com.gubun eq 4}">
														<c:choose>
															<c:when test="${insaInfo.job_type == com.code}">
																<option value="${com.code }" selected>${com.name }</option>
															</c:when>
															<c:otherwise>
																<option value="${com.code }">${com.name }</option>
															</c:otherwise>															
														</c:choose>
													</c:if>
														</c:forEach>
												</c:otherwise>
											</c:choose>
								</select>
							</td>
							<td>성별
								<select name="sex">
										<c:choose>
												<c:when test="${empty insaInfo.sex}">
													<option value="">--선택--</option>
														<c:forEach var="com" items="${comList }">
													<c:if test="${com.gubun eq 1}">
														<option value="${com.code }">${com.name }</option>
													</c:if>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<option value="">--선택--</option>
														<c:forEach var="com" items="${comList }">
													<c:if test="${com.gubun eq 1}">
														<c:choose>
															<c:when test="${insaInfo.sex == com.code}">
																<option value="${com.code }" selected>${com.name }</option>
															</c:when>
															<c:otherwise>
																<option value="${com.code }">${com.name }</option>
															</c:otherwise>															
														</c:choose>
													</c:if>
														</c:forEach>
												</c:otherwise>
											</c:choose>
								</select>
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<c:choose>
									<c:when test="${insaInfo.zip eq 0}">
										주소<input type="text" name="zip" id="zip" placeholder="우편번호" readonly value="">
									</c:when>
									<c:otherwise>
										주소<input type="text" name="zip" id="zip" placeholder="우편번호" readonly value="${insaInfo.zip}">
									</c:otherwise>
								</c:choose>
								<input type="button" value="주소검색" id="addCheck"> 
								<input type="text" name="addr1" placeholder="주소" readonly value="${insaInfo.addr1 }">
								<input type="text" name="addr2" placeholder="세부주소" value="${insaInfo.addr2 }">
							</td>
						</tr>
						<tr>
							<td>직위<select name="pos_gbn_code">
										<c:choose>
												<c:when test="${empty insaInfo.pos_gbn_code}">
													<option value="">--선택--</option>
														<c:forEach var="com" items="${comList }">
													<c:if test="${com.gubun eq 3}">
														<option value="${com.code }">${com.name }</option>
													</c:if>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<option value="">--선택--</option>
														<c:forEach var="com" items="${comList }">
													<c:if test="${com.gubun eq 3}">
														<c:choose>
															<c:when test="${insaInfo.pos_gbn_code == com.code}">
																<option value="${com.code }" selected>${com.name }</option>
															</c:when>
															<c:otherwise>
																<option value="${com.code }">${com.name }</option>
															</c:otherwise>															
														</c:choose>
													</c:if>
														</c:forEach>
												</c:otherwise>
											</c:choose>
								</select>
							</td>
							<td>부서<select name="dept_code">
									<c:choose>
												<c:when test="${empty insaInfo.dept_code}">
													<option value="">--선택--</option>
														<c:forEach var="com" items="${comList }">
													<c:if test="${com.gubun eq 5}">
														<option value="${com.code }">${com.name }</option>
													</c:if>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<option value="">--선택--</option>
														<c:forEach var="com" items="${comList }">
													<c:if test="${com.gubun eq 5}">
														<c:choose>
															<c:when test="${insaInfo.dept_code == com.code}">
																<option value="${com.code }" selected>${com.name }</option>
															</c:when>
															<c:otherwise>
																<option value="${com.code }">${com.name }</option>
															</c:otherwise>															
														</c:choose>
													</c:if>
														</c:forEach>
												</c:otherwise>
											</c:choose>
								</select>
							</td>
							<td>연봉<input type="text" name="salary" id="salary"  style="text-align:right;" value="${insaInfo.salary }"></td>
						</tr>
						<tr>
							<td>입사구분<select name="join_gbn_code">
									<c:choose>
												<c:when test="${empty insaInfo.join_gbn_code}">
													<option value="">--선택--</option>
														<c:forEach var="com" items="${comList }">
													<c:if test="${com.gubun eq 6}">
														<option value="${com.code }">${com.name }</option>
													</c:if>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<option value="">--선택--</option>
														<c:forEach var="com" items="${comList }">
													<c:if test="${com.gubun eq 6}">
														<c:choose>
															<c:when test="${insaInfo.join_gbn_code == com.code}">
																<option value="${com.code }" selected>${com.name }</option>
															</c:when>
															<c:otherwise>
																<option value="${com.code }">${com.name }</option>
															</c:otherwise>															
														</c:choose>
													</c:if>
														</c:forEach>
												</c:otherwise>
											</c:choose>
								</select>
							</td>
							<td>최종학력<select name=gart_level id="gart_level">
											<c:choose>
												<c:when test="${empty insaInfo.gart_level}">
													<option value="">--선택--</option>
														<c:forEach var="com" items="${comList }">
													<c:if test="${com.gubun eq 7}">
														<option value="${com.code }">${com.name }</option>
													</c:if>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<option value="">--선택--</option>
														<c:forEach var="com" items="${comList }">
													<c:if test="${com.gubun eq 7}">
														<c:choose>
															<c:when test="${insaInfo.gart_level == com.code}">
																<option value="${com.code }" selected>${com.name }</option>
															</c:when>
															<c:otherwise>
																<option value="${com.code }">${com.name }</option>
															</c:otherwise>															
														</c:choose>
													</c:if>
														</c:forEach>
												</c:otherwise>
											</c:choose>
								</select>
							</td>
							<td>투입여부<select name="put_yn">
										<c:choose>
												<c:when test="${empty insaInfo.put_yn}">
													<option value="">--선택--</option>
														<c:forEach var="com" items="${comList }">
													<c:if test="${com.gubun eq 8}">
														<option value="${com.code }">${com.name }</option>
													</c:if>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<option value="">--선택--</option>
														<c:forEach var="com" items="${comList }">
													<c:if test="${com.gubun eq 8}">
														<c:choose>
															<c:when test="${insaInfo.put_yn == com.code}">
																<option value="${com.code }" selected>${com.name }</option>
															</c:when>
															<c:otherwise>
																<option value="${com.code }">${com.name }</option>
															</c:otherwise>															
														</c:choose>
													</c:if>
														</c:forEach>
												</c:otherwise>
											</c:choose>
								</select>
							</td>
							<td>군필여부
								<select name="mil_yn" id="mil_yn">
									<c:choose>
												<c:when test="${empty insaInfo.mil_yn}">
													<option value="">--선택--</option>
														<c:forEach var="com" items="${comList }">
													<c:if test="${com.gubun eq 2}">
														<option value="${com.code }">${com.name }</option>
													</c:if>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<option value="">--선택--</option>
														<c:forEach var="com" items="${comList }">
													<c:if test="${com.gubun eq 2}">
														<c:choose>
															<c:when test="${insaInfo.mil_yn == com.code}">
																<option value="${com.code }" selected>${com.name }</option>
															</c:when>
															<c:otherwise>
																<option value="${com.code }">${com.name }</option>
															</c:otherwise>															
														</c:choose>
													</c:if>
														</c:forEach>
												</c:otherwise>
											</c:choose>
								</select>
							</td>
						</tr>
						<tr>
								<input type="hidden" name="mil_type" id="mil_type">
							<td>군별<select name="mil_type_val" id="mil_type_val">
									<c:choose>
												<c:when test="${empty insaInfo.mil_type}">
													<option value="">--선택--</option>
														<c:forEach var="com" items="${comList }">
													<c:if test="${com.gubun eq 9}">
														<option value="${com.code }">${com.name }</option>
													</c:if>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<option value="">--선택--</option>
														<c:forEach var="com" items="${comList }">
													<c:if test="${com.gubun eq 9}">
														<c:choose>
															<c:when test="${insaInfo.mil_type == com.code}">
																<option value="${com.code }" selected>${com.name }</option>
															</c:when>
															<c:otherwise>
																<option value="${com.code }">${com.name }</option>
															</c:otherwise>															
														</c:choose>
													</c:if>
														</c:forEach>
												</c:otherwise>
											</c:choose>
								</select>
							</td>
								<input type="hidden" name="mil_level" id="mil_level">
							<td>계급<select name="mil_level_val" id="mil_level_val">
									<c:choose>
												<c:when test="${empty insaInfo.mil_level}">
													<option value="">--선택--</option>
														<c:forEach var="com" items="${comList }">
													<c:if test="${com.gubun eq 10}">
														<option value="${com.code }">${com.name }</option>
													</c:if>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<option value="">--선택--</option>
														<c:forEach var="com" items="${comList }">
													<c:if test="${com.gubun eq 10}">
														<c:choose>
															<c:when test="${insaInfo.mil_level == com.code}">
																<option value="${com.code }" selected>${com.name }</option>
															</c:when>
															<c:otherwise>
																<option value="${com.code }">${com.name }</option>
															</c:otherwise>															
														</c:choose>
													</c:if>
														</c:forEach>
												</c:otherwise>
											</c:choose>
								</select>
							</td>
							<td>입영일자<input type="text" name="mil_startdate" id="datepicker1" readonly value="${insaInfo.mil_startdate }"></td>
							<td>전역일자<input type="text" name="mil_enddate" id="datepicker2" readonly value="${insaInfo.mil_enddate }"></td>
						</tr>
						<tr>
							<td>KOSA등록<select name="kosa_reg_yn" id="kosa_reg_yn">
									<c:choose>
												<c:when test="${empty insaInfo.kosa_reg_yn}">
													<option value="">--선택--</option>
														<c:forEach var="com" items="${comList }">
													<c:if test="${com.gubun eq 11}">
														<option value="${com.code }">${com.name }</option>
													</c:if>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<option value="">--선택--</option>
														<c:forEach var="com" items="${comList }">
													<c:if test="${com.gubun eq 11}">
														<c:choose>
															<c:when test="${insaInfo.kosa_reg_yn == com.code}">
																<option value="${com.code }" selected>${com.name }</option>
															</c:when>
															<c:otherwise>
																<option value="${com.code }">${com.name }</option>
															</c:otherwise>															
														</c:choose>
													</c:if>
														</c:forEach>
												</c:otherwise>
											</c:choose>
								</select>
							</td>
							<input type="hidden" name="kosa_class_code">
							<td>KOSA등급<select name="kosa_class_code_val" id="kosa_class_code_val">
									<c:choose>
												<c:when test="${empty insaInfo.kosa_class_code}">
													<option value="">--선택--</option>
														<c:forEach var="com" items="${comList }">
													<c:if test="${com.gubun eq 12}">
														<option value="${com.code }">${com.name }</option>
													</c:if>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<option value="">--선택--</option>
														<c:forEach var="com" items="${comList }">
													<c:if test="${com.gubun eq 12}">
														<c:choose>
															<c:when test="${insaInfo.kosa_class_code == com.code}">
																<option value="${com.code }" selected>${com.name }</option>
															</c:when>
															<c:otherwise>
																<option value="${com.code }">${com.name }</option>
															</c:otherwise>															
														</c:choose>
													</c:if>
														</c:forEach>
												</c:otherwise>
											</c:choose>
								</select>
							</td>
							<td>*입사일자<input type="text" name="join_day" id="datepicker3" readonly value="${insaInfo.join_day }"></td>
							<td>퇴사일자<input type="text" name="retire_day" id="datepicker4" readonly value="${insaInfo.retire_day }"></td>
						</tr>
						<tr>
							<td>사업자번호<input type="text" name="cmp_reg_no" id="cmp_reg_no" maxlength="12" value="${insaInfo.cmp_reg_no }"></td>
							<td>업체명<input type="text" name="crm_name" value="${insaInfo.crm_name }"></td>
							<td>사업자등록증<input type="text" readonly name="cmp_org_name" value="${insaInfo.cmp_reg_image }"></td>
							<input type="hidden" name="cmp_reg_image">
							<td><input type="button" id="openCmp" class='btn btn-xs btn-success' value="미리보기" data-toggle="modal" data-target="#cmpModal">
							<input type="file" id="cmp_reg_image" value="등록"></td>
						</tr>
						<tr>
							<td colspan="2" rowspan="2">자기소개<textarea name="self_intro" style="width:600px; height:25px;" placeholder="100자 내로 입력하세요.">${insaInfo.self_intro }</textarea></td>
							<td>이력서<input type="text" readonly name="carrier_org_name" value="${insaInfo.carrier }"></td>
							<input type="hidden" name="carrier">
							<td><input type="button" id="openCarrier" class='btn btn-xs btn-success' data-toggle='modal' data-target='#carrierModal' value="미리보기"><input type="file" id="carrier" value="업로드"></td>
						</tr>
					</table>
					
					<input type="button" value="메인" id="mainView">
					<input type="button" id="update" value="수정">
				</form>
            </div>
           </div>
          </div>
            <!-- End of Main Content -->
            <!-- 모달 시작 -->
			<div id="modal" class="searchModal">
				<div class="search-modal-content">
					<div class="page-header">
					<h1>사용자 등록증</h1>
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
					<h1>사용자 등록증</h1>
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
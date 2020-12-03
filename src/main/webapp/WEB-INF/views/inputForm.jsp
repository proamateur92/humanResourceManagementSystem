<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
 <title>작성 폼</title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

    <!-- Custom styles for this page -->
	<script src="https://kit.fontawesome.com/c1651245ed.js" crossorigin="anonymous"></script>
	
	 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="${contextPath}/resources/2/style.css">
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css">
	
	<script>
	var $jj = jQuery.noConflict();
	var now = new Date();
	var nowYear = now.getFullYear();
	var reg_no_arr = [];
	var pwd_arr = [];
	var pwd_ck_arr = [];
	
	$jj(document).ready(function() {
		//달력 넣기
		$jj.datepicker.setDefaults({
	        dateFormat: 'yy-mm-dd',
	        prevText: '이전 달',
	        nextText: '다음 달',
	        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	        showMonthAfterYear: true,
	        yearSuffix: '년'
	    });
		
	  	$jj( function() {
	  		$jj('#datepicker1').datepicker({
	  			showOn: "button",
	  			buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
	  			onClose: function(selectedDate) {
	  				let date = new Date(selectedDate);
	  				date.setDate(date.getDate()+1);
	  				$jj('#datepicker2').datepicker("option", "minDate", date);
	  			}
	  		});
	  		
	  		$jj('#datepicker2').datepicker({
	  			showOn: "button",
	  			buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
	  			onClose: function(selectedDate) {
	  				let date = new Date(selectedDate);
	  				date.setDate(date.getDate()-1);
	  				$jj("#datepicker1").datepicker( "option", "maxDate", date );
	  			}
	  		});
	  	});
	  	
	  	$jj( function() {
	  		$jj('#datepicker3').datepicker({
	  			showOn: "button",
	  			buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
	  			onClose: function(selectedDate) {
	  				let date = new Date(selectedDate);
	  				date.setDate(date.getDate()+1);
	  				$jj('#datepicker4').datepicker("option", "minDate", date);
	  			}
	  		});
	  		
	  		$jj('#datepicker4').datepicker({
	  			showOn: "button",
	  			buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
	  			onClose: function(selectedDate) {
	  				let date = new Date(selectedDate);
	  				date.setDate(date.getDate()-1);
	  				$jj("#datepicker3").datepicker( "option", "maxDate", date );
	  			}
	  		});
	  	});
	  	// 달력 끝
	  	
		// 이전화면으로 복귀
		$jj('#mainView').on('click', function(){
			location.href="/";
		});
		//이전화면 끝
		
		// 다음 주소 
		$jj('#addCheck').on('click', function(){
		         new daum.Postcode({
		              oncomplete: function(data) {
		                  // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		                  
		                   // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
		                   // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                   var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
		                   var extraRoadAddr = ''; // 도로명 조합형 주소 변수
		    
		                   // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                   // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                   if(data.bname !== '' && /[동|로|가]$j/g.test(data.bname)){
		                       extraRoadAddr += data.bname;
		                   }
		                   // 건물명이 있고, 공동주택일 경우 추가한다.
		                   if(data.buildingName !== '' && data.apartment === 'Y'){
		                      extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                   }
		                   // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                   if(extraRoadAddr !== ''){
		                       extraRoadAddr = ' (' + extraRoadAddr + ')';
		                   }
		                   // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
		                   if(fullRoadAddr !== ''){
		                       fullRoadAddr += extraRoadAddr;
		                   }
		    
		                   // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                   console.log(data.zonecode);
		                   console.log(fullRoadAddr);
		                   
		                   $jj("[name=zip]").val(data.zonecode);
		                   $jj("[name=addr1]").val(fullRoadAddr);
		                   
		              }
		          }).open();
		});
		// 다음 주소 끝
		
		//폰번호 하이픈
		var autoHypenPhone = function(str){
		      str = str.replace(/[^0-9]/g, '');
		      var tmp = '';
		      if( str.length < 4){
		          return str;
		      }else if(str.length < 7){
		          tmp += str.substr(0, 3);
		          tmp += '-';
		          tmp += str.substr(3);
		          return tmp;
		      }else if(str.length < 11){
		          tmp += str.substr(0, 3);
		          tmp += '-';
		          tmp += str.substr(3, 3);
		          tmp += '-';
		          tmp += str.substr(6);
		          return tmp;
		      }else{              
		          tmp += str.substr(0, 3);
		          tmp += '-';
		          tmp += str.substr(3, 4);
		          tmp += '-';
		          tmp += str.substr(7);
		          return tmp;
		      }
		      return str;
		}
		var phoneNum = document.getElementById('hp');
		phoneNum.onkeyup = function(){
		  console.log(this.value);
		  this.value = autoHypenPhone( this.value ) ;  
		}
			
		//폰번호 하이픈 끝
		
		//주민번호 하이픈(고쳐야됌)
		var autoHypenRegNo = function(str){
		      str = str.replace(/[^0-9]/g, '');
		      var tmp = '';
		      if( str.length < 8){
		          return str;
		      }else if(str.length < 10){
		          tmp += str.substr(0, 6);
		          tmp += '-';
		          tmp += str.substr(7);
		          return tmp;
		      }else{
		    	  tmp += "*";
		          return tmp;
		      }
		      var age = (100-str.substr(0,1)+21);
		      $j("[name=years]").val(age);
		      return str;
		}
		
		var regNo = document.getElementById('reg_no');
		regNo.onkeyup = function(){
		  console.log(this.value);
		  this.value = autoHypenRegNo( this.value );  
		}
			
		//주민번호 하이픈 끝
		
		//비밀번호 *
		
		var pwdChange = function(str){
			var symbol = '';
			var tmp = '';
			var value = '';
			for(var i=0; i<str.length; i++){
					symbol += '*';
				tmp = str.substr(str.length-1);
			}
			
			console.log(tmp);
			$j("[name=pwd]").val(tmp);
			
		    return symbol;
		}
		
		var pwd = document.getElementById('pwd3');
		
		pwd.onkeyup = function(){
			this.value = 
			pwdChange(this.value); 
		}
		//비밀번호 하이픈 끝
		
		//프로필 사진 올리기
		/* 프로필 사진 업로드하면 서버에 저장되고 savename를 저장한다. */
		$jj("#profile_image").change(function(){
			var formData = new FormData();
			formData.append("file", $jj("#profile_image")[0].files[0]);
			formData.append("type", "profile_image");
			
			$jj.ajax({
				url : "/fileupload",		
				type : "post",
				data : formData,
				processData: false,
				contentType: false,
				
				success : function(fileVO){
					if (fileVO != null){
						alert(fileVO.saveName);
						$jj(".img-profile").attr("src", "/" + fileVO.saveName);
						$jj("[name=profile_image]").val(fileVO.saveName);
					}
				},
				error : function(XHR, status, error) {
					alert("error");
				}
			});
		});
		//프로필 사진 올리기 끝
		
		//프로필 사진 이름
		//프로필 사진 이름 끝
		  $jj("#submit").on("click",function(){
			  var name = $j("[name=name]").val();
				var id = $j("[name=id]").val();
				var pwd = $j("[name=pwd3]").val();
				var hp = $j("[name=hp]").val();
				var email = $j("[name=email]").val();
				var reg_no = $j("[name=reg_no]").val();
				var pwd_check = $j("[name=pwd_check]").val();
				
				var r = document.getElementById('pwd3');
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
				if(pwd == ''){
					window.alert("비밀번호를 입력해 주세요.");
					return false;
				}
				if(hp == ''){
					window.alert("핸드폰번호를 입력해 주세요.");
					return false;
				}
				if(email == ''){
					window.alert("이메일을 입력해 주세요.");
					return false;
				}
				if(reg_no == ''){
					window.alert("주민등록번호를 입력해 주세요.");
					return false;
				}
				
			  if($j("[name=salary]").val() == "" ){
					$j("[name=salary]").val(0);
				}
			  if($j("[name=years]").val() == "" ){
					$j("[name=years]").val(0);
				}
			  if($j("[name=zip]").val() == "" ){
					$j("[name=zip]").val(0);
				}				 
			 
			 
			  
			  alert('입력완료');
		  });
			
			//script 끝
	});
</script>
</head>
<!-- favicon.ico 404 (Not Found) -->
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<body>
<jsp:include page="header.jsp"/>	

       <section class="pt-4">
		<div class="container p-5">
			<h3>직원 등록</h3>
				<form class="input" action="/inputForm" method="post" enctype="multipart/form-data">
					<div class="float-right">
					<button type="submit" id="submit" class="btn btn-sm btn-primary m-0 pl-4 pr-4">등록</button>
					<button type="reset" class="btn btn-sm btn-secondary m-1 pl-3 pr-3">초기화</button>
					<a href="javascript:window.history.back()" class="btn btn-sm btn-warning m-0 pl-2 pr-2">이전화면</a>
				</div>
				<br><br>
				<div class="row">
					<div class="col-3">
						<div class="row mt-2">
							<div class="col-8 uploadResult">
								<ul class="p-0">
									<li>
										<img src="$j{contextPath }/resources/img/unknown.png" style="width: 150px; height: 150px;" class="img-thumbnail img-profile">
									</li>
								</ul>
							</div>
							<label for="profile_image" class="btn btn-light profile col-8 mt-0">사진올리기</label>
							<input type="file" id="profile_image" class="d-none" size="1"/>
							<input type="hidden" name="profile_image">
						</div>
						<div class="row mt-2">
							<label for="kosa_reg_yn" class="col-6 small pt-2 text-center">KOSA등록</label>
							<select name="kosa_reg_yn" id="kosa_reg_yn" class="col-5 small p-1">
								<option value="" selected>--선택--</option>
										<c:forEach var="com" items="$j{comList }">
											<c:if test="$j{com.gubun eq 11}">
												<option value="$j{com.code }">${com.name }</option>
											</c:if>
										</c:forEach>
							</select>
						</div>
						<div class="row mt-2">
							<label for="kosa_class_code" class="col-6 small pt-2 text-center">KOSA등급</label>
							<select name="kosa_class_code" id="kosa_class_code" class="col-5 small p-1">
								<option value="" selected>--선택--</option>
										<c:forEach var="com" items="$j{comList }">
											<c:if test="$j{com.gubun eq 12}">
												<option value="$j{com.code }">${com.name }</option>
											</c:if>
										</c:forEach>
							</select>
						</div>
						<div class="row mt-2">
							<label for="join_day" class="col-6 small pt-2 text-center"><span class="text-danger"></span>입사일자</label>
							<input type="text" id="datepicker3" name="join_day" class="col-5 small p-1" placeholder="클릭하여 날짜선택" readonly>
						</div>
						<div class="row mt-2">
							<label for="retire_day" class="col-6 small pt-2 text-center">퇴사일자</label>
							<input type="text" id="datepicker4" name="retire_day" class="col-5 small p-1" placeholder="클릭하여 날짜선택" readonly>
						</div>
						<div class="row mt-2">
							<label for="join_gbn_code" class="col-6 small pt-2 text-center">입사구분</label>
							<select name="join_gbn_code" id="join_gbn_code" class="col-5 small p-1">
								<option value="" selected>--선택--</option>
										<c:forEach var="com" items="$j{comList }">
											<c:if test="$j{com.gubun eq 6}">
												<option value="$j{com.code }">${com.name }</option>
											</c:if>
										</c:forEach>
								</select>
						</div>
					</div>
					<div class="col-3">
						<div class="row mt-2">
							<label for="sabun" class="col-6 small pt-2 text-center"><span class="text-danger">*</span>사번</label>
							<input type="text" id="sabun" class="col-5 small p-1" disabled="disabled">
						</div>
						<div class="row mt-2">
							<label for="name" class="col-6 small pt-2 text-center"><span class="text-danger">*</span>한글성명</label>
							<input type="text" id="name" name="name" class="col-5 small p-1" style="ime-mode:active;">
						</div>
						<div class="row mt-2">
							<label for="eng_name" class="col-6 small pt-2 text-center">영문성명</label>
							<input type="text" id="eng_name" name="eng_name" class="col-5 small p-1" style="ime-mode:disabled;">
						</div>
						<div class="row mt-2">
							<label for="id" class="col-6 small pt-2 text-center"><span class="text-danger">*</span>아이디</label>
							<input type="text" id="id" name="id" class="col-5 small p-1">
						</div>
						<div class="row mt-2">
							<label for="pwd_input" class="col-6 small pt-2 text-center"><span class="text-danger">*</span>비밀번호</label>
							<input type="text" id="pwd_input" class="col-5 small p-1" style="ime-mode: disabled;"/>
							<input type="hidden" id="pwd" name="pwd"/>
						</div>
						<div class="row mt-2">
							<label for="pwd_ck_input" class="col-6 small pt-2 text-center"><span class="text-danger"></span>비밀번호확인</label>
							<input type="text" id="pwd_ck_input" class="col-5 small p-1" style="ime-mode: disabled;"/>
							<input type="hidden" id="pwd_ck"/>
						</div>
						<div class="row mt-2">
							<label for="reg_no_input" class="col-6 small pt-2 text-center"><span class="text-danger">*</span>주민번호</label>
							<input type="text" id="reg_no_input" class="col-5 small p-1" maxlength="14">
							<input type="hidden" id="reg_no" name="reg_no">
						</div>
					    <div class="row mt-2">
							<label for="years" class="col-6 small pt-2 text-center" >연령</label>
							<input type="text" id="years" name="years" class="col-5 small p-1">
						</div>
						<div class="row mt-2 mb-2">
							<label for="sex" class="col-6 small pt-2 text-center">성별</label>
							<select name="sex" id="sex" class="col-5 small p-1">
								<option value="" selected>--선택--</option>
										<c:forEach var="com" items="$j{comList }">
											<c:if test="$j{com.gubun eq 1}">
												<option value="$j{com.code }">${com.name }</option>
											</c:if>
										</c:forEach>
								</select>
						</div>
						<div class="row mt-2">
							<label for="put_yn" class="col-6 small pt-2 text-center">투입여부</label>
							<select name="put_yn" id="put_yn" class="col-5 small p-1">
								<option value="" selected>--선택--</option>
										<c:forEach var="com" items="$j{comList }">
											<c:if test="$j{com.gubun eq 8}">
												<option value="$j{com.code }">${com.name }</option>
											</c:if>
										</c:forEach>
							</select>
						</div>	
					</div>
					<div class="col-3">
						<div class="row mt-2 mb-2">
							<label for="hp" class="col-6 small pt-2 text-center"><span class="text-danger">*</span>핸드폰번호</label>
							<input type="text" id="hp" name="hp" class="col-5 small p-1" maxlength="13">
						</div>
						<div class="row mt-2">
							<label for="email" class="col-6 small pt-2 text-center"><span class="text-danger">*</span>이메일</label>
							<input type="text" id="email" name="email" class="col-5 small p-1" style="ime-mode:disabled;">@
							<input type="hidden" id="email2" name="email2">
							<br>
							<input type="text" id="emaila" style="width:150px" disabled="true" value="선택하세요.">
							<select name="emailCheck" id="emailCheck" class="col-5 small p-1">
									<option value="선택" selected>--선택--</option>
									<option value="gmail.com">gmail.com</option>
									<option value="naver.com">naver.com</option>
									<option value="0">직접입력</option>
							</select>
						</div>
						<br>
						<div class="border">
							<div class="row mt-2">
								<input type="button" id="addCheck" class="btn btn-sm btn-link mr-auto ml-auto col-8 border border-info" value="주소검색">
							</div>
							<div class="row mt-2">
								<label for="zip" class="col-6 small pt-2 text-center">우편번호</label>
								<input type="text" readonly id="zip" name="zip" class="col-5 small p-1">
							</div>
							<div class="row mt-2">
								<label for="addr1" class="col-6 small pt-2 text-center">주소</label>
								<input type="text" readonly name="addr1" class="col-5 small p-1" >
							</div>
							<div class="row mt-2 mb-2">
								<label for="addr2" class="col-6 small pt-2 text-center">세부주소</label>
								<input type="text" name="addr2" class="col-5 small p-1">
							</div>
						</div>
					</div>
					
					<div class="col-3">
						<div class="row mt-2">
							<label for="mil_yn" class="col-6 small pt-2 text-center">군필여부</label>
							<select id="mil_yn" name="mil_yn" class="col-5 small p-1">
									<option value="" selected>--선택--</option>
										<c:forEach var="com" items="$j{comList }">
											<c:if test="$j{com.gubun eq 2}">
												<option value="$j{com.code }">${com.name }</option>
											</c:if>
										</c:forEach>
								</select>
						</div>
						<div class="row mt-2">
							<label for="mil_type" class="col-6 small pt-2 text-center">군별</label>
								<select id="mil_type" name="mil_type" class="col-5 small p-1">
									<option value="" selected>--선택--</option>
										<c:forEach var="com" items="$j{comList }">
											<c:if test="$j{com.gubun eq 9}">
												<option value="$j{com.code }">${com.name }</option>
											</c:if>
										</c:forEach>
								</select>
						</div>		
						<div class="row mt-2">
							<label for="mil_level" class="col-6 small pt-2 text-center">계급</label>
								<select id="mil_level" name="mil_level" class="col-5 small p-1">
									<option value="" selected>--선택--</option>
										<c:forEach var="com" items="$j{comList }">
											<c:if test="$j{com.gubun eq 10}">
												<option value="$j{com.code }">${com.name }</option>
											</c:if>
										</c:forEach>
								</select>
						</div>
						<div class="row mt-2">
							<label for="datepicker1" class="col-6 small pt-2 text-center">입영일자</label>
							<input type="text" id="datepicker1" name="mil_startdate" class="col-5 small p-1" placeholder="클릭하여 입력">
						</div>			
						<div class="row mt-2">
							<label for="datepicker2" class="col-6 small pt-2 text-center">전역일자</label>
							<input type="text" id="datepicker2" name="mil_enddate" class="col-5 small p-1" placeholder="클릭하여 입력">
						</div>	
						<div class="row mt-2">
							<label for="job_type" class="col-6 small pt-2 text-center">직종체크</label>
							<select id="job_type" name="job_type" class="col-5 small p-1">
									<option value="" selected>--선택--</option>
										<c:forEach var="com" items="$j{comList }">
											<c:if test="$j{com.gubun eq 4}">
												<option value="$j{com.code }">${com.name }</option>
											</c:if>
										</c:forEach>
								</select>
						</div>
						<div class="row mt-2">
							<label for="pos_gbn_code" class="col-6 small pt-2 text-center">직위</label>
							<select name="pos_gbn_code" class="col-5 small p-1">
									<option value="" selected>--선택--</option>
										<c:forEach var="com" items="$j{comList }">
											<c:if test="$j{com.gubun eq 3}">
												<option value="$j{com.code }">${com.name }</option>
											</c:if>
										</c:forEach>
								</select>
						</div>	
						<div class="row mt-2">
							<label for="dept_code" class="col-6 small pt-2 text-center">부서</label>
							<select name="dept_code" class="col-5 small p-1">
									<option value="" selected>--선택--</option>
										<c:forEach var="com" items="$j{comList }">
											<c:if test="$j{com.gubun eq 5}">
												<option value="$j{com.code }">${com.name }</option>
											</c:if>
										</c:forEach>
								</select>
						</div>	
						<div class="row mt-2">
							<label for="gart_level" class="col-6 small pt-2 text-center">최종학력</label>
							<select name="gart_level" class="col-5 small p-1">
									<option value="" selected>--선택--</option>
										<c:forEach var="com" items="$j{comList }">
											<c:if test="$j{com.gubun eq 7}">
												<option value="$j{com.code }">${com.name }</option>
											</c:if>
										</c:forEach>
								</select>
						</div>	
						<div class="row mt-2">
							<label for="salary" class="col-6 small pt-2 text-center">연봉</label>
							<input type="text" id="salary" name="salary" class="col-5 small p-1 text-right" placeholder="(만원)">
						</div>
					</div>
				</div>
				<hr>
				<div class="row mt-2">
					<div class="col-3">
						<label for="cmp_reg_no" class="col-5 small pt-2 text-center">사업자번호</label>
						<input type="text" id="cmp_reg_no" name="cmp_reg_no" class="col-6 pl-1 pr-1">
					</div>
					<div class="col-3">
						<label for="crm_name" class="col-5 small pt-2 text-center">업체명</label>
						<input type="text" id="crm_name" name="crm_name" class="col-6 pl-1 pr-1">
					</div>	
					<div class="col-4">
						<label for="cmp_reg_image" class="col-6 small pt-2 text-center" readonly >사업자등록증</label>
						<input type="file" id="cmp_reg_image" name="cmp_reg_image" class="d-none">
						<div class="col-5 p-2 small d-inline text-muted cmp_reg_image_name">파일이름</div>
					</div>
					<div class="col-2">
						<button type="button" id="show_cmp_reg_img0" class="btn btn-info btn-sm">미리보기</button>
						<label for="cmp_reg_image1" class="btn btn-info btn-sm mb-0">등록</label>
					</div>
				</div>
				<div class="row mt-2">
					<div class="col-6">
						<label for="self_intro" class="col-2 small pt-2 text-center p-0">자기소개</label>
						<textarea id="self_intro" name="self_intro" class="col-9 small align-text-top p-1"></textarea>
					</div>
					<div class="col-4">
						<label for="carrier_image" class="col-6 small pt-2 text-center">이력서</label>
						<input type="file" id="carrier_image" name="carrier_image" class="d-none">
						<div class="col-5 p-2 small d-inline text-muted carrier_name">파일이름</div>
						<input type="hidden" name="carrier">
					</div>
					<div class="col-2">
						<button type="button" data-toggle="modal" data-target="#carrierModal" class="btn btn-success btn-sm">미리보기</button>
						<label for="carrier_image1" class="btn btn-success btn-sm mb-0">등록</label>
					</div>
					<div class="modal fade" id="carrierModal" role="dialog">
						<div class="modal-dialog modal-sm" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">x</button>
								</div>
								<div class="modal-body uploadCarrierResult">
									<ul class="p-0">
										<li><p class="text-center">등록된 이력서가 없습니다</p></li>
									</ul>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
									<input type="hidden" name="carrier">
								</div>
							</div>
						</div>
					</div>
				</div>	
			</form>
  	 </section>
                        <span>Copyright &copy; Your Website 2020</span>
                        
     <!-- 미리보기 모달 -->
	<div class="modal" id="preview_modal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<!-- Header -->
				<div class="modal-header">
					<h4 id="cmp_modal_header" class="modal-title dnone">사업자등록증
						미리보기</h4>
					<h4 id="carrier_modal_header" class="modal-title dnone">이력서
						미리보기</h4>
					<button type="button" class="close" data-dismiss="modal">
						&times;</button>
				</div>
				<!-- Body -->
				<div class="modal-body div-in-modal center">
					<img class="img-frm dnone" id="preview_cmp_reg" src="" /> <img
						class="img-frm dnone" id="preview_carrier" src="" />
				</div>
				<!-- Footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">
						Close</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
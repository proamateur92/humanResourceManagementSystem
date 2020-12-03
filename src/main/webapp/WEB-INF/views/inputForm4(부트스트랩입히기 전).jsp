<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
 <title>작성 폼</title>


    <!-- Custom styles for this template -->
	<script src="https://kit.fontawesome.com/c1651245ed.js" crossorigin="anonymous"></script>
	
	 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<!-- bootstrap css -->
	<link href="${contextPath }/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- bootstrap datepicker -->
	<link href="${contextPath }/assets/css/datepicker3.css" rel="stylesheet">
	
	<!-- index css -->
	<link href="${contextPath }/assets/css/input.css" rel="stylesheet">
	
	<script>
	var $j = jQuery.noConflict();
	var now = new Date();
	var nowYear = now.getFullYear();
	var reg_no_arr = [];
	var pwd_arr = [];
	var pwd_ck_arr = [];
	
	$j(document).ready(function() {
			//달력 넣기
			$j.datepicker.setDefaults({
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
			
		  	$j( function() {
		  		$j('#datepicker1').datepicker({
		  			showOn: "button",
		  			buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
		  			onClose: function(selectedDate) {
		  				let date = new Date(selectedDate);
		  				date.setDate(date.getDate()+1);
		  				$j('#datepicker2').datepicker("option", "minDate", date);
		  			}
		  		});
		  		
		  		$j('#datepicker2').datepicker({
		  			showOn: "button",
		  			buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
		  			onClose: function(selectedDate) {
		  				let date = new Date(selectedDate);
		  				date.setDate(date.getDate()-1);
		  				$j("#datepicker1").datepicker( "option", "maxDate", date );
		  			}
		  		});
		  	});
		  	
		  	$j( function() {
		  		$j('#datepicker3').datepicker({
		  			showOn: "button",
		  			buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
		  			onClose: function(selectedDate) {
		  				let date = new Date(selectedDate);
		  				date.setDate(date.getDate()+1);
		  				$j('#datepicker4').datepicker("option", "minDate", date);
		  			}
		  		});
		  		
		  		$j('#datepicker4').datepicker({
		  			showOn: "button",
		  			buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
		  			onClose: function(selectedDate) {
		  				let date = new Date(selectedDate);
		  				date.setDate(date.getDate()-1);
		  				$j("#datepicker3").datepicker( "option", "maxDate", date );
		  			}
		  		});
		  	});
		  	// 달력 끝
		  	
			// 이전화면으로 복귀
			$j('#mainView').on('click', function(){
				location.href="/";
			});
			//이전화면 끝
			
			// 다음 주소 
			$j('#addCheck').on('click', function(){
			         new daum.Postcode({
			              oncomplete: function(data) {
			                  // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			                  
			                   // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
			                   // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			                   var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
			                   var extraRoadAddr = ''; // 도로명 조합형 주소 변수
			    
			                   // 법정동명이 있을 경우 추가한다. (법정리는 제외)
			                   // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			                   if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
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
			                   
			                   $j("[name=zip]").val(data.zonecode);
			                   $j("[name=addr1]").val(fullRoadAddr);
			                   
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
			
			//연봉 ,
			var autoCheck = function(num){
				if(num.length==1){
					num = num.replace(/[^1-9]/g, '');
				}

				num = num.replace(/[^0-9]/g, '');
				
				return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			}

			var salaryCheck = document.getElementById('salary');
			
			salaryCheck.onkeyup = function(){
			  console.log(this.value);
			  this.value = autoCheck( this.value ) ;  
			}
			//연봉 , 끝
			
			//주민번호 *
			$("#reg_no_input").on("keydown", function(e) {
		var code = e.keyCode;

		if (!((code >= 48 && code <= 57) || (code >= 96 && code <= 105))) {
			if (code == 8 || code == 46 || code == 27) {
				$("#reg_no").val("");
				$("#reg_no_input").val("");
				$("#years").val("");
				reg_no_arr = [];
			} else if (code == 9) {
				return;
			} else {
				e.preventDefault();
			}
		}
	}).on("keyup", function(e) {
		var reg_no = $("#reg_no_input").val();
		var key = reg_no.replace(/\-/g, '');
		var num = "";
		var star_num = "";
		var key_num = e.key;
		var hidden_num = "";
		var code = e.keyCode;

		if ($("#reg_no").val().length == 14)
			return;

		if ((code >= 48 && code <= 57) || (code >= 96 && code <= 105)) {
			if (key.length < 7) {
				$(this).val(key);
			} else if (key.length >= 7 && key.length < 15) {
				reg_no_arr.push(key_num);
				var post_reg_no = key.substr(6, 7);
				for (i = 0; i < post_reg_no.length - 1; i++) {
					star_num += "*";
				}

				num += key.substr(0, 6);
				num += "-";
				num += key.substr(6, 1);
				num += star_num;
				num += key.substr(12, 2);
				$(this).val(num);
			}

			hidden_num += key.substr(0, 6);
			hidden_num += "-";
			hidden_num += reg_no_arr.join("");
			$("#reg_no").val(hidden_num);
		} else {
			e.preventDefault();
		}
	}).on("focusin", function() {
		$("#reg_no").val("");
		$("#reg_no_input").val("");
		$("#years").val("");
		reg_no_arr = [];
	});
	 console.log("reg_no_in: " + $("#reg_no_input").val());
	 console.log("reg_no   : " + $("#reg_no").val());
			
			
			// reg_no 뒷부분 입력시 * 처리
			
			
			// 주민등록번호 유효성 검사
			$("#reg_no_input").on('focusout', function() { // 포커스를 잃었을때 실행합니다.
				var regNo = $("#reg_no").val().replace("-", "");
		
				if (ssnConfirm(regNo)) {
					// 나이 대입..
					getAge(regNo);
		
					// 하이픈 입력
								regNo = regNo.replace(/^([0-9]{6})-?([0-9]{7})$/, "$1-$2");
								$(this).val(regNo);
		
				} else {
					$("#reg_no_input").val("");
					$("#reg_no").val("");
					$(this).focus();
				}
			});
			
			// 나이 대입 메서드
		function getAge(regNo) {
		var j1 = regNo.substring(0, 6);
		var j2 = regNo.substring(6, 13);
		var n1 = j1.substr(0, 2); // 앞 6자리에 입력한 값중 앞에서 두글자를 n1 에 대입
		var n2 = j2.substr(0, 1); // 뒤 7자리에 입력한 값중 맨앞의 글자를 n2 에 대입(1~4)

		if (n2 == 1 || n2 == 2) { // 뒤 첫째값이 1, 2일 경우(1900년대에 출생한 남녀)
			$("#years").val(nowYear - (1900 + Number(n1)));
		}
		if (n2 == 3 || n2 == 4) { // 뒤 첫째값이 3, 4일 경우
			$("#years").val(nowYear - (2000 + Number(n1)));
		}
	};
			
	
	// 주민번호 체계 검사
	function ssnConfirm(regNo) {
		var num = regNo;
		if (num == '') {
			return true;
		}
		if (num.length != 13) {
			alert("주민등록번호를 알맞게 입력해주세요.");
			return false;
		}
		if (isNaN(num)) {
			alert("주민등록번호는 숫자만 입력이 가능합니다.");
			return false;
		}
		var ssn1 = num.substring(0, 6);
		var ssn2 = num.substring(6, 13);
		if ((ssn1.length == 6) && (ssn2.length == 7)) {
			var ssn = ssn1 + ssn2;
			a = new Array(13);
			for (var i = 0; i < 13; i++) {
				a[i] = parseInt(ssn.charAt(i));
			}
			var k = 11 - (((a[0] * 2) + (a[1] * 3) + (a[2] * 4) + (a[3] * 5)
					+ (a[4] * 6) + (a[5] * 7) + (a[6] * 8) + (a[7] * 9)
					+ (a[8] * 2) + (a[9] * 3) + (a[10] * 4) + (a[11] * 5)) % 11);
			if (k > 9) {
				k -= 10;
			}
			if (k == a[12]) {
				return true;
			} else {
				alert("유효하지 않은 주민등록번호 입니다.");
				return false;
			}
		}
	}
	
			// password 입력시 * 표시
			$("#pwd_input")
					.on(
							"keydown",
							function(e) {
								var code = e.keyCode;

								if (!((code >= 48 && code <= 57)
										|| (code >= 96 && code <= 105) || (code >= 65 && code <= 90))) {
									if (code == 8 || code == 46 || code == 27) {
										$("#pwd").val("");
										$("#pwd_input").val("");
										pwd_arr = [];
									} else if (code == 9) {
										return;
									} else {
										e.preventDefault();
									}
								}
							}).on(
							"keyup",
							function(e) {
								var pwd = $("#pwd");
								var key = pwd.val().replace(/^[a-zA-Z-0-9]$/g, '');
								var num = "";
								var star_num = "";
								var key_num = e.key;
								var hidden_num = "";
								var code = e.keyCode;

								var replace = "";
								var post_pwd = pwd_arr;
								
								if ((code >= 48 && code <= 57)
										|| (code >= 96 && code <= 105)
										|| (code >= 65 && code <= 90)) {
									$(this).val(key);
									pwd_arr.push(key_num);
									for (i = 0; i < post_pwd.length - 1; i++) {
										star_num += "*";
										replace = pwd.val().replace(
												pwd.val().substr(0, post_pwd.length),
												star_num);
									}
									$(this).val(replace + key_num);
									hidden_num += pwd_arr.join("");
								}
								$("#pwd").val(hidden_num);
							}).on("focusin", function() {
						$("#pwd").val("");
						$("#pwd_input").val("");
						pwd_arr = [];
					});
			
			// password_ck 입력시 * 표시
			$("#pwd_ck_input")
			.on(
					"keydown",
					function(e) {
						var code = e.keyCode;
						
						if (!((code >= 48 && code <= 57)
								|| (code >= 96 && code <= 105) || (code >= 65 && code <= 90))) {
							if (code == 8 || code == 46 || code == 27) {
								$("#pwd_ck").val("");
								$("#pwd_ck_input").val("");
								pwd_ck_arr = [];
							} else if (code == 9) {
								return;
							} else {
								e.preventDefault();
							}
						}
					}).on(
							"keyup",
							function(e) {
								var pwd = $("#pwd_ck");
								var key = pwd.val().replace(/^[a-zA-Z-0-9]$/g, '');
								var num = "";
								var star_num = "";
								var key_num = e.key;
								var hidden_num = "";
								var code = e.keyCode;
								
								var replace = "";
								var post_pwd = pwd_ck_arr;
								if ((code >= 48 && code <= 57)
										|| (code >= 96 && code <= 105)
										|| (code >= 65 && code <= 90)) {
									$(this).val(key);
									pwd_ck_arr.push(key_num);
									for (i = 0; i < post_pwd.length - 1; i++) {
										star_num += "*";
										replace = pwd.val().replace(
												pwd.val().substr(0, post_pwd.length),
												star_num);
									}
									$(this).val(replace + key_num);
									hidden_num += pwd_ck_arr.join("");
								}
								$("#pwd_ck").val(hidden_num);
							}).on("focusin", function() {
								$("#pwd_ck").val("");
								$("#pwd_ck_input").val("");
								pwd_ck_arr = [];
							});
			
		
			
			//프로필 사진 올리기
			/* 프로필 사진 업로드하면 서버에 저장되고 savename를 저장한다. */
			$j("#profile_image").change(function(){
				var formData = new FormData();
				formData.append("file", $j("#profile_image")[0].files[0]);
				formData.append("type", "profile_image");
				
				$j.ajax({
					url : "/fileupload",		
					type : "post",
					data : formData,
					processData: false,
					contentType: false,
					
					success : function(fileVO){
						if (fileVO != null){
							alert(fileVO.saveName);
							$j(".img-profile").attr("src", "/" + fileVO.saveName);
							$j("[name=profile_image]").val(fileVO.saveName);
						}
					},
					error : function(XHR, status, error) {
						alert("error");
					}
				});
			});
			//프로필 사진 올리기 끝
			
			//사업자 등록증 사진 올리기
			$j("#cmp_reg_image").change(function(){
				var formData = new FormData();
				formData.append("file", $j("#cmp_reg_image")[0].files[0]);
				formData.append("type", "cmp_reg_image");
				
				$j.ajax({
					url : "/fileupload",		
					type : "post",
					data : formData,
					processData: false,
					contentType: false,
					
					success : function(fileVo){
						if (fileVo != null){
							var link = "/upload";
							link += fileVo.saveName;
							
							$("[name=cmp_reg_image]").val(fileVo.saveName);
							
							$("#cmpDown").attr({target: "_blank",
								href: link});
						}
					},
					error : function(XHR, status, error) {
						alert("error");
					}
				});
			});
			//사업자 등록증 사진 올리기 끝
			
			//이력서 사진 올리기
			$j("#carrier_image").change(function(){
				var formData = new FormData();
				formData.append("file", $j("#carrier_image")[0].files[0]);
				formData.append("type", "carrier_image");
				
				$j.ajax({
					url : "/fileupload",		
					type : "post",
					data : formData,
					processData: false,
					contentType: false,
					
					success : function(fileVo){
						if (fileVo != null){
							var link = "/upload";
							link += fileVo.saveName;
							
							$("[name=carrier_image]").val(fileVo.saveName);
							
							$("#cmpDown").attr({target: "_blank",
								href: link});
						}
					},
					error : function(XHR, status, error) {
						alert("error");
					}
				});
			});
			//이력서 사진 올리기 끝
			
			//이메일 직접입력 시
			$('#emailCheck').change(function(){ 
				$("#emailCheck option:selected").each(function () { 
					if($(this).val()== '0'){ 
						//직접입력일 경우 
						$("#emaila").val(''); 
						//값 초기화 
						$("#emaila").attr("disabled",false); 
						//활성화 
						}else{ 
							//직접입력이 아닐경우 
							$("#emaila").val($(this).text());
							//선택값 입력 
							$("#emaila").attr("disabled",true); 
							//비활성화 
							
						} 
					}); 
				});

			//이메일 직접입력 시 끝
			
			//등록버튼 시작
			  $j("#submit").on("click",function(){
				  var name = $("[name=name]").val();
					var id = $("[name=id]").val();
					var pwd = $("[name=pwd3]").val();
					var hp = $("[name=hp]").val();
					var email = $("[name=email]").val();
					var reg_no = $("[name=reg_no]").val();
					var pwd_check = $("[name=pwd_check]").val();
					
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
					
				  if($("[name=salary]").val() == "" ){
						$("[name=salary]").val(0);
					}
				  if($("[name=years]").val() == "" ){
						$("[name=years]").val(0);
					}
				  if($("[name=zip]").val() == "" ){
						$("[name=zip]").val(0);
					}				 
				  alert('입력완료');
			  });
			// 등록 버튼 끝
			
			//script 끝
	});
</script>
</head>

<body>
<div class="container">
	<h1>직원상세정보</h1>
	<div class="row">
		<form class="form-horizontal" id="input-form" action="/inputForm" method="post" enctype="multipart/form-data">
			<div class="col-xs-offset-10">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="submit" class="btn btn-primary">등록</button>
				<a href="/" class="btn btn-primary">전화면</a>
			</div>
			
			<div class="form-group">
				<div class="col-xs-3 text-center">
						<img src="${contextPath }/assets/img/unknown.png" class="img-thumbnail img-profile">
				</div>
				<label class="col-xs-1 control-label">사번</label>
					<div class="col-xs-2">
							<input type="text" class="form-control" id="sabun" readonly="readonly">
					</div>
					<label class="col-xs-1 control-label">*한글성명</label>
					<div class="col-xs-2">
						<input type="text" class="form-control" name="name">
					</div>
			</div>
		</form>
	</div>
</div>	
					
					<table>
						<tr>
							<td rowspan="6">
								<img src="${contextPath }/resources/img/unknown.png" style="width: 150px; height: 150px;" class="img-thumbnail img-profile"><br>
								<input type="file" id="profile_image">
								<input type="hidden" name="profile_image">
							</td>
							<td>*사번 <input type="text" disabled="disabled"></td>
							<td>*한글성명<input type="text" name="name"></td>
							<td>영문성명<input type="text" name="eng_name"></td>
						</tr>
						<tr>
	 						<td>*아이디<input type="text" name="id" id="id"></td>
							<td>*비밀번호<input type="text" id="pwd_input"></td>
							<input type="hidden" id="pwd" name="pwd">
							<td>비밀번호 확인<input type="text" id="pwd_ck_input"></td>
							<input type="hidden" id="pwd_ck" name="pwd_ck">
						</tr>
						<tr>
							<td>*이메일<input type="text" name="email" id="email">
							<input type="hidden" id="email2" name="email2">
							<br>
							<input type="text" id="emaila" style="width:150px" disabled="true" value="선택하세요.">
							<select name="emailCheck" id="emailCheck">
									<option value="선택" selected>--선택--</option>
									<option value="gmail.com">gmail.com</option>
									<option value="naver.com">naver.com</option>
									<option value="0">직접입력</option>
							</select>
							</td>
							<td>*주민등록번호<input type="text" id="reg_no_input" maxlength="14"></td>
							<input type="hidden" name="reg_no" id="reg_no">
							<td>*핸드폰번호<input type="text" name="hp" id="hp" maxlength="13" onKeyup="hpNumber(this)"></td>
						</tr>
						<tr>
							<td>연령<input type="text" name="years" id="years"></td>
							<td>직종체크<select name="job_type">
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
							<td>연봉<input type="text" name="salary" id="salary" placeholder="(만원)"></td>
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
								<select name="mil_yn">
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
							<td>군별<select name="mil_type">
									<option value="" selected>--선택--</option>
										<c:forEach var="com" items="${comList }">
											<c:if test="${com.gubun eq 9}">
												<option value="${com.code }">${com.name }</option>
											</c:if>
										</c:forEach>
								</select>
							</td>
							<td>계급<select name="mil_level">
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
							<td>KOSA등록<select name="kosa_reg_yn">
									<option value="" selected>--선택--</option>
										<c:forEach var="com" items="${comList }">
											<c:if test="${com.gubun eq 11}">
												<option value="${com.code }">${com.name }</option>
											</c:if>
										</c:forEach>
								</select>
							</td>
							<td>KOSA등급<select name="kosa_class_code">
									<option value="" selected>--선택--</option>
										<c:forEach var="com" items="${comList }">
											<c:if test="${com.gubun eq 12}">
												<option value="${com.code }">${com.name }</option>
											</c:if>
										</c:forEach>
								</select>
							</td>
							<td>입사일자<input type="text" name="join_day" id="datepicker3" readonly></td>
							<td>퇴사일자<input type="text" name="retire_day" id="datepicker4" readonly></td>
						</tr>
						<tr>
							<td>사업자번호<input type="text" name="cmp_reg_no"></td>
							<td>업체명<input type="text" name="crm_name"></td>
							<td>사업자등록증<input type="text" id="cmp_upload" name="cmp_upload"></td>
							<input type="hidden" name="cmp_reg_image">
							<td><input type="button" value="미리보기"><input type="button" value="등록"></td>
						</tr>
						<tr>
							<td colspan="2" rowspan="2">자기소개<textarea name="self_intro" style="width:600px; height:25px;"></textarea></td>
							<td>이력서<input type="text" name="carrier"></td>
							<input type="hidden" class="form-control" name="carrier_image">
							<td><input type="button" value="파일업로드"><input type="button" value="미리보기"></td>
						</tr>
					</table>
					
					<input type="button" value="전화면" id="mainView">
					<input type="submit" id="submit" value="등록">
					<input type="reset" value="취소">
				</form>
            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->
</div>
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>


</body>


</html>
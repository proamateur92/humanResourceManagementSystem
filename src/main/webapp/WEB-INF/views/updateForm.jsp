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

<style>
/* The Modal (background) */
.searchModal{
display: none; /* Hidden by default */
position: fixed; /* Stay in place */
z-index: 10; /* Sit on top */
left: 0;
top: 0;
width: 100%; /* Full width */
height: 100%; /* Full height */
overflow: auto; /* Enable scroll if needed */
background-color: rgb(0,0,0); /* Fallback color */
background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}
/* Modal Content/Box */
.search-modal-content{
background-color: #fefefe;
margin: 15% auto; /* 15% from the top and centered */
padding: 20px;
border: 1px solid #888;
width: 70%; /* Could be more or less, depending on screen size */
}
.searchModal1{
display: none; /* Hidden by default */
position: fixed; /* Stay in place */
z-index: 10; /* Sit on top */
left: 0;
top: 0;
width: 100%; /* Full width */
height: 100%; /* Full height */
overflow: auto; /* Enable scroll if needed */
background-color: rgb(0,0,0); /* Fallback color */
background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}
/* Modal Content/Box */
.search-modal-content1{
background-color: #fefefe;
margin: 15% auto; /* 15% from the top and centered */
padding: 20px;
border: 1px solid #888;
width: 70%; /* Could be more or less, depending on screen size */
}
</style>
<!-- Custom styles for this page -->
    <!-- Custom styles for this template -->
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
			
			// 한글 이름
			$j("#name").on('focusout', function(){
				var name = $j(this).val();
			    var check = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
				
				if(check.test(name)){
					return;
				} else{
					alert("한글만 입력 가능합니다.");
					$j("#name").val("");
					$j("#name").focus();
					return;
				}
			});
			// 한글 이름 끝
			
			// 영문 이름
			$j("#eng_name").on('focusout', function(){
				var eng_name = $j(this).val();
			    var check = /[a-z|A-Z]/;
				
				if(check.test(eng_name)){
					return;
				} else{
					alert("영문만 입력 가능합니다.");
					$j("#eng_name").val("");
					return;
				}
			});
			// 영문 이름 끝

			// 이메일 유효성
			$j("#emaila").on('focusout', function(){
				var emaila = $j(this).val();
			    var check = /[a-z|A-Z|0-9]/;
				
				if(check.test(emaila)){
					return;
				} else{
					alert("영문 또는 숫자만 입력 가능합니다.");
					$j("#emaila").val("");
					return;
				}
			});
			// 이메일 유효성 끝
			
			//폰번호 하이픈
			var autoHypenPhone = function(str){
				
				  if(str.length<2&&str==0) {
			      	str = str.replace(/[^1-9]/g, '');
				  }

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
			
			//사업자 하이픈
			var autoHypenCmp = function(str){
				
				  if(str.length<2&&str==0) {
			      	str = str.replace(/[^1-9]/g, '');
				  }

				  str = str.replace(/[^0-9]/g, '');
			      var tmp = '';
			      if( str.length < 4){
			          return str;
			      }else if(str.length < 5){
			          tmp += str.substr(0, 3);
			          tmp += '-';
			          tmp += str.substr(3);
			          return tmp;
			      }else if(str.length < 10){
			          tmp += str.substr(0, 3);
			          tmp += '-';
			          tmp += str.substr(3, 2);
			          tmp += '-';
			          tmp += str.substr(5);
			          return tmp;
			      }else{
			          tmp += str.substr(0, 3);
			          tmp += '-';
			          tmp += str.substr(3, 2);
			          tmp += '-';
			          tmp += str.substr(5);
			          return tmp;
			      }
			      return str;
			}
			var cmpNo = document.getElementById('cmp_reg_no');
			cmpNo.onkeyup = function(){
			  console.log(this.value);
			  this.value = autoHypenCmp( this.value ) ;  
			}
				
			//사업자 하이픈 끝
			
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
			$j("#reg_no_input").on("keydown", function(e) {
		var code = e.keyCode;

		if (!((code >= 48 && code <= 57) || (code >= 96 && code <= 105))) {
			if (code == 8 || code == 46 || code == 27) {
				$j("#reg_no").val("");
				$j("#reg_no_input").val("");
				$j("#years").val("");
				reg_no_arr = [];
			} else if (code == 9) {
				return;
			} else {
				e.preventDefault();
			}
		}
	}).on("keyup", function(e) {
		var reg_no = $j("#reg_no_input").val();
		var key = reg_no.replace(/\-/g, '');
		var num = "";
		var star_num = "";
		var key_num = e.key;
		var hidden_num = "";
		var code = e.keyCode;

		if ($j("#reg_no").val().length == 14)
			return;

		if ((code >= 48 && code <= 57) || (code >= 96 && code <= 105)) {
			if (key.length < 7) {
				$j(this).val(key);
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
				$j(this).val(num);
			}

			hidden_num += key.substr(0, 6);
			hidden_num += "-";
			hidden_num += reg_no_arr.join("");
			$j("#reg_no").val(hidden_num);
		} else {
			e.preventDefault();
		}
	}).on("focusin", function() {
		$j("#reg_no").val("");
		$j("#reg_no_input").val("");
		$j("#years").val("");
		reg_no_arr = [];
	});
			// reg_no 뒷부분 입력시 * 처리
			
			
			// 주민등록번호 유효성 검사
			$j("#reg_no_input").on('focusout', function() { // 포커스를 잃었을때 실행합니다.
				var regNo = $j("#reg_no").val().replace("-", "");
		
				if (ssnConfirm(regNo)) {
					// 나이 대입..
					getAge(regNo);
		
		
				} else {
					$j("#reg_no_input").val("");
					$j("#reg_no").val("");
					$j(this).focus();
				}
			});
			
			// 나이 대입 메서드
		function getAge(regNo) {
		var j1 = regNo.substring(0, 6);
		var j2 = regNo.substring(6, 13);
		var n1 = j1.substr(0, 2); // 앞 6자리에 입력한 값중 앞에서 두글자를 n1 에 대입
		var n2 = j2.substr(0, 1); // 뒤 7자리에 입력한 값중 맨앞의 글자를 n2 에 대입(1~4)

		if (n2 == 1 || n2 == 2) { // 뒤 첫째값이 1, 2일 경우(1900년대에 출생한 남녀)
			$j("#years").val(nowYear - (1900 + Number(n1)));
		}
		if (n2 == 3 || n2 == 4) { // 뒤 첫째값이 3, 4일 경우
			$j("#years").val(nowYear - (2000 + Number(n1)));
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
	
	// ID 중복체크
	$j("#id").on('focusout', function(e) {
		var id = $j(this).val();
		if (id == '')
			return;

		$j.ajax({
			url : '/checkId?id=' + id,
			type : 'get',
			success : function(data) {
				console.log(data == 1 ? '아이디 중복' : '아이디 사용가능');
				if (data == 1) {
					alert("중복되는 id가 있습니다. 다른 id를 사용해주세요.");
					$j("#id").val("");
					$j("#id").focus();
					return;
				} else {
					alert("사용가능한 아이디 입니다.")
					return;
				}
			}
		})
	});
	
	// password 입력시 * 표시
			$j("#pwd_input")
					.on(
							"keydown",
							function(e) {
								var code = e.keyCode;

								if (!((code >= 48 && code <= 57)
										|| (code >= 96 && code <= 105) || (code >= 65 && code <= 90))) {
									if (code == 8 || code == 46 || code == 27) {
										$j("#pwd").val("");
										$j("#pwd_input").val("");
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
								var pwd = $j("#pwd");
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
									$j(this).val(key);
									pwd_arr.push(key_num);
									for (i = 0; i < post_pwd.length - 1; i++) {
										star_num += "*";
										replace = pwd.val().replace(
												pwd.val().substr(0, post_pwd.length),
												star_num);
									}
									$j(this).val(replace + key_num);
									hidden_num += pwd_arr.join("");
								}
								$j("#pwd").val(hidden_num);
							}).on("focusin", function() {
						$j("#pwd").val("");
						$j("#pwd_input").val("");
						pwd_arr = [];
					});
			
			// password_ck 입력시 * 표시
			$j("#pwd_ck_input")
			.on(
					"keydown",
					function(e) {
						var code = e.keyCode;
						
						if (!((code >= 48 && code <= 57)
								|| (code >= 96 && code <= 105) || (code >= 65 && code <= 90))) {
							if (code == 8 || code == 46 || code == 27) {
								$j("#pwd_ck").val("");
								$j("#pwd_ck_input").val("");
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
								var pwd = $j("#pwd_ck");
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
									$j(this).val(key);
									pwd_ck_arr.push(key_num);
									for (i = 0; i < post_pwd.length - 1; i++) {
										star_num += "*";
										replace = pwd.val().replace(
												pwd.val().substr(0, post_pwd.length),
												star_num);
									}
									$j(this).val(replace + key_num);
									hidden_num += pwd_ck_arr.join("");
								}
								$j("#pwd_ck").val(hidden_num);
							}).on("focusin", function() {
								$j("#pwd_ck").val("");
								$j("#pwd_ck_input").val("");
								pwd_ck_arr = [];
							});
			
			// 비밀번호 확인 체크
			$j("#pwd_ck_input").on('focusout', function() {
				var pwd = $j("#pwd").val();
				var pwd_ck = $j("#pwd_ck").val();
				if (pwd_ck == '')
					return;

				if (pwd == pwd_ck) {
					return;
				} else {
					alert("패스워드가 일치하지 않습니다");
					$j("#pwd_ck").val("");
					$j("#pwd_ck_input").val("");
					pwd_ck_arr = [];
					$j("#pwd_ck_input").focus();
				}
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
							console.log(fileVO.saveName);
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
							
							$j("[name=cmp_org_name]").val(fileVo.orgName);
							$j("[name=cmp_reg_image]").val(fileVo.saveName);
							
						}
					},
					error : function(XHR, status, error) {
						alert("error");
					}
				});
			});
			//사업자 등록증 사진 올리기 끝
			
			//이력서 사진 올리기
			$j("#carrier").change(function(){
				var formData = new FormData();
				formData.append("file", $j("#carrier")[0].files[0]);
				formData.append("type", "carrier");
				
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
							
							$j("[name=carrier_org_name]").val(fileVo.orgName);
							$j("[name=carrier]").val(fileVo.saveName);
							$j("#carrierDown").attr({target: "_blank",
								href: link});
						}
					},
					error : function(XHR, status, error) {
						alert("error");
					}
				});
			});
			//이력서 사진 올리기 끝
			
			  // 이미지 업로드
		    $j("#profile_image").on("change", handleImgFileSelect1);
		
		    function handleImgFileSelect1(e) {
		        var files = e.target.files;
		        var filesArr = Array.prototype.slice.call(files);
		
		        filesArr.forEach(function(f) {
		            if(!f.type.match("image.*")) {
		                alert("확장자는 이미지 확장자만 가능합니다.");
		                return;
		            }
		
		            sel_file = f;
		
		            var reader = new FileReader();
		            reader.onload = function(e) {
		                $j(".img-profile").attr("src", e.target.result);
		            }
		            reader.readAsDataURL(f);
		        });
		    }
		    
		    //사업자등록증 사진띄우기
		    $j("#cmp_reg_image").on("change", handleImgFileSelect2);
		    			
		 		    function handleImgFileSelect2(e) {
		 		        var files = e.target.files;
		 		        var filesArr = Array.prototype.slice.call(files);
		 		
		 		        filesArr.forEach(function(f) {
		 		            if(!f.type.match("image.*")) {
		 		                alert("확장자는 이미지 확장자만 가능합니다.");
		 		                return;
		 		            }
		 		            sel_file = f;
		 		            var reader = new FileReader();
		 		            reader.onload = function(e) {
		 		                $j(".cmp-thumbnail").attr("src", e.target.result);
		 		            }
		 		            reader.readAsDataURL(f);
		 		        });
		 		    }
		    //사업자등록증 사진업로드 끝
		    
		    //이력서 사진띄우기
		    $j("#carrier").on("change", handleImgFileSelect3);
		    			
		 		    function handleImgFileSelect3(e) {
		 		        var files = e.target.files;
		 		        var filesArr = Array.prototype.slice.call(files);
		 		
		 		        filesArr.forEach(function(f) {
		 		            if(!f.type.match("image.*")) {
		 		                alert("확장자는 이미지 확장자만 가능합니다.");
		 		                return;
		 		            }
		 		            sel_file = f;
		 		            var reader = new FileReader();
		 		            reader.onload = function(e) {
		 		                $j(".carrier-thumbnail").attr("src", e.target.result);
		 		            }
		 		            reader.readAsDataURL(f);
		 		        });
		 		    }
		    //이력서 사진업로드 끝
		 		    
		    //이력서 모달창
		    $j('#openCmp').click(function(){
		    		$j("#modal").show();
			});
		    
		    $j('#close').click(function(){
			    	$j('.searchModal').hide();
		    });
		    //이력서 모달창 끝

		 	//이력서 모달창 
		 	$j('#openCarrier').click(function(){
		    		$j("#modal_1").show();
			});
		    
		    $j('#close_1').click(function(){
			    	$j('.searchModal1').hide();
		    });
		    //이력서 모달창 끝
		    
			//이메일 직접입력 시
			$j('#emailCheck').change(function(){ 
				$j("#emailCheck option:selected").each(function () { 
					if($j(this).val()== '0'){ 
						//직접입력일 경우 
						$j("#emaila").val(''); 
						//값 초기화 
						$j("#emaila").attr("disabled",false); 
						//활성화 
						}else{ 
							//직접입력이 아닐경우 
							$j("#emaila").val($j(this).text());
							//선택값 입력 
							$j("#emaila").attr("disabled",true); 
							//비활성화 
							var emailCheck = $j("[name=emailCheck]").val();
							$j("[name=email2]").val(emailCheck);
						} 
					}); 
				});

			//이메일 직접입력 시 끝
			
			// 군필 여부에 따라 disabled 속성 부여 및 제거
			if ($j("#mil_yn").val() != 201) {
				$j("#mil_type, #mil_level, #mil_startdate, #mil_enddate").val("");
				$j("#mil_type_val, #mil_level_val, #mil_startdate, #mil_enddate").attr(
						"disabled", true);
			};
		
			$j("#mil_yn").on(
					"change",
					function() {
						if ($j("#mil_yn").val() != 201) {
							$j("#mil_type_val, #mil_level_val, #mil_startdate, #mil_enddate")
									.attr("readonly", true);
							$j("#mil_type, #mil_level")
									.val("");
							return;
						} else {
							$j("#mil_type_val, #mil_level_val, #mil_startdate, #mil_enddate")
									.attr("disabled", false);
							return;
						}
					});
			
			// KOSA 등록여부에 따라 KOSA 등급 input창을 비활성화
			if ($j("#kosa_reg_yn").val() != 1101) {
				$j("#kosa_class_code_val").attr("disabled", true);
				$j("#kosa_class_code").val("");		
			};
			
			$j("#kosa_reg_yn").on("change", function() {
				if($j("#kosa_reg_yn").val() != 1101) {
					$j("#kosa_class_code_val").attr("disabled", true);
					$j("#kosa_class_code").val("");
					return;
				}
				else {
					$j("#kosa_class_code_val").attr("disabled", false);
					$j("#kosa_class_code").val("");
					return;
				}
			});
			
			//등록버튼 시작
			  $j("#submit").on("click",function(){
				  	var name = $j("[name=name]").val();
					var id = $j("[name=id]").val();
					var pwd_input = $j("[name=pwd_input]").val();
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
					if(pwd == ''){
						window.alert("비밀번호를 입력해 주세요.");
						return false;
					}
					if(pwd != pwd_check || pwd != '' && pwd_check == ''){
						window.alert("비밀번호가 일치하지 않습니다.");
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
					if(email != '' && email2 == '' || email == '' && email2 != ''){
						window.alert("이메일을 모두 입력해 주세요.");
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
				  alert('입력완료');
			});
			// 등록 버튼 끝
			
			//script 끝
	});
</script>
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
				<form class="input" action="/inputForm" method="post" enctype="multipart/form-data">
					<table>
						<tr>
							<td rowspan="6">
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
									<option value="" selected>--선택--</option>
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
									<option value="00" selected>--선택--</option>
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
					
					<input type="button" value="전화면" id="mainView">
					<input type="submit" id="submit" value="등록">
					<input type="reset" value="취소">
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
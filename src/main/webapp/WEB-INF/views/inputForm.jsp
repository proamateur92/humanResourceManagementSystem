<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
 <title>작성 폼</title>

    <!-- Custom fonts for this template -->
    <link href="../resources/1/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../resources/1/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="../resources/1/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
	<script src="https://kit.fontawesome.com/c1651245ed.js" crossorigin="anonymous"></script>
	
	 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<script>
	var $j = jQuery.noConflict();
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
		  		$j('#datepicker1, #datepicker2, #datepicker3, #datepicker4').datepicker();
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
			                   
			                   $("[name=zip]").val(data.zonecode);
			                   $("[name=addr1]").val(fullRoadAddr);
			                   
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
			      $("[name=years]").val(age);
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
				$("[name=pwd]").val(tmp);
				
			    return symbol;
			}
			
			var pwd = document.getElementById('pwd3');
			
			pwd.onkeyup = function(){
				this.value = 
				pwdChange(this.value); 
			}
			//비밀번호 하이픈 끝
			
			//프로필 사진 올리기
			function profileUpload() {

		        var form = jQuery("#ajaxFrom")[0];
		        var formData = new FormData(form);
		        formData.append("message", "ajax로 파일 전송하기");
		        formData.append("file", jQuery("#ajaxFile")[0].files[0]);
		
		        jQuery.ajax({
		              url : "./ajaxFormReceive.php"
		            , type : "POST"
		            , processData : false
		            , contentType : false
		            , data : formData
		            , success:function(json) {
		                var obj = JSON.parse(json);
		            }
		        });
   			}
			//프로필 사진 올리기 끝
			
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
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
				PINOSOFT
                    
                </nav>
                <!-- End of Topbar -->
                <!-- Begin Page Content -->
                <div class="container-fluid">
					<h1>직원상세정보</h1>
				<form class="input" action="/inputForm" method="post" enctype="multipart/form-data">
					<table>
						<tr>
							<td rowspan="6"><input type="button" onclick="profileUpload();" value="사진올리기"></td>
							<td>*사번 <input type="text" disabled="disabled"></td>
							<td>*한글성명<input type="text" name="name"></td>
							<td>영문성명<input type="text" name="eng_name"></td>
						</tr>
						<tr>
	 						<td>*아이디<input type="text" name="id" id="id"></td>
							<input type="hidden" name="pwd" id="pwd">
							<td>*비밀번호<input type="text" name="pwd3" id="pwd3" onKeyup="pwd(this)"></td>
							<td>비밀번호 확인<input type="text" id="pwd1"></td>
						</tr>
						<tr>
							<td>*이메일<input type="text" name="email" id="email"></td>
							<td>*주민등록번호<input type="text" name="reg_no" id="reg_no" maxlength="14"></td>
							<td>*핸드폰번호<input type="text" name="hp" id="hp" maxlength="13" onKeyup="hpNumber(this)"></td>
						</tr>
						<tr>
							<td>연령<input type="text" name="years" id="years" value="0"></td>
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
								주소<input type="text" name="zip" placeholder="우편번호" readonly>
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
							<td>입영일자<input type="text" name="mil_startdate" id="datepicker1"></td>
							<td>전역일자<input type="text" name="mil_enddate" id="datepicker2"></td>
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
							<td>입사일자<input type="text" name="join_day" id="datepicker3"></td>
							<td>퇴사일자<input type="text" name="retire_day" id="datepicker4"></td>
						</tr>
						<tr>
							<td>사업자번호<input type="text" name="cmp_reg_no"></td>
							<td>업체명<input type="text" name="crm_name"></td>
							<td>사업자등록증<input type="text" name="cmp_reg_image"></td>
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
					<input type="submit" value="등록">
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

    <!-- Bootstrap core JavaScript-->
    <script src="../resources/1/vendor/jquery/jquery.min.js"></script>
    <script src="../resources/1/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="../resources/1/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="../resources/1/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="../resources/1/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="../resources/1/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="../resources/1/js/demo/datatables-demo.js"></script>

</body>


</html>
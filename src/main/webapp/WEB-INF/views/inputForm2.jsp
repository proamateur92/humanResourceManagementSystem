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
 
		
<script>
		var $j = jQuery.noConflict();
			
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
		  	
			function button1(){
					location.href="/";
				}
			
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

			function button2(){
					var $frm = $j('.input :input');
					var param = $frm.serialize();
					
					console.log(param);
					$j.ajax({
					    url : "/test",
					    dataType: "json",
					    type: "POST",
					    data : param,
					    success: function(data, textStatus, jqXHR)
					    {
							alert("작성완료");
							
							alert("메세지:"+data.success);
							
							location.href = "redirect:/";
					    },
					    error: function (jqXHR, textStatus, errorThrown)
					    {
					    	alert("실패");
					    }
					});
				}
			
			$j("#up_upload").on("click", function(){
					alert("1");
			});
			/*
			var phoneNum = document.getElementById('hp');

			phoneNum.onkeyup = function(){
			  console.log(this.value);
			  this.value = autoHypenPhone( this.value ) ;  
			}
			*/
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
				<form class="input" id="input" enctype="multipart/form-data">
					<table>
						<tr>
							<div id="preView"></div>
							<td rowspan="6"><input type="file" name="up_upload" id="up_upload"></td>
							<td>*사번 <input type="text" disabled="disabled"></td>
							<td>*한글성명<input type="text" name="name"></td>
							<td>영문성명<input type="text" name="eng_name"></td>
						</tr>
						<tr>
	 						<td>*아이디<input type="text" name="id"></td>
							<td>*비밀번호<input type="text" name="pwd"></td>
							<td>비밀번호 확인<input type="text" id="pwd"></td>
						</tr>
						<tr>
							<td>*이메일<input type="text" name="email"></td>
							<td>*주민등록번호<input type="text" name="reg_no" maxlength="14"></td>
							<td>*핸드폰번호<input type="text" name="hp" class="hp" maxlength="13"></td>
						</tr>
						<tr>
							<td>연령<input type="text" name="age"></td>
							<td>직종체크<select name="major">
									<option value="" selected>--선택--</option>
										<c:forEach var="com" items="${comList }">
											<c:if test="${com.gubun eq 4}">
												<option value="${com.code }">${com.name }</option>
											</c:if>
										</c:forEach>
								</select>
							</td>
							<td>성별
								<select name="gender">
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
								주소<input type="text" name="add1" placeholder="우편번호">
								<input type="button" value="주소검색" onclick="addSearch();"> 
								<input type="text" name="add2" placeholder="주소">
								<input type="text" name="add3" placeholder="세부주소">
							</td>
						</tr>
						<tr>
							<td>직위<select name="rank">
									<option value="" selected>--선택--</option>
										<c:forEach var="com" items="${comList }">
											<c:if test="${com.gubun eq 3}">
												<option value="${com.code }">${com.name }</option>
											</c:if>
										</c:forEach>
								</select>
							</td>
							<td>부서<select name="dept">
									<option value="" selected>--선택--</option>
										<c:forEach var="com" items="${comList }">
											<c:if test="${com.gubun eq 5}">
												<option value="${com.code }">${com.name }</option>
											</c:if>
										</c:forEach>
								</select>
							</td>
							<td>연봉<input type="text" name="sal" placeholder="(만원)"></td>
						</tr>
						<tr>
							<td>입사구분<select name="join_check">
									<option value="" selected>--선택--</option>
										<c:forEach var="com" items="${comList }">
											<c:if test="${com.gubun eq 6}">
												<option value="${com.code }">${com.name }</option>
											</c:if>
										</c:forEach>
								</select>
							</td>
							<td>최종학력<select name="school">
									<option value="" selected>--선택--</option>
										<c:forEach var="com" items="${comList }">
											<c:if test="${com.gubun eq 7}">
												<option value="${com.code }">${com.name }</option>
											</c:if>
										</c:forEach>
								</select>
							</td>
							<td>투입여부<select name="input_check">
									<option value="" selected>--선택--</option>
										<c:forEach var="com" items="${comList }">
											<c:if test="${com.gubun eq 8}">
												<option value="${com.code }">${com.name }</option>
											</c:if>
										</c:forEach>
								</select>
							</td>
							<td>군필여부
								<select name="mil_check">
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
							<td>군별<select name="mil_kind">
									<option value="" selected>--선택--</option>
										<c:forEach var="com" items="${comList }">
											<c:if test="${com.gubun eq 9}">
												<option value="${com.code }">${com.name }</option>
											</c:if>
										</c:forEach>
								</select>
							</td>
							<td>계급<select name="mil_rank">
									<option value="" selected>--선택--</option>
										<c:forEach var="com" items="${comList }">
											<c:if test="${com.gubun eq 10}">
												<option value="${com.code }">${com.name }</option>
											</c:if>
										</c:forEach>
								</select>
							</td>
							<td>입영일자<input type="text" name="mil_date1" id="datepicker1"></td>
							<td>전역일자<input type="text" name="mil_date2" id="datepicker2"></td>
						</tr>
						<tr>
							<td>KOSA등록<select name="kosa_reg">
									<option value="" selected>--선택--</option>
										<c:forEach var="com" items="${comList }">
											<c:if test="${com.gubun eq 11}">
												<option value="${com.code }">${com.name }</option>
											</c:if>
										</c:forEach>
								</select>
							</td>
							<td>KOSA등급<select name="kosa_rank">
									<option value="" selected>--선택--</option>
										<c:forEach var="com" items="${comList }">
											<c:if test="${com.gubun eq 12}">
												<option value="${com.code }">${com.name }</option>
											</c:if>
										</c:forEach>
								</select>
							</td>
							<td>입사일자<input type="text" name="enter_date" id="datepicker3"></td>
							<td>퇴사일자<input type="text" name="leave_date" id="datepicker4"></td>
						</tr>
						<tr>
							<td>사업자번호<input type="text" name="empno"></td>
							<td>업체명<input type="text" name="company"></td>
							<td>사업자등록증<input type="text" name="reserv"></td>
							<td rowspan="2">
								<input type="button" value="미리보기"><input type="button" value="다운"><br>
								<input type="button" value="등록"><input type="button" value="파일업로드">
							</td>
						</tr>
						<tr>
							<td colspan="2" rowspan="2">자기소개<textarea name="introduce" style="width:600px; height:25px;"></textarea></td>
							<td>이력서<input type="text" name="resume"></td>
						</tr>
					</table>
					
					<input type="button" value="전화면" onclick="button1();">
					<!-- <input type="submit" value="등록"> -->
					<input type="button" value="등록(아작스)" onclick="button2();">
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
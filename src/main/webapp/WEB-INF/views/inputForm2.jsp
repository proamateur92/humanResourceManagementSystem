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
	$j(document).ready(function() {
		
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
				<form class="input" action="/inputForm" method="post">
					<div>
						<label for="sabun">사번</label>
						<input type="text" disabled="disabled">
					</div>
					<div>
						<label for="id">*아이디</label>
						<input type="text" name="id">
					</div>
					<div>
						<label for="name">*한글성명</label>
						<input type="text" name="name">
					</div>
					<div>
						<label for="pwd">*패스워드</label>
						<input type="text" name="pwd">
					</div>
					<div>
						<label for="hp">*핸드폰번호</label>
						<input type="text" name="hp">
					</div>
					<div>
						<label for="reg_no">*주민번호</label>
						<input type="text" name="reg_no">
					</div>
					<div>
						<label for="email">*이메일</label>
						<input type="text" name="email">
					</div>
					<div>
						<label for="join_day">입사일</label>
						<input type="text" name="join_day">
					</div>
					<input type="button" value="전화면" id="back">
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
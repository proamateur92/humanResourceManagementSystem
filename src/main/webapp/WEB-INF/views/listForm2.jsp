<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<title>직원 리스트</title>

<!-- Custom fonts for this template -->
<link href="../resources/1/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../resources/1/css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link
	href="../resources/1/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/c1651245ed.js"
	crossorigin="anonymous"></script>
<script>
		function button2() {
			location.replace("/listForm");
		}	

		function button3() {
			location.href="/";
		}
		
		function update() {
			var leng = $("input:checkbox[name=sabun]:checked").length;
			
			if(leng!=1){
				alert("한명의 사원만 체크해주세요.");
				return false;
			}
			
			var sabun = $("input:checkbox[name='sabun']:checked").val();
			
			location.href= "/update?sabun="+sabun;
		}
		
		function delete_m() {
			
			var leng = $("input:checkbox[name=sabun]:checked").length;
			
			if(leng!=1){
				alert("한명의 사원만 체크해주세요.");
				return false;
			}

			result = confirm("삭제하시겠습니까?");
			
			if(!result){
				return false;
			}
			
			var sabun = $("input:checkbox[name='sabun']:checked").val();
			
			$.ajax({
				url : "/delete",		
				type : "post",
				data : {"sabun":sabun},
				
				success : function(data){
					console.log(data);
					if(data==1){
						alert("삭제 성공");
						location.href = "/listForm";
					} else{
						alert("삭제 실패");
					}
				},
				error : function(XHR, status, error) {
					alert("데이터 전달이 올바르지 않습니다.");
				}
			});
		}
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

				<!-- Begin Page Content -->
				<div class="container-fluid">
					사번<input type="text"> 성명<input type="text"> 입사구분
					<input type="text"> 투입여부<input type="text"> <br>직위
					<input type="text"> 입사일자<input type="text"> 퇴사일자
					<input type="text"> 직종분류<input type="text"> 
					<input type="button" value="검색"> 
					<input type="button" value="초기화" onclick="button2();">
					<input type="button" value="전화면" onclick="button3();">

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h4 class="m-0 font-weight-bold text-primary">직원리스트</h4>
							<input type="button" value="수정" style="float: right;" onclick="update();">
							<input type="button" value="삭제" style="float: right;" onclick="delete_m();">
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>사번</th>
											<th>이름</th>
											<th>주민번호</th>
											<th>핸드폰번호</th>
											<th>직위</th>
											<th>입사일자</th>
											<th>퇴사일자</th>
											<th>투입여부</th>
											<th>연봉</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>사번</th>
											<th>이름</th>
											<th>주민번호</th>
											<th>핸드폰번호</th>
											<th>직위</th>
											<th>입사일자</th>
											<th>퇴사일자</th>
											<th>투입여부</th>
											<th>연봉</th>
										</tr>
									</tfoot>
									<tbody>
										<c:forEach var="insa" items="${list }">
											<tr>
												<td><input type='checkbox' name="sabun" value="${insa.sabun }" />${insa.sabun }</td>
												<td>${insa.name }</td>
												<td>${insa.reg_no }</td>
												<td>${insa.hp }</td>
												<td><c:forEach var="com" items="${com}">
														<c:if test="${insa.pos_gbn_code eq com.code}">
		                                            			${com.name }
		                                            		</c:if>
													</c:forEach></td>
												<td>${insa.join_day}</td>
												<td>${insa.retire_day }</td>
												<td><c:forEach var="com" items="${com}">
														<c:if test="${insa.put_yn eq com.code}">
		                                            			${com.name }
		                                            		</c:if>
													</c:forEach></td>
												<td>${insa.salary }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>

				</div>
				<!-- /.container-fluid -->

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

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Bootstrap core JavaScript-->
	<script src="../resources/1/vendor/jquery/jquery.min.js"></script>
	<script
		src="../resources/1/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="../resources/1/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="../resources/1/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="../resources/1/vendor/datatables/jquery.dataTables.min.js"></script>
	<script
		src="../resources/1/vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="../resources/1/js/demo/datatables-demo.js"></script>

</body>

</html>
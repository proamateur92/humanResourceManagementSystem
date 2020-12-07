<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<title>직원 리스트</title>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> <!-- datepicker -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />

<style type="text/css">
li {list-style: none; float: left; padding: 6px;}

.page {
	text-align: center;
	padding-left: 40%;
}
</style>

<script>
		function button2() {
			location.replace("/listForm");
		}	

		function button3() {
			location.href="/";
		}
		
		function update() {
			var leng = $("input:checkbox[name=sabun]:checked").length;
			
			if(leng==0){
				alert("정보를 수정할 사원을 체크해주세요.");
				return false;
			}
			
			if(leng!=1){
				alert("한명의 사원만 체크해주세요.");
				return false;
			}
			
			var sabun = $("input:checkbox[name='sabun']:checked").val();
			
			location.href= "/updateForm?sabun="+sabun;
		}
		
		function delete_m() {
			
			var leng = $("input:checkbox[name=sabun]:checked").length;
			
			if(leng==0){
				alert("정보를 삭제할 사원을 체크해주세요.");
				return false;
			}
			
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
		
		$.datepicker.setDefaults({
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
		
		$( function() {
	  		$('#j').datepicker({
	  			showOn: "button",
	  			buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
	  		});
	  		
	  		$('#r').datepicker({
	  			showOn: "button",
	  			buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
	  		});
	  	});
		
		$(function(){
	        $('#searchBtn').click(function() {
	          self.location = "listForm" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
	        });
	      }); 
		
		$(function(){
	        $('#searchBtn2').click(function() {

	        	if($('#o').val()!='' && $('#u').val()!='') {
	        	  var keyword=$('[name=keyword3]').val()+$('[name=keyword4]').val();
	        	  
	        	  self.location = "listForm" + '${pageMaker.makeQuery(1)}' + "&searchType=O&keyword=" + encodeURIComponent(keyword);
	        	  return false;
	        	} 

	        	if($('#o').val()!='' && $('#g').val()!='') {
	        	  var keyword=$('[name=keyword3]').val()+$('[name=keyword5]').val();
	        	  
	        	  self.location = "listForm" + '${pageMaker.makeQuery(1)}' + "&searchType=G&keyword=" + encodeURIComponent(keyword);
	        	  return false;
	        	} 
	        	
	        	if($('#o').val()!='' && $('#t').val()!='') {
		        	  var keyword=$('[name=keyword3]').val()+$('[name=keyword8]').val();
		        	  
		        	  self.location = "listForm" + '${pageMaker.makeQuery(1)}' + "&searchType=T&keyword=" + encodeURIComponent(keyword);
		        	  return false;
		        	} 
	        	
	        	if($('#u').val()!='' && $('#g').val()!='') {
		        	  var keyword=$('[name=keyword4]').val()+$('[name=keyword5]').val();
		        	  
		        	  self.location = "listForm" + '${pageMaker.makeQuery(1)}' + "&searchType=U&keyword=" + encodeURIComponent(keyword);
		        	  return false;
		        	} 
	        	
	        	if($('#u').val()!='' && $('#t').val()!='') {
		        	  var keyword=$('[name=keyword4]').val()+$('[name=keyword8]').val();
		        	  
		        	  self.location = "listForm" + '${pageMaker.makeQuery(1)}' + "&searchType=W&keyword=" + encodeURIComponent(keyword);
		        	  return false;
		        	} 
	        	
	        	if($('#g').val()!='' && $('#t').val()!='') {
		        	  var keyword=$('[name=keyword5]').val()+$('[name=keyword8]').val();
		        	  
		        	  self.location = "listForm" + '${pageMaker.makeQuery(1)}' + "&searchType=A&keyword=" + encodeURIComponent(keyword);
		        	  return false;
		        	} 
	        	
	        	if($('#s').val()!='') {
	        	  	alert($('[name=keyword]').val());
		          	self.location = "listForm" + '${pageMaker.makeQuery(1)}' + "&searchType=s&keyword=" + encodeURIComponent($('#s').val());
	        		return false;
	        	} 
	        	
	        	if($('#n').val()!='') {
	        	 	self.location = "listForm" + '${pageMaker.makeQuery(1)}' + "&searchType=n&keyword=" + encodeURIComponent($('#n').val());
	        		return false;
	        	} 
	        	

	        	if($('#o').val()!='') {
	        		if($('#o').val()==''){
	        			return false;
	        		}
	        	  self.location = "listForm" + '${pageMaker.makeQuery(1)}' + "&searchType=o&keyword=" + encodeURIComponent($('#o').val());
	        	  return false;
	        	} 
	        	
	        	if($('#u').val()!='') {
	        		if($('#u').val()==''){
	        			return false;
	        		}
	        	  self.location = "listForm" + '${pageMaker.makeQuery(1)}' + "&searchType=u&keyword=" + encodeURIComponent($('#u').val());
	        			return false;
	        	} 
	        	
	        	if($('#g').val()!='') {
	        		if($('#g').val()==''){
	        			return false;
	        		}
	        	  self.location = "listForm" + '${pageMaker.makeQuery(1)}' + "&searchType=g&keyword=" + encodeURIComponent($('#g').val());
	        	  return false;
	        	} 
	        	
	        	if($('#j').val()!='') {
	        	  self.location = "listForm" + '${pageMaker.makeQuery(1)}' + "&searchType=j&keyword=" + encodeURIComponent($('#j').val());
	        	} 
	        	
	        	if($('#r').val()!='') {
	        	  self.location = "listForm" + '${pageMaker.makeQuery(1)}' + "&searchType=r&keyword=" + encodeURIComponent($('#r').val());
	        	} 
	        	
	        	if($('#t').val()!=''){
	        		if($('#t').val()==''){
	        			return false;
	        		}
	        	  self.location = "listForm" + '${pageMaker.makeQuery(1)}' + "&searchType=t&keyword=" + encodeURIComponent($('#t').val());
	        			return false;
	        	} 
	        });
	      }); 
</script>
</head>

<body id="page-top">
	<!-- Page Wrapper -->
				<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
					PINOSOFT
					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">
						<div class="topbar-divider d-none d-sm-block"></div>
					</ul>

				</nav>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">
					사번<input type="text" id="s" name="keyword1"> 
					성명<input type="text" id="n" name="keyword2"> 
					입사구분
					<select id="o" name="keyword3">
					<option value="">--선택--</option>
						<c:forEach var="com" items="${com }">
							<c:if test="${com.gubun eq 6}">
							<option value="${com.code }">${com.name }</option>
							</c:if>
						</c:forEach>
					</select>
					
					투입여부
					<select id="u" name="keyword4">
					<option value="">--선택--</option>
						<c:forEach var="com" items="${com }">
							<c:if test="${com.gubun eq 8}">
							<option value="${com.code }">${com.name }</option>
							</c:if>
						</c:forEach>
					</select> 
					
					직위
					<select id="g" name="keyword5">
					<option value="">--선택--</option>
						<c:forEach var="com" items="${com }">
							<c:if test="${com.gubun eq 3}">
							<option value="${com.code }">${com.name }</option>
							</c:if>
						</c:forEach>
					</select>
					
					입사일자<input type="text" id="j" name="keyword6" readonly> 
					퇴사일자<input type="text" id="r" name="keyword7" readonly> 
					
					직종분류
					<select id="t" name="keyword8">
					<option value="">--선택--</option>
						<c:forEach var="com" items="${com }">
							<c:if test="${com.gubun eq 4}">
							<option value="${com.code }">${com.name }</option>
							</c:if>
						</c:forEach>
					</select>
					
					<input type="button" id="searchBtn2" value="검색"> 
					<input type="button" value="초기화" onclick="button2();">
					<input type="button" value="전화면" onclick="button3();">

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h4 class="m-0 font-weight-bold text-primary">직원리스트</h4>
							<input type="button" value="수정" style="float: right;" onclick="update();">
							<input type="button" value="삭제" style="float: right;" onclick="delete_m();">
						</div>
								<table class="table table-bordered" id="dataTable" border="1" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>사번</th>
											<th>이름</th>
											<th>주민등록번호</th>
											<th>핸드폰번호</th>
											<th>직위</th>
											<th>입사일자</th>
											<th>퇴사일자</th>
											<th>투입여부</th>
											<th>연봉</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="list" items="${list }">
											<tr>
												<td><input type='checkbox' name="sabun" value="${list.sabun }" />${list.sabun }</td>
												<td>${list.name }</td>
												<td>${list.reg_no }</td>
												<td>${list.hp }</td>
												<td><c:forEach var="com" items="${com}">
														<c:if test="${list.pos_gbn_code eq com.code}">
		                                            			${com.name }
		                                            		</c:if>
													</c:forEach></td>
												<td>${list.join_day}</td>
												<td>${list.retire_day }</td>
												<td><c:forEach var="com" items="${com}">
														<c:if test="${list.put_yn eq com.code}">
		                                            			${com.name }
		                                            		</c:if>
													</c:forEach></td>
												<td>${list.salary }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
<!--
								 <div class="search">
  	<select name="searchType">
      <option value="f"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
      <option value="s"<c:out value="${scri.searchType eq 'n' ? 'selected' : ''}"/>>사번</option>
      <option value="n"<c:out value="${scri.searchType eq 'n' ? 'selected' : ''}"/>>이름</option>
      <option value="o"<c:out value="${scri.searchType eq 'o' ? 'selected' : ''}"/>>입사구분</option>
      <option value="u"<c:out value="${scri.searchType eq 'u' ? 'selected' : ''}"/>>투입여부</option>
      <option value="g"<c:out value="${scri.searchType eq 'g' ? 'selected' : ''}"/>>직위</option>
      <option value="j"<c:out value="${scri.searchType eq 'j' ? 'selected' : ''}"/>>입사일자</option>
      <option value="r"<c:out value="${scri.searchType eq 'r' ? 'selected' : ''}"/>>퇴사일자</option>
      <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>직종분류</option>
    </select>
    <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>
    <button id="searchBtn" type="button">검색</button>
-->

								<div class="page">
								  <ul>
								    <c:if test="${pageMaker.prev}">
								    	<li><a href="listForm${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
								    </c:if> 
								
								    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
								    	<li><a href="listForm${pageMaker.makeSearch(idx)}">${idx}</a></li>
								    </c:forEach>
								
								    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								    	<li><a href="listForm${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
								    </c:if> 
								  </ul>
								</div>
  					</div>
				</div>



	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Bootstrap core JavaScript-->

	<!-- Core plugin JavaScript-->
	<script src="../resources/1/vendor/jquery-easing/jquery.easing.min.js"></script>
	<link href="../resources/1/css/sb-admin-2.min.css" rel="stylesheet">
	<!-- Custom scripts for all pages-->
</body>

</html>
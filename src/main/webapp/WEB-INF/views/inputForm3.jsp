<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인사관리시스템</title>

	<!-- bootstrap css -->
	<link href="${pageContext.request.contextPath }/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- bootstrap datepicker -->
	<link href="${pageContext.request.contextPath }/assets/css/datepicker3.css" rel="stylesheet">
	
	<!-- index css -->
	<link href="${pageContext.request.contextPath }/assets/css/input.css" rel="stylesheet">
	
	<!-- ui.jqgrid css -->
	<link href="${pageContext.request.contextPath }/assets/jqGrid/css/ui.jqgrid.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/assets/jqGrid/css/ui.jqgrid-bootstrap.css" rel="stylesheet">
</head>

<body>
	<div class="container">
		<div class="row">
			<form class="form-horizontal" id="input-form" action="" method="post" enctype="multipart/form-data" onsubmit="return insertAndCheck();">
				<div class="form-group">
					<c:if test="${loadType eq 'regist'}">
						<label class="h2">직원 등록</label>
					</c:if>
					<c:if test="${loadType eq 'modify'}">
						<label class="h2">직원 상세 정보 및 수정</label>
					</c:if>
				</div>
				<div class="form-group">
					<c:if test="${loadType eq 'regist'}">
						<div class="col-xs-offset-10">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="submit" class="btn btn-primary">등록</button>
							<a href="${pageContext.request.contextPath }/index" class="btn btn-primary">전화면</a>

						</div>
					</c:if>
					<c:if test="${loadType eq 'modify'}">
						<!-- 버튼 3개짜리 -->
						<div class="col-xs-offset-10">
							<button type="submit" class="btn btn-primary">수정</button>
							<button type="button" class="btn btn-danger">삭제</button>
							<a href="${pageContext.request.contextPath }/search" class="btn btn-primary">이전</a>
						</div>
					</c:if>
					<hr>
				</div>
				
				<div class="form-group">
					<div class="col-xs-3 text-center">
						<img src="${pageContext.request.contextPath }/assets/img/unknown.png" class="img-thumbnail img-profile">
					</div>
					<label class="col-xs-1 control-label">사번</label>
					<div class="col-xs-2">
						<c:if test="${loadType eq 'regist'}">
							<input type="text" class="form-control" id="sabun" readonly="readonly">
						</c:if>
						<c:if test="${loadType eq 'modify'}">
							<input type="text" class="form-control" id="sabun" name="sabun" readonly="readonly">
						</c:if>
					</div>
					<label class="col-xs-1 control-label">*한글성명</label>
					<div class="col-xs-2">
						<input type="text" class="form-control" name="name">
					</div>
					<label class="col-xs-1 control-label">영문성명</label>
					<div class="col-xs-2">
						<input type="text" class="form-control" name="eng_name">
					</div>
					<label class="col-xs-1 control-label">*아이디</label>
					<div class="col-xs-2">
						<input type="text" class="form-control" name="id">
					</div>
					<label class="col-xs-1 control-label">*패스워드</label>
					<div class="col-xs-2">
						<input type="password" class="form-control" name="pwd">
					</div>
					<label class="col-xs-1 control-label">*패스워드확인</label>
					<div class="col-xs-2">
						<input type="password" class="form-control" name="pwd-check">
					</div>
					<label class="col-xs-1 control-label">전화번호</label>
					<div class="col-xs-2">
						<input type="text" class="form-control" name="phone">
					</div>
					<label class="col-xs-1 control-label">*핸드폰번호</label>
					<div class="col-xs-2">
						<input type="text" class="form-control" name="hp">
					</div>
					<label class="col-xs-1 control-label">주민번호</label>
					<div class="col-xs-2">
						<input type="text" class="form-control" name="reg_no">
					</div>
					<label class="col-xs-1 control-label">연령</label>
					<div class="col-xs-1">
						<input type="text" class="form-control" name="years">
					</div>
					<label class="col-xs-1 control-label">*이메일</label>
					<div class="col-xs-2">
						<div class="col-xs-6">
							<input type="text" class="form-control" name="email">
						</div>
						<div class="col-xs-6">
							<select id="email-selector" class="form-control" name="email_sel">
	  							<option value="00">(선택)</option>
	  							<c:forEach items="${commonMap.emailList }" var="vo" >
	  								<option value="${vo.code }">${vo.name }</option>
	  							</c:forEach>
							</select>
						</div>
					</div>
					<label class="col-xs-1 control-label">직종체크</label>
					<div class="col-xs-1">
						<select id="job-selector" class="form-control" name="job_type">
	  						<option value="00">(선택)</option>
	  						<c:forEach items="${commonMap.jobList }" var="vo" >
	  							<option value="${vo.code }">${vo.name }</option>
	  						</c:forEach>
						</select>
					</div>
					<label class="col-xs-1 control-label">성별</label>
					<div class="col-xs-1">
						<select id="sex-selector" class="form-control" name="sex">
	  						<option value="00">(선택)</option>
	  						<c:forEach items="${commonMap.sexList }" var="vo" >
	  							<option value="${vo.code }">${vo.name }</option>
	  						</c:forEach>
						</select>
					</div>
					<label class="col-xs-1 control-label">주소</label>
					<div class="col-xs-1">
						<input type="text" class="form-control" id="sample6_postcode" placeholder="우편번호" name="zip">
					</div>
					<div class="col-xs-1">
						<input type="button" class="btn btn-default" onclick="sample6_execDaumPostcode()" value="주소검색">
					</div>
					<div class="col-xs-3">
						<input type="text" class="form-control" id="sample6_address" placeholder="주소" name="addr1">
					</div>
					<div class="col-xs-3">
						<input type="text" class="form-control" id="sample6_detailAddress" placeholder="세부주소" name="addr2">
						<input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
					</div>
					<div class="col-xs-3 text-center">
						<label class="btn btn-default btn-file"><span class="glyphicon glyphicon-camera" aria-hidden="true"></span> 사진올리기
							<input type="file" id="profile" style="display: none;">
							<input type="hidden" name="profile">
						</label>
					</div>
					<label class="col-xs-1 control-label">직위</label>
					<div class="col-xs-2">
						<select id="pos-selector" class="form-control" name="pos_gbn_code">
	  						<option value="00">(선택)</option>
	  						<c:forEach items="${commonMap.posList }" var="vo" >
	  							<option value="${vo.code }">${vo.name }</option>
	  						</c:forEach>
						</select>
					</div>
					<label class="col-xs-1 control-label">부서</label> 
					<div class="col-xs-2">
						<select id="dept-selector" class="form-control" name="dept_code">
	  						<option value="00">(선택)</option>
	  						<c:forEach items="${commonMap.deptList }" var="vo" >
	  							<option value="${vo.code }">${vo.name }</option>
	  						</c:forEach>
						</select>
					</div>
					<label class="col-xs-1 control-label">연봉</label>
					<div class="col-xs-2">
						<input type="number" class="form-control" placeholder="(만원)" name="salary">
					</div>
					<label class="col-xs-1 control-label">입사구분</label>
					<div class="col-xs-2">
						<select id="join-selector" class="form-control" name="join_gbn_code">
	  						<option value="00">(선택)</option>
	  						<c:forEach items="${commonMap.joinList }" var="vo" >
	  							<option value="${vo.code }">${vo.name }</option>
	  						</c:forEach>
						</select>
					</div>
					<label class="col-xs-1 control-label">등급</label>
					<div class="col-xs-2">
						<select id="gart-selector" class="form-control" name="gart_level">
	  						<option value="00">(선택)</option>
	  						<c:forEach items="${commonMap.gartList }" var="vo" >
	  							<option value="${vo.code }">${vo.name }</option>
	  						</c:forEach>
						</select>
					</div>
					<label class="col-xs-1 control-label">투입여부</label>
					<div class="col-xs-2">
						<select class="form-control" name="put_yn">
	  						<option value="00">(선택)</option>
	  						<option value="Y">Y</option>
	  						<option value="N">N</option>
						</select>
					</div>
					<label class="col-xs-1 control-label">군필여부</label>
					<div class="col-xs-2">
						<select class="form-control" name="mil_yn">
	  						<option value="00">(선택)</option>
	  						<option value="Y">Y</option>
	  						<option value="N">N</option>
						</select>
					</div>
					<label class="col-xs-1 control-label">군별</label>
					<div class="col-xs-2">
						<select id="mtype-selector" class="form-control" disabled="disabled">
	  						<option value="00">(선택)</option>
	  						<c:forEach items="${commonMap.mTypeList }" var="vo" >
	  							<option value="${vo.code }">${vo.name }</option>
	  						</c:forEach>
						</select>
						<input type="hidden" name="mil_type" value="00">
					</div>
					<label class="col-xs-1 control-label">계급</label>
					<div class="col-xs-2">
						<select id="mlevel-selector" class="form-control" disabled="disabled">
	  						<option value="00">(선택)</option>
	  						<c:forEach items="${commonMap.mLevelList }" var="vo" >
	  							<option value="${vo.code }">${vo.name }</option>
	  						</c:forEach>
						</select>
						<input type="hidden" name="mil_level" value="00">
					</div>
					<label class="col-xs-1 control-label">입영일자</label>
					<div class="col-xs-2">
						<input type="text" class="form-control dateRangePicker" name="mil_startdate" readonly="readonly">
					</div>
					<label class="col-xs-1 control-label">전역일자</label>
					<div class="col-xs-2">
						<input type="text" class="form-control dateRangePicker" name="mil_enddate" readonly="readonly">
					</div>
					<label class="col-xs-1 control-label">KOSA등록</label>
					<div class="col-xs-2">
						<select class="form-control" name="kosa_reg_yn">
	  						<option value="00">(선택)</option>
	  						<option value="Y">Y</option>
	  						<option value="N">N</option>
						</select>
					</div>
					<label class="col-xs-1 control-label">KOSA등급</label>
					<div class="col-xs-2">
						<select id="kclass-selector" class="form-control" name="kosa_class_code">
	  						<option value="00">(선택)</option>
	  						<c:forEach items="${commonMap.kClassList }" var="vo" >
	  							<option value="${vo.code }">${vo.name }</option>
	  						</c:forEach>
						</select>
					</div>
					<label class="col-xs-1 control-label">*입사일자</label>
					<div class="col-xs-2">
						<input type="text" class="form-control dateRangePicker" name="join_day">
					</div>
					<label class="col-xs-1 control-label">퇴사일자</label>
					<div class="col-xs-2">
						<input type="text" class="form-control dateRangePicker" name="retire_day">
					</div>
					<label class="col-xs-1 control-label">사업자번호</label>
					<div class="col-xs-2">
						<input type="text" class="form-control" name="cmp_reg_no">
					</div>
					<label class="col-xs-1 control-label">업체명</label>
					<div class="col-xs-2">
						<input type="text" class="form-control" name="crm_name">
					</div>
					<label class="col-xs-1 control-label">사업자등록증</label>
					<div class="col-xs-2">
						<input type="text" class="form-control" readonly="readonly" name="cmp_org_name">
						<input type="hidden" class="form-control" name="cmp_reg_image">
					</div>
					<div class="col-xs-3">
						<div class="col-xs-6">
							<a class="btn btn-default" id="cmpDown">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;미리보기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
						</div>
						<div class="col-xs-6">
							<label class="btn btn-default btn-file">등록
								<input type="file" id="cmp_reg_image" style="display: none;">
							</label>
						</div>
					</div>
					<label class="col-xs-1 control-label">자기소개</label>
					<div class="col-xs-5">
						<textarea class="form-control" rows="2" placeholder="100자 내외로 적으시오." name="self_intro"></textarea>
					</div>
					<label class="col-xs-1 control-label">이력서</label>
					<div class="col-xs-2">
						<input type="text" class="form-control" readonly="readonly" name="carrier_org_name">
						<input type="hidden" class="form-control" name="carrier">
					</div>
					<div class="col-xs-3">
						<div class="col-xs-6">
							<a class="btn btn-default" id="carrierDown">이력서 다운로드</a>
						</div>
						<div class="col-xs-6">
							<label class="btn btn-default btn-file">이력서 업로드
								<input type="file" id="carrier" style="display: none;">
							</label>
						</div>
					</div>
				</div>
			</form>
		</div>
		
		<div class="row">
	    	<table id="jqGrid"></table>
	    	<div id="jqGridPager"></div>
		</div>
	</div>
	<!--jQuery -->
	<script src="${pageContext.request.contextPath }/assets/js/jquery-3.4.1.min.js"></script>
	
	<!--Bootstrap JS -->
	<script src="${pageContext.request.contextPath }/assets/bootstrap/js/bootstrap.min.js"></script>
	
	<!-- Bootstrap datepicker JS -->
	<script src="${pageContext.request.contextPath }/assets/js/bootstrap-datepicker.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/bootstrap-datepicker.kr.js"></script>
	
	<!-- Daum 우편번호 서비스 API -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	
	<!-- jqGrid JS -->
	<script src="${pageContext.request.contextPath }/assets/jqGrid/js/jquery.jqGrid.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/jqGrid/js/i18n/grid.locale-kr.js"></script>
	
</body>
<script type="text/javascript">
	
	$.jgrid.defaults.styleUI = 'Bootstrap';
	
	$(document).ready(function() {
		var loadType = "${loadType}";
		
		if("regist" == loadType){
			$("#input-form").attr("action", "${pageContext.request.contextPath }/input/regist");
		}
		if("modify" == loadType){
			$("#input-form").attr("action", "${pageContext.request.contextPath }/modify/insamodify");
		}
		
		/* 화면을 vo로 채워준다. */
		if("modify" == loadType){
			/* 넣으면 끝인 데이터 */
			$("#sabun").val("${insaVo.sabun}");
			var sabun = "${insaVo.sabun}";
			
			$("[name=join_day]").val("${insaVo.join_day}");
			$("[name=retire_day]").val("${insaVo.retire_day}");
			$("[name=name]").val("${insaVo.name}");
			$("[name=reg_no]").val("${insaVo.reg_no}");
			$("[name=eng_name]").val("${insaVo.eng_name}");
			$("[name=phone]").val("${insaVo.phone}");
			$("[name=hp]").val("${insaVo.hp}");
			$("[name=cmp_reg_no]").val("${insaVo.cmp_reg_no}");
			$("[name=addr1]").val("${insaVo.addr1}");
			$("[name=addr2]").val("${insaVo.addr2}");
			$("[name=id]").val("${insaVo.id}");
			$("[name=self_intro]").val("${insaVo.self_intro}");
			$("[name=crm_name]").val("${insaVo.crm_name}");
			$("[name=put_yn]").val("${insaVo.put_yn}");
			$("[name=kosa_reg_yn]").val("${insaVo.kosa_reg_yn}");
			$("[name=job_type]").val("${insaVo.job_type}");
			$("[name=sex]").val("${insaVo.sex}");
			$("[name=pos_gbn_code]").val("${insaVo.pos_gbn_code}");
			$("[name=dept_code]").val("${insaVo.dept_code}");
			$("[name=join_gbn_code]").val("${insaVo.join_gbn_code}");
			$("[name=gart_level]").val("${insaVo.gart_level}");
			$("[name=kosa_class_code]").val("${insaVo.kosa_class_code}");
			
			/* 처리가 필요한 데이터 */
			/* 숫자 처리 */
			if("${insaVo.salary}" == 0) {
				$("[name=salary]").val("");
			}else {
				$("[name=salary]").val("${insaVo.salary}");
			}
			
			if("${insaVo.years}" == 0) {
				$("[name=years]").val("");
			}else {
				$("[name=years]").val("${insaVo.years}");
			}
			
			if("${insaVo.zip}" == 0) {
				$("[name=zip]").val("");
			}
			else { 
				$("[name=zip]").val("${insaVo.zip}");
			}
			
			/* 이메일 처리 */
			$("[name=email]").val("${insaVo.email}");
			$("[name=email_sel]").val("${email_sel}");
			
			/* mil관련 처리 */
			$("[name=mil_yn]").val("${insaVo.mil_yn}");
			
			if("Y" == "${insaVo.mil_yn}"){
				$("#mtype-selector").removeAttr("disabled");
				$("#mlevel-selector").removeAttr("disabled");
				$("[name = mil_startdate]").removeAttr("readonly");
				$("[name = mil_enddate]").removeAttr("readonly");
			}
				
			$("[name=mil_type]").val("${insaVo.mil_type}");
			$("#mtype-selector").val("${insaVo.mil_type}");
			$("[name=mil_level]").val("${insaVo.mil_level}");
			$("#mlevel-selector").val("${insaVo.mil_level}");
			$("[name=mil_startdate]").val("${insaVo.mil_startdate}");
			$("[name=mil_enddate]").val("${insaVo.mil_enddate}");
			
			/* file 처리 */
			if("${insaVo.profile}" != "") {
				$("[name=profile]").val("${insaVo.profile}");
				$(".img-profile").attr("src", "${pageContext.request.contextPath }/upload/" + "${insaVo.profile}");
			}
			
			if("${insaVo.cmp_reg_image}" != "") {
				var saveName = "${insaVo.cmp_reg_image}";
				var link = "${pageContext.request.contextPath }/upload/";
				link += saveName;
				
				$.ajax({
					url : "${pageContext.request.contextPath }/modify/getfileorgname",		
					type : "post",
					data : {saveName : saveName},
					dataType : "json",
					success : function(orgName){
						$("[name=cmp_reg_image]").val("${insaVo.cmp_reg_image}");
						$("[name=cmp_org_name]").val(orgName);
						$("#cmpDown").attr({target: "_blank",
							href: link});
					},
					error : function(XHR, status, error) {
						console.error(status + " : " + error);
					}
				});
				
			}
			if("${insaVo.carrier}" != "") {
				var saveName = "${insaVo.carrier}";
				var link = "${pageContext.request.contextPath }/upload/";
				link += saveName;
				
				$.ajax({
					url : "${pageContext.request.contextPath }/modify/getfileorgname",		
					type : "post",
					data : {saveName : saveName},
					dataType : "json",
					success : function(orgName){
						$("[name=carrier]").val("${insaVo.carrier}");
						$("[name=carrier_org_name]").val(orgName);
						$("#carrierDown").attr({target: "_blank",
							href: link});
					},
					error : function(XHR, status, error) {
						console.error(status + " : " + error);
					}
				});
			}
			
			/* jqGrid */
			console.log(sabun);
			$("#jqGrid").jqGrid({
                url: "${pageContext.request.contextPath }/modify/getinputinfo?sabun=" + sabun,
                datatype: "json",
                colModel: [
                	{ lable: '사번', name: 'sabun', hidden:true , editable: true},
                    { label: 'No', name: 'seq', sorttype:'integer', editable: true },
                    { label: '근무가능일', name: 'wrk_posb_day', editable: true },
                    { label: '월 제시금액(단위:만원)', name: 'sugst_money', sorttype:'integer',editable: true },
                    { label: 'PJT형태구분코드', name: 'pjt_gbn_code',editable: true },
                    { label: '장비유무', name: 'eqm_yn',editable: true },
                    { label: '현재연봉(단위:만원)', name: 'current_salary', sorttype:'integer',editable: true },
                    { label: '근무지', name: 'work_area',editable: true }
                ],
                loadonce: true,
                multiselect: true,
                rowNum: 20,
				viewrecords: true,
                pager: "#jqGridPager"
            });
			
			$('#jqGrid').navGrid('#jqGridPager',
				{ edit: true, add: true, del: true, search: false, refresh: false, view: false, position: "left", cloneToTop: false },
				{
                    editCaption: "edit",
                    url: "${pageContext.request.contextPath }/modify/inputinfoedit",
                    errorTextFormat: function (data) {
                        return 'Error: ' + data.responseText
                    }
                },
            	// options for the Add Dialog
                {
                	url: "${pageContext.request.contextPath }/modify/inputinfoadd",
                    errorTextFormat: function (data) {
                        return 'Error: ' + data.responseText
                    }
                },
                // options for the Delete Dailog
                {
                	url: "${pageContext.request.contextPath }/modify/inputinfodel",
                    errorTextFormat: function (data) {
                        return 'Error: ' + data.responseText
                    }
                }
	        );
		}
	});
	
	$('.dateRangePicker').datepicker({
		format: "yyyy-mm-dd",
		language: "kr"
	});
	
	/* 프로필 사진 업로드하면 서버에 저장되고 savename를 저장한다. */
	$("#profile").change(function(){
		var formData = new FormData();
		formData.append("file", $("#profile")[0].files[0]);
		formData.append("type", "profile");
		
		$.ajax({
			url : "${pageContext.request.contextPath }/input/fileupload",		
			type : "post",
			data : formData,
			processData: false,
			contentType: false,
			
			success : function(fileVo){
				if (fileVo != null){
					$(".img-profile").attr("src", "${pageContext.request.contextPath }/upload/" + fileVo.saveName);
					$("[name=profile]").val(fileVo.saveName);
				}
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	});
	
	$("#cmp_reg_image").change(function(){
		var formData = new FormData();
		formData.append("file", $("#cmp_reg_image")[0].files[0]);
		formData.append("type", "cmp_reg_image");
		
		$.ajax({
			url : "${pageContext.request.contextPath }/input/fileupload",		
			type : "post",
			data : formData,
			processData: false,
			contentType: false,
			
			success : function(fileVo){
				if (fileVo != null){
					var link = "${pageContext.request.contextPath }/upload/";
					link += fileVo.saveName;
					
					$("[name=cmp_org_name]").val(fileVo.orgName);
					$("[name=cmp_reg_image]").val(fileVo.saveName);
					
					$("#cmpDown").attr({target: "_blank",
						href: link});
				}
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	});
	
	$("#carrier").change(function(){
		var formData = new FormData();
		formData.append("file", $("#carrier")[0].files[0]);
		formData.append("type", "carrier");
		
		$.ajax({
			url : "${pageContext.request.contextPath }/input/fileupload",		
			type : "post",
			data : formData,
			processData: false,
			contentType: false,
			
			success : function(fileVo){
				if (fileVo != null){
					var link = "${pageContext.request.contextPath }/upload/";
					link += fileVo.saveName;
					
					$("[name=carrier_org_name]").val(fileVo.orgName);
					$("[name=carrier]").val(fileVo.saveName);
					$("#carrierDown").attr({target: "_blank",
											href: link});
				}
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	});
	
	$("[name=mil_yn]").change(function(){
		var ynValue = $("[name=mil_yn]").val();
		
		if(ynValue == "Y"){
			$("#mtype-selector").removeAttr("disabled");
			$("#mlevel-selector").removeAttr("disabled");
			$("[name = mil_startdate]").removeAttr("readonly");
			$("[name = mil_enddate]").removeAttr("readonly");
		}
		else if(ynValue == "00" || ynValue == "N"){
			$("#mtype-selector").val("00").prop("selected", true);
			$("[name = mil_type]").val($("#mtype-selector").val());
			$("#mlevel-selector").val("00").prop("selected", true);
			$("[name = mil_level]").val($("#mlevel-selector").val());
			$("[name = mil_startdate]").val("");
			$("[name = mil_enddate]").val("");
			
			$("#mtype-selector").attr("disabled", "disabled");
			$("#mlevel-selector").attr("disabled", "disabled");
			$("[name = mil_startdate]").attr("readonly", "readonly");
			$("[name = mil_enddate]").attr("readonly", "readonly");
		}
	});
	
	$("#mtype-selector").change(function(){
		var mType = $("#mtype-selector").val();
		
		$("[name = mil_type]").val(mType);
	});
	
	$("#mlevel-selector").change(function(){
		var mLevel = $("#mlevel-selector").val();
		
		$("[name = mil_level]").val(mLevel);
	});
	
	function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
	
	function insertAndCheck() {
		var name = $("[name=name]").val();
		var id = $("[name=id]").val();
		var pwd = $("[name=pwd]").val();
		var hp = $("[name=hp]").val();
		var email = $("[name=email]").val();
		var join_day = $("[name=join_day]").val();
		var pwd_check = $("[name=pwd-check]").val();
		
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
		if(join_day == ''){
			window.alert("입사일을 선택해 주세요.");
			return false;
		}
		if(pwd != pwd_check){
			window.alert("비밀번호가 서로 다릅니다.");
			return false;
		}		
		
		if($("[name=years]").val() == "" ){
			$("[name=years]").val(0);
		}
		if($("[name=zip]").val() == "" ){
			$("[name=zip]").val(0);
		}
		if($("[name=salary]").val() == "" ){
			$("[name=salary]").val(0);
		}
		
	}

</script>
</html>
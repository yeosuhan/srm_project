<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%-- 작성자: 최은종 / 작성 날짜: 230218 --%>

<html>
<head>
<%@include file="/WEB-INF/views/fragments/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/css/deptlist.css">
	
<script>
/* 검색 필터링 */
function searchDept(){
	$("#deptFilter input").each((index,value)=>{
		if(!$(value).val()){
			$(value).prop("disabled",true);
		}
	});
	return true;
}

</script>	
<style>
#headerFirst {
	background: #4C1342;
}

.card .card-header {
	background: linear-gradient(135deg, #360940 10%, #782748 100%);
}

</style>	
</head>
<body>
	<%@include file="/WEB-INF/views/fragments/top.jsp"%>
	<%@include file="/WEB-INF/views/fragments/sidebar.jsp"%>
	<!-- Page-body start -->
	<div class="page-body">
		<!-- *********** -->
		<div class="card col-xs-12">
			<div class="card-header" id="headerFirst">
				<h5 style="font-weight: bold;">부서 관리</h5>
				</div>
				<div class="card-block"
						style="padding-top: 10px; padding-bottom: 10px;">
				<%--검색 --%>
				<div class="col-sm-12 mt-3 justify-content-between row">
					<div >
						<form id="deptFilter" action="${pageContext.request.contextPath}/admin/department/list" onSubmit="return searchDept()">
							<div class="form-group row">
								<label class="col-sm-2 col-form-label text-right">부서명</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" name="deptNm" value="${deptNm}">
								</div>
								<label class="col-sm-2 col-form-label text-right">부서
									담당자명</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" name="flnm" value="${flnm}">
								</div>
								<div class="col-sm-2 ">
									<button type="submit" class="btn btn-oti waves-effect waves-light">검색</button>
								</div>
							</div>
						</form>
						</div>
						<div>
							<div class="btn btn-oti waves-effect waves-light"
								onclick="show()" data-toggle="modal" data-target="ModalRegister">부서
								등록</div>
						</div>
				
				</div>
			</div>
		</div>
		<%-- Departments List --%>
		<section id="departments" class="pb-5">
			<div class="row">
				<%-- 부서 카드 --%>
				<c:forEach var="department" items="${departmentList}"
					varStatus="status">
					<div class="col-xs-12 col-sm-6 col-md-3">
						<div class="image-flip">
							<div class="mainflip flip-0">
								<div class="frontside">
									<div class="card">
										<div class="card-body text-center">
											<p>
												<img class=" img-fluid"
													src="${pageContext.request.contextPath}/member/img/${department.mngrId}"
													alt="card image">
											</p>
											<h4 class="card-title">${department.deptNm}</h4>
											<p class="card-text mt-2 mb-1">부서 담당자: ${department.flnm}</p>
											<p class="card-text">부서 인원: ${department.deptNope}명</p>
											<div class="btn btn-oti btn-sm">
												<i class="fa fa-search-plus"></i>
											</div>
										</div>
									</div>
								</div>
								<div class="backside" style="height: 312px">
									<div class="card mb-3">
										<div class="card-body">
											<div class="row">
												<div class="col-10">
													<h4 class="card-title text-start mb-4">${department.deptNm}</h4>
												</div>
												<div class="col-2">
													<form class="form-material" id="deleteInfo" method="get"
														action="<c:url value='/admin/department/delete'/>">
														<input type="hidden" name="deptCd"
															value="${department.deptCd}">
														<button type="submit" class="btn btn-sm btn-oti" style="padding-left:10px; padding-right:8px;">
															<i class="fa fa-trash" data-html="true"
																data-toggle="tooltip" data-placement="top" title=""
																data-original-title="부서정보가 삭제됩니다.<br/>정말 삭제하시겠습니까?"></i>
														</button>
													</form>
												</div>
											</div>
											<div>
												<form class="form-material" id="modifyInfo${status.count}"
													method="post"
													action="<c:url value='/admin/department/modify'/>">
													<input type="hidden" name="deptCd"
														value="${department.deptCd}">
													<div class="form-group row mb-0">
														<p class="col-sm-5 font-weight-bold mt-1">부서코드</p>
														<div class="col-sm-7" id="deptCd">${department.deptCd}</div>
													</div>
													<div class="form-group row">
														<p class="col-sm-5 font-weight-bold mt-2">부서 담당자</p>
														<div class="col-sm-7" id="MDepartmentManager">
															<input name="flnm" type="text" class="form-control"
																required style="width: 90%" value="${department.flnm}">
														</div>
													</div>
													<div class="form-group form-default row">
														<p class="col-sm-5 font-weight-bold mt-2">부서 전화번호</p>
														<div class="col-sm-7" id="MDepartmentTel">
															<input name="ofcTelno" type="text" class="form-control"
																required style="width: 90%"
																value="${department.ofcTelno}">
														</div>
													</div>
												</form>
											</div>
											<div align="center">
												<button type="submit" form="modifyInfo${status.count}"
													class="btn btn-oti btn-sm waves-effect waves-light mt-2">수정</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				<%-- /부서 카드 --%>
			</div>
		</section>
		<%-- /Departments List--%>
		<%-- *********** --%>
	</div>
	<%-- Page-body end --%>
	<%-- Modal 호출 & include --%>
	<%@include
		file="/WEB-INF/views/management/modalDeptManagementRegister.jsp"%>
	<%@include file="/WEB-INF/views/fragments/bottom.jsp"%>
</body>
</html>
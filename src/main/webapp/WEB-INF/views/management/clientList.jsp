<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- 작성자: 최은종 / 작성 날짜: 230217 --%>
<html>
<head>
<%@include file="/WEB-INF/views/fragments/header.jsp"%>
<script
	src="${pageContext.request.contextPath}/resources/js/clientList.js"></script>

<style>
table, th, td {
	text-align: center;
	line-height: normal;
}

#headerFirst {
	background: #4C1342;
}

.card .card-header {
	background: linear-gradient(135deg, #360940 10%, #782748 100%);
}
</style>
<script>
	function getClient(cid) {
		console.log("~~" + cid);

		$
				.ajax({
					url : '${pageContext.request.contextPath}/admin/client/'
							+ cid,
					type : 'GET',
					data : {
						clientId : cid
					},
					success : function(res) {
						$("#pimg")
								.html(
										'<img src="${pageContext.request.contextPath}/member/img/' + res.memberId +
							'"   style="height: 200px; width: 200px; align-content: center;">');
						$("#MClientId").text(res.memberId);
						$("#MClientName").text(res.flnm);
						$("#MClientTel").text(res.telNo);
						$("#MClientemail").text(res.eml);
						$("#MEmployeeAddr").text(res.addr);
						$("#MEmployeeTel").text(res.telNo);

						$("#MEmployeeTel").text(res.telNo);
						$("#MClientIns").text(res.institution.instNm);
						$("#MClientInsTel").text(res.institution.instTelno);
						$("#MClientInsAddr").text(res.institution.instAddr);
						$("#MClientInsAddrDetail").text(
								res.institution.instDetailAddr);

					}
				});
	}
</script>
</head>
<body>
	<%@include file="/WEB-INF/views/fragments/top.jsp"%>
	<%@include file="/WEB-INF/views/fragments/sidebar.jsp"%>
	<!-- Page-body start -->
	<div class="page-body">
		<div class="row">
			<!-- *********** -->
			<%-- 고객 목록  --%>
			<div class="col-xl-8 col-md-12">
				<div class="card" style="height: 700px;">
					<div class="card-header" id="headerFirst">
						<h5 style="font-weight: bold;">고객 관리</h5>
						<div class="card-header-right">
							<ul class="list-unstyled card-option" align="right">
								<li><i class="fa fa fa-wrench open-card-option"></i></li>
								<li><i class="fa fa-window-maximize full-card"></i></li>
								<li><i class="fa fa-refresh reload-card"></i></li>
							</ul>
						</div>
					</div>
					<div class="card-block"
						style="padding-top: 20px; padding-bottom: 10px;">
						<%-- 검색 기능 --%>
						<div class="mr-5">
							<form id="clientFilterForm" onsubmit="return searchClient()">
								<div class="form-group row">
									<label class="col-sm-1 col-form-label text-right"
										style="font-size: 14; font-weight: bold">이름</label>
									<div class="col-sm-2">
										<input type="text" class="form-control" name="flnm"
											id="flnmFilter" value="${flnm}">
									</div>
									<label class="col-sm-2 col-form-label text-right"
										style="font-size: 14; font-weight: bold">소속기관</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" name="instNm"
											id="instNmFilter" value="${instNm}">
									</div>
									<div class="col-sm-4 d-flex justify-content-end">
										<button class="btn btn-oti waves-effect waves-light ">검색</button>
									</div>
								</div>
							</form>
						</div>
					</div>
					<div class="card-block table-border-style p-0">
						<div class="table-responsive">
							<table class="table table-hover">
								<thead style="font-size: 15px;">
									<tr style="font-size: 15px;">
										<th style="font-size: 15px;">번호</th>
										<th style="font-size: 15px;">아이디</th>
										<th style="font-size: 15px;">이름</th>
										<th style="font-size: 15px;">전화번호</th>
										<th style="font-size: 15px;">소속기관</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${fn:length(clientList) gt 0}">
										<c:forEach var="client" items="${clientList}"
											varStatus="status">
											<tr onclick="getClient('${client.memberId}')"
												style="font-size: 15px;">
												<th style="font-size: 15px;">${status.count}</th>
												<td style="font-size: 15px; text-align: left;">${client.memberId}</td>
												<td style="font-size: 15px;">${client.flnm}</td>
												<td style="font-size: 15px;">${client.telNo}</td>
												<td style="font-size: 15px;">${client.institution.instNm}</td>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
							<c:if test="${fn:length(clientList) eq 0}">
								<div style="text-align: center; margin-top:10px;"><span>검색 결과가 없습니다.</span></div>
	
							</c:if>
							<!-- 페이징 처리 -->
							<%@ include file="/WEB-INF/views/fragments/pagination.jsp"%>
						</div>
					</div>
				</div>
			</div>
			<%-- 고객 목록 끝 --%>
			<%-- 고객 상세조회 카드--%>
			<div class="col-xl-4 col-md-12" style="font-size: 15px;">
				<div class="card">
					<div class="card-header">
						<h5 style="font-weight: bold;">고객 상세</h5>
					</div>
					<div class="card-block"
						style="justify-content: center; text-align: center;">
						<div class="my-2" id="pimg">
							<img
								src="${pageContext.request.contextPath}/member/img/${client.memberId}"
								style="height: 200px; width: 200px; align-content: center;">
						</div>
					</div>
					<div class="card-block" style="font-size: 15px;">
						<div class="row" style="font-size: 15px;">
							<p class="col-sm-5 font-weight-bold" style="font-size: 15px;">아이디</p>
							<div class="col-sm-7" id="MClientId" style="font-size: 15px;">${client.memberId}</div>
						</div>
						<div class="row">
							<p class="col-sm-5 font-weight-bold" style="font-size: 15px;">이름</p>
							<div class="col-sm-7" id="MClientName" style="font-size: 15px;">${client.flnm}</div>
						</div>
						<div class="row">
							<p class="col-sm-5 font-weight-bold" style="font-size: 15px;">전화번호</p>
							<div class="col-sm-7" id="MClientTel" style="font-size: 15px;">${client.telNo}</div>
						</div>
						<div class="row">
							<p class="col-sm-5 font-weight-bold" style="font-size: 15px;">이메일</p>
							<div class="col-sm-7" id="MClientemail" style="font-size: 15px;">${client.eml}</div>
						</div>
						<div class="row">
							<p class="col-sm-5 font-weight-bold" style="font-size: 15px;">주소</p>
							<div class="col-sm-7" id="MClientAddr" style="font-size: 15px;">${client.addr}</div>
						</div>
						<div class="row">
							<p class="col-sm-5 font-weight-bold" style="font-size: 15px;">소속기관</p>
							<div class="col-sm-7" id="MClientIns" style="font-size: 15px;">${client.institution.instNm}</div>
						</div>
						<div class="row">
							<p class="col-sm-5 font-weight-bold" style="font-size: 15px;">기관
								전화번호</p>
							<div class="col-sm-7" id="MClientInsTel" style="font-size: 15px;">${client.institution.instTelno}</div>
						</div>
						<div class="row" style="height: 50px;">
							<p class="col-sm-5 font-weight-bold" style="font-size: 15px;">기관
								주소</p>
							<div class="col-sm-7" id="MClientInsAddr"
								style="font-size: 15px;">${client.institution.instAddr}</div>
						</div>

						<div class="row">
							<p class="col-sm-5 font-weight-bold" style="font-size: 15px;">상세
								주소</p>
							<div class="col-sm-7" id="MClientInsAddrDetail"
								style="font-size: 15px;">${client.institution.instDetailAddr}</div>
						</div>
					</div>
				</div>
			</div>
			<%--고객 상세조회 카드 끝--%>
		</div>
		<%-- *********** --%>
	</div>
	<%-- Page-body end --%>
	<%@include file="/WEB-INF/views/fragments/bottom.jsp"%>
</body>
</html>
<%-- 작성자 : 신정은
	작성날짜 : 2023-02-20 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
	<%@include file="/WEB-INF/views/fragments/header.jsp"%>
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/srButton.css">
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/pagination.css">
	<script src="${pageContext.request.contextPath}/resources/js/mytodo.js"></script>
	<!-- 모달 -->
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/srModal.css">
</head>
<body>
	<div id="pcoded" class="pcoded">
		<div class="pcoded-overlay-box"></div>
		<div class="pcoded-container navbar-wrapper">
			<%@include file="/WEB-INF/views/fragments/top.jsp"%>
			<div class="pcoded-main-container">
				<div class="pcoded-wrapper">
					<%@include file="/WEB-INF/views/fragments/sidebar.jsp"%>
					<div class="pcoded-content">
						<%@include file="/WEB-INF/views/fragments/pageHeader.jsp"%>
						<div class="pcoded-inner-content pt-4">
							<div class="main-body">
								<div id="pageWrapper" class="page-wrapper">
									<!-- Page-body start -->
									<div class="page-body">
										<!-- Row start -->
										<div class="row">
											<!-- Color Open Accordion start -->
											<div class="col-lg-12">
												<div class="card">
													<div class="card-header">
														<h5 class="card-header-text">나의 할일</h5>
													</div>
													<div class="col-12 ">
														<!-- Nav tabs -->
														<ul class="nav nav-tabs md-tabs" role="tablist">
															<sec:authorize access="hasAnyRole('ROLE_CLIENT', 'ROLE_ADMIN')">
																<li class="nav-item"><div class="nav-link sttsCd0 active" 
																	onclick="moveTab(0)">요청</div>
																	<div class="slide"></div></li>
																<li class="nav-item"><div class="nav-link sttsCd1"
																	onclick="moveTab(1)">반려</div>
																	<div class="slide"></div></li>
																<li class="nav-item"><div class="nav-link sttsCd2" 
																	onclick="moveTab(2)">접수</div>
																	<div class="slide"></div></li>
															</sec:authorize>
															<sec:authorize access="hasRole('ROLE_DEVELOPER')">
																<li class="nav-item"><div class="nav-link sttsCd3 active" 
																	onclick="moveTab(3)">개발중</div>
																	<div class="slide"></div></li>
															</sec:authorize>
															<sec:authorize access="hasAnyRole('ROLE_CLIENT', 'ROLE_ADMIN')">
																<li class="nav-item"><div class="nav-link sttsCd3" 
																	onclick="moveTab(3)">개발중</div>
																	<div class="slide"></div></li>
															</sec:authorize>
															<li class="nav-item"><div class="nav-link sttsCd4" 
																onclick="moveTab(4)">테스트</div>
																<div class="slide"></div></li>
															<li class="nav-item"><div class="nav-link sttsCd5" 
																onclick="moveTab(5)">개발완료</div>
																<div class="slide"></div></li>
															<li class="nav-item"><div class="nav-link sttsCd6" 
																onclick="moveTab(6)">개발 취소</div>
																<div class="slide"></div></li>
														</ul>
														<!-- Tab panes -->
														<div class="tab-content card-block">
															<div class="tab-pane active" id="request" role="tabpanel">
																<table class="table table-hover">
																	<thead>
																		<tr class="row">
																			<th class="col">SR번호</th>
																			<th class="col">시스템구분</th>
																			<th class="col">업무구분</th>
																			<th class="col">SR제목</th>
																			<th class="col">담당자</th>
																			<th class="col">완료요청일</th>
																			<th class="col">진행상태</th>
																			<c:if test="${sr.sttsCd} > 1">
																				<sec:authorize access="hasAnyRole('ROLE_DEVELOPER', 'ROLE_ADMIN')">
																					<th class="col">우선순위</th>
																				</sec:authorize>
																			</c:if>
																		</tr>
																	</thead>
																	<tbody>
																		<c:forEach var="sr" items="${srList}">
																			<tr>
																				<td id="dmndNo">${sr.dmndNo}</td>
																				<td id="sysNm">${sr.sysNm}</td>
																				<td id="taskNm">${sr.taskNm}</td>
																				<td id="ttl">${sr.ttl}</td>
																				<td id="picNm">${sr.picNm}</td>
																				<td id="cmptnDmndYmd">${sr.cmptnDmndYmd}</td>
																				<td id="sttsNm">${sr.sttsNm}</td>
																				<c:if test="${sr.sttsCd} > 1">
																					<sec:authorize access="hasAnyRole('ROLE_DEVELOPER', 'ROLE_ADMIN')">
																						<td id="rnk">${sr.rnk}</td>
																					</sec:authorize>
																				</c:if>
																			</tr>
																		</c:forEach>
																	</tbody>
																</table>
															</div>
														</div>
													</div>
													<!-- 페이징 처리 -->
													<%@ include file="/WEB-INF/views/fragments/pagination.jsp"%>
												</div>
											</div>
											<!-- Color Open Accordion ends -->
										</div>
										<!-- Row end -->
										<!-- Row start -->
										<div class="row">
											<!-- Multiple Open Accordion start -->
											<div class="col-lg-6">
												<div class="card">
													<div class="card-header">
														<h5 class="card-header-text">공지사항</h5>
													</div>
													<table class="table table-hover">
														<thead>
															<tr>
																<th scope="col">글 번호</th>
																<th scope="col">제목</th>
																<th scope="col">파일첨부</th>
																<th scope="col">작성자</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<th scope="row">3</th>
																<td>오티아이 휴가 사용 공지</td>
																<td>-</td>
																<td>최은종(관리자)</td>
															</tr>
															<tr>
																<th scope="row">2</th>
																<td>오티아이 워크샵 공지</td>
																<td><img src="/resources/oti_images/attachFile.png"
																	style="width: 20px;"></td>
																<td>신정은(관리자)</td>
															</tr>
															<tr>
																<th scope="row">1</th>
																<td>오티아이 회식 공지</td>
																<td>-</td>
																<td>한송민(관리자)</td>
															</tr>
														</tbody>
													</table>
													<!-- 페이징 처리 -->
													<%@ include file="/WEB-INF/views/fragments/pagination.jsp"%>
												</div>
											</div>
											<!-- Multiple Open Accordion ends -->
											<!-- Single Open Accordion start -->
											<div class="col-lg-6">
												<div class="card">
													<div class="card-header">
														<h5 class="card-header-text">문의사항</h5>
													</div>
													<table class="table table-hover">
														<thead>
															<tr>
																<th scope="col">글 번호</th>
																<th scope="col">제목</th>
																<th scope="col">작성자</th>
																<th scope="col">답변상태</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<th scope="row">1</th>
																<td>사이드바 색상 문의드립니다.</td>
																<td>홍길동</td>
																<td>미답변</td>
															</tr>
															<tr>
																<th scope="row">2</th>
																<td>오티아이 워크샵 공지</td>
																<td>이순신</td>
																<td>답변완료</td>
															</tr>
															<tr>
																<th scope="row">1</th>
																<td>오티아이 회식 공지</td>
																<td>강감찬</td>
																<td>미답변</td>
															</tr>
														</tbody>
													</table>
													<!-- 페이징 처리 -->
													<%@ include file="/WEB-INF/views/fragments/pagination.jsp"%>
												</div>
											</div>
											<!-- Single Open Accordion ends -->
										</div>
										<!-- Row end -->

									</div>
									<!-- Page-body end -->
									<div id="styleSelector"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/fragments/bottom.jsp"%>
	<!-- 모달 -->

	<jsp:include page="/WEB-INF/views/srDemand/srDemandDetail.jsp" />
	<jsp:include page="/WEB-INF/views/srDemand/modal.jsp" />

</body>
</html>
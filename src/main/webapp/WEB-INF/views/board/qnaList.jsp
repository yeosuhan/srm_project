<%-- 작성자 : 신정은
	작성날짜 : 2023-02-20 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>
<%@include file="/WEB-INF/views/fragments/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="/resources/css/pagination.css">
<link rel="stylesheet" type="text/css"
	href="/resources/js/pagination.js">
<link rel="stylesheet" type="text/css"
	href="/resources/css/srButton.css">
<script src="/resources/js/board.js"></script>
<script type="text/javascript">
	function toUpdate() {
		console.log("눌림 ~~");
		$("#update").css("display", "block");
		$("#postDetail").css("display", "none");
	}
</script>
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
						<div class="pcoded-inner-content">
							<div class="main-body">
								<div id="pageWrapper" class="page-wrapper">
									<!-- Page-body start -->
									<div class="page-body button-page">
										<div class="row">
											<!-- bootstrap modal start -->
											<div class="col-sm-5">
												<!-- Notification card start -->
												<div class="card">
													<div class="card-header">
														<h5 class="card-header-text">문의사항</h5>
													</div>
													<table class="table table-hover">
														<thead>
															<tr>
																<th class="col-1" style="text-align: center;"></th>
																<th class="col-7 text-center">제목</th>
																<th class="col-1">작성자</th>
																<th class="col-3">작성날짜</th>
																<th class="col-3">답변상태</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${list}" var="board" varStatus="status">
																<tr onclick="qnaDetail(${board.bbsNo})">
																	<th style="text-align: center;">${status.count}</th>
																	<c:choose>
																		<c:when test="${fn:length(board.bbsTtl) > 20}">
																			<td id="ttl" class="text-center"><c:out
																					value="${fn:substring(board.bbsTtl,0,19)}" />...</td>
																		</c:when>
																		<c:otherwise>
																			<td id="ttl" class="text-center"><c:out
																					value="${board.bbsTtl}" /></td>
																		</c:otherwise>
																	</c:choose>
																	<td>${board.wrtNm}</td>
																	<td>${board.wrtYmd}</td>
																	<c:if test="${board.ansYn == false}">
																		<td>미답변</td>
																	</c:if>
																	<c:if test="${board.ansYn == true}">
																		<td>답변완료</td>
																	</c:if>
																</tr>
															</c:forEach>
														</tbody>
													</table>
													<!-- 페이징 처리 -->
													<%@ include file="/WEB-INF/views/fragments/pagination.jsp"%>
												</div>
												<!-- Notification card end -->
											</div>
											<div class="col-sm-7" id="qnaDetail">
												<!-- 상세 보기 ------------------------------------------------------ -->
												<div class="card">
													<div class="card-header">
														<h5>문의사항</h5>
													</div>
													<div class="card-block">
														<form enctype="multipart/form-data">
															<input type="hidden" value="${board.bbsNo}">
															<div class="form-group row">
																<div class="col-sm-2 font-weight-bold">작성일자</div>
																<div class="col-sm-6">${board.wrtYmd}</div>
																<div class="col-sm-2 font-weight-bold text-right">답변상태</div>
																<div class="col-sm-2">${board.wrtYmd}</div>
															</div>
															<div class="form-group row">
																<div class="col-sm-2 font-weight-bold">제목</div>
																<div class="col-sm-6">${board.bbsTtl}</div>
																<div class="col-sm-2 font-weight-bold text-right">작성자</div>
																<div class="col-sm-2">${board.wrtrNm}</div>
															</div>
															<div class="form-group row">
																<div class="col-sm-2 font-weight-bold">SR번호</div>
																<div class="col-sm-6">${board.srNo}</div>
															</div>
															<div class="form-group row">
																<p class="col-sm-2 font-weight-bold">내용</p>
																<div class="col-sm-10">
																	<input class="form-control"
																		style="border: none; background-color: #DFDEDE"
																		readonly value="${board.bbsCn}"></input>
																</div>
															</div>
															<div class="form-group row">
																<p class="col-sm-2 font-weight-bold">첨부파일</p>
																<div class="col-sm-5">
																	<c:forEach var="f" items="${board.srcList}">
																		<div>
																			<a
																				href="<c:url value='/file/download/${f.fileSn}' />">
																				<span class="glyphicon glyphicon-save"
																				aria-hidden="true"></span> <span>
																					${f.orgnlFileNm} </span>
																			</a> <span> Size : ${f.fileSz} Bytes</span>
																		</div>
																	</c:forEach>
																</div>
															</div>
														</form>
														<c:if test="${board.wrtrId eq memberId}">
															<div class="d-flex justify-content-center">
																<button onclick="updateQna(${board.bbsNo})"
																	class="btn btn-inverse btn-round waves-effect waves-light mr-4">수정</button>
																<form action="#">
																	<button
																		class="btn btn-inverse btn-round waves-effect waves-light">삭제</button>
																</form>
															</div>
														</c:if>
													</div>
												</div>
												<!-- Input Alignment card end -->
											</div>
											<!-- Bootstrap modal end -->
										</div>
										<sec:authorize access="hasRole('ROLE_CLIENT')">
											<div class="d-flex justify-content-end" onclick="writeQna()">
												<img class="rounded newPost"
													src="/resources/oti_images/newPost.png">
											</div>
										</sec:authorize>
										<div class="modal" tabindex="-1" id="writeQna"></div>
									</div>
									<!-- Page body end -->
								</div>
								<div id="styleSelector"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/fragments/bottom.jsp"%>
</body>
</html>
<%-- 작성자 : 신정은
	작성날짜 : 2023-02-20 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>
<%@include file="/WEB-INF/views/fragments/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/pagination.css">
<link rel="stylesheet" type="text/css"
	href="/${pageContext.request.contextPath}resources/js/pagination.js">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/srButton.css">
<script src="${pageContext.request.contextPath}/resources/js/board.js"></script>

</head>
<body>
	<%@include file="/WEB-INF/views/fragments/top.jsp"%>
	<%@include file="/WEB-INF/views/fragments/sidebar.jsp"%>
	<!-- Page-body start -->
	<div class="page-body button-page">
		<div class="row">
			<!-- bootstrap modal start -->
			<div class="col-sm-5" id="qnaList">
				<!--목록-->
				<div class="card">
					<div class="card-header">
						<h5 class="card-header-text">문의사항</h5>
					</div>
							<c:if test="${fn:length(qnaList) == 0 }">
								<div class="text-center d-flex justify-content-center"
									style="height: 100px;">
									<div style="margin: auto;">문의 내역이 없습니다.</div>
								</div>
							</c:if>
							<c:if test="${fn:length(qnaList) gt 0}">
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
								<c:forEach items="${qnaList}" var="board" varStatus="status">
									<tr onclick="qnaDetail(${board.bbsNo})">
										<th style="text-align: center;">${qPager.startRowNo + status.index}</th>
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
					</c:if>
					<!-- 페이징 처리 -->
					<%@ include file="/WEB-INF/views/board/qnaPager.jsp"%>
				</div>
			</div>
			<div class="col-sm-7" id="qnaDetail">
				<!-- 상세 보기 ------------------------------------------------------ -->
				<jsp:include page="/WEB-INF/views/board/qna-detail.jsp" />
				<!-- Input Alignment card end -->
			</div>
			<!-- Bootstrap modal end -->
		</div>
		<sec:authorize access="hasRole('ROLE_CLIENT')">
			<div class="d-flex justify-content-end" onclick="writeQna()">
				<img class="rounded newPost" src="/resources/oti_images/newPost.png">
			</div>
		</sec:authorize>
		<div class="modal" tabindex="-1" id="writeQna"></div>
	</div>
	<!-- Page body end -->
	<%@include file="/WEB-INF/views/fragments/bottom.jsp"%>
</body>
</html>
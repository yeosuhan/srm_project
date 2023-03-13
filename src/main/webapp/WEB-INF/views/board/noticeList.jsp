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
</script>
</head>
<body>
	<%@include file="/WEB-INF/views/fragments/top.jsp"%>
	<%@include file="/WEB-INF/views/fragments/sidebar.jsp"%>
	<div class="page-body button-page">
		<div class="row">
			<div class="col-sm-5" id="noticeList">
				<!-- 공지사항 목록 -->
				<div class="card">
					<div class="card-header">
						<h5 class="card-header-text">공지사항</h5>
					</div>
					<table class="table table-hover">
						<thead>
							<tr>
								<th class="col-1" style="text-align: center;"></th>
								<th class="col-7 text-center">제목</th>
								<th class="col-1">작성자</th>
								<th class="col-3">작성날짜</th>
								<th class="col-3">조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${noticeList}" var="board" varStatus="status">
								<tr onclick="noticeDetail(${board.bbsNo})">
									<th style="text-align: center;">${nPager.startRowNo + status.index}</th>
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
									<td>${board.inqCnt}</td>

								</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- 페이징 처리 -->
					<%@ include file="/WEB-INF/views/board/noticePager.jsp"%>
				</div>
			</div>
			<!-- 공지사항 상세 ----->
			<div class="col-sm-7" id="noticeDetail">
				<jsp:include page="/WEB-INF/views/board/notice-detail.jsp" />
			</div>
		</div>
	</div>
	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<div class="d-flex justify-content-end" onclick="writeNotice()">
			<img class="rounded newPost" src="/resources/oti_images/newPost.png">
		</div>
	</sec:authorize>
	<div class="modal" tabindex="-1" id="writeNotice"></div>
	<%@include file="/WEB-INF/views/fragments/bottom.jsp"%>
</body>
</html>

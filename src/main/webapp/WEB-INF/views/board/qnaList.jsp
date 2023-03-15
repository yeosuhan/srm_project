<%-- 작성자 : 신정은
	작성날짜 : 2023-02-20 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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
		<!--------------- 필터링 ------------------------->
		<div class="row">
			<div class="col-xl-12">
				<div class="card">
					<div class="card-header">
						<div class="row">
							<div class="col-10">
								<h5>문의사항</h5>
							</div>
						</div>
						<hr />
						<form id="boardSearchForm"
							action="${pageContext.request.contextPath}/board/list?type=qna&"
							onsubmit="return boardSearch()">
							<div class="row" style="height:30px;">
								<input type="hidden" name="type" id="type" value="qna">
								<div class="col col-3 pr-0">
									<label for="dmndYmdStart" style="margin-right: 10px;">조회
										기간</label> <input type="date" name="dmndYmdStart" id="dmndYmdStart">
									~ <input type="date" name="dmndYmdEnd" id="dmndYmdEnd">
								</div>
								<div class="col col-2 pr-0">
									<label for="ansYn" style="margin-right: 10px;">답변 상태</label> <select
										id="ansYn" name="ansYn">
										<option value="">전체</option>
										<option value="1">답변완료</option>
										<option value="0">미답변</option>
									</select>
								</div>								
								<div class="col col-3 px-0">
									<label for="wrtrNm" style="margin-right: 10px;">작성자</label> <input
										type="text" name="wrtrNm" id="wrtrNm">
								</div>
								<div class="col col-2 px-0">
									<label for="keyWord" style="margin-right: 10px;">키워드</label> <input
										type="text" name="keyWord" id="keyWord">
								</div>
									<button type="submit" class="btn btn-sm btn-oti"
										style="margin-right: 10px; height: 30px;">
										<i class="ti-search"></i>
									</button>

							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
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
						<table class="table table-hover" style="text-align:center;">
							<thead>
								<tr>
									<th class="col-1" style="text-align: center;">순번</th>
									<th class="col-6 text-center">제목</th>
									<th class="col-1">작성자</th>
									<th class="col-3" style="text-align:center;">작성날짜</th>
									<th class="col-3">답변상태</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${qnaList}" var="board" varStatus="status">
									<tr onclick="qnaDetail(${board.bbsNo})">
										<th style="text-align: center;">${qPager.startRowNo + status.index}</th>
										<c:choose>
											<c:when test="${fn:length(board.bbsTtl) > 20}">
												<td id="ttl" class="text-left"><c:out
														value="${fn:substring(board.bbsTtl,0,19)}" />...</td>
											</c:when>
											<c:otherwise>
												<td id="ttl" class="text-left"><c:out
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
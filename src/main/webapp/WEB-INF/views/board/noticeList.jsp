<%-- 작성자 : 신정은
	작성날짜 : 2023-02-20 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<%@include file="/WEB-INF/views/fragments/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/pagination.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/srButton.css">
<script
	src="${pageContext.request.contextPath}/resources/js/pagination.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/board.js"></script>

<style>
#headerFirst {
	background: #4C1342;
}

.card .card-header {
	background: linear-gradient(135deg, #360940 10%, #782748 100%);
}

#noticeList{
font-size: 15px !important;
	}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/fragments/top.jsp"%>
	<%@include file="/WEB-INF/views/fragments/sidebar.jsp"%>
	<div class="page-body button-page">
		<div class="row">
			<div class="col-xl-12">
				<div class="card">
					<div class="card-header" id="headerFirst">
						<div class="row">
							<div class="col-10">
								<h5 style="font-weight: bold;">공지사항</h5>
							</div>
						</div>
					</div>
					<div class="card-body">
						<form id="nboardSearch"
							action="${pageContext.request.contextPath}/board/list?type=notice"
							onsubmit="return nboardSearch()"> 
							<input type="hidden" name="btype" value="notice">
							<input type="hidden" name="type" value="notice">
							<div class="row" style="height: 30px;">
								<div class="col col-3 pr-0">
									<label for="dmndYmdStart" style="margin-right: 10px;">조회
										기간</label> <input type="date" name="dmndYmdStart" id="dmndYmdStart"
										value="${boardFilterDto.dmndYmdStart}"> ~ <input
										type="date" name="dmndYmdEnd" id="dmndYmdEnd"
										value="${boardFilterDto.dmndYmdEnd }">
								</div>
								<div class="col col-3 px-0">
									<label for="wrtrNm" style="margin-right: 10px;">작성자</label> <input
										type="text" name="wrtrNm" id="keyWord"
										value="${boardFilterDto.wrtrNm}">
								</div>

								<div class="col col-2 px-0">
									<label for="keyWord" style="margin-right: 10px;">키워드</label> <input
										type="text" name="keyWord" id="keyWord"
										value="${boardFilterDto.keyWord}">
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
			<div class="col-sm-7" id="noticeList">
				<!-- 공지사항 목록 -->
				<div class="card" style="height: 650px;">
					<div class="card-header" style="height: 50px;">
						<h5>전체 목록</h5>
					</div>
					<table class="table table-hover" style="text-align: center;">
						<thead>
							<tr>
								<th class="col-1" style="text-align: center;">순번</th>
								<th class="col-7 text-left">제목</th>
								<th class="col-1">작성자</th>
								<th class="col-3" style="text-align: center;">작성날짜</th>
								<th class="col-3">조회수</th>
							</tr>
						</thead>
						<tbody style="font-size: 15px !important;">
							<c:forEach items="${noticeList}" var="board" varStatus="status">
								<tr onclick="noticeDetail(${board.bbsNo})">
									<th style="text-align: center;">${nPager.startRowNo + status.index}</th>
									<%-- <c:choose>
										<c:when test="${fn:length(board.bbsTtl) > 30}">
											<td id="ttl" class="text-left"><c:out
													value="${fn:substring(board.bbsTtl,0,29)}" />...</td>
										</c:when>
										<c:otherwise>
											<td id="ttl" class="text-left"><c:out
													value="${board.bbsTtl}" /></td>
										</c:otherwise>
									</c:choose> --%>
									<td id="ttl" class="text-left" style="font-size: 15px;">${board.bbsTtl}</td>
									<td style="font-size: 15px;">${board.wrtNm}</td>
									<td style="font-size: 15px;">${board.wrtYmd}</td>
									<td style="font-size: 15px;">${board.inqCnt}</td>

								</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- 페이징 처리 -->
					<%@ include file="/WEB-INF/views/board/noticePager.jsp"%>
				</div>
			</div>
			<!-- 공지사항 상세 ----->
			<div class="col-sm-5" id="noticeDetail">
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

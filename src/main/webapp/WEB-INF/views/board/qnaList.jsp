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
			<div class="col-sm-5">
				<!-- Notification card start -->
				 <jsp:include page="/WEB-INF/views/mytodo/qna.jsp" />
				<!-- Notification card end -->
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
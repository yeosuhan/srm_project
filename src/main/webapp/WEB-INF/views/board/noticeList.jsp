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
	<!-- Page-body start -->
	<div class="page-body button-page">
		<div class="row">
			<!-- bootstrap modal start -->
			<div class="col-sm-5">
				<!-- Notification card start -->
				<jsp:include page="/WEB-INF/views/mytodo/notice.jsp" />
				<!-- Notification card end -->
			</div>
			<!-- 상세 보기 ------------------------------------------------------ -->
			<div class="col-sm-7" id="noticeDetail">
				<jsp:include page="/WEB-INF/views/board/notice-detail.jsp" />
			</div>

			<!-- Input Alignment card end -->
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

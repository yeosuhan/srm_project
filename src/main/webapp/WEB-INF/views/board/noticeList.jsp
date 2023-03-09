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
		$("#postDetail").css("display","none");
	}
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
							<c:forEach items="${list}" var="board" varStatus="status">
								<tr onclick="noticeDetail(${board.bbsNo})">
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
									<td>미답변</td>

								</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- 페이징 처리 -->
					<%@ include file="/WEB-INF/views/fragments/pagination.jsp"%>
				</div>
				<!-- Notification card end -->
			</div>
			<!-- 상세 보기 ------------------------------------------------------ -->
			<div class="col-sm-7" id="noticeDetail">
				<div class="card">
					<div class="card-header">
						<h5>공지사항</h5>
					</div>
					<div class="card-block">
						<form enctype="multipart/form-data">
							<input type="hidden" value="${board.bbsNo}">
							<div class="form-group row">
								<div class="col-sm-2 font-weight-bold">작성일자</div>
								<div class="col-sm-6">${board.wrtYmd}</div>
								<div class="col-sm-2 font-weight-bold text-right">조회수</div>
								<div class="col-sm-2">${board.inqCnt}</div>
							</div>
							<div class="form-group row">
								<div class="col-sm-2 font-weight-bold">제목</div>
								<div class="col-sm-6">${board.bbsTtl}</div>
								<div class="col-sm-2 font-weight-bold text-right">작성자</div>
								<div class="col-sm-2">${board.wrtrNm}</div>
							</div>
							<div class="form-group row">
								<p class="col-sm-2 font-weight-bold">내용</p>
								<div class="col-sm-10">
									<input class="form-control" value="${board.bbsCn}"
										style="border: none; opacity: 0.5;" readonly></input>
								</div>
							</div>
							<div class="form-group row">
								<p class="col-sm-2 font-weight-bold">첨부파일</p>
								<div class="col-sm-5">
									<c:forEach var="f" items="${board.srcList}">
										<div>
											<a href="<c:url value='/file/download/${f.fileSn}' />"> <span
												class="glyphicon glyphicon-save" aria-hidden="true"></span>
												<span> ${f.orgnlFileNm} </span>
											</a> <span> Size : ${f.fileSz} Bytes</span>
										</div>
									</c:forEach>
								</div>
							</div>
						</form>
						<div class="d-flex justify-content-center">
							<button class="btn btn-oti waves-effect waves-light mr-4"
								onclick="toUpdate()">수정</button>
							<form action="#">
								<button class="btn btn-oti waves-effect waves-light">삭제</button>
							</form>
						</div>
					</div>
				</div>
				<!-- Input Alignment card end -->
			</div>
			<!------------------- 수정 누르면 바뀌는 화면 -------------------->
			<div class="col-sm-7" id="update" style="display: none;">
				<div class="card">
					<div class="card-header">
						<h5>공지사항</h5>
					</div>
					<div class="card-block">
						<form enctype="multipart/form-data">
							<div class="form-group row">
								<div class="col-sm-2 font-weight-bold">글번호</div>
								<div class="col-sm-1">37</div>
								<div class="col-sm-2 font-weight-bold text-right">작성자</div>
								<div class="col-sm-3">신정은(관리자)</div>
								<div class="col-sm-2 font-weight-bold text-right">조회수</div>
								<div class="col-sm-2">128</div>
							</div>
							<div class="form-group row">
								<div class="col-sm-2 font-weight-bold">제목</div>
								<div class="col-sm-6">
									<input type="text" class="form-control"
										value="수정 누르면 보이는 공지사항 수정 화면">
								</div>
								<div class="col-sm-2 font-weight-bold text-right">작성일자</div>
								<div class="col-sm-2">2023-02-14</div>
							</div>
							<div class="form-group row">
								<p class="col-sm-2 font-weight-bold">내용</p>
								<div class="col-sm-10">
									<textarea rows="20" cols="5" class="form-control"
										style="border: none; background-color: #e9ecef"></textarea>
								</div>
							</div>
							<div class="form-group row">
								<p class="col-sm-2 font-weight-bold">첨부파일</p>
								<div class="col-sm-5">
									<img class="mr-2" src="/resources/oti_images/user.png"
										style="height: 100px; align-content: center;"> <img
										class="mr-2" src="/resources/oti_images/user.png"
										style="height: 100px; align-content: center;"> <img
										class="mr-2" src="/resources/oti_images/user.png"
										style="height: 100px; align-content: center;"> <img
										class="mr-2" src="/resources/oti_images/user.png"
										style="height: 100px; align-content: center;"> <img
										class="mr-2" src="/resources/oti_images/user.png"
										style="height: 100px; align-content: center;">
								</div>
								<div class="col-sm-5">
									<a href="#" class="mr-3">2023-02-07_공지내용.pdf</a> <a href="#"
										class="mr-3">2023-02-07_공지내용.pdf</a>
								</div>
							</div>
						</form>
						<div class="d-flex justify-content-center">
							<button class="btn btn-oti waves-effect waves-light mr-4">저장</button>
						</div>
					</div>
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
	</div>
	<!-- Page body end -->
	<
	<%@include file="/WEB-INF/views/fragments/bottom.jsp"%>
</body>
</html>

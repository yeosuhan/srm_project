<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
	<%@include file="/WEB-INF/views/fragments/header.jsp"%>
	<link rel="stylesheet" type="text/css" href="/resources/css/pagination.css">
	<link rel="stylesheet" type="text/css" href="/resources/js/pagination.js">
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
											<div class="col-sm-12">
												<!-- Notification card start -->
												<div class="card">
													<div class="card-header">
														<h5 class="card-header-text">문의사항</h5>
													</div>
													<table class="table table-hover">
														<thead>
															<tr>
																<th class="col-1">글 번호</th>
																<th class="col-6">제목</th>
																<th class="col-3">작성자</th>
																<th class="col-2">답변상태</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<th scope="row" style="text-align: center;">1</th>
																<td>사이드바 색상 문의드립니다.</td>
																<td>홍길동</td>
																<td>미답변</td>
															</tr>
															<tr>
																<th scope="row" style="text-align: center;">2</th>
																<td>오티아이 워크샵 공지</td>
																<td>이순신</td>
																<td>답변완료</td>
															</tr>
															<tr>
																<th scope="row" style="text-align: center;">1</th>
																<td>오티아이 회식 공지</td>
																<td>강감찬</td>
																<td>미답변</td>
															</tr>
														</tbody>
													</table>
													<!-- 페이징 처리 -->
													<%@ include file="/WEB-INF/views/fragments/pagination.jsp"%>													
												</div>
												<!-- Notification card end -->
											</div>
											<!-- Bootstrap modal end -->
										</div>
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
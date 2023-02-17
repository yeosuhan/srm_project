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
														<h5 class="card-header-text">공지사항</h5>
														<form action="noticedetail"><button>상세보기</button></form>
                                          				<form action="noticewrite"><button>글 작성</button></form>
													</div>
													<table class="table table-hover">
														<thead>
															<tr>
																<th class="col-1" style="text-align: center;">글 번호</th>
																<th class="col-7">제목</th>
																<th class="col-1">파일첨부</th>
																<th class="col-3">작성자</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<th scope="row" style="text-align: center;">7</th>
																<td>오티아이 휴가 사용 공지</td>
																<td>-</td>
																<td>최은종(관리자)</td>
															</tr>
															<tr>
																<th scope="row" style="text-align: center;">6</th>
																<td>오티아이 휴가 사용 공지</td>
																<td>-</td>
																<td>최은종(관리자)</td>
															</tr>
															<tr>
																<th scope="row" style="text-align: center;">5</th>
																<td>오티아이 휴가 사용 공지</td>
																<td>-</td>
																<td>최은종(관리자)</td>
															</tr>
															<tr>
																<th scope="row" style="text-align: center;">4</th>
																<td>오티아이 휴가 사용 공지</td>
																<td>-</td>
																<td>최은종(관리자)</td>
															</tr>
															<tr>
																<th scope="row" style="text-align: center;">3</th>
																<td>오티아이 휴가 사용 공지</td>
																<td>-</td>
																<td>최은종(관리자)</td>
															</tr>
															<tr>
																<th scope="row" style="text-align: center;">2</th>
																<td>오티아이 워크샵 공지</td>
																<td><img src="/resources/oti_images/attachFile.png"
																	style="width: 20px;"></td>
																<td>신정은(관리자)</td>
															</tr>
															<tr>
																<th scope="row" style="text-align: center;">1</th>
																<td>오티아이 회식 공지</td>
																<td>-</td>
																<td>한송민(관리자)</td>
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
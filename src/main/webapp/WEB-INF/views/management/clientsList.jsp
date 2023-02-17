<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- 작성자: 최은종 --%>
<html>
<head>
<%@include file="/WEB-INF/views/fragments/header.jsp"%>
<style>
table, th, td {
	text-align: center;
	line-height: 35px;
}
</style>
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
						<div class="pcoded-inner-content pt-4">
							<div class="main-body">
								<div id="pageWrapper" class="page-wrapper">
									<%-- Page-body start --%>
									<div class="page-body">
										<%-- *********** --%>
										<div class="row">
											<%-- 고객 목록  --%>
											<div class="col-xl-8 col-md-12">
												<div class="card">
													<div class="card-header">
														<h5 style="font-weight: bold;">고객 관리</h5>
														<%-- 검색 기능 --%>
														<div class="mt-4 mr-5" style="height: 30px;">
															<form>
																<div class="form-group row">
																	<label class="col-sm-1 col-form-label text-right"
																		style="font-size: 14;">이름</label>
																	<div class="col-sm-2">
																		<input type="text" class="form-control">
																	</div>
																	<label class="col-sm-2 col-form-label text-right"
																		style="font-size: 14;">소속기관</label>
																	<div class="col-sm-3">
																		<input type="text" class="form-control">
																	</div>
																	<div class="col-sm-4 d-flex justify-content-end">
																		<button
																			class="btn btn-primary btn-sm btn-round waves-effect waves-light ">검색</button>
																	</div>
																</div>
															</form>
														</div>
													</div>
													<div class="card-block table-border-style">
														<div class="table-responsive">
															<table class="table table-hover" style="font-size: 12;">
																<thead>
																	<tr>
																		<th>번호</th>
																		<th>아이디</th>
																		<th>이름</th>
																		<th>전화번호</th>
																		<th>소속기관</th>
																		<th>기관번호</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<th scope="row">1</th>
																		<td>test2</td>
																		<td>test1</td>
																		<td>test1</td>
																		<td>test1</td>
																		<td>test1</td>
																	</tr>
																	<tr>
																		<th scope="row">2</th>
																		<td>test2</td>
																		<td>test2</td>
																		<td>test2</td>
																		<td>test2</td>
																		<td>test2</td>
																	</tr>
																	<tr>
																		<th scope="row">3</th>
																		<td>test3</td>
																		<td>test3</td>
																		<td>test3</td>
																		<td>test3</td>
																		<td>test3</td>
																	</tr>
																	<tr>
																		<th scope="row">4</th>
																		<td>test3</td>
																		<td>test3</td>
																		<td>test3</td>
																		<td>test3</td>
																		<td>test3</td>
																	</tr>
																	<tr>
																		<th scope="row">5</th>
																		<td>test3</td>
																		<td>test3</td>
																		<td>test3</td>
																		<td>test3</td>
																		<td>test3</td>
																	</tr>
																	<tr>
																		<th scope="row">6</th>
																		<td>test3</td>
																		<td>test3</td>
																		<td>test3</td>
																		<td>test3</td>
																		<td>test3</td>
																	</tr>
																	<tr>
																		<th scope="row">7</th>
																		<td>test3</td>
																		<td>test3</td>
																		<td>test3</td>
																		<td>test3</td>
																		<td>test3</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
											<%-- 고객 목록 끝 --%>
											<%-- 고객 상세조회 카드--%>
											<div class="col-xl-4 col-md-12">
												<div class="card">
													<div class="card-header">
														<h5 style="font-weight: bold;">기관명</h5>
														<div class="card-header-right">
															<ul class="list-unstyled card-option" align="right">
																<li><i class="fa fa fa-wrench open-card-option"></i></li>
																<li><i class="fa fa-window-maximize full-card"></i></li>
																<li><i class="fa fa-refresh reload-card"></i></li>
															</ul>
														</div>
													</div>
													<div class="card-block"
														style="justify-content: center; text-align: center;">
														<div class="my-2">
															<img src="/resources/assets/images/ejexample.png"
																style="height: 200px; width: 200px; align-content: center;">
														</div>
													</div>
													<div class="card-block">
														<div class="row">
															<p class="col-sm-5 font-weight-bold">아이디</p>
															<div class="col-sm-7" id="MClientId">je1234</div>
														</div>
														<div class="row">
															<p class="col-sm-5 font-weight-bold">이름</p>
															<div class="col-sm-7" id="MClientName">신정은</div>
														</div>
														<div class="row">
															<p class="col-sm-5 font-weight-bold">전화번호</p>
															<div class="col-sm-7" id="MClientTel">010-1234-5678</div>
														</div>
														<div class="row">
															<p class="col-sm-5 font-weight-bold">이메일</p>
															<div class="col-sm-7" id="MClientemail">abc@gmail.com</div>
														</div>
														<div class="row">
															<p class="col-sm-5 font-weight-bold">주소</p>
															<div class="col-sm-7" id="MClientAddr">서울</div>
														</div>
														<div class="row">
															<p class="col-sm-5 font-weight-bold">소속기관</p>
															<div class="col-sm-7" id="MClientIns">한국고용원</div>
														</div>
														<div class="row">
															<p class="col-sm-5 font-weight-bold">기관 전화번호</p>
															<div class="col-sm-7" id="MClientInsTel">02-123-1234</div>
														</div>
													</div>
												</div>
											</div>
											<%--고객 상세조회 카드 끝--%>
										</div>
										<%-- *********** --%>
									</div>
									<%-- Page-body end --%>
								</div>
							</div>
							<div id="styleSelector"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/fragments/bottom.jsp"%>
</body>
</html>
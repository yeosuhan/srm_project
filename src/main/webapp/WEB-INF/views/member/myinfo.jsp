<%-- 작성자 : 신정은
	작성날짜 : 2023-02-20 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<%@include file="/WEB-INF/views/fragments/header.jsp"%>
<script src="/resources/js/kakaoAddress.js"></script>
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
									<!-- Page-body start -->
									<div class="page-body">
										<!-- *********** -->
										<div class="card">
											<div class="card-header">
												<h5>내정보 관리</h5>
											</div>
											<div class="row">
												<div class="col-4"
													style="justify-content: center; text-align: center;">
													<div class="mb-2">
														<img src="/resources/oti_images/user.png"
															style="height: 200px; align-content: center; margin-top: 50px;">
													</div>
												</div>
												<div class="col-8 card-block">
													<form class="form-material">
														<div class="form-group row">
															<p class="col-sm-2 font-weight-bold">이름</p>
															<div class="col-sm-10">신정은</div>
														</div>
														<div class="form-group row">
															<p class="col-sm-2 font-weight-bold">아이디</p>
															<div class="col-sm-10">je1234</div>
														</div>

														<div class="form-group form-default">
															<input type="password" name="footer-email"
																class="form-control" required="" style="width: 50%"
																value="dfdffffdf"> <span class="form-bar"></span>
															<label class="float-label">비밀번호</label>
														</div>



														<div class="form-group form-default">
															<input type="text" name="footer-email"
																class="form-control" required="" style="width: 50%"
																value="01012345678"> <span class="form-bar"></span>
															<label class="float-label">전화번호</label>
														</div>

														<div class="form-group form-default">
															<input type="text" name="footer-email"
																class="form-control" required="" style="width: 50%"
																value="test@gmail.com"> <span class="form-bar"></span>
															<label class="float-label">이메일 (exa@gmail.com)</label>
														</div>

														<div class="form-group form-default">
															<input type="text" name="footer-email" id="address_kakao"
																class="form-control" required="" style="width: 50%"
																value="혜화역 4번출구"> <span class="form-bar"></span>
															<label class="float-label">주소</label>
														</div>

														<div class="form-group form-default"
															style="display: flex;">
															<input type="text" name="footer-email"
																class="form-control" required="" style="width: 50%" value="워크넷(내부망)">
															<label class="float-label">${inst.INST_NM}</label>
															<div class="btn-group dropright">
																<a href="institution/add" type="button" class="btn waves-effect waves-light hor-grd btn-grd-inverse ml-2">
																	기관 등록
																</a>
																
															</div>
														</div>
														<div class="form-group form-default"
															style="display: flex;">
															<p class="col-sm-2 font-weight-bold">부서</p>
															<div class="col-sm-10">신정은</div>
														</div>

														<div class="form-group form-default"
															style="display: flex;">
															<p class="col-sm-2 font-weight-bold">직급</p>
															<div class="col-sm-10">사원</div>
														</div>

													</form>
													<div class="d-flex">
														<button
															class="btn btn-inverse btn-round waves-effect waves-light"
															style="margin-left: 160px;">저장</button>
													</div>
												</div>
											</div>
										</div>


										<!-- *********** -->
									</div>
									<!-- Page-body end -->
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
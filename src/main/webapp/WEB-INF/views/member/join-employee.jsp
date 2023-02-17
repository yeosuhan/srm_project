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
					<%-- <%@include file="/WEB-INF/views/fragments/sidebar.jsp"%> --%>
					<!-- <div class="pcoded-content"> -->
					<%@include file="/WEB-INF/views/fragments/pageHeader.jsp"%>
					<div class="pcoded-inner-content pt-4">
						<div class="main-body">
							<div id="pageWrapper" class="page-wrapper">
								<!-- Page body start -->
								<div class="page-body">
									<div class="card">
										<div class="card-header">
											<h5>Sign Up for Employee</h5>
										</div>
										<div class="row">
											<div class="col-1"></div>
											<div class="col-4"
												style="justify-content: center; text-align: center;">
												<div class="mb-2">
													<img src="/resources/oti_images/user.png"
														style="height: 200px; align-content: center; margin-top: 50px;">
												</div>
												<span style="color: gray">프로필 사진을 등록해주세요.</span>

											</div>

											<div class="col-7 card-block">
												<form class="form-material">
													<div class="form-group form-default" style="display: flex;">
														<input type="text" name="footer-email"
															class="form-control" required="" style="width: 50%">
														<label class="float-label">아이디</label>
														<button
															class="btn waves-effect waves-light hor-grd btn-grd-inverse ml-2"
															style="width: 100px;">중복확인</button>
													</div>

													<div class="form-group form-default">
														<input type="password" name="footer-email"
															class="form-control" required="" style="width: 50%">
														<label class="float-label">비밀번호</label>
													</div>

													<div class="form-group form-default">
														<input type="text" name="footer-email"
															class="form-control" required="" style="width: 50%">
														<label class="float-label">이름</label>
													</div>

													<div class="form-group form-default">
														<input type="text" name="footer-email"
															class="form-control" required="" style="width: 50%">
														<label class="float-label">전화번호</label>
													</div>

													<div class="form-group form-default">
														<input type="text" name="footer-email"
															class="form-control" required="" style="width: 50%">
														<label class="float-label">이메일 (exa@gmail.com)</label>
													</div>

													<div class="form-group form-default">
														<input type="text" name="footer-email" id="address_kakao"
															class="form-control" required="" style="width: 50%"
															value="혜화역 4번출구"> <input class="form-control"
															type="text" name="address_detail" placeholder="상세주소"
															style="width: 70%"> <span class="form-bar"></span>
														<label class="float-label">주소</label>
													</div>

													<div class="form-group form-default" style="display: flex;">
														<input type="text" name="footer-email"
															class="form-control" required="" style="width: 50%">
														<label class="float-label">부서</label>
														<div class="btn-group dropright">
															<button type="button"
																class="dropdown-toggle btn waves-effect waves-light hor-grd btn-grd-inverse ml-2"
																data-toggle="dropdown" aria-expanded="false">
																찾기</button>
															<div class="dropdown-menu"
																style="padding: 10px; width: 300px; height: 300px; overflow-y: scroll">
																<!-- Dropdown menu links -->
																<div style="display: flex;">
																	<input type="text" name="footer-email"
																		class="form-control" required=""
																		style="margin-left: 10px; width: 60%;">
																	<button class="btn-sm ml-4" style="border: none;">검색</button>
																</div>
																<a class="dropdown-item" href="#">워크넷(외부망)</a> <a
																	class="dropdown-item" href="#">워크넷(내부망)</a> <a
																	class="dropdown-item" href="#">외국인고용관리</a> <a
																	class="dropdown-item" href="#">고용보험</a> <a
																	class="dropdown-item" href="#">HRD-NET 시스템</a> <a
																	class="dropdown-item" href="#">일모아템</a> <a
																	class="dropdown-item" href="#">MDM(바로원시스템)</a> <a
																	class="dropdown-item" href="#">EIS</a> <a
																	class="dropdown-item" href="#">부정수급모니터링</a> <a
																	class="dropdown-item" href="#">기타</a>
															</div>
														</div>
													</div>

													<div class="form-group form-default" style="display: flex;">
														<input type="text" name="footer-email"
															class="form-control" required="" style="width: 50%">
														<label class="float-label">직급</label>
														<div class="btn-group dropright">
															<button type="button"
																class="dropdown-toggle btn waves-effect waves-light hor-grd btn-grd-inverse ml-2"
																data-toggle="dropdown" aria-expanded="false">
																찾기</button>
															<div class="dropdown-menu"
																style="padding: 10px; width: 300px;">
																<!-- Dropdown menu links -->
																<a class="dropdown-item" href="#">부장</a> <a
																	class="dropdown-item" href="#">차장</a> <a
																	class="dropdown-item" href="#">과장</a> <a
																	class="dropdown-item" href="#">대리</a> <a
																	class="dropdown-item" href="#">사원</a>
															</div>
														</div>
													</div>

												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div style="justify-content: center; text-align: center;">
								<button
									class="btn waves-effect waves-light hor-grd btn-grd-primary ">Sign
									Up</button>
							</div>
						</div>
						<!-- Page body end -->
					</div>
					<div id="styleSelector"></div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/fragments/bottom.jsp"%>
</body>
</html>
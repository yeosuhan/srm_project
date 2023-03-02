<%-- 작성자 : 신정은
	작성날짜 : 2023-02-20 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<%@include file="/WEB-INF/views/fragments/header.jsp"%>
<script src="/resources/js/kakaoAddress.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/check.js"></script>
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
								<!-- Page-body start -->
								<div class="page-body">
									<div class="card">
										<div class="card-header">
											<h5>Sign Up For Client</h5>
										</div>
										<div class="row">
											<div class="col-4"
												style="justify-content: center; text-align: center;">
												<div class="mb-2">
													<img src="/resources/oti_images/user.png"
														style="height: 200px; align-content: center; margin-top: 50px;">
												</div>
												<span style="color: gray">프로필 사진을 등록해주세요.</span>
											</div>
											<div class="col-8 card-block">
												<form class="form-material" id="joinForm"
													action="<c:url value='/join'/>" method="post">
													<input type="hidden" name="memberType" value="ROLE_CLIENT">
													<input type="hidden" name="jbgdCd"> <input
														type="hidden" name="deptCd"> <input type="hidden"
														name="fileType"> <input type="hidden"
														name="fileData">
													<div class="form-group form-default" style="display: flex;">
														<input type="text" name="memberId" class="form-control" id="memberId"
															required style="width: 50%"> <label
															class="float-label">아이디</label>
														<button type="button" onclick="getMemberId()"
															class="btn waves-effect waves-light hor-grd btn-grd-inverse ml-2"
															style="width: 100px;">중복확인</button>
													</div>

													<div class="form-group form-default">
														<input type="password" name="pswd" class="form-control"
															required="" style="width: 50%"> <span
															class="form-bar"></span> <label class="float-label">비밀번호</label>
													</div>

													<div class="form-group form-default">
														<input type="text" name="flnm" class="form-control"
															required="" style="width: 50%"> <span
															class="form-bar"></span> <label class="float-label">이름</label>
													</div>

													<div class="form-group form-default">
														<input type="text" name="telNo" class="form-control"
															required="" style="width: 50%"> <span
															class="form-bar"></span> <label class="float-label">전화번호</label>
													</div>

													<div class="form-group form-default">
														<input type="text" name="eml" class="form-control"
															required="" style="width: 50%"> <span
															class="form-bar"></span> <label class="float-label">이메일
															(exa@gmail.com)</label>
													</div>

													<div class="form-group form-default">
														<input type="text" name="addr" id="address_kakao"
															class="form-control" required="" style="width: 50%"
															value="혜화역 4번출구"> <input class="form-control"
															type="text" name="addrDetail" placeholder="상세주소"
															style="width: 70%"> <span class="form-bar"></span>
														<label class="float-label">주소</label>
													</div>

													<div class="form-group form-default" style="display: flex;">
														<input type="text" name="instCd" class="form-control"
															required="" style="width: 50%"> <label
															class="float-label">기관 소속</label>
														<div class="btn-group dropright">
															<button type="button"
																class="dropdown-toggle btn waves-effect waves-light hor-grd btn-grd-inverse ml-2"
																data-toggle="dropdown" aria-expanded="false">
																찾기</button>
															<div class="dropdown-menu"
																style="padding: 10px; width: 300px; height: 300px; overflow-y: scroll">
																<!-- Dropdown menu links -->
																<div style="display: flex;">
																	<input type="text" class="form-control"
																		style="margin-left: 10px; width: 60%;">
																	<button class="btn-sm ml-4" style="border: none;">검색</button>
																</div>
																<a class="dropdown-item" href="#">워크넷</a> <a
																	class="dropdown-item" href="#">HRD-NET</a> <a
																	class="dropdown-item" href="#">일모아시스템</a> <a
																	class="dropdown-item" href="#">MDM(바로원시스템)</a> <a
																	class="dropdown-item" href="#">EIS</a>
															</div>
														</div>
													</div>
												</form>
											</div>
										</div>
									</div>
									<div style="justify-content: center; text-align: center;">
										<button form="joinForm" type="submit"
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
		</div>
	</div>
	<%@include file="/WEB-INF/views/fragments/bottom.jsp"%>
</body>
</html>
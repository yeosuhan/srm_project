<%-- 작성자 : 신정은
	작성날짜 : 2023-02-20 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<%@include file="/WEB-INF/views/fragments/header.jsp"%>
<script src="/resources/js/kakaoAddress.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/check.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/image.js"></script>
</head>
<style>
.box {
	width: 200px;
	border: 1px solid #77aaff;
	box-sizing: border-box;
	border-radius: 10px;
	padding: 12px 13px;
	font-family: 'Roboto';
	font-style: normal;
	font-weight: 400;
	font-size: 14px;
	line-height: 16px;
}

.box:focus {
	border: 1px solid #9B51E0;
	box-sizing: border-box;
	border-radius: 10px;
	outline: 3px solid #77aaff;
	border-radius: 10px;
}

#chooseFile {
	visibility: hidden;
}

label>img {
	margin-top: 50px;
	border-radius: 50%;
}
</style>
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

											<div class="col-4"
												style="justify-content: center; text-align: center;">
												<div class="mb-2">
													<div class="container">
														<div class="image-upload" id="image-upload">
															<form method="post" enctype="multipart/form-data">
																<div class="button">
																	<label for="chooseFile" id="newImg"><img
																		id="defaultImage" src="/resources/oti_images/user.png"
																		style="height: 400px; align-content: center; margin-top: 50px;">
																	</label>
																</div>
																<input type="file" id="chooseFile" name="chooseFile"
																	accept="image/*" onchange="loadFile(this)">
															</form>
														</div>
														<span style="color: gray" id="addImg">회원가입후 프로필 사진을
															등록해주세요.</span>
													</div>
												</div>
											</div>

											<div class="col-8 card-block">
												<form class="form-material" id="joinForm" action="/join"
													method="post">
													<input type="hidden" name="instCd" value=""> <input
														type="hidden" name="fileType" value=""> <input
														type="hidden" name="fileData" value="">
													<div class="form-group form-default" style="display: flex;">
														<input type="text" name="memberId" class="form-control"
															required="" style="width: 50%"> <label
															class="float-label">아이디</label>
														<button type="button" onclick="checkMemberId()"
															class="btn waves-effect waves-light hor-grd btn-oti ml-2"
															style="width: 100px;">중복확인</button>
															<font id="checkId" size="2" style="padding-left: 10px;"></font>
													</div>

													<div class="form-group form-default">
														<input type="password" name="pswd" class="form-control"
															required="" style="width: 50%"> <label
															class="float-label">비밀번호</label>
													</div>

													<div class="form-group form-default">
														<input type="text" name="flnm" class="form-control"
															required="" style="width: 50%"> <label
															class="float-label">이름</label>
													</div>

													<div class="form-group form-default">
														<input type="text" name="telNo" class="form-control"
															required="" style="width: 50%"> <label
															class="float-label">전화번호</label>
													</div>

													<div class="form-group form-default">
														<input type="text" name="eml" class="form-control"
															required="" style="width: 50%"> <label
															class="float-label">이메일 (exa@gmail.com)</label>
													</div>

													<div class="form-group form-default">
														<input type="text" name="addr" id="address_kakao"
															class="form-control" required="" style="width: 50%"
															value="혜화역 4번출구"> <input class="form-control"
															type="text" name="address_detail" placeholder="상세주소"
															style="width: 70%"> <span class="form-bar"></span>
														<label class="float-label">주소</label>
													</div>

													<div class="form-group form-default" style="display: flex;">
														<select name="deptCd" id="dept" class="box">
															<option disabled selected>부서</option>
															<c:forEach var="dept" items="${dept}">
																<option value="${dept.deptCd}">${dept.deptNm}</option>
															</c:forEach>
														</select>
													</div>

													<div class="form-group form-default" style="display: flex;">
														<select name="jbgdCd" id="grade" class="box">
															<option disabled selected>직급</option>
															<c:forEach var="grade" items="${grade}">
																<option value="${grade.jbgdCd}">${grade.jbgdNm}</option>
															</c:forEach>
														</select>
													</div>

												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div style="justify-content: center; text-align: center;">
								<button form="joinForm" type="submit"
									class="btn waves-effect waves-light hor-grd btn-oti">Sign
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
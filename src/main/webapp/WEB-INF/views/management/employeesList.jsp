<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- 작성자: 최은종 --%>
<html>
<head>
<%@include file="/WEB-INF/views/fragments/header.jsp"%>
<%-- 카카오 주소 js --%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/js/kakaoAddress.js"></script>
<style>
table, th, td {
	text-align: center;
	line-height: 35px;
}

.form-group {
  margin-bottom: 0;
  }
  	p{	
		margin:auto;
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
											<%-- 사원목록  --%>
											<div class="col-xl-8 col-md-12">
												<div class="card">
													<div class="card-header">
														<h5 style="font-weight: bold;">사원 관리</h5>
														<%-- 검색 기능 --%>
														<div class="mt-4 mr-5" style="height: 30px;">
															<form>
																<div class="form-group row">
																	<label class="col-sm-1 col-form-label text-right"
																		style="font-size: 14;">이름</label>
																	<div class="col-sm-2">
																		<input type="text" class="form-control">
																	</div>
																	<label class="col-sm-1 col-form-label text-right"
																		style="font-size: 14;">부서</label>
																	<div class="col-sm-2">
																		<input type="text" class="form-control">
																	</div>
																	<label class="col-sm-1 col-form-label text-right"
																		style="font-size: 14;">직급</label>
																	<div class="col-sm-2">
																		<input type="text" class="form-control">
																	</div>
																	<div class="col-sm-3 d-flex justify-content-end">
																		<button
																			class="btn btn-primary btn-round btn-sm waves-effect waves-light">검색</button>
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
																		<th>부서</th>
																		<th>직급</th>
																		<th>이메일</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<th scope="row">1</th>
																		<td>test1</td>
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
																</tbody>
															</table>
														</div>
													</div>

												</div>

											</div>

											<%-- 사원 목록 끝--%>
											<%-- 사원 상세조회 카드--%>
											<div class="col-xl-4 col-md-12">


												<div class="card">

													<div class="card-header">
														<h5 style="font-weight: bold;">사원명</h5>
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
														<form class="form-material">
															<div class="form-group row">
																<p class="col-sm-2 font-weight-bold">아이디</p>
																<div class="col-sm-10" id="MEmployeeId">je1234</div>
															</div>
															<div class="form-group row">
																<p class="col-sm-2 font-weight-bold pt-3">이름</p>
																<div class="col-sm-10 pt-3" id="MEmployeeName">신정은</div>
															</div>
															<div class="form-group form-default row">
																<p class="col-sm-2 font-weight-bold pt-2">전화번호</p>
																<div class="col-sm-10 pt-2" id="MEmployeeTel">
																	<input type="text" class="form-control" required=""
																		style="width: 70%" value="01012345678">
																</div>
															</div>
															<div class="form-group form-default row">
																<p class="col-sm-2 font-weight-bold">이메일</p>
																<div class="col-sm-10" id="MEmployeeEmail">
																	<input type="text" class="form-control" required=""
																		style="width: 70%" value="abc@gmail.com">
																</div>
															</div>
															<div class="form-group form-default row">
																<p class="col-sm-2 font-weight-bold">주소</p>
																<div class="col-sm-10" id="MEmployeeAddr">
																	<input type="text" id="address_kakao"
																		class="form-control" required="" style="width: 90%"
																		placeholder="도로명주소"> <input type="text"
																		name="address_detail" class="form-control" required=""
																		style="width: 90%" placeholder="상세주소">
																</div>
															</div>
															<div class="form-group form-default row">
																<p class="col-sm-2 font-weight-bold">부서</p>
																<div class="col-sm-10" id="MEmployeeDepartment">
																	<select name="selectDepartment" class="form-control"
																		style="width: 60%">
																		<option value="" disabled selected>유지보수1팀</option>
																		<option value="opt1">개발1팀</option>
																		<option value="opt2">개발2팀</option>
																		<option value="opt3">유지보수2팀</option>
																		<option value="opt4">유지보수3팀</option>
																	</select>
																</div>
															</div>
															<div class="form-group form-default row">
																<p class="col-sm-2 font-weight-bold">직급</p>
																<div class="col-sm-10" id="MEmployeeJobGrade">
																	<select name="selectJobGrade" class="form-control"
																		style="width: 60%">
																		<option value="" disabled selected>사원</option>
																		<option value="opt1">대표이사</option>
																		<option value="opt2">이사</option>
																		<option value="opt3">부장</option>
																		<option value="opt4">차장</option>
																		<option value="opt5">과장</option>
																		<option value="opt6">대리</option>
																		<option value="opt7">사원</option>
																	</select>
																</div>
															</div>
														</form>
													</div>

													<div class="card-footer">
														<div align="center">
															<form method="post">
																<button type="button" id="deleteInfo"
																	class="btn btn-primary btn-sm btn-round waves-effect waves-light">삭제</button>
																<button type="button" id="modifyInfo"
																	class="btn btn-primary btn-sm btn-out btn-round waves-effect waves-light">저장</button>
															</form>
														</div>
													</div>


												</div>

											</div>


										</div>


										<!-- *********** -->
									</div>

									<!-- Page-body end -->
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
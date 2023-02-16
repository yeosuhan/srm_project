<%@page contentType="text/html; charset=UTF-8"%>

<html>
<head>
<%@include file="/WEB-INF/views/fragments/header.jsp"%>
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

									<!-- Page body start -->
									<div class="page-body">
										<div class="row">
											<div class="col-sm-12">
												<!-- Basic Form Inputs card start------------------------------------------------------ -->
												<div class="card">
													<div class="card-header">
														<h5>공지사항 수정</h5>
													</div>
													<div class="card-block">
														<form enctype="multipart/form-data">
														<div class="form-group row">
																<div class="col-sm-2 font-weight-bold">글번호</div>
																<div class="col-sm-5">37</div>
																<div class="col-sm-1 font-weight-bold text-right">작성자</div>
																<div class="col-sm-2">신정은(관리자)</div>
																
															</div>	
															<div class="form-group row">
																<label class="col-sm-2 col-form-label">제목</label>
																<div class="col-sm-10">
																	<input type="text" class="form-control">
																</div>
															</div>														
															<div class="form-group row">
																<label class="col-sm-2 col-form-label">내용</label>
																<div class="col-sm-10">
																	<textarea rows="20" cols="5" class="form-control"
																		placeholder="내용을 입력해주세요"></textarea>
																</div>
															</div>
															<div class="form-group row">
																<label class="col-sm-2 col-form-label">첨부파일</label>
																<div class="col-sm-10">
																	<input type="file" class="form-control" multiple >
																</div>
															</div>
														</form>
														<div class="d-flex justify-content-center">
															<button class="btn btn-inverse btn-round waves-effect waves-light mr-4">저장</button>
														</div>
													</div>
												</div>
												<!-- Input Alignment card end -->
											</div>
										</div>
									</div>
									<!-- Page body end -->
								</div>
							</div>
							<!-- Main-body end -->
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
<%@page contentType="text/html; charset=UTF-8"%>

<html>
<head>
<%@include file="/WEB-INF/views/fragments/header.jsp"%>
<script type="text/javascript">
</script>
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
														<h5>문의사항</h5>
													</div>
													<div class="card-block">
														<form enctype="multipart/form-data">
															<div class="form-group row">
																<div class="col-sm-2 font-weight-bold">글번호</div>
																<div class="col-sm-5">37</div>
																<div class="col-sm-1 font-weight-bold text-right">작성자</div>
																<div class="col-sm-2">신정은(관리자)</div>
																<div class="col-sm-1 font-weight-bold text-right">답변상태</div>
																<div class="col-sm-1">답변완료</div>
															</div>
															<div class="form-group row">
																<div class="col-sm-2 font-weight-bold">제목</div>
																<div class="col-sm-8">제목a</div>
																<div class="col-sm-1 font-weight-bold text-right">작성일자</div>
																<div class="col-sm-1">2023-02-14</div>
															</div>
															<div class="form-group row">
																<p class="col-sm-2 font-weight-bold">내용</p>
																<div class="col-sm-10">
																	<textarea rows="20" cols="5" class="form-control"
																		style="border: none; opacity: 0.5;" readonly></textarea>
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
																	<a href="#" class="mr-3">2023-02-07_공지내용.pdf</a> <a
																		href="#" class="mr-3">2023-02-07_공지내용.pdf</a>
																</div>
															</div>
														</form>
														<div class="d-flex justify-content-center">
															<form action="qnaupdate">
																<button class="btn btn-inverse btn-round waves-effect waves-light mr-4">수정</button>
															</form>
															<form action="#">
																<button class="btn btn-inverse btn-round waves-effect waves-light">삭제</button>
															</form>
														</div>
													</div>
												</div>
												<!-- Input Alignment card end -->
											</div>
										</div>
										<div class="row">
											<div class="col-sm-12">
												<div class="card">
													<div class="card-header text-right">
														<h6>댓글 8</h6>
													</div>
													<div class="card-block">
														<div class="row mb-2">
															<input type="hidden" value="1">
															<!-- 여기에 댓글 id  -->
															<div class="col-1 text-left" style="margin: auto;">작성자3</div>
															<form
																action="#"
																class="col-8 text-left d-flex justify-content-start" style="margin: auto;"> 
																<input type="text" name="comment" class="form-control"
																	style="width: 90%;"
																	value="상단바에 '로그아웃' 탭  수정 부탁드립니다."/>
																<div type="submit" class="ml-3"
																	style="color: blue; padding-top: 9px">저장</div>
															</form>
															<div class="col-2 text-right" style="margin: auto;">2023-02-18</div>
															<div class="col-1 d-flex justify-content-end text-center">
																<a href="#" style="color: #A1A6A6; margin: auto;">삭제 </a> 
															</div>
														</div>


														<div class="row mb-2">
															<input type="hidden" value="1">
															<!-- 여기에 댓글 id  -->
															<div class="col-1 text-left" style="margin: auto;">관리자1</div>
															<div class="col-8 text-left">네 고객님 여기에 작성해주시면 확인 후
																답변드리겠습니다.</div>
															<div class="col-2 text-right">2023-02-17</div>
															<div class="col-1"></div>
														</div>
														<div class="row mb-2" >
															<input type="hidden" value="1">
															<!-- 여기에 댓글 id  -->
															<div class="col-1 text-left" style="margin: auto;">작성자3</div>
															<form 
																action="#"
																class="col-8 text-left d-flex justify-content-start" style="margin: auto;">
																<input type="text" name="comment" class="form-control"
																	style="width: 90%;"
																	value="상단바 부분 내용 수정하려는데 어디로 문의드리면 될까요?">
																<div type="submit" class="ml-3"
																	style="color: blue; padding-top: 9px">저장</div>
															</form>
															<div class="col-2 text-right" style="margin: auto;">2023-02-16</div>
															<div class="col-1 d-flex justify-content-end">
																<a href="#" style="color: #A1A6A6; margin: auto;">삭제 </a>
															</div>
														</div>
														<div class="text-center">
															<a href="" class="font-weight-bold">더 보기</a>
														</div>
													</div>
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
		<%@include file="/WEB-INF/views/fragments/bottom.jsp"%>
</body>
</html>
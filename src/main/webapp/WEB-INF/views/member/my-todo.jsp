<%-- 작성자 : 신정은
	작성날짜 : 2023-02-20 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
	<%@include file="/WEB-INF/views/fragments/header.jsp"%>
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/srButton.css">
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/pagination.css">
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/js/pagination.js">
	<!-- 모달 -->
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/srModal.css">
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
										<!-- Row start -->
										<div class="row">
											<!-- Color Open Accordion start -->
											<div class="col-lg-12">
												<div class="card">
													<div class="card-header">
														<h5 class="card-header-text">나의 할일</h5>
													</div>
													<div class="col-12 ">
														<!-- Nav tabs -->
														<ul class="nav nav-tabs md-tabs" role="tablist">
															<li class="nav-item"><a class="nav-link active"
																data-toggle="tab" href="#request" role="tab">요청</a>
																<div class="slide"></div></li>
															<li class="nav-item"><a class="nav-link"
																data-toggle="tab" href="#reject" role="tab">반려</a>
																<div class="slide"></div></li>
															<li class="nav-item"><a class="nav-link"
																data-toggle="tab" href="#receipt" role="tab">접수</a>
																<div class="slide"></div></li>
															<li class="nav-item"><a class="nav-link"
																data-toggle="tab" href="#develop" role="tab">개발중</a>
																<div class="slide"></div></li>
															<li class="nav-item"><a class="nav-link"
																data-toggle="tab" href="#test" role="tab">테스트</a>
																<div class="slide"></div></li>
															<li class="nav-item"><a class="nav-link"
																data-toggle="tab" href="#complete" role="tab">개발완료</a>
																<div class="slide"></div></li>
														</ul>
														<!-- Tab panes -->
														<div class="tab-content card-block">
															<div class="tab-pane active" id="request" role="tabpanel">
																<table class="table table-hover">
																	<thead>
																		<tr>
																			<th scope="col"></th>
																			<th scope="col">SR번호</th>
																			<th scope="col">시스템구분</th>
																			<th scope="col">업무구분</th>
																			<th scope="col">SR제목</th>
																			<th scope="col">담당자</th>
																			<th scope="col">완료요청일</th>
																			<th scope="col">진행상태</th>
																			<th scope="col">상세보기</th>
																		</tr>
																	</thead>
																	<tbody>
																		<tr>
																			<th scope="row">1</th>
																			<td>SR0003</td>
																			<td>워크넷(외부망)</td>
																			<td>모바일</td>
																			<td>워크넷 모바일 화면 수정3</td>
																			<td>신정은</td>
																			<td>2023-02-19</td>
																			<td>요청</td>
																			<td><button id="modbtn" class="srbutton">요청수정</button></td>
																		</tr>
																		<tr>
																			<th scope="row">2</th>
																			<td>SR0002</td>
																			<td>워크넷(외부망)</td>
																			<td>모바일</td>
																			<td>워크넷 모바일 화면 수정3</td>
																			<td>신정은</td>
																			<td>2023-02-18</td>
																			<td>요청</td>
																			<td>
																				<button class="srbutton" data-toggle="modal"
																					data-target="#srDemandModal">요청상세</button>
																			</td>
																		</tr>
																		<tr>
																			<th scope="row">3</th>
																			<td>SR0001</td>
																			<td>워크넷(외부망)</td>
																			<td>모바일</td>
																			<td>워크넷 모바일 화면 수정3</td>
																			<td>신정은</td>
																			<td>2023-02-17</td>
																			<td>요청</td>
																			<td>
																				<button class="srbutton" data-toggle="modal"
																					data-target="#srDemandModal">요청상세</button>
																			</td>
																		</tr>
																	</tbody>
																</table>
															</div>
															<div class="tab-pane" id="reject" role="tabpanel">
																<table class="table table-hover">
																	<thead>
																		<tr>
																			<th scope="col"></th>
																			<th scope="col">SR번호</th>
																			<th scope="col">시스템구분</th>
																			<th scope="col">업무구분</th>
																			<th scope="col">SR제목</th>
																			<th scope="col">담당자</th>
																			<th scope="col">완료요청일</th>
																			<th scope="col">진행상태</th>
																			<th scope="col">상세보기</th>
																		</tr>
																	</thead>
																	<tbody>
																		<tr>
																			<th scope="row">1</th>
																			<td>SR0003</td>
																			<td>워크넷(외부망)</td>
																			<td>모바일</td>
																			<td>워크넷 모바일 화면 수정3</td>
																			<td>신정은</td>
																			<td>2023-02-19</td>
																			<td>반려</td>
																			<td><button id="modbtn" class="srbutton">요청수정</button></td>
																		</tr>
																		<tr>
																			<th scope="row">2</th>
																			<td>SR0002</td>
																			<td>워크넷(외부망)</td>
																			<td>모바일</td>
																			<td>워크넷 모바일 화면 수정3</td>
																			<td>신정은</td>
																			<td>2023-02-18</td>
																			<td>반려</td>
																			<td>
																				<button class="srbutton" data-toggle="modal"
																					data-target="#srDemandModal">요청상세</button>
																			</td>
																		</tr>
																		<tr>
																			<th scope="row">3</th>
																			<td>SR0001</td>
																			<td>워크넷(외부망)</td>
																			<td>모바일</td>
																			<td>워크넷 모바일 화면 수정3</td>
																			<td>신정은</td>
																			<td>2023-02-17</td>
																			<td>반려</td>
																			<td>
																				<button class="srbutton" data-toggle="modal"
																					data-target="#srDemandModal">요청상세</button>
																			</td>
																		</tr>
																	</tbody>
																</table>
															</div>
															<div class="tab-pane" id="receipt" role="tabpanel">
																<table class="table table-hover">
																	<thead>
																		<tr>
																			<th scope="col"></th>
																			<th scope="col">SR번호</th>
																			<th scope="col">시스템구분</th>
																			<th scope="col">업무구분</th>
																			<th scope="col">SR제목</th>
																			<th scope="col">담당자</th>
																			<th scope="col">완료요청일</th>
																			<th scope="col">진행상태</th>
																			<th scope="col">상세보기</th>
																		</tr>
																	</thead>
																	<tbody>
																		<tr>
																			<th scope="row">1</th>
																			<td>SR0003</td>
																			<td>워크넷(외부망)</td>
																			<td>모바일</td>
																			<td>워크넷 모바일 화면 수정3</td>
																			<td>신정은</td>
																			<td>2023-02-19</td>
																			<td>접수</td>
																			<td><button id="modbtn" class="srbutton">요청수정</button></td>
																		</tr>
																		<tr>
																			<th scope="row">2</th>
																			<td>SR0002</td>
																			<td>워크넷(외부망)</td>
																			<td>모바일</td>
																			<td>워크넷 모바일 화면 수정3</td>
																			<td>신정은</td>
																			<td>2023-02-18</td>
																			<td>접수</td>
																			<td>
																				<button class="srbutton" data-toggle="modal"
																					data-target="#srDemandModal">요청상세</button>
																			</td>
																		</tr>
																		<tr>
																			<th scope="row">3</th>
																			<td>SR0001</td>
																			<td>워크넷(외부망)</td>
																			<td>모바일</td>
																			<td>워크넷 모바일 화면 수정3</td>
																			<td>신정은</td>
																			<td>2023-02-17</td>
																			<td>접수</td>
																			<td>
																				<button class="srbutton" data-toggle="modal"
																					data-target="#srDemandModal">요청상세</button>
																			</td>
																		</tr>
																	</tbody>
																</table>
															</div>
															<div class="tab-pane" id="develop" role="tabpanel">
																<table class="table table-hover">
																	<thead>
																		<tr>
																			<th scope="col"></th>
																			<th scope="col">SR번호</th>
																			<th scope="col">시스템구분</th>
																			<th scope="col">업무구분</th>
																			<th scope="col">SR제목</th>
																			<th scope="col">담당자</th>
																			<th scope="col">완료요청일</th>
																			<th scope="col">진행상태</th>
																			<th scope="col">상세보기</th>
																		</tr>
																	</thead>
																	<tbody>
																		<tr>
																			<th scope="row">1</th>
																			<td>SR0003</td>
																			<td>워크넷(외부망)</td>
																			<td>모바일</td>
																			<td>워크넷 모바일 화면 수정3</td>
																			<td>신정은</td>
																			<td>2023-02-19</td>
																			<td>개발중</td>
																			<td><button id="modbtn" class="srbutton">요청수정</button></td>
																		</tr>
																		<tr>
																			<th scope="row">2</th>
																			<td>SR0002</td>
																			<td>워크넷(외부망)</td>
																			<td>모바일</td>
																			<td>워크넷 모바일 화면 수정3</td>
																			<td>신정은</td>
																			<td>2023-02-18</td>
																			<td>개발중</td>
																			<td>
																				<button class="srbutton" data-toggle="modal"
																					data-target="#srDemandModal">요청상세</button>
																			</td>
																		</tr>
																		<tr>
																			<th scope="row">3</th>
																			<td>SR0001</td>
																			<td>워크넷(외부망)</td>
																			<td>모바일</td>
																			<td>워크넷 모바일 화면 수정3</td>
																			<td>신정은</td>
																			<td>2023-02-17</td>
																			<td>개발중</td>
																			<td>
																				<button class="srbutton" data-toggle="modal"
																					data-target="#srDemandModal">요청상세</button>
																			</td>
																		</tr>
																	</tbody>
																</table>
															</div>
															<div class="tab-pane" id="test" role="tabpanel">
																<table class="table table-hover">
																	<thead>
																		<tr>
																			<th scope="col"></th>
																			<th scope="col">SR번호</th>
																			<th scope="col">시스템구분</th>
																			<th scope="col">업무구분</th>
																			<th scope="col">SR제목</th>
																			<th scope="col">담당자</th>
																			<th scope="col">완료요청일</th>
																			<th scope="col">진행상태</th>
																			<th scope="col">상세보기</th>
																		</tr>
																	</thead>
																	<tbody>
																		<tr>
																			<th scope="row">1</th>
																			<td>SR0003</td>
																			<td>워크넷(외부망)</td>
																			<td>모바일</td>
																			<td>워크넷 모바일 화면 수정3</td>
																			<td>신정은</td>
																			<td>2023-02-19</td>
																			<td>테스트</td>
																			<td><button id="modbtn" class="srbutton">요청수정</button></td>
																		</tr>
																		<tr>
																			<th scope="row">2</th>
																			<td>SR0002</td>
																			<td>워크넷(외부망)</td>
																			<td>모바일</td>
																			<td>워크넷 모바일 화면 수정3</td>
																			<td>신정은</td>
																			<td>2023-02-18</td>
																			<td>테스트</td>
																			<td>
																				<button class="srbutton" data-toggle="modal"
																					data-target="#srDemandModal">요청상세</button>
																			</td>
																		</tr>
																		<tr>
																			<th scope="row">3</th>
																			<td>SR0001</td>
																			<td>워크넷(외부망)</td>
																			<td>모바일</td>
																			<td>워크넷 모바일 화면 수정3</td>
																			<td>신정은</td>
																			<td>2023-02-17</td>
																			<td>테스트</td>
																			<td>
																				<button class="srbutton" data-toggle="modal"
																					data-target="#srDemandModal">요청상세</button>
																			</td>
																		</tr>
																	</tbody>
																</table>
															</div>
															<div class="tab-pane" id="complete" role="tabpanel">
																<table class="table table-hover">
																	<thead>
																		<tr>
																			<th scope="col"></th>
																			<th scope="col">SR번호</th>
																			<th scope="col">시스템구분</th>
																			<th scope="col">업무구분</th>
																			<th scope="col">SR제목</th>
																			<th scope="col">담당자</th>
																			<th scope="col">완료요청일</th>
																			<th scope="col">진행상태</th>
																			<th scope="col">상세보기</th>
																		</tr>
																	</thead>
																	<tbody>
																		<tr>
																			<th scope="row">1</th>
																			<td>SR0003</td>
																			<td>워크넷(외부망)</td>
																			<td>모바일</td>
																			<td>워크넷 모바일 화면 수정3</td>
																			<td>신정은</td>
																			<td>2023-02-19</td>
																			<td>개발완료</td>
																			<td><button id="modbtn" class="srbutton">요청수정</button></td>
																		</tr>
																		<tr>
																			<th scope="row">2</th>
																			<td>SR0002</td>
																			<td>워크넷(외부망)</td>
																			<td>모바일</td>
																			<td>워크넷 모바일 화면 수정3</td>
																			<td>신정은</td>
																			<td>2023-02-18</td>
																			<td>개발완료</td>
																			<td>
																				<button class="srbutton" data-toggle="modal"
																					data-target="#srDemandModal">요청상세</button>
																			</td>
																		</tr>
																		<tr>
																			<th scope="row">3</th>
																			<td>SR0001</td>
																			<td>워크넷(외부망)</td>
																			<td>모바일</td>
																			<td>워크넷 모바일 화면 수정3</td>
																			<td>신정은</td>
																			<td>2023-02-17</td>
																			<td>개발완료</td>
																			<td>
																				<button class="srbutton" data-toggle="modal"
																					data-target="#srDemandModal">요청상세</button>
																			</td>
																		</tr>
																	</tbody>
																</table>
															</div>
														</div>
													</div>
													<!-- 페이징 처리 -->
													<%@ include file="/WEB-INF/views/fragments/pagination.jsp"%>
												</div>
											</div>
											<!-- Color Open Accordion ends -->
										</div>
										<!-- Row end -->
										<!-- Row start -->
										<div class="row">
											<!-- Multiple Open Accordion start -->
											<div class="col-lg-6">
												<div class="card">
													<div class="card-header">
														<h5 class="card-header-text">공지사항</h5>
													</div>
													<table class="table table-hover">
														<thead>
															<tr>
																<th scope="col">글 번호</th>
																<th scope="col">제목</th>
																<th scope="col">파일첨부</th>
																<th scope="col">작성자</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<th scope="row">3</th>
																<td>오티아이 휴가 사용 공지</td>
																<td>-</td>
																<td>최은종(관리자)</td>
															</tr>
															<tr>
																<th scope="row">2</th>
																<td>오티아이 워크샵 공지</td>
																<td><img src="/resources/oti_images/attachFile.png"
																	style="width: 20px;"></td>
																<td>신정은(관리자)</td>
															</tr>
															<tr>
																<th scope="row">1</th>
																<td>오티아이 회식 공지</td>
																<td>-</td>
																<td>한송민(관리자)</td>
															</tr>
														</tbody>
													</table>
													<!-- 페이징 처리 -->
													<%@ include file="/WEB-INF/views/fragments/pagination.jsp"%>
												</div>
											</div>
											<!-- Multiple Open Accordion ends -->
											<!-- Single Open Accordion start -->
											<div class="col-lg-6">
												<div class="card">
													<div class="card-header">
														<h5 class="card-header-text">문의사항</h5>
													</div>
													<table class="table table-hover">
														<thead>
															<tr>
																<th scope="col">글 번호</th>
																<th scope="col">제목</th>
																<th scope="col">작성자</th>
																<th scope="col">답변상태</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<th scope="row">1</th>
																<td>사이드바 색상 문의드립니다.</td>
																<td>홍길동</td>
																<td>미답변</td>
															</tr>
															<tr>
																<th scope="row">2</th>
																<td>오티아이 워크샵 공지</td>
																<td>이순신</td>
																<td>답변완료</td>
															</tr>
															<tr>
																<th scope="row">1</th>
																<td>오티아이 회식 공지</td>
																<td>강감찬</td>
																<td>미답변</td>
															</tr>
														</tbody>
													</table>
													<!-- 페이징 처리 -->
													<%@ include file="/WEB-INF/views/fragments/pagination.jsp"%>
												</div>
											</div>
											<!-- Single Open Accordion ends -->
										</div>
										<!-- Row end -->

									</div>
									<!-- Page-body end -->
									<div id="styleSelector"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/fragments/bottom.jsp"%>
	<!-- 모달 -->

	<jsp:include page="/WEB-INF/views/srDemand/srDemandDetail.jsp" />
	<jsp:include page="/WEB-INF/views/srDemand/modal.jsp" />

</body>
</html>
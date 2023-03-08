<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- 작성자 : 여수한 / 작성 날짜 : 2023-02-17 --%>
<%-- 작성자 : 최은종 / 작성 날짜 : 2023-02-28 --%>

<html>
<head>
<%@include file="/WEB-INF/views/fragments/header.jsp"%>
<%-- 캘린더css --%>
<link
	href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css'
	rel='stylesheet' />
</head>
<script
	src="${pageContext.request.contextPath}/resources/js/srResources.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/deliverables.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/srInfoListHstry.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/srInfo.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/hstryPager.css">

<script>
	
<%-- 모달 실행 --%>
	$(document).on('click', '#addbtn', function(e) {
		console.log("click event");
		$('#addmodal').addClass('show');
		document.body.style = `overflow: hidden`;
	});
	$(document).on('click', '#closebtn', function(e) {
		console.log("click event");
		$('#addmodal').removeClass('show');
		document.body.style = `overflow: scroll`;
	});
</script>

<style>
.ui-datepicker-trigger {
	width: 29px;
	vertical-align: top;
}

#startDatepicker, #endDatepicker, #addDatepicker {
	width: 90px;
}

#requestDatepicker, #endRequestDatepicker, #firStartDatepicker,
	#firEndDatepicker, #secStartDatepicker, #secEndDatepicker,
	#thrStartDatepicker, #thrEndDatepicker, #fiveStartDatepicker,
	#fiveEndDatepicker, #fourStartDatepicker, #fourEndDatepicker,
	#sixStartDatepicker, #sixEndDatepicker {
	width: 70px;
	padding-right: 0px;
}

div.left {
	width: 65%;
	float: left;
	box-sizing: border-box;
}

div.right {
	width: 35%;
	float: right;
	box-sizing: border-box;
	border-left: 1px solid black;
}

div .right .form-control {
	height: 20px;
}

th {
	text-align: center;
}

.col-sm-4 {
	padding: 0px;
}
/* 
.table td, .table th {
   padding: 0.75rem;
} */
.card .card-block {
	padding: 0px 5px !important;
}

.col-xl-1 {
	padding-top: 8px;
	padding-right: 0px;
	padding-left: 10px;
}

.modal {
	position: fixed;
	top: 0;
	left: 0;
	bottom: 0;
	right: 0;
	background: rgba(0, 0, 0, 0.4);
}

.m.body {
	height: 50vh;
	overflow-y: auto;
}

.form-control {
	font-size: inherit;
}
</style>

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
									<div class="page-body text">
										<!-- *********** -->
										<%-- *********************************** [ 산출물 추가 모달 ] ***********************************--%>
										<div class="modal" id="addmodal">
											<div class="modal_body" style="height: 300px">
												<div class="m_head" style="height: 60px">
													<div class="modal_title" style="color: white;">산출물 추가</div>
												</div>
												<div class="m_body" style="height: 190px">
													<div class="form-group row">
														<div class="col-sm-6">
															<div class="row">
																<div class="col col-sm-4">산출물 구분</div>
																<div class="col col-sm-6">
																	<div class="dropdown dropdown open">
																		<select name="prgrsId" id="prgrsIdSelect">
																			<option value="1">요구정의</option>
																			<option value="2">분석/설계</option>
																			<option value="3">구현</option>
																			<option value="4">시험</option>
																		</select>
																	</div>
																</div>
															</div>
														</div>
														<div class="col-sm-6">
															<%-- <div class="row">
                                                <div class="col col-sm-4">등록일</div>
                                                <div class="col col-sm-6">
                                                   <input type="date" id="regYmd" name="regYmd">
                                                </div>
                                             </div> --%>
														</div>
													</div>
													<div class="form-group row">
														<div class="col-sm-6">
															<div class="row">
																<div class="col-sm-4">
																	<label class="col-form-label">산출물명</label>
																</div>
																<div class="col-sm-6">
																	<input type="text" id="delivNm" name="delivNm">
																</div>
															</div>
														</div>
														<div class="col-sm-6">
															<div class="row">
																<div class="col-sm-4">
																	<label class="col-form-label">산출물 경로</label>
																</div>
																<div class="col-sm-6">
																	<input type="text" id="delivUrl" name="delivUrl">
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="m_footer" style="height: 50px">
													<div onclick="addDeliverable()"
														class="modal_btn save center" id="closebtn">등록</div>
													<div class="modal_btn danger cancle" id="closebtn">닫기</div>
												</div>
											</div>
										</div>
										<%-- *********************************** [SR 진척 관리 ] ***********************************--%>
										<div class="row">
											<div class="col-xl-12">
												<div class="card">
													<div class="card-header">
														<h5>SR 진척 관리</h5>
														<hr />
														<form id="srInfoFilterForm"
															action="${pageContext.request.contextPath}/srinformation/list"
															onsubmit="return srSearch()">
															<div class="col col-xl-1" style="width: 90px;">시스템
																구분</div>
															<div class="col col-xl-1" style="">
																<div class="dropdown dropdown open">

																	<select name="sysCd" id="sysCdFilter"
																		onclick="getSysCd()" onchange="removeTaskSeCd()">
																		<c:if test="${srInfoFilter.sysCd ne null}">
																			<option value="${srInfoFilter.sysCd}">${sd.sysNm}<c:if
																					test="${sd.sysNm eq null}">${srInfoFilter.sysCd}</c:if></option>
																		</c:if>
																	</select>

																</div>
															</div>
															<div class="col col-xl-1" style="width: 80px;">업무
																구분</div>
															<div class="col col-xl-1" style="">
																<div class="dropdown dropdown open">

																	<select name="taskSeCd" id="taskSeCdFilter"
																		onclick="getTaskSeCd()">
																		<c:if test="${srInfoFilter.taskSeCd ne null}">
																			<option value="${srInfoFilter.taskSeCd}">${sd.taskSeNm}<c:if
																					test="${sd.taskSeNm}">${srInfoFilter.taskSeCd}</c:if></option>
																		</c:if>
																	</select>

																</div>
															</div>
															<div class="col col-xl-1" style="width: 80px;">진행
																상태</div>
															<div class="col col-xl-1" style="">
																<div class="dropdown dropdown open">

																	<select name="sttsCd" id="sttsCdFilter">
																		<option></option>
																		<option value="3"
																			<c:if test="${srInfoFilter.sttsCd eq 3}"> selected</c:if>>개발중</option>
																		<option value="4"
																			<c:if test="${srInfoFilter.sttsCd eq 4}"> selected</c:if>>테스트</option>
																		<option value="5"
																			<c:if test="${srInfoFilter.sttsCd eq 5}"> selected</c:if>>반영
																			요청</option>
																	</select>

																</div>
															</div>
															<div class="col col-xl-1"
																style="width: 80px; padding-left: 20px;">SR 제목</div>
															<div class="col col-xl-1" style="">
																<input type="text" class="form-control" name="ttl"
																	value="${srInfoFilter.ttl}">
															</div>
															<div class="col col-xl-1"
																style="width: 80px; padding-left: 30px">SR 번호</div>
															<div class="col col-xl-1" style="">
																<input type="text" class="form-control" name="dmndNo"
																	value="${srInfoFilter.dmndNo}">
															</div>
															<div class="col col-xl-1" style="padding-left: 30px">
																내 처리건
																<c:if test="${srInfoFilter.mySrOnly eq true}">
																	<input type="checkbox" name="mySrOnly" value="true"
																		checked>
																</c:if>
																<c:if test="${srInfoFilter.mySrOnly ne true}">
																	<input type="checkbox" name="mySrOnly" value="true">
																</c:if>
															</div>
															<div class="col col-xl-1">
																<button type="submit" class="btn btn-lg btn-info">
																	<i class="ti-search"></i>
																</button>
															</div>
														</form>
														<div class="col col-xl-1">
															<button class="btn btn-info">엑셀 다운로드</button>
														</div>
													</div>
												</div>
											</div>
											<%-- *********************************** [SR 처리 목록 ] ***********************************--%>
											<div class="col-xl-8 col-md-12">
												<div class="card">
													<div class="card-header">
														<h5>SR 처리 목록</h5>
														<div class="card-header-right">
															<ul class="list-unstyled card-option">
																<li><i class="fa fa fa-wrench open-card-option"></i></li>
																<li><i class="fa fa-window-maximize full-card"></i></li>
																<li><i class="fa fa-minus minimize-card"></i></li>
																<li><i class="fa fa-refresh reload-card"></i></li>
																<li><i class="fa fa-trash close-card"></i></li>
															</ul>
														</div>
													</div>
													<div class="card-block" id="list">
														<div id="sales-analytics" class="p-2">
															<div class="card-block table-border-style">
																<div class="table-responsive">
																	<table class="table table-hover text-center"
																		style="font-size: 12;">
																		<thead>
																			<tr>
																				<th style="width: 1px;">#</th>
																				<th>SR번호</th>
																				<th>시스템구분</th>
																				<th>업무구분</th>
																				<th style="width: 200px;">SR명</th>
																				<th>요청자</th>
																				<th>완료요청일</th>
																				<th>완료예정일</th>
																				<th>진행상태</th>
																			</tr>
																		</thead>
																		<tbody>
																			<c:if test="${srlist ne null}">
																				<c:forEach var="srlist" items="${srlist}"
																					varStatus="num">
																					<tr
																						onclick="getDetail('${srlist.dmndNo}','${srlist.srNo}');">
																						<th scope="row">${num.count}</th>
																						<td id="">${srlist.srNo}</td>
																						<td>${srlist.sysNm}</td>
																						<td>${srlist.taskSeNm}</td>
																						<td>${srlist.ttl}</td>
																						<td>${srlist.flnm}</td>
																						<td>${srlist.bgngYmd}</td>
																						<td>${srlist.endYmd}</td>
																						<td><c:if test="${(srlist.sttsNm) eq '요청'}">
																								<label class="badge badge-warning">${srlist.sttsNm}</label>
																							</c:if> <c:if test="${(srlist.sttsNm) eq '반려'}">
																								<label class="badge badge-danger">${srlist.sttsNm}</label>
																							</c:if> <c:if test="${(srlist.sttsNm) eq '접수'}">
																								<label class="badge badge-inverse-success">${srlist.sttsNm}</label>
																							</c:if> <c:if test="${(srlist.sttsNm) eq '개발중'}">
																								<label class="badge badge-success">${srlist.sttsNm}</label>
																							</c:if> <c:if test="${(srlist.sttsNm) eq '개발완료'}">
																								<label class="badge badge-primary">${srlist.sttsNm}</label>
																							</c:if> <c:if test="${(srlist.sttsNm) eq '개발취소'}">
																								<label class="badge badge-danger">${srlist.sttsNm}</label>
																							</c:if></td>
																					</tr>
																				</c:forEach>
																			</c:if>
																			<c:if test="${srlist eq null}">
																				<tr>
																					<td colSpan="9">검색 결과가 없습니다.</td>
																				</tr>
																			</c:if>
																		</tbody>
																	</table>
																	<%@include
																		file="/WEB-INF/views/fragments/pagination.jsp"%>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<%-- *********************************** [SR요청 상세정보 ] ***********************************--%>
											<div class="col-xl-4 col-md-12">
												<div class="card">
													<div class="card-header">
														<div class="row">
															<div class="col-8">
																<h5>SR요청 상세정보</h5>
															</div>
															<div class="col-3 ml-4">
																<button class="btn btn-primary btn-sm"
																	onclick="addHistory('${srNo}')" data-toggle="modal"
																	data-target="#addHistoryModal">SR 변경요청</button>
															</div>
														</div>
													</div>
													<div class="card-block" style="height: 700px;">
														<div class="card_body "
															style="font-size: 12px; padding-top: 20px;">
															<div class="form-group row">
																<div class="col-sm-6">
																	<div class="col col-sm-4">요청 번호</div>
																	<div class="col col-sm-6">
																		<input type="hidden" id="SRDSrNo"
																			value="${srlist[0].srNo}"> <input readonly
																			class="form-control" id="SRDDmndNo"
																			value="${sd.dmndNo}" style="width: 110px;">
																	</div>
																</div>
																<div class="col-sm-6">
																	<div class="col col-sm-4">우선순위</div>
																	<div class="col col-sm-6">
																		<input type="text" readonly class="form-control"
																			id="SiRnk" value="${sd.rnk}">
																	</div>
																</div>
															</div>
															<hr />
															<div class="form-group row">
																<div class="col col-sm-2">SR 제목</div>
																<div class="col col-sm-9">
																	<input readonly class="form-control"
																		style="width: 150px;" id="SRDTitle" value="${sd.ttl}">
																</div>
															</div>
															<hr />
															<div class="form-group row">
																<div class="col col-sm-2" style="padding-right: 0px;">관련근거</div>
																<div class="col col-sm-9">
																	<input readonly class="form-control"
																		style="width: 150px;" id="SRDRelgrund"
																		value="${sd.relGrund}">
																</div>
															</div>
															<hr />
															<div class="form-group row">
																<div class="col-sm-6">
																	<div class="col col-sm-4">시스템구분</div>
																	<div class="col col-sm-6">
																		<input readonly class="form-control"
																			style="width: 200%;" id="SRDSys" value="${sd.sysNm}">
																	</div>
																</div>
																<div class="col-sm-6">
																	<div class="col col-sm-4">업무구분</div>
																	<div class="col col-sm-6">
																		<input readonly class="form-control"
																			style="width: 150%;" id="SRDTask"
																			value="${sd.taskSeNm}">
																	</div>
																</div>
															</div>
															<hr />
															<div class="form-group row">
																<div class="col-sm-6">
																	<div class="col col-sm-4">요청기관</div>
																	<div class="col col-sm-6">
																		<input readonly class="form-control"
																			style="width: 200%;" id="SRDInst"
																			value="${sd.instNm}">
																	</div>
																</div>
																<div class="col-sm-6">
																	<div class="col col-sm-4">요청자</div>
																	<div class="col col-sm-6">
																		<input readonly class="form-control"
																			style="width: 150%;" id="SRDClientNm"
																			value="${sd.clientNm}">
																	</div>
																</div>
															</div>
															<hr />
															<div class="form-group row">
																<div class="col-sm-6">
																	<div class="col col-sm-4">요청일</div>
																	<div class="col col-sm-8">
																		<input readonly class="form-control" id="SRDDmndymd"
																			value="${sd.dmndYmd}">
																	</div>
																</div>
																<div class="col-sm-6">
																	<div class="col col-sm-4">완료요청일</div>
																	<div class="col col-sm-8">
																		<input readonly class="form-control"
																			id="SRDCmptnDmndYmd" value="${sd.cmptnDmndYmd}">
																	</div>
																</div>
															</div>
															<hr />
															<div class="form-group row">
																<label class="col-sm-2 col-form-label"
																	style="line-height: 100px; font-size: 12px;">SR
																	내용</label>
																<div class="col-sm-9">
																	<input readonly class="form-control"
																		style="width: 300px; height: 110px;" id="SRDCn"
																		value="${sd.cn}">
																</div>
															</div>
															<hr />
															<div class="form-group row">
																<div class="col-sm-6">
																	<div class="col col-sm-4">검토자</div>
																	<div class="col col-sm-8">
																		<input readonly class="form-control" id="SRDRvwrNm"
																			value="${sd.rvwrNm}">
																	</div>
																</div>
																<div class="col-sm-6">
																	<div class="col col-sm-4">진행상태</div>
																	<div class="col col-sm-8">
																		<input readonly class="form-control"
																			id="SRDCmptnDmndYmd" value="${sd.sttsNm}">
																	</div>
																</div>
															</div>
															<div class="form-group row">
																<label class="col-sm-3 col-form-label"
																	style="font-size: 12px;">첨부파일</label>
																<div class="col-sm-9">
																	<input type="file" class="" id="SRDFile">
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<%-- *********************************** [SR요청 처리정보 ] ***********************************--%>
										<div class="col-xl-12 col-md-12">
											<div class="card">
												<div class="card-header">
													<h5>SR요청 처리정보</h5>
												</div>
												<div class="card-block" style="padding-top: 10px;">
													<ul class="nav nav-tabs  md-tabs" role="tablist">
														<li class="nav-item" onclick="getPlan()"><a
															id="srPlanTab" class="nav-link active" data-toggle="tab"
															href="#home1" role="tab">SR 계획정보</a>
															<div class="slide"></div></li>
														<li class="nav-item"><a id="srResourceTab"
															class="nav-link" data-toggle="tab" href="#profile1"
															role="tab">SR 자원정보</a>
															<div class="slide"></div></li>
														<li class="nav-item" onclick="getProgress()"><a
															class="nav-link" data-toggle="tab" href="#messages1"
															role="tab">SR 진척율</a>
															<div class="slide"></div></li>
														<li class="nav-item" onclick="empHstry()"><a
															class="nav-link" data-toggle="tab" href="#srInfhistory"
															role="tab">SR 히스토리</a>
															<div class="slide"></div></li>
													</ul>
													<%-- *********************************** [ 계획정보 ] ***********************************--%>
													<div class="tab-content tabs card-block"
														style="padding: 0px; padding-top: 20px;">
														<input type="hidden" id="SRPlDmndNo">
														<div class="tab-pane active" id="home1" role="tabpanel"
															style="padding: 20px;">
															<div class="form-group row">
																<div class="col-sm-6">
																	<div class="col col-sm-4">처리팀</div>
																	<div class="col col-sm-6" id="deptDiv">
																		<select id="dept" onchange="changeDept()">
																			<c:forEach var="deptList" items="${deptList}">
																				<option id="SRDept" value="${deptList.deptCd}">${deptList.deptNm}</option>
																			</c:forEach>
																		</select> <input type="hidden" id="SRPlDeptNm">
																	</div>

																</div>
																<div class="col-sm-6">
																	<div class="col col-sm-4">담당자</div>
																	<div class="col col-sm-6" id="SRPlFlnmBySelect">
																		<input type="hidden" id="SRPlMemberId"> <input
																			readonly class="form-control" id="SRPlFlnm"
																			value="${sp.flnm}">
																	</div>
																</div>
															</div>
															<div class="form-group row">
																<div class="col-sm-6">
																	<div class="col col-sm-4">계획시작일</div>
																	<div class="col col-sm-6" id="bgngYmdDiv">
																		<input type="date" class="form-control"
																			id="SRPlBgngYmd" value="${sp.bgngYmd}">
																	</div>
																</div>
																<div class="col-sm-6">
																	<div class="col col-sm-4">계획종료일</div>
																	<div class="col col-sm-6" id="endYmdDiv">
																		<input type="date" class="form-control"
																			id="SRPlEndYmd" value="${sp.endYmd}">
																	</div>
																</div>
															</div>
															<div class="form-group row">
																<div class="col col-sm-2" style="line-height: 90px;">검토
																	내용</div>
																<div class="col col-sm-9" id="rvwCnDiv">
																	<textarea rows="5" cols="5" class="form-control"
																		id="SRPlRvwCn">${sp.rvwCn}</textarea>
																</div>
															</div>
															<button class="btn btn-info" onclick="planUpdate()"
																id="planBtn"
																style="float: right; padding-bottom: 10px; margin-bottom: 10px;">수정</button>
														</div>

														<%-- *********************************** [ 자원정보 ] ***********************************--%>
														<div class="tab-pane" id="profile1" role="tabpanel"
															style="padding-bottom: 20px;">
															<div class="card-block table-border-style"
																style="padding: 0px;">
																<div class="table-responsive">
																	<table class="table table-hover text-center"
																		style="font-size: 12px; padding: 0px;">
																		<thead>
																			<tr>
																				<th style="width: 1px;">#</th>
																				<th style="width: 1px;"><input type="checkbox"
																					name="resource" value="selectResourceAll"
																					onclick="selectResourceAll(this)"></th>
																				<th>개발자명</th>
																				<th>역할</th>
																				<th>투입시작일</th>
																				<th>투입종료일</th>
																			</tr>
																		</thead>
																		<tbody id="resourceTableRow">
																		</tbody>
																	</table>
																</div>
															</div>
															<button class="btn btn-info"
																style="float: right; padding-bottom: 10px; margin-bottom: 10px;">저장</button>
															<button onclick="deleteResource()" class="btn btn-info"
																style="float: right; padding-bottom: 10px; margin-bottom: 10px; margin-right: 10px;">선택
																삭제</button>
															<button class="btn btn-info"
																style="float: right; padding-bottom: 10px; margin-bottom: 10px; margin-right: 10px;"
																data-toggle="modal" data-target="#addSrResourcesModal">추가</button>
														</div>
														<%-- *********************************** [ 진척률 ] ***********************************--%>
														<!-- 진행상태에 따라서 inpu readonly로 출력 및 버튼 안보여야됨 -->
														<div class="tab-pane" id="messages1" role="tabpanel"
															style="padding-bottom: 20px;">
															<div class="tab-pane" id="profile1" role="tabpanel">
																<div class="card-block table-border-style"
																	style="padding: 0px;">
																	<div class="table-responsive">
																		<table class="table table-hover text-center"
																			style="font-size: 12px; padding: 0px;">
																			<thead>
																				<tr>
																					<th style="width: 1px;">#</th>
																					<th style="width: 100px;">작업구분</th>
																					<th style="width: 250px;">시작일</th>
																					<th style="width: 250px;">종료일</th>
																					<th style="width: 50px;">진척률(누적)</th>
																					<th>산출물</th>
																					<th style="width: 50px;"></th>
																				</tr>
																			</thead>
																			<tbody>
																				<tr>
																					<th scope="row">1</th>
																					<td>요구정의 <input type="hidden"
																						id="SRPgPrgrsId0"> <input type="hidden"
																						id="SRPgSrNo">
																					</td>
																					<td id="0bgngYmd"><input type="date"
																						id="SRPgBgngYmd0"></td>
																					<td id="0endYmd"><input type="date"
																						id="SRPgEndYmd0"></td>
																					<td id="0rt"><input type="number"
																						class="form-control" id="SRPgPrgrsRt0" min="0"
																						max="10"></td>
																					<td><div class="accordion"
																							id="accordionExample">
																							<button
																								class="btn btn-link btn-block text-center"
																								type="button" data-toggle="collapse"
																								data-target="#collapse0" aria-expanded="true"
																								aria-controls="collapse0">첨부파일</button>
																						</div></td>
																					<td style="padding: 0px; margin: 0px;">
																						<button class="btn btn-info btn-lg"
																							onclick="updateProgress0()" id="btn0"
																							style="width: 100%; height: 100%">저장</button>
																					</td>
																				</tr>
																				<tr id="collapse0" class="collapse"
																					aria-labelledby="headingOne"
																					data-parent="#accordionExample">
																					<td colspan="6">
																						<div>
																							<table
																								class="table table-border text-center deliverableTable"
																								style="font-size: 12px; padding: 0px;">
																								<thead>
																									<tr>
																										<th style="width: 1px;">#</th>
																										<th style="width: 1px;"><input
																											type="checkbox" name="output"
																											value="selectOutputAll"
																											onclick="selectOutputAll(this)"></th>
																										<th>산출물구분</th>
																										<th>산출물명</th>
																										<th>산출물 경로</th>
																										<th>등록자</th>
																										<th>등록일</th>
																									</tr>
																								</thead>
																								<tbody>

																								</tbody>
																							</table>
																						</div>
																					</td>
																				</tr>
																				<tr>
																					<th scope="row">2</th>
																					<td>분석/설계<input type="hidden"
																						id="SRPgPrgrsId1"></td>
																					<td id="1bgngYmd"><input type="date"
																						id="SRPgBgngYmd1"></td>
																					<td id="1endYmd"><input type="date"
																						id="SRPgEndYmd1"></td>
																					<td id="1rt"><input type="number"
																						class="form-control" id="SRPgPrgrsRt1" min="11"
																						max="40"></td>
																					<td><div class="accordion"
																							id="accordionExample">
																							<button
																								class="btn btn-link btn-block text-center"
																								type="button" data-toggle="collapse"
																								data-target="#collapse1" aria-expanded="true"
																								aria-controls="collapse1">첨부파일</button>
																						</div></td>
																					<td style="padding: 0px; margin: 0px;">
																						<button class="btn btn-info btn-lg"
																							onclick="updateProgress1()" id="btn1"
																							style="width: 100%; height: 100%">저장</button>
																					</td>
																				</tr>
																				<tr id="collapse1" class="collapse"
																					aria-labelledby="headingOne"
																					data-parent="#accordionExample">
																					<td colspan="6">
																						<div>
																							<table
																								class="table table-border text-center deliverableTable"
																								style="font-size: 12px; padding: 0px;">
																								<thead>
																									<tr>
																										<th style="width: 1px;">#</th>
																										<th style="width: 1px;"><input
																											type="checkbox" name="output"
																											value="selectOutputAll"
																											onclick="selectOutputAll(this)"></th>
																										<th>산출물구분</th>
																										<th>산출물명</th>
																										<th>산출물 경로</th>
																										<th>등록자</th>
																										<th>등록일</th>
																									</tr>
																								</thead>
																								<tbody>

																								</tbody>
																							</table>
																						</div>
																					</td>
																				</tr>
																				<tr>
																					<th scope="row">3</th>
																					<td>구현<input type="hidden" id="SRPgPrgrsId2"></td>
																					<td id="2bgngYmd"><input type="date"
																						id="SRPgBgngYmd2"></td>
																					<td id="2endYmd"><input type="date"
																						id="SRPgEndYmd2"></td>
																					<td id="2rt"><input type="number"
																						class="form-control" id="SRPgPrgrsRt2" min="41"
																						max="70"></td>
																					<td><div class="accordion"
																							id="accordionExample">
																							<button
																								class="btn btn-link btn-block text-center"
																								type="button" data-toggle="collapse"
																								data-target="#collapse2" aria-expanded="true"
																								aria-controls="collapse2">첨부파일</button>
																						</div></td>
																					<td style="padding: 0px; margin: 0px;">
																						<button class="btn btn-info btn-lg"
																							onclick="updateProgress2()" id="btn2"
																							style="width: 100%; height: 100%">저장</button>
																					</td>
																				</tr>
																				<tr id="collapse2" class="collapse"
																					aria-labelledby="headingOne"
																					data-parent="#accordionExample">
																					<td colspan="6">
																						<div>
																							<table
																								class="table table-border text-center deliverableTable"
																								style="font-size: 12px; padding: 0px;">
																								<thead>
																									<tr>
																										<th style="width: 1px;">#</th>
																										<th style="width: 1px;"><input
																											type="checkbox" name="output"
																											value="selectOutputAll"
																											onclick="selectOutputAll(this)"></th>
																										<th>산출물구분</th>
																										<th>산출물명</th>
																										<th>산출물 경로</th>
																										<th>등록자</th>
																										<th>등록일</th>
																									</tr>
																								</thead>
																								<tbody>

																								</tbody>
																							</table>
																						</div>
																					</td>
																				</tr>
																				<tr>
																					<th scope="row">4</th>
																					<td>테스트<input type="hidden" id="SRPgPrgrsId3"></td>
																					<td id="3bgngYmd"><input type="date"
																						id="SRPgBgngYmd3"></td>
																					<td id="3endYmd"><input type="date"
																						id="SRPgEndYmd3"></td>
																					<td id="3rt"><input type="number"
																						class="form-control" id="SRPgPrgrsRt3" min="71"
																						max="80"></td>
																					<td>
																						<div class="accordion" id="accordionExample">
																							<button
																								class="btn btn-link btn-block text-center"
																								type="button" data-toggle="collapse"
																								data-target="#collapse3" aria-expanded="true"
																								aria-controls="collapse3">첨부파일</button>
																						</div>

																					</td>
																					<td style="padding: 0px; margin: 0px;">
																						<button class="btn btn-info btn-lg"
																							onclick="updateProgress3()" id="btn3"
																							style="width: 100%; height: 100%">저장</button>
																					</td>
																				</tr>
																				<tr id="collapse3" class="collapse"
																					aria-labelledby="headingOne"
																					data-parent="#accordionExample">
																					<td colspan="6">
																						<div>
																							<table
																								class="table table-border text-center deliverableTable"
																								style="font-size: 12px; padding: 0px;">
																								<thead>
																									<tr>
																										<th style="width: 1px;">#</th>
																										<th style="width: 1px;"><input
																											type="checkbox" name="output"
																											value="selectOutputAll"
																											onclick="selectOutputAll(this)"></th>
																										<th>산출물구분</th>
																										<th>산출물명</th>
																										<th>산출물 경로</th>
																										<th>등록자</th>
																										<th>등록일</th>
																									</tr>
																								</thead>
																								<tbody>

																								</tbody>
																							</table>
																						</div>
																					</td>
																				</tr>
																				<tr>
																					<th scope="row">5</th>
																					<td>반영요청<input type="hidden" id="SRPgPrgrsId4"></td>
																					<td id="4bgngYmd"><input type="date"
																						id="SRPgBgngYmd4"></td>
																					<td id="4endYmd"><input type="date"
																						id="SRPgEndYmd4"></td>
																					<td id="4rt"><input type="number"
																						class="form-control" id="SRPgPrgrsRt4" min="81"
																						max="90"></td>
																					<td><div class="accordion"
																							id="accordionExample">
																							<button
																								class="btn btn-link btn-block text-center"
																								type="button" data-toggle="collapse"
																								data-target="#collapse4" aria-expanded="true"
																								aria-controls="collapse4">첨부파일</button>
																						</div></td>
																					<td style="padding: 0px; margin: 0px;">
																						<button class="btn btn-info btn-lg"
																							onclick="updateProgress4()" id="btn4"
																							style="width: 100%; height: 100%">저장</button>
																					</td>
																				</tr>
																				<tr id="collapse4" class="collapse"
																					aria-labelledby="headingOne"
																					data-parent="#accordionExample">
																					<td colspan="6">
																						<div>
																							<table
																								class="table table-border text-center deliverableTable"
																								style="font-size: 12px; padding: 0px;">
																								<thead>
																									<tr>
																										<th style="width: 1px;">#</th>
																										<th style="width: 1px;"><input
																											type="checkbox" name="output"
																											value="selectOutputAll"
																											onclick="selectOutputAll(this)"></th>
																										<th>산출물구분</th>
																										<th>산출물명</th>
																										<th>산출물 경로</th>
																										<th>등록자</th>
																										<th>등록일</th>
																									</tr>
																								</thead>
																								<tbody>

																								</tbody>
																							</table>
																						</div>
																					</td>
																				</tr>
																				<tr>
																					<th scope="row">6</th>
																					<td>운영반영<input type="hidden" id="SRPgPrgrsId5"></td>
																					<td id="5bgngYmd"><input type="date"
																						id="SRPgBgngYmd5"></td>
																					<td id="5endYmd"><input type="date"
																						id="SRPgEndYmd5"></td>
																					<td id="5rt"><input type="number"
																						class="form-control" id="SRPgPrgrsRt5" min="91"
																						max="100"></td>
																					<td><div class="accordion"
																							id="accordionExample">
																							<button
																								class="btn btn-link btn-block text-center"
																								type="button" data-toggle="collapse"
																								data-target="#collapse5" aria-expanded="true"
																								aria-controls="collapse5">첨부파일</button>
																						</div></td>
																					<td style="padding: 0px; margin: 0px;">
																						<button class="btn btn-info btn-lg"
																							onclick="updateProgress5()" id="btn5"
																							style="width: 100%; height: 100%">저장</button>
																					</td>
																				</tr>
																				<tr id="collapse5" class="collapse"
																					aria-labelledby="headingOne"
																					data-parent="#accordionExample">
																					<td colspan="6">
																						<div>
																							<table
																								class="table table-border text-center deliverableTable"
																								style="font-size: 12px; padding: 0px;">
																								<thead>
																									<tr>
																										<th style="width: 1px;">#</th>
																										<th style="width: 1px;"><input
																											type="checkbox" name="output"
																											value="selectOutputAll"
																											onclick="selectOutputAll(this)"></th>
																										<th>산출물구분</th>
																										<th>산출물명</th>
																										<th>산출물 경로</th>
																										<th>등록자</th>
																										<th>등록일</th>
																									</tr>
																								</thead>
																								<tbody>

																								</tbody>
																							</table>
																						</div>
																					</td>
																				</tr>
																			</tbody>
																		</table>
																	</div>
																</div>
															</div>
															<button class="btn btn-info" id="delbtn"
																onclick="deleteDeliverable()"
																style="float: right; padding-bottom: 10px; margin-bottom: 10px; margin-right: 10px;">선택된
																산출물 삭제</button>
															<button class="btn btn-info" id="addbtn"
																style="float: right; padding-bottom: 10px; margin-bottom: 10px; margin-right: 10px;">산출물
																추가</button>
														</div>
														<%-- *********************************** [ SR 히스토리  ] ***********************************--%>
														<div class="tab-pane" id="srInfhistory" role="tabpanel"
															style="padding-bottom: 20px;">
															<div class="card-block table-border-style"
																style="padding: 0px;">
																<div class="table-responsive">
																	<table
																		class="table table-hover text-center historyTable"
																		style="font-size: 12px; padding: 0px;">
																		<thead>
																			<tr>
																				<th style="width: 1px;">순번</th>
																				<th>요청자명</th>
																				<th>요청유형</th>
																				<th>변경될 완료예정일</th>
																				<th>승인여부</th>
																			</tr>
																		</thead>
																		<tbody id="srhistory1">
																		</tbody>
																	</table>
																	<%-- 페이징 --%>
																	<%-- 페이징 --%>
																	<div class="hstryPager-container">
																		<div class="hstryPager"></div>
																	</div>
																</div>
															</div>
														</div>

													</div>
												</div>
											</div>
										</div>
									</div>
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
	<%@include file="/WEB-INF/views/history/approvalInfoHistoryModal.jsp"%>
	<%@include file="/WEB-INF/views/history/addHistoryModal.jsp"%>
	<%@include file="/WEB-INF/views/history/modifyHistoryModal.jsp"%>
	<%@include file="/WEB-INF/views/srInfo/addSrResourcesModal.jsp"%>
	<%@include file="/WEB-INF/views/fragments/bottom.jsp"%>
</body>
</html>
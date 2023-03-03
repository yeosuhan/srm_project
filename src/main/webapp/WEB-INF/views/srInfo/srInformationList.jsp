<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<%-- SR요청 상세보기 --%>
	function getDetail(dmndNo, srNo) {
		console.log("상세보기 : " + dmndNo + srNo);
		$.ajax({
			url : '/srinformation/detail/' + dmndNo,
			type : 'GET',
			data : {
				dmndNo : dmndNo
			},
			success : function(detail) {
				console.log(srNo);
				console.log(detail);
				$("#SRDSrNo").val(srNo);
				$("#SRDDmndNo").val(detail.dd.dmndNo);
				$("#SRDTitle").val(detail.dd.ttl);
				$("#SRDRelgrund").val(detail.dd.relGrund);
				$("#SRDSys").val(detail.dd.sysNm);
				$("#SRDTask").val(detail.dd.taskSeNm);
				$("#SRDInst").val(detail.dd.instNm);
				$("#SRDFlnm").val(detail.dd.flnm);
				$("#SRDDmndymd").val(detail.dd.dmndYmd);
				$("#SRDCmptnDmndYmd").val(detail.dd.cmptnDmndYmd);
				$("#SRDCn").val(detail.dd.cn);
				$("#SRDFile").val(detail.dd.fileNm);
				$("#SRPlDeptNm").val(detail.pi.deptNm);
				$("#SRPlFlnm").val(detail.pi.flnm);
				$("#SRPlBgngYmd").val(detail.pi.bgngYmd);
				$("#SRPlEndYmd").val(detail.pi.endYmd);
				$("#SRPlRvwCn").text(detail.pi.rvwCn);
				/*자원 정보 모달*/
				$("#srPlanTab").tab("show");
				$("#srNo").val(srNo);
				$("#ttl").val(detail.dd.ttl);
				$("#deptCd").val(detail.pi.deptCd);
				$("#deptNm").val(detail.pi.deptNm);
				$("#resourceInst").val(detail.dd.instNm);

				$("#resourceTableRow").empty();
				$(".deliverableTable tbody").empty();
				$(".historyTable tbody").empty();
			}
		});
	}
<%-- SR요청 계획정보 --%>
	function getPlan() {
		$("#SRDDmndNo").val();
		console.log("계획정보 : " + $("#SRDDmndNo").val());
		$.ajax({
			url : '/srinformation/plan/' + $("#SRDDmndNo").val(),
			type : 'GET',
			data : {
				plan : $("#SRDDmndNo").val()
			},
			success : function(plan) {
				$("#SRPlDeptNm").val(plan.deptNm);
				$("#SRPlFlnm").val(plan.flnm);
				$("#SRPlBgngYmd").val(plan.bgngYmd);
				$("#SRPlEndYmd").val(plan.endYmd);
				$("#SRPlRvwCn").val(plan.rvwCn);
			}
		});
	}
<%-- SR요청 진척률 --%>
	function getProgress() {
		$("#SRDSrNo").val();
		console.log("진척률: " + $("#SRDSrNo").val());
		$.ajax({
			url : '/srinformation/progress/list/' + $("#SRDSrNo").val(),
			type : 'GET',
			data : {
				Progress : $("#SRDSrNo").val()
			},
			success : function(Progress) {
				console.log(Progress[0]);
				for (var i = 0; i < Progress.length; i++) {
					$("#SRPgPrgrsId" + i).val(Progress[i].prgrsId);
					$("#SRPgBgngYmd" + i).val(Progress[i].bgngYmd);
					$("#SRPgEndYmd" + i).val(Progress[i].endYmd);
					$("#SRPgPrgrsRt" + i).val(Progress[i].prgrsRt);
				}
			}
		});
	}
	/* 진척률 추가 */
	function addProgress() {
		$("#SRPgPrgrsRt0").val();
		$("#SRPgPrgrsRt1").val();
		$("#SRPgPrgrsRt2").val();
		$("#SRPgPrgrsRt3").val();
		$("#SRPgPrgrsRt4").val();
		$("#SRPgPrgrsRt5").val();
		console.log("요구정의: " + $("#SRPgPrgrsRt0").val());
		console.log("분석/설계	: " + $("#SRPgPrgrsRt1").val());
		console.log("구현: " + $("#SRPgPrgrsRt2").val());
		console.log("테스트: " + $("#SRPgPrgrsRt3").val());
		console.log("반영요청	: " + $("#SRPgPrgrsRt4").val());
		console.log("운영반영 : " + $("#SRPgPrgrsRt5").val());
		var prgrs = [];
		for (var i = 0; i < 6; i++) {
			prgrs[i] = $("#SRPgPrgrsRt" + i).val();
		}
		$.ajax({
			url : '/srinformation/progress/add',
			type : 'POST',
			data : {
				prgrs : prgrs
			},
			success : function(prgrs) {
				for (var i = 0; i < prgrs.length; i++) {
					$("#SRPgBgngYmd" + i).val(prgrs[i].bgngYmd);
					$("#SRPgEndYmd" + i).val(prgrs[i].endYmd);
					$("#SRPgPrgrsRt" + i).val(prgrs[i].prgrsRt);
				}
			}
		});
	}
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
										<div class="row">
											<%-- *********************************** [SR 진척 관리 ] ***********************************--%>
											<div class="col-xl-12">
												<div class="card">
													<div class="card-header">
														<h5>SR 진척 관리</h5>
														<hr />
														<div class="col col-xl-1" style="width: 90px;">시스템
															구분</div>
														<div class="col col-xl-1" style="">
															<div class="dropdown dropdown open">
																<form action="#">
																	<select name="languages" id="lang">
																		<option value="워크넷">시스템3</option>
																		<option value="굴국밥">시스템2</option>
																		<option value="고소미">시스템1</option>
																	</select>
																</form>
															</div>
														</div>
														<div class="col col-xl-1" style="width: 80px;">업무 구분</div>
														<div class="col col-xl-1" style="">
															<div class="dropdown dropdown open">
																<form action="#">
																	<select name="languages" id="lang">
																		<option value="워크넷">업무구분1</option>
																		<option value="굴국밥">업무2</option>
																		<option value="고소미">업무3</option>
																	</select>
																</form>
															</div>
														</div>
														<div class="col col-xl-1" style="width: 80px;">진행 상태</div>
														<div class="col col-xl-1" style="">
															<div class="dropdown dropdown open">
																<form action="#">
																	<select name="languages" id="lang">
																		<option value="워크넷">개발중</option>
																		<option value="굴국밥">테스트</option>
																		<option value="고소미">반영요청</option>
																	</select>
																</form>
															</div>
														</div>
														<div class="col col-xl-1"
															style="width: 80px; padding-left: 20px;">SR 제목</div>
														<div class="col col-xl-1" style="">
															<input type="text" class="form-control">
														</div>
														<div class="col col-xl-1"
															style="width: 80px; padding-left: 30px">SR 번호</div>
														<div class="col col-xl-1" style="">

															<input type="text" class="form-control">
														</div>
														<div class="col col-xl-1" style="padding-left: 30px">
															내 처리건 <input type="checkbox">
														</div>
														<div class="col col-xl-1">
															<button onclick="srSearch()" type="button"
																class="btn btn-lg btn-info">
																<i class="ti-search"></i>
															</button>
														</div>
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
																			<c:forEach var="srlist" items="${srlist}"
																				varStatus="num">
																				<tr
																					onclick="getDetail('${srlist.dmndNo}','${srlist.srNo}')">
																					<th scope="row">${num.count}</th>
																					<td>${srlist.srNo}</td>
																					<td>${srlist.sysNm}</td>
																					<td>${srlist.taskSeNm}</td>
																					<td>${srlist.ttl}</td>
																					<td>${srlist.flnm}</td>
																					<td>${srlist.bgngYmd}</td>
																					<td>${srlist.endYmd}</td>
																					<td>${srlist.sttsNm}</td>
																				</tr>
																			</c:forEach>
																		</tbody>
																	</table>
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
													<div class="card-block" style="height: 600px;">
														<div class="card_body "
															style="font-size: 12px; padding-top: 20px;">
															<div class="form-group row">
																<div class="col col-sm-3">요청 번호</div>
																<div class="col col-sm-9">
																	<input type="hidden" id="SRDSrNo"> <input
																		readonly class="form-control" style="width: 150px;"
																		id="SRDDmndNo">
																</div>
															</div>
															<hr />
															<div class="form-group row">
																<div class="col col-sm-3">SR 제목</div>
																<div class="col col-sm-9">
																	<input readonly class="form-control"
																		style="width: 150px;" id="SRDTitle">
																</div>
															</div>
															<hr />
															<div class="form-group row">
																<div class="col col-sm-3">관련 근거</div>
																<div class="col col-sm-9">
																	<input readonly class="form-control"
																		style="width: 150px;" id="SRDRelgrund">
																</div>
															</div>
															<hr />
															<div class="form-group row">
																<div class="col-sm-6">
																	<div class="col col-sm-4">시스템구분</div>
																	<div class="col col-sm-6">
																		<input readonly class="form-control"
																			style="width: 200%;" id="SRDSys">
																	</div>
																</div>
																<div class="col-sm-6">
																	<div class="col col-sm-4">업무구분</div>
																	<div class="col col-sm-6">
																		<input readonly class="form-control"
																			style="width: 150%;" id="SRDTask">
																	</div>
																</div>
															</div>
															<hr />
															<div class="form-group row">
																<div class="col-sm-6">
																	<div class="col col-sm-4">요청기관</div>
																	<div class="col col-sm-6">
																		<input readonly class="form-control"
																			style="width: 200%;" id="SRDInst">
																	</div>
																</div>
																<div class="col-sm-6">
																	<div class="col col-sm-4">요청자</div>
																	<div class="col col-sm-6">
																		<input readonly class="form-control"
																			style="width: 150%;" id="SRDFlnm">
																	</div>
																</div>
															</div>
															<hr />
															<div class="form-group row">
																<div class="col-sm-6">
																	<div class="col col-sm-4">요청일</div>
																	<div class="col col-sm-8">
																		<input readonly class="form-control" id="SRDDmndymd">
																	</div>
																</div>
																<div class="col-sm-6">
																	<div class="col col-sm-4">완료요청일</div>
																	<div class="col col-sm-8">
																		<input readonly class="form-control"
																			id="SRDCmptnDmndYmd">
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
																		style="width: 300px; height: 110px;" id="SRDCn">
																</div>
															</div>
															<hr />
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

															<li class="nav-item" onclick="getSrHistoryList()"><a
																class="nav-link" data-toggle="tab" href="#srInfhistory"
																role="tab">SR 히스토리</a>
																<div class="slide"></div></li>
														</ul>
														<%-- *********************************** [ 계획정보 ] ***********************************--%>
														<div class="tab-content tabs card-block"
															style="padding: 0px; padding-top: 20px;">
															<div class="tab-pane active" id="home1" role="tabpanel"
																style="padding: 20px;">
																<div class="form-group row">
																	<div class="col-sm-6">
																		<div class="col col-sm-4">처리팀</div>
																		<div class="col col-sm-6">
																			<input readonly class="form-control" id="SRPlDeptNm">
																		</div>

																	</div>
																	<div class="col-sm-6">
																		<div class="col col-sm-4">담당자</div>
																		<div class="col col-sm-6">
																			<input readonly class="form-control" id="SRPlFlnm">
																		</div>
																	</div>
																</div>
																<div class="form-group row">
																	<div class="col-sm-6">
																		<div class="col col-sm-4">계획시작일</div>
																		<div class="col col-sm-6">
																			<input readonly class="form-control" id="SRPlBgngYmd">
																		</div>

																	</div>
																	<div class="col-sm-6">
																		<div class="col col-sm-4">계획종료일</div>
																		<div class="col col-sm-6">
																			<input readonly class="form-control" id="SRPlEndYmd">
																		</div>
																	</div>
																</div>
																<div class="form-group row">
																	<div class="col col-sm-2" style="line-height: 90px;">검토
																		내용</div>
																	<div class="col col-sm-9">
																		<textarea rows="5" cols="5" class="form-control"
																			id="SRPlRvwCn"></textarea>
																	</div>
																</div>
																<button class="btn btn-info"
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
																						<th style="width: 50px;">작업구분</th>
																						<th style="width: 300px;">시작일</th>
																						<th style="width: 300px;">종료일</th>
																						<th style="width: 50px;">진척률(누적)</th>
																						<th>산출물</th>
																					</tr>
																				</thead>
																				<tbody>
																					<tr>
																						<th scope="row">1</th>
																						<td class="prgrsIdTd">요구정의<input
																							type="hidden" value="" id="SRPgPrgrsId0"></td>
																						<td><input type="date" id="SRPgBgngYmd0"></td>
																						<td><input type="date" id="SRPgEndYmd0"></td>
																						<td><input type="text" class="form-control"
																							id="SRPgPrgrsRt0"></td>
																						<td>
																							<div class="accordion" id="accordionExample">
																								<button
																									class="btn btn-link btn-block text-center"
																									type="button" data-toggle="collapse"
																									data-target="#collapse0" aria-expanded="true"
																									aria-controls="collapse0">첨부파일</button>
																							</div>
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
																						<td><input type="date" id="SRPgBgngYmd1"></td>
																						<td><input type="date" id="SRPgEndYmd1"></td>
																						<td><input type="text" class="form-control"
																							id="SRPgPrgrsRt1"></td>
																						<td>
																							<div class="accordion" id="accordionExample">
																								<button
																									class="btn btn-link btn-block text-center"
																									type="button" data-toggle="collapse"
																									data-target="#collapse1" aria-expanded="true"
																									aria-controls="collapse1">첨부파일</button>
																							</div>
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
																						<td><input type="date" id="SRPgBgngYmd2"></td>
																						<td><input type="date" id="SRPgEndYmd2"></td>
																						<td><input type="text" class="form-control"
																							id="SRPgPrgrsRt2"></td>
																						<td>
																							<div class="accordion" id="accordionExample">
																								<button
																									class="btn btn-link btn-block text-center"
																									type="button" data-toggle="collapse"
																									data-target="#collapse2" aria-expanded="true"
																									aria-controls="collapse2">첨부파일</button>
																							</div>
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
																						<td><input type="date" id="SRPgBgngYmd3"></td>
																						<td><input type="date" id="SRPgEndYmd3"></td>
																						<td><input type="text" class="form-control"
																							id="SRPgPrgrsRt3"></td>
																						<td>
																							<div class="accordion" id="accordionExample">
																								<button
																									class="btn btn-link btn-block text-center"
																									type="button" data-toggle="collapse"
																									data-target="#collapse3" aria-expanded="true"
																									aria-controls="collapse3">첨부파일</button>
																							</div>
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
																						<td>반영요청<input type="hidden"
																							id="SRPgPrgrsId4"></td>
																						<td><input type="date" id="SRPgBgngYmd4"></td>
																						<td><input type="date" id="SRPgEndYmd4"></td>
																						<td><input type="text" class="form-control"
																							id="SRPgPrgrsRt4"></td>
																						<td>
																							<div class="accordion" id="accordionExample">
																								<button
																									class="btn btn-link btn-block text-center"
																									type="button" data-toggle="collapse"
																									data-target="#collapse4" aria-expanded="true"
																									aria-controls="collapse4">첨부파일</button>
																							</div>
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
																						<td>운영반영<input type="hidden"
																							id="SRPgPrgrsId5"></td>
																						<td><input type="date" id="SRPgBgngYmd5"></td>
																						<td><input type="date" id="SRPgEndYmd5"></td>
																						<td><input type="text" class="form-control"
																							id="SRPgPrgrsRt5"></td>
																						<td>
																							<div class="accordion" id="accordionExample">
																								<button
																									class="btn btn-link btn-block text-center"
																									type="button" data-toggle="collapse"
																									data-target="#collapse5" aria-expanded="true"
																									aria-controls="collapse5">첨부파일</button>
																							</div>
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
																<button class="btn btn-info"
																	onclick="deleteDeliverable()"
																	style="float: right; padding-bottom: 10px; margin-bottom: 10px; margin-right: 10px;">선택된
																	산출물 삭제</button>
																<button class="btn btn-info" id="addbtn"
																	style="float: right; padding-bottom: 10px; margin-bottom: 10px; margin-right: 10px;">산출물
																	추가</button>
																<button class="btn btn-info" onclick="addProgress()"
																	style="float: right; padding-bottom: 10px; margin-bottom: 10px;">저장</button>
																<button class="btn btn-info"
																	style="float: right; padding-bottom: 10px; margin-bottom: 10px; margin-right: 10px;">선택
																	삭제</button>
															</div>
															<%-- *********************************** [ 산출물  ] ***********************************--%>
															<%-- <div class="tab-pane" id="settings1" role="tabpanel"
																style="padding-bottom: 20px;">
																<div class="tab-pane" id="profile1" role="tabpanel">
																	<div class="card-block table-border-style"
																		style="padding: 0px;">
																		<div class="table-responsive">
																			<table class="table table-hover text-center" id="deliverableTable"
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
																					<tr>
																						<th scope="row">1</th>
																						<td><input type="checkbox" name="output"></td>
																						<td>요구정의</td>
																						<td>요구사항_명세서.pdf</td>
																						<td>2023-02-24</td>
																					</tr>
																					<tr>
																						<th scope="row">2</th>
																						<td><input type="checkbox" name="output"></td>
																						<td>분석/설계</td>
																						<td>소프트웨어_설계서.pdf</td>
																						<td>2023-02-28</td>
																					</tr>
																					<tr>
																						<th scope="row">3</th>
																						<td><input type="checkbox" name="output"></td>
																						<td></td>
																						<td></td>
																						<td></td>
																					</tr>
																				</tbody>
																			</table>
																		</div>
																	</div>
																</div>
																<button class="btn btn-info"
																	style="float: right; padding-bottom: 10px; margin-bottom: 10px;">저장</button>
																<button class="btn btn-info"
																	style="float: right; padding-bottom: 10px; margin-bottom: 10px; margin-right: 10px;">선택
																	삭제</button>
																<div class="btn btn-info" id="addbtn"
																	style="float: right; padding-bottom: 10px; margin-bottom: 10px; margin-right: 10px;">추가</div>
															</div> --%>
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
	</div>
	<%@include file="/WEB-INF/views/history/approvalInfoHistoryModal.jsp"%>
	<%@include file="/WEB-INF/views/history/addHistoryModal.jsp"%>
	<%@include file="/WEB-INF/views/srInfo/addSrResourcesModal.jsp"%>
	<%@include file="/WEB-INF/views/fragments/bottom.jsp"%>
</body>
</html>
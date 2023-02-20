<%@page contentType="text/html; charset=UTF-8"%>

<%-- 작성자 : 여수한 / 작성 날짜 : 2023-02-17 --%>

<html>
<head>
<%@include file="/WEB-INF/views/fragments/header.jsp"%>
</head>
<script>
	
<%-- 달력--%>
	/* $(function() {
		$("#startDatepicker").datepicker({
			showOn : "both",
			buttonImage : "resources/assets/images/button.png",
			buttonImageOnly : true,
			changeMonth : true,
			changeYear : true,
			showButtonPanel : true,
			currentText : '오늘 날짜',
			closeText : '닫기',
			dateFormat : "yy-mm-dd",
			minDate : -0,
			todayHighlight : true,
			language : "ko"

		});
		$('#addDatepicker').datepicker('setDate', 'today');
		$('button.ui-datepicker-current').on(
				'click',
				function() {
					$.datepicker._curInst.input.datepicker('setDate',
							new Date()).datepicker('hide').blur();
				});
	});
	$(function() {
		$("#addDatepicker").datepicker({
			showOn : "both",
			buttonImage : "resources/assets/images/button.png",
			buttonImageOnly : true,
			changeMonth : true,
			changeYear : true,
			showButtonPanel : true,
			currentText : '오늘 날짜',
			closeText : '닫기',
			dateFormat : "yy-mm-dd",
			minDate : -0,
			todayHighlight : true,
			language : "ko"

		});
		$('#addDatepicker').datepicker('setDate', 'today');
		$('button.ui-datepicker-current').on(
				'click',
				function() {
					$.datepicker._curInst.input.datepicker('setDate',
							new Date()).datepicker('hide').blur();
				});
	});
	$(function() {
		$("#endDatepicker").datepicker({
			showOn : "both",
			buttonImage : "resources/assets/images/button.png",
			buttonImageOnly : true,
			changeMonth : true,
			changeYear : true,
			showButtonPanel : true,
			currentText : '오늘 날짜',
			closeText : '닫기',
			dateFormat : "yy-mm-dd",
			minDate : -0,
			todayHighlight : true,
			language : "ko"

		});
		$('#addDatepicker').datepicker('setDate', 'today');
		$('button.ui-datepicker-current').on(
				'click',
				function() {
					$.datepicker._curInst.input.datepicker('setDate',
							new Date()).datepicker('hide').blur();
				});
	});
	
	$(function() {
		$("#requestDatepicker").datepicker({
			showOn : "both",
			buttonImage : "resources/assets/images/button.png",
			buttonImageOnly : true,
			changeMonth : true,
			changeYear : true,
			showButtonPanel : true,
			currentText : '오늘 날짜',
			closeText : '닫기',
			dateFormat : "yy-mm-dd",
			minDate : -0,
			todayHighlight : true,
			language : "ko"

		});
		$('button.ui-datepicker-current').on(
				'click',
				function() {
					$.datepicker._curInst.input.datepicker('setDate',
							new Date()).datepicker('hide').blur();
				});
	});
	
	$(function() {
		$("#endRequestDatepicker").datepicker({
			showOn : "both",
			buttonImage : "resources/assets/images/button.png",
			buttonImageOnly : true,
			changeMonth : true,
			changeYear : true,
			showButtonPanel : true,
			currentText : '오늘 날짜',
			closeText : '닫기',
			dateFormat : "yy-mm-dd",
			minDate : -0,
			todayHighlight : true,
			language : "ko"

		});
		$('button.ui-datepicker-current').on(
				'click',
				function() {
					$.datepicker._curInst.input.datepicker('setDate',
							new Date()).datepicker('hide').blur();
				});
	}); */
	/*  */
	/* $(function() {
		$("#firStartDatepicker").datepicker({
			showOn : "both",
			buttonImage : "resources/assets/images/button.png",
			buttonImageOnly : true,
			changeMonth : true,
			changeYear : true,
			showButtonPanel : true,
			currentText : '오늘 날짜',
			closeText : '닫기',
			dateFormat : "yy-mm-dd",
			minDate : -0,
			todayHighlight : true,
			language : "ko"

		});
		$('button.ui-datepicker-current').on(
				'click',
				function() {
					$.datepicker._curInst.input.datepicker('setDate',
							new Date()).datepicker('hide').blur();
				});
	});
	$(function() {
		$("#firEndDatepicker").datepicker({
			showOn : "both",
			buttonImage : "resources/assets/images/button.png",
			buttonImageOnly : true,
			changeMonth : true,
			changeYear : true,
			showButtonPanel : true,
			currentText : '오늘 날짜',
			closeText : '닫기',
			dateFormat : "yy-mm-dd",
			minDate : -0,
			todayHighlight : true,
			language : "ko"

		});
		$('button.ui-datepicker-current').on(
				'click',
				function() {
					$.datepicker._curInst.input.datepicker('setDate',
							new Date()).datepicker('hide').blur();
				});
	});
	$(function() {
		$("#secStartDatepicker").datepicker({
			showOn : "both",
			buttonImage : "resources/assets/images/button.png",
			buttonImageOnly : true,
			changeMonth : true,
			changeYear : true,
			showButtonPanel : true,
			currentText : '오늘 날짜',
			closeText : '닫기',
			dateFormat : "yy-mm-dd",
			minDate : -0,
			todayHighlight : true,
			language : "ko"

		});
		$('button.ui-datepicker-current').on(
				'click',
				function() {
					$.datepicker._curInst.input.datepicker('setDate',
							new Date()).datepicker('hide').blur();
				});
	});
	$(function() {
		$("#secEndDatepicker").datepicker({
			showOn : "both",
			buttonImage : "resources/assets/images/button.png",
			buttonImageOnly : true,
			changeMonth : true,
			changeYear : true,
			showButtonPanel : true,
			currentText : '오늘 날짜',
			closeText : '닫기',
			dateFormat : "yy-mm-dd",
			minDate : -0,
			todayHighlight : true,
			language : "ko"

		});
		$('button.ui-datepicker-current').on(
				'click',
				function() {
					$.datepicker._curInst.input.datepicker('setDate',
							new Date()).datepicker('hide').blur();
				});
	});
	$(function() {
		$("#thrStartDatepicker").datepicker({
			showOn : "both",
			buttonImage : "resources/assets/images/button.png",
			buttonImageOnly : true,
			changeMonth : true,
			changeYear : true,
			showButtonPanel : true,
			currentText : '오늘 날짜',
			closeText : '닫기',
			dateFormat : "yy-mm-dd",
			minDate : -0,
			todayHighlight : true,
			language : "ko"

		});
		$('button.ui-datepicker-current').on(
				'click',
				function() {
					$.datepicker._curInst.input.datepicker('setDate',
							new Date()).datepicker('hide').blur();
				});
	});
	$(function() {
		$("#thrEndDatepicker").datepicker({
			showOn : "both",
			buttonImage : "resources/assets/images/button.png",
			buttonImageOnly : true,
			changeMonth : true,
			changeYear : true,
			showButtonPanel : true,
			currentText : '오늘 날짜',
			closeText : '닫기',
			dateFormat : "yy-mm-dd",
			minDate : -0,
			todayHighlight : true,
			language : "ko"

		});
		$('button.ui-datepicker-current').on(
				'click',
				function() {
					$.datepicker._curInst.input.datepicker('setDate',
							new Date()).datepicker('hide').blur();
				});
	});
	$(function() {
		$("#fourStartDatepicker").datepicker({
			showOn : "both",
			buttonImage : "resources/assets/images/button.png",
			buttonImageOnly : true,
			changeMonth : true,
			changeYear : true,
			showButtonPanel : true,
			currentText : '오늘 날짜',
			closeText : '닫기',
			dateFormat : "yy-mm-dd",
			minDate : -0,
			todayHighlight : true,
			language : "ko"

		});
		$('button.ui-datepicker-current').on(
				'click',
				function() {
					$.datepicker._curInst.input.datepicker('setDate',
							new Date()).datepicker('hide').blur();
				});
	});
	$(function() {
		$("#fourEndDatepicker").datepicker({
			showOn : "both",
			buttonImage : "resources/assets/images/button.png",
			buttonImageOnly : true,
			changeMonth : true,
			changeYear : true,
			showButtonPanel : true,
			currentText : '오늘 날짜',
			closeText : '닫기',
			dateFormat : "yy-mm-dd",
			minDate : -0,
			todayHighlight : true,
			language : "ko"

		});
		$('button.ui-datepicker-current').on(
				'click',
				function() {
					$.datepicker._curInst.input.datepicker('setDate',
							new Date()).datepicker('hide').blur();
				});
	});
	$(function() {
		$("#fiveStartDatepicker").datepicker({
			showOn : "both",
			buttonImage : "resources/assets/images/button.png",
			buttonImageOnly : true,
			changeMonth : true,
			changeYear : true,
			showButtonPanel : true,
			currentText : '오늘 날짜',
			closeText : '닫기',
			dateFormat : "yy-mm-dd",
			minDate : -0,
			todayHighlight : true,
			language : "ko"

		});
		$('button.ui-datepicker-current').on(
				'click',
				function() {
					$.datepicker._curInst.input.datepicker('setDate',
							new Date()).datepicker('hide').blur();
				});
	});
	$(function() {
		$("#fiveEndDatepicker").datepicker({
			showOn : "both",
			buttonImage : "resources/assets/images/button.png",
			buttonImageOnly : true,
			changeMonth : true,
			changeYear : true,
			showButtonPanel : true,
			currentText : '오늘 날짜',
			closeText : '닫기',
			dateFormat : "yy-mm-dd",
			minDate : -0,
			todayHighlight : true,
			language : "ko"

		});
		$('button.ui-datepicker-current').on(
				'click',
				function() {
					$.datepicker._curInst.input.datepicker('setDate',
							new Date()).datepicker('hide').blur();
				});
	});
	$(function() {
		$("#sixStartDatepicker").datepicker({
			showOn : "both",
			buttonImage : "resources/assets/images/button.png",
			buttonImageOnly : true,
			changeMonth : true,
			changeYear : true,
			showButtonPanel : true,
			currentText : '오늘 날짜',
			closeText : '닫기',
			dateFormat : "yy-mm-dd",
			minDate : -0,
			todayHighlight : true,
			language : "ko"

		});
		$('button.ui-datepicker-current').on(
				'click',
				function() {
					$.datepicker._curInst.input.datepicker('setDate',
							new Date()).datepicker('hide').blur();
				});
	});
	$(function() {
		$("#sixEndDatepicker").datepicker({
			showOn : "both",
			buttonImage : "resources/assets/images/button.png",
			buttonImageOnly : true,
			changeMonth : true,
			changeYear : true,
			showButtonPanel : true,
			currentText : '오늘 날짜',
			closeText : '닫기',
			dateFormat : "yy-mm-dd",
			minDate : -0,
			todayHighlight : true,
			language : "ko"

		});
		$('button.ui-datepicker-current').on(
				'click',
				function() {
					$.datepicker._curInst.input.datepicker('setDate',
							new Date()).datepicker('hide').blur();
				});
	}); */
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
										<div class="row">
											<%-- *********************************** [SR 요청 관리 ] ***********************************--%>
											<div class="col-xl-12">
												<div class="card">
													<div class="card-header">
														<div class="row">
															<div class="col-10">
																<h5>SR 요청 관리</h5>
															</div>
															<div class="col-2 pl-5">
																<button class="btn btn-info" id="addbtn">요청 등록</button>
															</div>
														</div>
														<hr />
														<form id="srSearchForm">
															<div class="row">
																<div class="col col-3 pr-0">
																	<label for="dmndYmdStart" style="margin-right: 10px;">조회
																		기간</label> <input type="date" name="dmndYmdStart"
																		id="dmndYmdStart"> ~ <input type="date"
																		name="dmndYmdEnd" id="dmndYmdEnd">
																</div>
																<div class="col col-2 pr-0">
																	<label for="sttsCd" style="margin-right: 10px;">진행
																		상태</label> <select id="sttsCd" name="sttsCd">
																		<option value="0">요청</option>
																		<option value="1">반려</option>
																		<option value="2">접수</option>
																		<option value="3">개발중</option>
																		<option value="4">테스트</option>
																		<option value="5">개발 완료</option>
																	</select>
																</div>
																<div class="col col-3 pr-0">
																	<label for="sysCd" style="margin-right: 10px;">관련
																		시스템</label> <select id="sysCd" name="sysCd">
																		<option value="0">워크넷</option>
																		<option value="1">고용정보원</option>
																	</select> <select id="taskSeCd" name="taskSeCd">
																		<option value="0">내부망</option>
																		<option value="1">외부망</option>
																	</select>
																</div>
																<div class="col col-xl-3">
																	<label for="keyWord" style="margin-right: 10px;">키워드</label>
																	<input type="text" name="keyWord" id="keyWord">
																	<button onclick="srSearch()" type="button"
																		class="btn btn-sm btn-info">
																		<i class="ti-search"></i>
																	</button>
																</div>
															</div>
														</form>
													</div>
												</div>
											</div>

											<%-- *********************************** [SR 요청 목록 ] ***********************************--%>
											<div class="col-xl-8 col-md-12">
												<div class="card">
													<div class="card-header">
														<h5>SR 요청 목록</h5>
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
														<div id="sales-analytics">
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
																				<th style="width: 200px;">SR제목</th>
																				<th>담당자</th>
																				<th>완료요청일</th>
																				<th>완료예정일</th>
																				<th>진행상태</th>
																			</tr>
																		</thead>
																		<tbody>
																			<tr>
																				<th scope="row">1</th>
																				<td>Mark</td>
																				<td>Otto</td>
																				<td>@mdo</td>
																				<td>@mdo</td>
																				<td>Mark</td>
																				<td>Otto</td>
																				<td>@mdo</td>
																				<td>@mdo</td>
																			</tr>
																			<tr>
																				<th scope="row">2</th>
																				<td>Jacob</td>
																				<td>Thornton</td>
																				<td>@fat</td>
																				<td>Jacob</td>
																				<td>Thornton</td>
																				<td>@fat</td>
																				<td>Jacob</td>
																				<td>Thornton</td>

																			</tr>
																			<tr>
																				<th scope="row">3</th>
																				<td>Larry</td>
																				<td>the Bird</td>
																				<td>@twitter</td>
																				<td>Larry</td>
																				<td>the Bird</td>
																				<td>@twitter</td>
																				<td>Larry</td>
																				<td>the Bird</td>

																			</tr>
																			<tr>
																				<th scope="row">3</th>
																				<td>Larry</td>
																				<td>the Bird</td>
																				<td>@twitter</td>
																				<td>Larry</td>
																				<td>the Bird</td>
																				<td>@twitter</td>
																				<td>Larry</td>
																				<td>the Bird</td>

																			</tr>
																			<tr>
																				<th scope="row">3</th>
																				<td>Larry</td>
																				<td>the Bird</td>
																				<td>@twitter</td>
																				<td>Larry</td>
																				<td>the Bird</td>
																				<td>@twitter</td>
																				<td>Larry</td>
																				<td>the Bird</td>

																			</tr>
																			<tr>
																				<th scope="row">3</th>
																				<td>Larry</td>
																				<td>the Bird</td>
																				<td>@twitter</td>
																				<td>Larry</td>
																				<td>the Bird</td>
																				<td>@twitter</td>
																				<td>Larry</td>
																				<td>the Bird</td>

																			</tr>
																			<tr>
																				<th scope="row">3</th>
																				<td>Larry</td>
																				<td>the Bird</td>
																				<td>@twitter</td>
																				<td>Larry</td>
																				<td>the Bird</td>
																				<td>@twitter</td>
																				<td>Larry</td>
																				<td>the Bird</td>

																			</tr>
																			<tr>
																				<th scope="row">3</th>
																				<td>Larry</td>
																				<td>the Bird</td>
																				<td>@twitter</td>
																				<td>Larry</td>
																				<td>the Bird</td>
																				<td>@twitter</td>
																				<td>Larry</td>
																				<td>the Bird</td>

																			</tr>
																			<tr>
																				<th scope="row">3</th>
																				<td>Larry</td>
																				<td>the Bird</td>
																				<td>@twitter</td>
																				<td>Larry</td>
																				<td>the Bird</td>
																				<td>@twitter</td>
																				<td>Larry</td>
																				<td>the Bird</td>
																			</tr>
																		</tbody>
																	</table>
																</div>
															</div>

														</div>
													</div>
												</div>
											</div>

											<%-- *********************************** [SR요청 처리정보 ] ***********************************--%>
											<div class="col-xl-4 col-md-12">
												<div class="card">
													<div class="card-header">
														<h5>SR요청 처리정보</h5>
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
													<ul class="nav nav-tabs  md-tabs" role="tablist">
														<li class="nav-item"><a class="nav-link active"
															data-toggle="tab" href="#srDemandDetail" role="tab">SR요청
																상세정보</a>
															<div class="slide"></div></li>
														<li class="nav-item"><a class="nav-link"
															data-toggle="tab" href="#srHistory" role="tab">SR
																히스토리</a>
															<div class="slide"></div></li>
													</ul>

													<div class="tab-content tabs card-block"
														style="padding: 0px; padding-top: 20px;">
														<div class="tab-pane active" id="srDemandDetail"
															role="tabpanel">
															<div class="card-block">
																<div class="card_body "
																	style="font-size: 12px; padding-top: 20px;">
																	<div class="form-group row">
																		<div class="col-sm-6">
																			<div class="col col-sm-4">SR번호</div>
																			<div class="col col-sm-6">
																				<input type="text" class="form-control">
																			</div>
																		</div>
																		<div class="col-sm-6">
																			<div class="col col-sm-4">요청구분</div>
																			<div class="col col-sm-6">
																				<input type="text" class="form-control">
																			</div>
																		</div>
																	</div>
																	<div class="form-group row">
																		<div class="col col-sm-2">SR 제목</div>
																		<div class="col col-sm-9">
																			<input type="text" class="form-control">
																		</div>
																	</div>
																	<div class="form-group row">
																		<div class="col col-sm-2">관련 근거</div>
																		<div class="col col-sm-9">
																			<input type="text" class="form-control">
																		</div>
																	</div>
																	<div class="form-group row">
																		<div class="col-sm-6">
																			<div class="col col-sm-4">시스템구분</div>
																			<div class="col col-sm-6">
																				<div class="dropdown dropdown open">
																					<form action="#">
																						<select name="languages" id="lang">
																							<option value="워크넷">워크넷</option>
																							<option value="굴국밥">굴국밥</option>
																							<option value="고소미">고소미</option>
																						</select>
																					</form>
																				</div>
																			</div>
																		</div>
																		<div class="col-sm-6">
																			<div class="col col-sm-4">업무구분</div>
																			<div class="dropdown dropdown open">
																				<form action="#">
																					<select name="languages" id="lang">
																						<option value="워크넷">내부망</option>
																						<option value="굴국밥">외부망</option>
																						<option value="고소미">구매</option>
																					</select>
																				</form>
																			</div>
																		</div>
																	</div>
																	<div class="form-group row">
																		<div class="col-sm-6">
																			<div class="col col-sm-4">요청기관</div>
																			<div class="col col-sm-6">
																				<div class="dropdown dropdown open">
																					<form action="#">
																						<select name="languages" id="lang">
																							<option value="워크넷">고용부</option>
																							<option value="굴국밥">오티아이</option>
																							<option value="고소미">네이버</option>
																						</select>
																					</form>
																				</div>
																			</div>

																		</div>
																		<div class="col-sm-6">
																			<div class="col col-sm-4">요청자</div>
																			<div class="dropdown dropdown open">
																				<form action="#">
																					<select name="languages" id="lang">
																						<option value="워크넷">워크넷 직원</option>
																						<option value="굴국밥">공무원</option>
																						<option value="고소미">직원</option>
																					</select>
																				</form>
																			</div>
																		</div>
																	</div>
																	<div class="form-group row">
																		<div class="col-sm-6">
																			<div class="col col-sm-4">요청일</div>
																			<div class="col col-sm-8">
																				<input type="date" id="requestDatepicker">
																			</div>
																		</div>
																		<div class="col-sm-6">
																			<div class="col col-sm-4">완료요청일</div>
																			<div class="col col-sm-8">
																				<input type="date" id="endRequestDatepicker">
																			</div>
																		</div>
																	</div>
																	<div class="row mt-3">
																		<div class="col-6">
																			<div class="col col-sm-4">개발 담당자</div>
																			<div class="col col-sm-6">
																				<input type="text" class="form-control" value="개발자1"
																					disabled>
																			</div>
																		</div>
																		<div class="col-6">
																			<div class="col col-sm-4">개발 부서</div>
																			<div class="col col-sm-6">
																				<input type="text" class="form-control" value="부서1"
																					disabled>
																			</div>
																		</div>
																	</div>
																	<div class="row mt-3">
																		<div class="col-6">
																			<div class="col col-sm-4">진행 상태</div>
																			<div class="col col-sm-6">
																				<input type="text" class="form-control" value="관리자1"
																					disabled>
																			</div>
																		</div>
																		<div class="col-6">
																			<div class="col col-sm-4">완료(예정)일</div>
																			<div class="col col-sm-6">
																				<input type="text" class="form-control"
																					value="000-0000-0000" disabled>
																			</div>
																		</div>
																	</div>
																	<div class="row mt-3">
																		<div class="col-6">
																			<div class="col col-sm-4">검토자 이름</div>
																			<div class="col col-sm-6">
																				<input type="text" class="form-control" value="관리자1"
																					disabled>
																			</div>
																		</div>
																		<div class="col-6">
																			<div class="col col-sm-4">부서 번호</div>
																			<div class="col col-sm-6">
																				<input type="text" class="form-control"
																					value="000-0000-0000" disabled>
																			</div>
																		</div>
																	</div>

																	<div class="row mt-3 ml-1">
																		<label class="col-sm-3 col-form-label px-0"
																			style="line-height: 120px">반려 사유</label>
																		<div class="col-sm-9 pl-0 ">
																			<textarea rows="5" cols="5" class="form-control"></textarea>
																		</div>
																	</div>
																	<div class="form-group row">
																		<label class="col-sm-2 col-form-label"
																			style="line-height: 100px; font-size: 12px;">SR
																			내용</label>
																		<div class="col-sm-9">
																			<textarea rows="5" cols="5" class="form-control"
																				style="height: 100px;"></textarea>
																		</div>
																	</div>
																	<div class="form-group row">
																		<label class="col-sm-3 col-form-label"
																			style="font-size: 12px;">첨부파일</label>
																		<div class="col-sm-9">
																			<input type="file" class="">
																		</div>
																	</div>
																	<div class="row">
																		<div class="col-6"></div>
																		<div class="col-6" style="text-align: right">
																			<button class="btn btn-primary btn-round save center">승인</button>

																			<button
																				class="btn btn-primary btn-round danger cancle">반려</button>
																		</div>
																	</div>
																</div>
															</div>
														</div>
														<%-- *********************************** [ SR 히스토리  ] ***********************************--%>
														<div class="tab-pane" id="srHistory" role="tabpanel">
															<div class="card-block table-border-style"
																style="padding: 0px;">
																<div class="table-responsive">
																	<table class="table table-hover text-center"
																		style="font-size: 12px; padding: 0px;">
																		<thead>
																			<tr>
																				<th style="width: 1px;">순번</th>
																				<th>제목</th>
																				<th>변경된 완료예정일</th>
																				<th>수락여부</th>
																			</tr>
																		</thead>
																		<tbody>
																			<tr data-toggle="modal"
																				data-target="#addHistoryModalDetail">
																				<th scope="row">1</th>
																				<td>@mdo</td>
																				<td>@mdo</td>
																				<td>@mdo</td>
																			</tr>
																			<tr data-toggle="modal"
																				data-target="#addHistoryModalDetail">
																				<th scope="row">2</th>
																				<td>@mdo</td>
																				<td>@mdo</td>
																				<td>@mdo</td>
																			</tr>
																			<tr data-toggle="modal"
																				data-target="#addHistoryModalDetail">
																				<th scope="row">3</th>
																				<td>@mdo</td>
																				<td>@mdo</td>
																				<td>@mdo</td>
																			</tr>
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

	<%@include file="/WEB-INF/views/fragments/bottom.jsp"%>

	<!-- 검색 -->
	<script src="/resources/assets/js/srDemandList.js"></script>

	<!-- 모달 -->
	<jsp:include page="/WEB-INF/views/history/approvalHistoryModal.jsp" />
	<jsp:include page="/WEB-INF/views/srDemand/srDemandDetail.jsp" />
	<jsp:include page="/WEB-INF/views/srDemand/modal.jsp" />
	<%@include file="/WEB-INF/views/history/addHistoryModal.jsp"%>
	<%@include file="/WEB-INF/views/history/addHistoryModalDetail.jsp"%>
</body>
</html>
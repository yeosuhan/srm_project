<%@page contentType="text/html; charset=UTF-8"%>

<%-- <html>
<head>
<%@include file="/WEB-INF/views/fragments/header.jsp"%>
</head> --%>
<script>
	$(document).on('click', '#addbtn', function(e) {
		console.log("click event");
		$('#addmodal').addClass('show');

	});
	$(document).on('click', '#closebtn', function(e) {
		console.log("click event");
		$('#addmodal').removeClass('show');

	});
	/* 요청 수정 */
	$(document).on('click', '#modbtn', function(e) {
		console.log("click event");
		$('#modmodal').addClass('show');
	});
	$(document).on('click', '#closebtn', function(e) {
		console.log("click event");
		$('#modmodal').removeClass('show');

	});
	/* 개발 등록 */
	$(document).on('click', '#devbtn', function(e) {
		console.log("click event");
		$('#devmodal').addClass('show');

	});
	$(document).on('click', '#closebtn', function(e) {
		console.log("click event");
		$('#devmodal').removeClass('show');

	});
	/* 달력 */
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
		$("#addEndRequestDatepicker").datepicker({
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
		$("#modDatepicker").datepicker({
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
		$("#modEndRequestDatepicker").datepicker({
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
		$("#devDatepicker").datepicker({
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
</script>
<style>
img {
	width: 29px;
	vertical-align: top;
}

#addDatepicker, #addEndRequestDatepicker, #modDatepicker,
	#modEndRequestDatepicker, #devDatepicker {
	width: 90px;
}

.col-sm-4 {
	padding: 0px;
}
</style>
<body>
	<!-- *********************************** [ modal start ] ***********************************-->
	<!-- *********************************** [ SR 요청 등록 ] ***********************************-->
	<div class="modal" id="addmodal">
		<div class="modal_body">
			<div class="m_head">
				<div class="modal_title" style="color: white;">SR 요청 등록</div>
			</div>
			<div class="m_body">
				<div class="form-group row">
					<div class="col-sm-6">
						<div class="col col-sm-4">등록자</div>
						<div class="col col-sm-6">
							<input type="text" class="form-control">
						</div>
					</div>
					<div class="col-sm-6">
						<div class="col col-sm-4">소속</div>
						<div class="col col-sm-6">
							<input type="text" class="form-control">
						</div>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-sm-6">
						<div class="col col-sm-4">등록일</div>
						<div class="col col-sm-6">
							<input type="text" id="addDatepicker">
						</div>

					</div>

					<div class="col-sm-6">
						<div class="col col-sm-4">관련 시스템</div>
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
				</div>
				<hr />
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
					<label class="col-sm-2 col-form-label" style="line-height: 120px">SR
						내용</label>
					<div class="col-sm-9">
						<textarea rows="5" cols="5" class="form-control"></textarea>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2 col-form-label">첨부파일</label>
					<div class="col-sm-9">
						<input type="file" class="">
					</div>
				</div>
				<div class="form-group row">
					<div class="col-sm-6">
						<div class="col col-sm-4">완료 요청일</div>
						<div class="col col-sm-6">
							<input type="text" id="addEndRequestDatepicker">
						</div>
					</div>
				</div>
			</div>
			<div class="m_footer">
				<div class="modal_btn save center" id="savebtn">등록</div>
				<div class="modal_btn danger cancle" id="closebtn">닫기</div>
			</div>
		</div>

	</div>
	<!-- *********************************** [ SR 요청 수정 ] *********************************** -->
	<div class="modal" id="modmodal">
		<div class="modal_body">
			<div class="m_head">
				<div class="modal_title" style="color: white;">SR 요청 수정</div>
			</div>
			<div class="m_body">
				<div class="form-group row">
					<div class="col-sm-6">
						<div class="col col-sm-4">등록자</div>
						<div class="col col-sm-6">
							<input type="text" class="form-control">
						</div>
					</div>
					<div class="col-sm-6">
						<div class="col col-sm-4">소속</div>
						<div class="col col-sm-6">
							<input type="text" class="form-control">
						</div>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-sm-6">
						<div class="col col-sm-4">등록일</div>
						<div class="col col-sm-6">
							<input type="text" id="modDatepicker">
						</div>
					</div>
					<div class="col-sm-6">
						<div class="col col-sm-4">관련 시스템</div>
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
				</div>
				<hr />
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
					<label class="col-sm-2 col-form-label" style="line-height: 120px">SR
						내용</label>
					<div class="col-sm-9">
						<textarea rows="5" cols="5" class="form-control"></textarea>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2 col-form-label">첨부파일</label>
					<div class="col-sm-9">
						<input type="file" class="">
					</div>
				</div>
				<div class="form-group row">
					<div class="col-sm-6">
						<div class="col col-sm-4">완료 요청일</div>
						<div class="col col-sm-6">
							<input type="text" id="modEndRequestDatepicker">
						</div>
					</div>
				</div>
			</div>
			<div class="m_footer">
				<div class="modal_btn save center" id="savebtn">삭제</div>
				<div class="modal_btn save center" id="savebtn">저장</div>
				<div class="modal_btn danger cancle" id="closebtn">닫기</div>
			</div>
		</div>
	</div>
	<!-- *********************************** [ SR 개발 등록 ] *********************************** -->
	<div class="modal" id="devmodal">
		<div class="modal_devbody">
			<div class="m_devhead">
				<div class="modal_title" style="color: white;">SR 개발 등록</div>
			</div>
			<div class="m_devbody">
				<div class="form-group row">
					<div class="col-sm-6">
						<div class="col col-sm-4">등록자</div>
						<div class="col col-sm-6">
							<input type="text" class="form-control">
						</div>
					</div>
					<div class="col-sm-6">
						<div class="col col-sm-4">소속</div>
						<div class="col col-sm-6">
							<input type="text" class="form-control">
						</div>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-sm-6">
						<div class="col col-sm-4">등록일</div>
						<div class="col col-sm-6">
							<input type="text" class="form-control">
						</div>
					</div>
					<div class="col-sm-6">
						<div class="col col-sm-4">관련 시스템</div>
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
				</div>
				<hr />
				<div class="form-group row">
					<div class="col-sm-6">
						<div class="col col-sm-4">개발 담당자</div>
						<div class="col col-sm-6">
							<input type="text" class="form-control">
						</div>
					</div>
					<div class="col-sm-6">
						<div class="col col-sm-4">개발 부서</div>
						<div class="col col-sm-6">
							<input type="text" class="form-control">
						</div>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-sm-6">
						<div class="col col-sm-4">진행 상태</div>
						<div class="col col-sm-6">
							<div class="dropdown dropdown open">
								<form action="#">
									<select name="languages" id="lang">
										<option value="요청">요청</option>
										<option value="반려">반려</option>
										<option value="접수">접수</option>
										<option value="개발중">개발중</option>
										<option value="테스트">테스트</option>
										<option value="개발완료">개발완료</option>
									</select>
								</form>
							</div>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="col col-sm-4">완료(예정)일</div>
						<div class="col col-sm-6">
							<input type="text" id="devDatepicker">
						</div>
					</div>
				</div>

				<div class="form-group row">
					<div class="col-sm-6">
						<div class="col col-sm-4">관련 부서</div>
						<div class="col col-sm-6">
							<input type="text" class="form-control">
						</div>
					</div>
					<div class="col-sm-6">
						<div class="col col-sm-4">우선 순위</div>
						<div class="col col-sm-6">
							<div class="dropdown dropdown open">
								<form action="#">
									<select name="languages" id="lang">
										<option value="상">상</option>
										<option value="중">중</option>
										<option value="하">하</option>
									</select>
								</form>
							</div>
						</div>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2 col-form-label" style="line-height: 120px">검토
						내용</label>
					<div class="col-sm-9">
						<textarea rows="5" cols="5" class="form-control"></textarea>
					</div>
				</div>
				<hr />
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
					<label class="col-sm-2 col-form-label" style="line-height: 120px">SR
						내용</label>
					<div class="col-sm-9">
						<textarea rows="5" cols="5" class="form-control"></textarea>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2 col-form-label">첨부파일</label>
					<div class="col-sm-9">
						<input type="file" class="">
					</div>
				</div>
				<div class="form-group row">
					<div class="col-sm-6">
						<div class="col col-sm-4">완료 요청일</div>
						<div class="col col-sm-6">
							<input type="text" class="form-control">
						</div>
					</div>
				</div>
			</div>
			<div class="m_footer">
				<div class="modal_btn save center" id="savebtn">저장</div>
				<div class="modal_btn danger cancle" id="closebtn">닫기</div>
			</div>
		</div>
	</div>
	<%-- <!-- *********************************** [ modal end ] ***********************************-->
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
										<!-- *********** -->
										<div class="card">
											<div class="card-header">SpringFramework 복습</div>
											<div class="card-body">
												<div class="btn btn-info btn-sm" id="addbtn">요청 등록</div>
												<div class="btn btn-info btn-sm" id="modbtn">요청 수정</div>
												<div class="btn btn-info btn-sm" id="devbtn">개발 등록</div>
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
				</div>
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/fragments/bottom.jsp"%>
</body>
</html> --%>
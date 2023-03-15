<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- 작성자: 최은종 / 작성 날짜: 230217 --%>

<script>
	function show() {
		$("#ModalRegister").modal("show");
	}
</script>

<style>
.modal-header {
	color: white;
}
</style>

<%------------- Modal ---------------%>
<%-- div id값으로 모달 호출 --%>
<div class="modal fade" id="ModalRegister" tabindex="-1" role="dialog"
	aria-labelledby="ModalLabelRegister" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header" style="height:55px;">
				<h4 class="modal-title" style="font-weight: bold;" id="ModalDepartmentRegister" style="">신규
					부서 등록</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: white">×</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="card mb-2" id="RegisterInfo">
					<div class="card-block">
						<form class="form-material" id="registerDeptInfo" method="post"
							action="<c:url value='/admin/department/add'/>">
							<div class="form-group row">
								<p class="col-sm-4 font-weight-bold mt-2">부서명</p>
								<div class="col-sm-8" id="MDepartmentName">
									<input name="deptNm" type="text" class="form-control"
										required="" style="width: 90%" placeholder="부서명 (한글)"
										value="${department.deptNm}">
								</div>
							</div>
							<div class="form-group row">
								<p class="col-sm-4 font-weight-bold mt-2">부서코드</p>
								<div class="col-sm-8" id="MDepartmentCode">
									<input name="deptCd" type="text"
										class="form-control form-control-uppercase" required=""
										style="width: 90%" placeholder="부서코드 (영문+숫자)"
										value="${department.deptCd}">
								</div>
							</div>
							<div class="form-group form-default row">
								<p class="col-sm-4 font-weight-bold mt-2">부서 전화번호</p>
								<div class="col-sm-8" id="MDepartmentTel">
									<input name="ofcTelno" type="text" class="form-control"
										required="" style="width: 90%" placeholder="부서 전화번호"
										value="${department.ofcTelno}">
								</div>
							</div>
							<div class="form-group row">
								<p class="col-sm-4 font-weight-bold mt-2">부서 담당자</p>
								<div class="col-sm-8" id="MDepartmentManager">
									<input name=flnm type="text" class="form-control" required=""
										style="width: 90%" placeholder="부서 담당자"
										value="${department.flnm}">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div align="center">
				<button type="submit" form="registerDeptInfo"
					class="btn btn-oti btn-sm waves-effect waves-light mb-2">등록</button>
			</div>
		</div>
	</div>
</div>

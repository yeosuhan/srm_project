<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- 작성자: 최은종 / 작성 날짜: 230217 --%>

<script>
	function show1() {
		$("#ModalRegister").modal("show");
	}
</script>

<style>
.modal-header {
	background-color: #4778FF;
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
			<div class="modal-header">
				<h4 class="modal-title" id="ModalDepartmentRegister" style="">신규
					부서 등록</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: white">×</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="card mb-2" id="RegisterInfo">
					<div class="card-block">
						<form class="form-material">
							<div class="form-group row">
								<p class="col-sm-4 font-weight-bold mt-2">부서명 (한글)</p>
								<div class="col-sm-8" id="MDepartmentKorName">
									<input type="text" class="form-control" required=""
										style="width: 90%" placeholder="부서명 (한글)">
								</div>
							</div>
							<div class="form-group row">
								<p class="col-sm-4 font-weight-bold mt-2">부서명 (영문)</p>
								<div class="col-sm-8" id="MDepartmentEngName">
									<input type="text" class="form-control form-control-uppercase"
										required="" style="width: 90%" placeholder="부서명 (영문)">
								</div>
							</div>
							<div class="form-group form-default row">
								<p class="col-sm-4 font-weight-bold mt-2">부서 전화번호</p>
								<div class="col-sm-8" id="MDepartmentTel">
									<input type="text" class="form-control" required=""
										style="width: 90%" placeholder="부서 전화번호">
								</div>
							</div>
							<div class="form-group row">
								<p class="col-sm-4 font-weight-bold mt-2">부서 담당자</p>
								<div class="col-sm-8" id="MDepartmentManager">
									<input type="text" class="form-control" required=""
										style="width: 90%" placeholder="부서 담당자">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div align="center">
				<form method="post">
					<button type="button" id="registerDepartment"
						class="btn btn-primary btn-sm btn-round waves-effect waves-light mb-2">등록</button>
				</form>
			</div>
		</div>
	</div>
</div>

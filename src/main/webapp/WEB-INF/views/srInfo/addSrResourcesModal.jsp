<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal" id="addSrResourcesModal" >
	
	<div class = "modal-body modal-dialog modal-lg" style="height:700px">
		<div class="m_head ">
			<div class="modal_title" style="color:white">SR 요청 상세</div>
			<!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
		</div>
		<div class="m_body bg-light">
			<div class="row">
				<div class="col-6">
					<div id="calendar" style="width:100%"></div>
					
				</div>
				<div class="col-6 border-left-1">
					<form id="resourceForm" action="/" method="POST">
						<div class="row my-3">
							<div class="col-6">SR제목 : </div>
							<div class="col-6">
								<input type="text" id="srNo" name="srNo" value="테스트" disabled>
							</div>
						</div>
						<div class="row my-3">
							<div class="col-6">요청기관 : </div>
							<div class="col-6">
								<input type="text" value="고용부" disabled>
							</div>
						</div>
						<div class="row my-3">
							<div class="col-6">부서 : </div>
							<div class="col-6">
								<select id="deptCd" name="deptCd" disabled>
									<option value="DVLP01" selected>개발1팀</option>
									<option value="DVLP02">개발2팀</option>
								</select>
							</div>
						</div>
						<div class="row my-3">
							<div class="col-6">투입 인력 : </div>
							<div class="col-6">
								<select id="empId" name="empId" onchange="showSchedule()">
									
								</select>
							</div>
						</div>
						<div class="row my-3">
							<div class="col-6">역할 : </div>
							<div class="col-6">
								<select id="ptcptnRoleCd" name="ptcptnRoleCd">
									<option value="0">개발자</option>
									<option value="1">QA</option>
								</select>
							</div>
						</div>
						<div class="row my-3">
							<div class="col-6"><label for="schdlBgngYmd">투입 시작일 : </label></div>
							<div class="col-6">
								<input type="date" id="schdlBgngYmd" name="schdlBgngYmd">
							</div>
						</div>
						<div class="row my-3">
							<div class="col-6"><label for="schdlEndYmd">투입 종료일 : </label></div>
							<div class="col-6">
								<input type="date" id="schdlEndYmd" name="schdlEndYmd">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="m_footer bg-light">
		
			<button class="btn btn-info save center" data-dismiss="modal" >확인</button>
		
			<button class="btn btn-danger danger cancle" data-dismiss="modal">닫기</button>
				
		</div>
	</div>

</div>
<!-- fullcalendar CDN -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<!-- fullcalendar 언어 CDN -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>

<script src="/resources/assets/js/addSrResourcesModal.js"></script>
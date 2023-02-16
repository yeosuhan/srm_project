<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal" id="addSrResourcesModal" >
	
	<div class = "modal-body modal-dialog modal-lg">
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
								<input type="text" value="테스트" disabled>
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
								<select onchange="" id="empId" name="empId">
									<option>개발1팀</option>
									<option>개발2팀</option>
								</select>
							</div>
						</div>
						<div class="row my-3">
							<div class="col-6">투입 인력 : </div>
							<div class="col-6">
								<select id="empId" name="empId">
									<option>홍길동</option>
									<option>감자바</option>
								</select>
							</div>
						</div>
						<div class="row my-3">
							<div class="col-6">역할 : </div>
							<div class="col-6">
								<select id="ptcptnRoleCd" name="ptcptnRoleCd">
									<option>개발자</option>
									<option>QA</option>
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
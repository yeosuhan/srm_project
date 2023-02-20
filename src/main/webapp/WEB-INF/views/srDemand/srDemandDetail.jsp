<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--
	작성자: 안한길
	작성일: 2023.02.17.
	내용  : sr 요청 상세 모달
 --%>
<div class="modal" id="srDemandModal">

	<div class="modal-body modal-dialog modal-lg">
		<div class="m_head ">
			<div class="modal_title" style="color: white">SR 요청 상세</div>
			<!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
		</div>
		<div class="m_body bg-light" style="height: 100%;">
			<form action="/" method="post">
				<div class="row mt-3">
					<div class="col-6">
						<div class="col col-sm-4">등록자</div>
						<div class="col col-sm-6">
							<input type="text" class="form-control" value="홍길동" disabled>
						</div>

					</div>
					<div class="col-6">
						<div class="col col-sm-4">소속</div>
						<div class="col col-sm-6">
							<input type="text" class="form-control" value="고용부" disabled>
						</div>

					</div>
				</div>
				<div class="row  mt-3">
					<div class="col-6">
						<div class="col col-sm-4">등록일</div>
						<div class="col col-sm-6">
							<input type="text" class="form-control" value="2023.02.13."
								disabled>
						</div>
					</div>
					<div class="col-6">
						<div class="col col-sm-4">관련 시스템</div>
						<div class="col col-sm-6">
							<input type="text" class="form-control" value="워크넷" disabled>
						</div>
					</div>
				</div>
				<div class="row mt-3">
					<div class="col-6">
						<div class="col col-sm-4">요청 상태</div>
						<div class="col col-sm-6">
							<input type="text" class="form-control" value="요청" disabled>
						</div>
					</div>
					<div class="col-6">
						<div class="col col-sm-4">요청 완료일</div>
						<div class="col col-sm-6">
							<input type="text" class="form-control" value="2023.02.18."
								disabled>
						</div>
					</div>
				</div>
				<div class="row mt-3">
					<div class="col-6">
						<div class="col col-sm-4">개발 담당자</div>
						<div class="col col-sm-6">
							<input type="text" class="form-control" value="개발자1" disabled>
						</div>
					</div>
					<div class="col-6">
						<div class="col col-sm-4">개발 부서</div>
						<div class="col col-sm-6">
							<input type="text" class="form-control" value="부서1" disabled>
						</div>
					</div>
				</div>
				<div class="row mt-3">
					<div class="col-6">
						<div class="col col-sm-4">진행 상태</div>
						<div class="col col-sm-6">
							<input type="text" class="form-control" value="관리자1" disabled>
						</div>
					</div>
					<div class="col-6">
						<div class="col col-sm-4">완료(예정)일</div>
						<div class="col col-sm-6">
							<input type="text" class="form-control" value="000-0000-0000"
								disabled>
						</div>
					</div>
				</div>
				<div class="row mt-3">
					<div class="col-6">
						<div class="col col-sm-4">검토자 이름</div>
						<div class="col col-sm-6">
							<input type="text" class="form-control" value="관리자1" disabled>
						</div>
					</div>
					<div class="col-6">
						<div class="col col-sm-4">부서 번호</div>
						<div class="col col-sm-6">
							<input type="text" class="form-control" value="000-0000-0000"
								disabled>
						</div>
					</div>
				</div>

				<div class="row mt-3 ml-1">
					<label class="col-sm-2 col-form-label" style="line-height: 120px">반려
						사유</label>
					<div class="col-sm-9 pl-0 pr-4">
						<textarea rows="5" cols="5" class="form-control"></textarea>
					</div>
				</div>
				<div class="row mt-3 ml-1">
					<label class="col-sm-2 col-form-label" for="ttl">SR 내용</label>
					<div class="col-sm-9 pl-0 pr-4">
						<input class="form-control" id="ttl" name="ttl" disabled
							value="워크넷 모바일 화면 수정">
					</div>
				</div>
				<div class="row mt-3 ml-1">
					<div class="col col-sm-2">관련 근거</div>
					<div class="col col-sm-9 pl-0 pr-4">
						<input type="text" class="form-control" value="테스트" disabled>
					</div>
				</div>
				<div class="row mt-3 ml-1">
					<label class="col-sm-2 col-form-label" style="line-height: 120px">SR
						내용</label>
					<div class="col-sm-9 pl-0 pr-4">
						<textarea rows="5" cols="5" class="form-control" disabled>테스트 내용</textarea>
					</div>
				</div>
				<div class="row mt-3 ml-1">
					<div class="col-12">첨부 파일</div>
				</div>

			</form>
		</div>
		<div class="m_footer bg-light">

			<button class="btn btn-info save center" data-dismiss="modal">승인</button>

			<button class="btn btn-danger danger cancle" data-dismiss="modal">반려</button>

		</div>
	</div>

</div>
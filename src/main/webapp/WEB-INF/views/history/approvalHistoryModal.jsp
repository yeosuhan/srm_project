<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="modal fade" id="approvalHistoryModal">

	<div class="modal-body modal-dialog modal-lg" style="height:600px;">
		<div class="m_head ">
			<div class="modal_title" style="color: white">완료 예정일 수정 요청/ 개발
				취소 요청</div>

		</div>
		<div class="m_body bg-light">
			<form id="resourceForm" action="/" method="POST">
				<div class="row my-3">
					<div class="col-2">SR 번호 :</div>
					<div class="col-10">
						<input style="width: 90%" type="text" value="테스트" disabled>
					</div>
				</div>
				<div class="row my-3">
					<div class="col-2">요청 기관 :</div>
					<div class="col-4">
						<input type="text" value="고용부" disabled>
					</div>
					<div class="col-2">요청 시스템 :</div>
					<div class="col-4">
						<input type="text" value="개발1팀" disabled>
					</div>
				</div>
				<div class="row my-3">
					<div class="col-2">담당부서 :</div>
					<div class="col-4">
						<input type="text" value="고용부" disabled>
					</div>
					<div class="col-2">작성일 :</div>
					<div class="col-4">
						<input type="text" value="개발1팀" disabled>
					</div>
				</div>
				<div class="row my-3">
					<div class="col-2">
						<label for="">기존 예정일 : </label>
					</div>
					<div class="col-4">
						<input type="text" value="2023.02.24." disabled>
					</div>
					<div class="col-2">
						<label for="chgEndYmd">요청 예정일 : </label>
					</div>
					<div class="col-4">
						<input type="text" value="2023.02.30." disabled>
					</div>
				</div>
				<div class="row my-3">
					<div class="col-2">제목 :</div>
					<div class="col-10">
						<input style="width: 90%" type="text" value="기간 연장" disabled>
					</div>
				</div>
				<div class="row my-3">
					<div class="col-2">내용 :</div>
					<div class="col-10">
						<textarea style="width: 90%" rows="5" disabled>기간연장을 요청합니다.</textarea>
					</div>
				</div>
			</form>


			<div class="pt-3" align="center">
				<button type="submit" form="" class="btn btn-info save center"
					data-dismiss="modal">승인</button>

				<button type="submit" form="" class="btn btn-danger danger cancle"
					data-dismiss="modal">반려</button>
			</div>
		</div>


	</div>

</div>
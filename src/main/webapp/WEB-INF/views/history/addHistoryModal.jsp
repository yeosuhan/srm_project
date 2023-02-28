<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="modal" id="addHistoryModal">

	<div class="modal-body modal-dialog modal-lg" style="height: 600px">
		<div class="m_head ">
			<div class="modal_title" style="color: white">진척 정보 변경 요청</div>
			<!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
		</div>
		<div class="m_body bg-light">
			<form id="historyForm" action="<c:url value='/history/add'/>"
				method="post" class="form-material">
				<div class="row my-3">
					<div class="col-2">SR 번호 :</div>
					<div class="col-10">
						<input id="HsrNo" style="width: 91%" type="text"
							value="${srHistoryDetailDto.srNo}" disabled>
					</div>
				</div>
				<div class="row my-3">
					<div class="col-2">요청 기관 :</div>
					<div class="col-4">
						<input id="HinstNm" type="text"
							value="${srHistoryDetailDto.instNm}" disabled>
					</div>
					<div class="col-2">요청 시스템 :</div>
					<div class="col-4">
						<input id="HsysNm" type="text" value="${srHistoryDetailDto.sysNm}"
							disabled>
					</div>
				</div>
				<div class="row my-3">
					<div class="col-2">담당 부서 :</div>
					<div class="col-4">
						<input id="HdeptNm" type="text"
							value="${srHistoryDetailDto.deptNm}" disabled>
					</div>
					<div class="col-2 pr-0">변경요청 발신일 :</div>
					<div class="col-4">
						<input id="HwrtYmd" type="text"
							value="${srHistoryDetailDto.wrtYmd}" disabled>
					</div>
				</div>
				<div class="row my-3">
					<div class="col-2 pr-0">
						<label for="">기존 완료예정일 : </label>
					</div>
					<div class="col-4">
						<input id="HcmptnDmndYmd" type="text"
							value="${srHistoryDetailDto.cmptnDmndYmd}" disabled>
					</div>

					<div class="col-2">
						<label for="chgEndYmd">요청 예정일 : </label>
					</div>
					<div class="col-4">
						<input type="date" id="HchgEndYmd" name="chgEndYmd">
					</div>
				</div>
				<div class="row my-3">
					<div class="col-2">제목 :</div>
					<div class="col-10">
						<input id="HhstryTtl" style="width: 90%" type="text" value="">
					</div>
				</div>
				<div class="row my-3">
					<div class="col-2">내용 :</div>
					<div class="col-10">
						<textarea id="HhstryCn" style="width: 90%" rows="10"></textarea>
					</div>
				</div>
			</form>
			<div align="center">
				<button type="submit" form="" class="btn btn-info save center"
					data-dismiss="modal">요청</button>
			</div>
		</div>
	</div>
</div>
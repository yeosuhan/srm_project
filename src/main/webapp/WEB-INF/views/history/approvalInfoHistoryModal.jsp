<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- 작성자: 최은종 / 작성 날짜: 2023-02-28 --%>

<script type="text/javascript">
	function getInfoHstryDetail(historyId) {
		console.log("historyId: " + historyId);

		$.ajax({
			url : '/history/detail/' + historyId,
			type : 'GET',
			success : function(result) {
				console.log(result);

				var AhstryType = result.hstryType;

				$('#AsrNo').val(result.srNo);
				$('#AinstNm').val(result.instNm);
				$('#AsysNm').val(result.sysNm);
				$('#AdeptNm').val(result.deptNm);
				$('#AwrtYmd').val(result.wrtYmd);
				$('#AcmptnDmndYmd').val(result.cmptnDmndYmd);
				//이거 + empty 왜 안먹히는지 모르겠음 	
				if (AhstryType != 'C') {
					$('#AchgEndYmd').val(result.chgEndYmd);
				} else {
					$('#AhstryType1').remove();
					$('#AhstryType2').remove();
				}
				$('#AhstryTtl').val(result.hstryTtl);
				$('#AhstryCn').val(result.hstryCn);
			}
		});
	}
</script>

<div class="modal fade" id="approvalInfoHistoryModal">
	<div class="modal-body modal-dialog modal-lg" style="height: 600px;">
		<div class="m_head ">
			<div class="modal_title" style="color: white">진척 정보 변경 사항</div>
		</div>
		<div class="m_body bg-light detailDiv">
			<form id="historyDetailForm" action="/" method="POST">
				<div class="row my-3">
					<div class="col-2">SR 번호 :</div>
					<div class="col-10">
						<input id="AsrNo" style="width: 91%" type="text" value="" disabled>
					</div>
				</div>
				<div class="row my-3">
					<div class="col-2">기관 :</div>
					<div class="col-4">
						<input id="AinstNm" type="text" value="" disabled>
					</div>
					<div class="col-2">요청 시스템 :</div>
					<div class="col-4">
						<input id="AsysNm" type="text" value="" disabled>
					</div>
				</div>
				<div class="row my-3">
					<div class="col-2">담당 부서 :</div>
					<div class="col-4">
						<input id="AdeptNm" type="text" value="" disabled>
					</div>
					<div class="col-2 pr-0">변경요청 발신일 :</div>
					<div class="col-4">
						<input id="AwrtYmd" type="text" value="" disabled>
					</div>
				</div>
				<div class="row my-3">
					<div class="col-2 pr-0">
						<label for="">기존 완료예정일 : </label>
					</div>
					<div class="col-4">
						<input id="AcmptnDmndYmd" type="text" value="" disabled>
					</div>
					<div class="col-2" id="AhstryType1">
						<label for="">변경될 완료일 : </label>
					</div>
					<div class="col-4" id="AhstryType2">
						<input id="AchgEndYmd" type="text" value="" disabled>
					</div>
				</div>
				<div class="row my-3">
					<div class="col-2">제목 :</div>
					<div class="col-10">
						<input id="AhstryTtl" style="width: 90%" type="text" value=""
							disabled>
					</div>
				</div>
				<div class="row my-3">
					<div class="col-2">내용 :</div>
					<div class="col-10">
						<textarea id="AhstryCn" style="width: 90%" rows="5" disabled></textarea>
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
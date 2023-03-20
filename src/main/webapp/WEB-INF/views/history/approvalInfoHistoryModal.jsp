<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<%-- 작성자: 최은종 / 작성 날짜: 2023-02-28 / 진척관리 뷰 --%>

<script
	src="${pageContext.request.contextPath}/resources/js/approvalInfoHstryModal.js"></script>

<%@include file="/WEB-INF/views/history/modifyHistoryModal.jsp"%>
<script type="text/javascript">

</script>

<div class="modal fade" id="approvalInfoHistoryModal">
	<div class="modal-body modal-dialog modal-lg" style="height: 600px;">
		<div class="m_head">
			<div class="modal_title" style="color: white">Sr진척정보 변경요청 상세</div>	
				<div class="mheadDiv"></div>
		</div>
		<div class="m_body bg-light detailDiv">
			<form id="historyDetailForm" action="<c:url value='/history/add'/>" onsubmit="return checkApprInfoVal()">
				<div class="row my-3">
					<div class="col-2">SR 번호 :</div>
					<div class="col-4">
						<input id="AsrNo" class="AsrNo" name="srNo" type="text" value="" readonly>
					</div>
					<div class="col-2" id="HstrySttsDiv1">결재 :</div>
					<div class="col-4" id="HstrySttsDiv2"></div>
				</div>
				<div class="row my-3">
					<div class="col-2">기관 :</div>
					<div class="col-4">
						<input id="AinstNm" class="AinstNm" type="text" value="" readonly>
					</div>
					<div class="col-2">요청 시스템 :</div>
					<div class="col-4">
						<input id="AsysNm" class="AsysNm" type="text" value="" readonly>
					</div>
				</div>
				<div class="row my-3">
					<div class="col-2">담당 부서 :</div>
					<div class="col-4">
						<input id="AdeptNm" class="AdeptNm" type="text" value="" readonly> <input
							id="ArqstrId" class="ArqstrId" name="rqstrId" type="hidden"
							value='<sec:authentication property="principal.username"/>'>
						<input id="bHstryType" class="bHstryType" name="hstryType" type="hidden" value="">
					</div>
					<div class="col-2 pr-0">변경요청 발신일 :</div>
					<div class="col-4">
						<input id="AwrtYmd" class="AwrtYmd" type="text" name="wrtYmd" value="" readonly>
					</div>
				</div>
				<div class="row my-3">
					<div class="col-2 pr-0">
						<label for="">기존 완료요청일 : </label>
					</div>
					<div class="col-4">
						<input id="AcmptnDmndYmd" class="AcmptnDmndYmd" type="text" value="" readonly>
					</div>
					<div class="col-2 AhstryType1" id="AhstryType1">
						<label for="">변경될 완료일 : </label>
					</div>
					<div class="col-4 AhstryType2" id="AhstryType2">
						<input id="AchgEndYmd" class="AchgEndYmd" name="chgEndYmd" type="date" value=""
							style="width: 75%">
					</div>
				</div>
				<div class="row my-3">
					<div class="col-2">제목 :</div>
					<div class="col-10">
						<input id="AhstryTtl" style="width: 90%" type="text"
							name="hstryTtl" class="AhstryTtl" value="">
					</div>
				</div>
				<div class="row my-3">
					<div class="col-2">사유 :</div>
					<div class="col-10">
						<textarea id="AhstryCn" class="AhstryCn" name="hstryCn" style="width: 90%; resize:none;" maxlength="500" rows="5"></textarea>
					</div>
				</div>
			</form>
			<div id="footDiv" class="pt-3" align="center"></div>
		</div>
	</div>
</div>
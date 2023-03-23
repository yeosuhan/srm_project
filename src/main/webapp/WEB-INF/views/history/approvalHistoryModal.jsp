<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%-- 작성자: 최은종 / 작성 날짜: 230223 / 요청관리 뷰--%>

<script
	src="${pageContext.request.contextPath}/resources/js/approvalHstryModal.js"></script>
<script type="text/javascript">
	
</script>

<div class="modal fade" id="approvalHistoryModal">
	<div class="modal-body modal-dialog modal-lg" style="height: 600px;">
		<div class="m_head ">
			<div class="modal_title" style="color: white; font-weight: bold;font-size: 20px">SR진행정보 변경요청 상세</div>
		</div>
		<div class="m_body bg-light">
			<form id="approvalHistoryForm" action="<c:url value='/history/add'/>" onsubmit="return checkApprVal()">
				<div class="row my-3">
					<div class="col-2 font-weight-bold">SR 번호</div>
					<div class="col-4">
						<input id="appvSrNo" class="AsrNo" name="srNo" type="text"
							value="" readonly>
					</div>
					<div class="col-2 font-weight-bold" id="appvHstrySttsDiv1">결재</div>
					<div class="col-4" id="appvHstrySttsDiv2"></div>
				</div>
				<div class="row my-3">
					<div class="col-2 font-weight-bold">기관</div>
					<div class="col-4">
						<input id="appvInstNm" class="AinstNm" type="text" value=""
							readonly>
					</div>
					<div class="col-2 font-weight-bold">요청 시스템</div>
					<div class="col-4">
						<input id="appvSysNm" class="AsysNm" type="text" value="" readonly>
					</div>
				</div>
				<div class="row my-3">
					<div class="col-2 font-weight-bold">담당 부서</div>
					<div class="col-4">
						<input id="appvDeptNm" class="AdeptNm" type="text" value=""
							readonly> <input id="appvRqstrId" " class="ArqstrId"
							name="rqstrId" type="hidden"
							value='<sec:authentication property="principal.username"/>'>
						<input id="appvHstryType" class="bHstryType" name="hstryType"
							type="hidden" value="">
					</div>
					<div class="col-2 pr-0 font-weight-bold">변경요청 발신일</div>
					<div class="col-4">
						<input id="appvWrtYmd" class="AwrtYmd" type="text" name="wrtYmd"
							value="" readonly>
					</div>
				</div>
				<div class="row my-3">
					<div class="col-2 pr-0 font-weight-bold">
						<label for="">기존 완료요청일</label>
					</div>
					<div class="col-4">
						<input id="appvCmptnDmndYmd font-weight-bold" class="AcmptnDmndYmd" type="text"
							value="" readonly>
					</div>
					<div class="col-2 AhstryType1 font-weight-bold" id="appvHstryType1">
						<label for="">변경될 완료일</label>
					</div>
					<div class="col-4 AhstryType2" id="appvHstryType2">
						<input id="appvChgEndYmd" class="AchgEndYmd" name="chgEndYmd"
							type="date" value="" style="width: 75%" readonly>
					</div>
				</div>
				<div class="row my-3">
					<div class="col-2 font-weight-bold">제목</div>
					<div class="col-10">
						<input id="appvHstryTtl" style="width: 90%" type="text"
							name="hstryTtl" class="AhstryTtl" value="" readonly>
					</div>
				</div>
				<div class="row my-3">
					<div class="col-2 font-weight-bold">사유</div>
					<div class="col-10">
						<textarea id="appvHstryCn" class="AhstryCn" name="hstryCn"
							style="width: 90%" rows="5" readonly></textarea>
					</div>
				</div>
			</form>
			<div id="footDivUSer" class="pt-3 font-weight-bold" align="center"></div>
		</div>
	</div>
</div>
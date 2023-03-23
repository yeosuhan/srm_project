<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 작성자: 최은종 / 작성 날짜: 2023-03-01 --%>
<script src="${pageContext.request.contextPath}/resources/js/srInfo.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/addHstryModal.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/textarea.js"></script>
<script type="text/javascript">
	
</script>
<style>
.wrap {
	position: relative;
	display: inline=block;
}
</style>
<div class="modal" id="addHistoryModal">
	<div class="modal-body modal-dialog modal-lg" style="height: 500px;">
		<div id="mHd" class="m_head" style="height: 13%">
			<div class="modal_title" style="color: white; font-weight: bold;font-size: 20px">SR 진척정보 변경요청</div>
			<!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
		</div>
		<div class="m_body bg-light">
			<form id="addHistoryForm" method="post"
				action="<c:url value='/history/add'/>" class="form-material"
				onsubmit="return checkValue()">
				<div class="row my-3">
					<div class="col-2 font-weight-bold ">SR 번호</div>
					<div class="col-4">
						<input id="HsrNo" name="srNo" style="width: 100%" type="text"
							value="" readonly>
					</div>
					<div class="col-2 font-weight-bold">요청 유형</div>
					<div class="col-4">
						<div class="dropdown dropdown open">
							<select name="hstryType" id="hstryType" style="width: 73%">
								<sec:authorize access="hasRole('ROLE_DEVELOPER')">
									<option value="A">완료일 변경</option>
								</sec:authorize>
								<sec:authorize access="hasRole('ROLE_ADMIN')">
									<option value="B">완료일 변경</option>
									<option value="C">개발 취소</option>
								</sec:authorize>
							</select>
						</div>
					</div>
				</div>
				<div class="row my-3">
					<div class="col-2 font-weight-bold">발신일</div>
					<div class="col-4">
						<input type="date" id="HwrtYmd" type="text" value="" readonly
							style="width: 100%">
					</div>
					<div class="col-2 font-weight-bold">발신자</div>
					<div class="col-4">
						<input type="hidden" id="rqstrId" name="rqstrId"
							value='<sec:authentication property="principal.username"/>' /> <input
							id="HrqstrId" type="text" style="width: 73%"
							value="<sec:authentication property="principal.flnm"/>" readonly>
					</div>
				</div>
				<div class="row my-3">
					<div class="col-2 pr-0 font-weight-bold">
						<label for="">기존 완료요청일</label>
					</div>
					<div class="col-4">
						<input id="HcmptnDmndYmd" type="text" value="" readonly
							style="width: 100%">
					</div>


					<div class="col-2 font-weight-bold" id="chg1">
						<label for="chgEndYmd ">요청 예정일</label>
					</div>
					<div class="col-4 " id="chg2">
						<input type="date" id="HchgEndYmd" name="chgEndYmd"
							style="width: 73%">
					</div> 
				</div>
				<div class="row my-3">
					<div class="col-2 font-weight-bold">제목</div>
					<div class="col-10">
						<input id="HhstryTtl" style="width: 90%" type="text"
							name="hstryTtl" value="">
					</div>
				</div>
				<div class="row my-3">
					<div class="col-2 font-weight-bold">
						사유
						<p class="textCount" style="margin-top: 3px"></p>
					</div>
					<div class="col-10">
						<textarea id="HhstryCn" name="hstryCn"
							style="width: 90%; resize: none;" maxlength="500" rows="10"></textarea>
					</div>
				</div>
				<div align="center">
					<button id="mBt" type="submit" class="btn btn-oti center" style="font-weight: bold;font-size: 20px">등록</button>
				</div>
			</form>
		</div>
	</div>
</div>
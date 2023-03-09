<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<%-- 작성자: 최은종 / 작성 날짜: 2023-03-05 / 진척관리 뷰 --%>

<script src="${pageContext.request.contextPath}/resources/js/modiHstryModal.js"></script>

<script type="text/javascript">

</script>

<div class="modal fade" id="modifyHistoryModal">
	<div class="modal-body modal-dialog modal-lg" style="height: 600px;">
		<div class="m_head ">
			<div class="modal_title" style="color: white">진척정보 변경요청 수정</div>
		</div>
		<div class="m_body bg-light modifyDiv">
			<form id="historyModifyForm" method="post"
				action="<c:url value='/history/modify'/>"
				onsubmit="return checkVal()">
				<div class="row my-3">
					<div class="col-2">SR 번호 :</div>
					<div class="col-4">
						<input id="modiSrNo" class="AsrNo" name="srNo" type="text"
							value="" readonly> <input type="hidden" id="modiHstryId"
							name="hstryId" class="AhstryId" value="">
					</div>
					<div class="col-2">요청 유형 :</div>
					<div class="col-4">
						<div class="dropdown dropdown open">
							<select name="hstryType" id="modiHstryType">
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
					<div class="col-2">기관 :</div>
					<div class="col-4">
						<input id="modiInstNm" class="AinstNm" type="text" value=""
							readonly>
					</div>
					<div class="col-2">요청 시스템 :</div>
					<div class="col-4">
						<input id="modiSysNm" class="AsysNm" type="text" value="" readonly>
					</div>
				</div>
				<div class="row my-3">
					<div class="col-2">담당 부서 :</div>
					<div class="col-4">
						<input id="modiDeptNm" class="AdeptNm" type="text" value=""
							readonly> <input id="modiRqstrId" class="ArqstrId"
							name="rqstrId" type="hidden"
							value='<sec:authentication property="principal.username"/>'>
					</div>
					<div class="col-2 pr-0">변경요청 발신일 :</div>
					<div class="col-4">
						<input id="modiWrtYmd" class="AwrtYmd" type="text" name="wrtYmd"
							value="" readonly>
					</div>
				</div>
				<div class="row my-3">
					<div class="col-2 pr-0">
						<label for="">기존 완료예정일 : </label>
					</div>
					<div class="col-4">
						<input id="modiCmptnDmndYmd" class="AcmptnDmndYmd" type="text"
							value="" readonly>
					</div>
					<div class="col-2 AhstryType1" id="modiHstryType1">
						<label for="">변경될 완료일 : </label>
					</div>
					<div class="col-4 AhstryType2" id="modiHstryType2">
						<input id="modiChgEndYmd" class="AchgEndYmd" name="chgEndYmd"
							type="date" value="" style="width: 75%">
					</div>
				</div>
				<div class="row my-3">
					<div class="col-2">제목 :</div>
					<div class="col-10">
						<input id="modiHstryTtl" style="width: 90%" type="text"
							name="hstryTtl" class="AhstryTtl" value="">
					</div>
				</div>
				<div class="row my-3">
					<div class="col-2">내용 :</div>
					<div class="col-10">
						<textarea id="modiHstryCn" class="AhstryCn" name="hstryCn"
							style="width: 90%" rows="5"></textarea>
					</div>
				</div>
				<div id="footModiDiv" class="pt-3" align="center">
					<button type="submit" class="btn btn-oti save center">확인</button>
				</div>
			</form>

		</div>
	</div>
</div>
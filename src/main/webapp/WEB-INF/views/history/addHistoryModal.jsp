<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- 작성자: 최은종 / 작성 날짜: 2023-03-01 --%>

<script type="text/javascript">
	/* 고정값 넣어놓기 */
	function addHistory(srNo) {
		var srNo = $("#srNo").val();
		var cmptnDmndYmd = $("#SRDCmptnDmndYmd").val();
		document.getElementById('HwrtYmd').valueAsDate = new Date();

		$.ajax({
			url : "/history/add?srNo=" + srNo,
			type : "GET",

			success : function(result) {
				console.log(result);
				$("#HsrNo").val(srNo);
				$("#HcmptnDmndYmd").val(cmptnDmndYmd);
			}
		});
	}
	
	/* 개발취소 선택 시 색상 바꿔서 강조하기 */
	$(document).ready(function() {
		$('#hstryType').change(function() {
			var value = $('#hstryType option:selected').val();
			if (value == 'C') {
				 $('#mHd').css({"background-color": "indianred"});
				 $('#mBt').css({"background-color": "indianred", "border-color" : "indianred"});
			} else {
				 $('#mHd').css({"background-color": "dodgerblue"});
				 $('#mBt').css({"background-color": "dodgerblue", "border-color" : "dodgerblue"});				
			}
		});
	});

</script>

<div class="modal" id="addHistoryModal">
	<div class="modal-body modal-dialog modal-lg" style="height: 500px">
		<div id="mHd" class="m_head" style="height: 13%">
			<div class="modal_title" style="color: white">SR 진척정보 변경요청</div>
			<!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
		</div>
		<div class="m_body bg-light">
			<form id="addHistoryForm" action="<c:url value='/history/add'/>"
				class="form-material">
				<div class="row my-3">
					<div class="col-2">SR 번호 :</div>
					<div class="col-4">
						<input id="HsrNo" name="srNo" style="width: 91%" type="text"
							value="" readonly>
					</div>
					<div class="col-2">요청 유형 :</div>
					<div class="col-4">
						<div class="dropdown dropdown open">
							<select name="hstryType" id="hstryType">
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
					<div class="col-2">발신일 :</div>
					<div class="col-4">
						<input type="date" id="HwrtYmd" type="text" value="" readonly>
					</div>
					<div class="col-2">발신자 :</div>
					<div class="col-4">
						<input type="hidden" id="rqstrId" name="rqstrId"
							value='<sec:authentication property="principal.username"/>' /> <input
							id="HrqstrId" type="text"
							value="<sec:authentication property="principal.flnm"/>" readonly>
					</div>
				</div>
				<div class="row my-3">
					<div class="col-2 pr-0">
						<label for="">기존 완료예정일 : </label>
					</div>
					<div class="col-4">
						<input id="HcmptnDmndYmd" type="text" value="" readonly>
					</div>


					<div class="col-2" id="chg1">
						<label for="chgEndYmd">요청 예정일 : </label>
					</div>
					<div class="col-4" id="chg2">
						<input type="date" id="HchgEndYmd" name="chgEndYmd">
					</div>
				</div>
				<div class="row my-3">
					<div class="col-2">제목 :</div>
					<div class="col-10">
						<input id="HhstryTtl" style="width: 90%" type="text"
							name="hstryTtl" value="">
					</div>
				</div>
				<div class="row my-3">
					<div class="col-2">사유 :</div>
					<div class="col-10">
						<textarea id="HhstryCn" name="hstryCn" style="width: 90%"
							rows="10"></textarea>
					</div>
				</div>
			</form>
			<div align="center">
				<button id="mBt" type="submit" form="addHistoryForm" formmethod="post"
					class="btn btn-info save center">등록</button>
			</div>
		</div>
	</div>
</div>
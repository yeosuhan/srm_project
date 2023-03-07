$(document).ready(function(){
	getPlan();
});
/* SR요청 상세보기 */
function getDetail(dmndNo, srNo) {
	console.log("상세보기 : " + dmndNo + srNo);
	$.ajax({
		url : '/srinformation/detail/' + dmndNo,
		type : 'GET',
		data : {
			dmndNo : dmndNo
		},
		success : function(detail) {
			$('#SRPlFlnm').show();
			$('#changeMemberId').remove();
			$('#changeManager').remove();
			console.log(srNo);
			console.log(detail);
			$("#SRDSrNo").val(srNo);
			$("#SRDDmndNo").val(detail.dd.dmndNo);
			// 우선순위 데이터 
			$("#SiRnk").empty();
			$("#SiRnk").text(detail.dd.rnk);
			$("#SRDTitle").val(detail.dd.ttl);
			$("#SRDRelgrund").val(detail.dd.relGrund);
			$("#SRDSys").val(detail.dd.sysNm);
			$("#SRDTask").val(detail.dd.taskSeNm);
			$("#SRDInst").val(detail.dd.instNm);
			$("#SRDFlnm").val(detail.dd.flnm);
			$("#SRDDmndymd").val(detail.dd.dmndYmd);
			$("#SRDCmptnDmndYmd").val(detail.dd.cmptnDmndYmd);
			$("#SRDCn").val(detail.dd.cn);
			$("#SRDFile").val(detail.dd.fileNm);
			$("#dept").val(detail.pi.deptCd).prop("selected", true);
			
			$("#SRPlDmndNo").val(detail.pi.dmndNo);
			$("#SRPlMemberId").val(detail.pi.memberId);
			$("#SRPlFlnm").val(detail.pi.flnm);
			$("#SRPlBgngYmd").val(detail.pi.bgngYmd);
			$("#SRPlEndYmd").val(detail.pi.endYmd);
			$("#SRPlRvwCn").val(detail.pi.rvwCn);
			/* 자원 정보 모달 */
			$("#srPlanTab").tab("show");
			$("#srNo").val(srNo);
			$("#ttl").val(detail.dd.ttl);
			$("#addSrResourceModalDept option[value='"+detail.pi.deptCd+"']").prop("selected",true);
			$("#resourceInst").val(detail.dd.instNm);
			$("#resourceTableRow").empty();
			$(".deliverableTable tbody").empty();
			
		}
	});
}
/* SR요청 계획정보 */
function getPlan() {
	$("#SRDDmndNo").val();
	console.log("계획정보 : " + $("#SRDDmndNo").val());
	$.ajax({
		url : '/srinformation/plan/' + $("#SRDDmndNo").val(),
		type : 'GET',
		success : function(plan) {
			console.log("멤버 아이디:" + plan.memberId);
			$('#SRPlFlnm').show();
			$('#changeMemberId').remove();
			$('#changeManager').remove();
			$("#dept").val(plan.deptCd).prop("selected", true);
			$("#SRPlDmndNo").val(plan.dmndNo);
			$("#SRPlMemberId").val(plan.memberId);
			$("#SRPlFlnm").val(plan.flnm);
			$("#SRPlBgngYmd").val(plan.bgngYmd);
			$("#SRPlEndYmd").val(plan.endYmd);
			$("#SRPlRvwCn").val(plan.rvwCn);
		}
	});
}
/* sr계획정보 - 처리팀 변경시 해당 담당자 변경 */
function changeDept() {
	var selectedElement = document.getElementById("dept");

	// 선택한 option의 value, 텍스트
	var deptCd = selectedElement.options[selectedElement.selectedIndex].value;
	var deptNm = selectedElement.options[selectedElement.selectedIndex].text;
	console.log("선택된 시스템 :" + deptCd)

	$.ajax({
		url : '/srinformation/mngr/' + deptCd,
		type : 'GET',
		success : function(res) {
			$('#changeMemberId').remove();
			$('#changeManager').remove();
			var input1 = $("<input type='hidden' id='changeMemberId' value=" + res.memberId	+ "></input>")
			var input2 = $("<input readonly class='form-control' id='changeManager' value=" + res.flnm + "></input>")
			$('#SRPlFlnmBySelect').append(input1);
			$('#SRPlFlnmBySelect').append(input2);
			$('#SRPlFlnm').hide();
		}
	});
}
/* SR요청 진척률 조회 */
function getProgress() {
	$("#SRDSrNo").val();
	console.log("진척률: " + $("#SRDSrNo").val());
	$.ajax({
		url : '/srinformation/progress/list/' + $("#SRDSrNo").val(),
		type : 'GET',
		data : {
			Progress : $("#SRDSrNo").val()
		},
		success : function(Progress) {
			for (var i = 0; i < Progress.length; i++) {
				$("#SRPgSrNo").val(Progress[i].srNo);
				$("#SRPgPrgrsId" + i).val(Progress[i].prgrsId);
				$("#SRPgBgngYmd" + i).val(Progress[i].bgngYmd);
				$("#SRPgEndYmd" + i).val(Progress[i].endYmd);
				$("#SRPgPrgrsRt" + i).val(Progress[i].prgrsRt);
				document.getElementById('SRPgEndYmd' + i).setAttribute("min",
						$("#SRPgBgngYmd" + i).val());
			}
		}
	});
}
/* SR요청 진척률 수정 */
function updateProgress1() {
	var bgngYmd = $("#SRPgBgngYmd0").val();
	var prgrsId = $("#SRPgPrgrsId0").val();
	var endYmd = $("#SRPgEndYmd0").val();
	var prgrsRt = $("#SRPgPrgrsRt0").val();
	$.ajax({
		url : '/srinformation/progress/update',
		type : 'POST',
		data : {
			prgrsRt : prgrsRt,
			bgngYmd : bgngYmd,
			endYmd : endYmd,
			prgrsId : prgrsId,
			srNo : $("#SRPgSrNo").val()
		},
		success : function(prgrs) {
			console.log("예~");
		}
	});
}
function updateProgress2() {
	var bgngYmd = $("#SRPgBgngYmd1").val();
	var prgrsId = $("#SRPgPrgrsId1").val();
	var endYmd = $("#SRPgEndYmd1").val();
	var prgrsRt = $("#SRPgPrgrsRt1").val();
	$.ajax({
		url : '/srinformation/progress/update',
		type : 'POST',
		data : {
			prgrsRt : prgrsRt,
			bgngYmd : bgngYmd,
			endYmd : endYmd,
			prgrsId : prgrsId,
			srNo : $("#SRPgSrNo").val()
		},
		success : function(prgrs) {
		}
	});
}
function updateProgress3() {
	var bgngYmd = $("#SRPgBgngYmd2").val();
	var prgrsId = $("#SRPgPrgrsId2").val();
	var endYmd = $("#SRPgEndYmd2").val();
	var prgrsRt = $("#SRPgPrgrsRt2").val();
	$.ajax({
		url : '/srinformation/progress/update',
		type : 'POST',
		data : {
			prgrsRt : prgrsRt,
			bgngYmd : bgngYmd,
			endYmd : endYmd,
			prgrsId : prgrsId,
			srNo : $("#SRPgSrNo").val()
		},
		success : function(prgrs) {
		}
	});
}
function updateProgress4() {
	var bgngYmd = $("#SRPgBgngYmd3").val();
	var prgrsId = $("#SRPgPrgrsId3").val();
	var endYmd = $("#SRPgEndYmd3").val();
	var prgrsRt = $("#SRPgPrgrsRt3").val();
	$.ajax({
		url : '/srinformation/progress/update',
		type : 'POST',
		data : {
			prgrsRt : prgrsRt,
			bgngYmd : bgngYmd,
			endYmd : endYmd,
			prgrsId : prgrsId,
			srNo : $("#SRPgSrNo").val()
		},
		success : function(prgrs) {
		}
	});
}
function updateProgress5() {
	var bgngYmd = $("#SRPgBgngYmd4").val();
	var prgrsId = $("#SRPgPrgrsId4").val();
	var endYmd = $("#SRPgEndYmd4").val();
	var prgrsRt = $("#SRPgPrgrsRt4").val();
	$.ajax({
		url : '/srinformation/progress/update',
		type : 'POST',
		data : {
			prgrsRt : prgrsRt,
			bgngYmd : bgngYmd,
			endYmd : endYmd,
			prgrsId : prgrsId,
			srNo : $("#SRPgSrNo").val()
		},
		success : function(prgrs) {
		}
	});
}
function updateProgress6() {
	var bgngYmd = $("#SRPgBgngYmd5").val();
	var prgrsId = $("#SRPgPrgrsId5").val();
	var endYmd = $("#SRPgEndYmd5").val();
	var prgrsRt = $("#SRPgPrgrsRt5").val();
	$.ajax({
		url : '/srinformation/progress/update',
		type : 'POST',
		data : {
			prgrsRt : prgrsRt,
			bgngYmd : bgngYmd,
			endYmd : endYmd,
			prgrsId : prgrsId,
			srNo : $("#SRPgSrNo").val()
		},
		success : function(prgrs) {
		}
	});
}
/* 계획정보 변경 */
function planUpdate() {
	console.log("$('#SRPlMemberId').val() : " + $("#SRPlMemberId").val())
	console.log("$('#changeMemberId').val() : " + $("#changeMemberId").val())

	if($("#changeMemberId").val()==null) {
		var memberId = $("#SRPlMemberId").val();
	} else {
		var memberId = $("#changeMemberId").val();
	}
	console.log("담당자: " + memberId);
	$.ajax({
		url : '/srinformation/plan/update',
		type : 'POST',
		data : {
			dmndNo : $("#SRPlDmndNo").val(),
			memberId : memberId,
			deptCd : $("#SRDept").val(),
			bgngYmd : $("#SRPlBgngYmd").val(),
			endYmd : $("#SRPlEndYmd").val(),
			rvwCn : $("#SRPlRvwCn").val()
		},
		success : function(res) {
		}
	});
}

/*시스템 목록*/
function getSysCd(){
	if($("#sysCdFilter option").length == 1){
		$("#sysCdFilter option").remove();
	}
	if($("#sysCdFilter option").length == 0){
		$.ajax({
			url : '/srsystem/list',
			type : 'GET',
			success : function(result){
				$("#sysCdFilter").append("<option></option>");
				result.forEach((value)=>{
					$("#sysCdFilter").append(
							"<option value='"+value.sysCd+"'>"+value.sysNm+"</option>"
					);
				});
			}
		});
	}
}
function removeTaskSeCd(){
	$("#taskSeCdFilter option").remove();
} 
/*업무 목록*/
function getTaskSeCd(){
	if($("#taskSeCdFilter option").length == 1){
		$("#taskSeCdFilter option").remove();
	}
	if($("#sysCdFilter option:selected").length != 0 && $("#taskSeCdFilter option").length == 0 ){
		$.ajax({
			url : '/task/list/'+$("#sysCdFilter option:selected").val(),
			type : 'GET',
			data : {'sysCd' : $("sysCdFilter option:selected").val()},
			success : function(result){
				$("#taskSeCdFilter").append("<option></option>");
				result.forEach((value)=>{
					$("#taskSeCdFilter").append(
							"<option value='"+value.taskSeCd+"'>"+value.taskSeNm+"</option>"
					);
				});
			}
		});
	}
}
/*빈 검색 조건 비활성화*/
function srSearch(){
	$("#srInfoFilterForm input").each((index,value)=>{
		if(!$(value).val()){
			$(value).prop("disabled",true);
		}
	});
	$("#srInfoFilterForm select").each((index,value)=>{
		if(!$(value).children("option:selected").val()||$(value).children(" option").length==0){
			$(value).prop("disabled",true);
		}
	});
	return true;
}
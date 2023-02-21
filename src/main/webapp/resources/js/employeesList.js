/*
 * 작성자:안한길
 * 작성일:2023.02.20.
 * 내용: 사원 목록 자바스크립트
 */
/* 사원 정보 가져오는 함수 */
function getEmployee(employeeId){
	$.ajax({
		url:"/admin/employee",
		type:"GET",
		data:{employeeId:employeeId},
		success:function(result){
			$("#MEmployeeId").text(result.memberId);
			$("#MEmployeeName").text(result.flnm);
			$("#MEmployeeTel").text(result.telNo);
			$("#MEmployeeEmail").text(result.eml);
			$("#MEmployeeAddr").text(result.addr);
			$("#MEmployeeTel").text(result.telNo);
			$("#MEmployeeJobGrade option[value='"+result.jbgdCd+"']").prop("selected",true);
			$("#MEmployeeDepartment option[value='"+result.deptCd+"']").prop("selected",true);
			$("#deleteInfo").attr("onclick","deleteInfo('"+result.memberId+"')");
			$("#modifyInfo").attr("onclick","modifyInfo('"+result.memberId+"')");
		}
	});
}
/*사원 정보 삭제*/
function deleteInfo(employeeId){
	console.log(employeeId);
	if(employeeId && confirm("사원 정보를 삭제하시겠습니까?")){
		deleteEmployee(employeeId);
	}
}
function deleteEmployee(employeeId){
	$.ajax({
		url:"/admin/employee/delete",
		type:"GET",
		data:{employeeId:employeeId},
		success:function(result){
			$("#MEmployeeId").text("");
			$("#MEmployeeName").text("");
			$("#MEmployeeTel").text("");
			$("#MEmployeeEmail").text("");
			$("#MEmployeeAddr").text("");
			$("#MEmployeeTel").text("");
			$("#deleteInfo").attr("onclick","deleteInfo("+null+")");
			$("#modifyInfo").attr("onclick","modifyInfo("+null+")");
			//테이블 삭제
			$("#"+employeeId+"Row").remove();
			alert("성공적으로 삭제되었습니다.");
		}
	});
}
/*사원 정보 수정*/
function modifyInfo(employeeId){
	if(employeeId && confirm("사원 정보를 수정하시겠습니까?")){
		modifyEmployee(employeeId);
	}
}
function modifyEmployee(employeeId){
	var employeeInfo={
			memberId:employeeId,
			deptCd:$("#MEmployeeDepartment option:selected").val(),
			jbgdCd:$("#MEmployeeJobGrade option:selected").val()
	};
	$.ajax({
		url:"/admin/employee/modify",
		type:"POST",
		data:employeeInfo,
		success:function(result){
			//선택된 옵션값으로 테이블 수정
			$("#"+employeeId+"Dept").text($("#MEmployeeDepartment option:selected").text())
			$("#"+employeeId+"Jbgd").text($("#MEmployeeJobGrade option:selected").text())
			
			alert("성공적으로 수정되었습니다.");
		}
	});
}

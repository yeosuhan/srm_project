/*
 * 작성자:안한길
 * 작성일:2023.02.20.
 * 내용: 사원 목록 자바스크립트
 */

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
			
		}
	});
	
}
 
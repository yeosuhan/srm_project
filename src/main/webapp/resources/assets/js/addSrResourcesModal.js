var calendar=null;

$(document).ready(function(){
	/* 자원정보 추가 모달
	 * @author: 안한길
	 * */
	$("#addSrResourcesModal").on('show.bs.modal',function() 
	{
		var calendarEl=null;
		var deptCd=$("#deptCd option:selected").val();
		//console.log(deptCd);
		if($("#empId option").length==0){
			/*개발자 목록*/
			$.ajax({
				url:"/member/department",
				type:"GET",
				data:{deptCd:deptCd},
				success:function(result){
					result.forEach((value,index)=>{
						$("#empId").append(
								"<option value='"+value.empId+"'>" +value.flnm+"</option>"
						);
						//console.log(index);
						if(index==0){
							/*달력*/
							console.log(value.srResourceByEmpId);
							calendarEl= $('#calendar')[0];
						
							calendar = new FullCalendar.Calendar(calendarEl,{
								headerToolbar:{
									left : 'prev, next',
									center: 'title',
									right:''
								},
								height:400,
								initialView: 'dayGridMonth',
								events:
									value.srResourceByEmpId
								
							});
							calendar.render();
							//처음 모달을 열때 달력이 안보이는 문제
							$(".fc-scroller td, th").css('width','50px');
							
						}
					});
					
					
				}
			});
		}
		
	});
	
});
/* 선택된 개발자 일정 가져오는 함수
 * @author: 안한길
 * */
function showSchedule(){
	var empId=$("#empId option:selected").val();
	$.ajax({
		url:"/sr-resource/resource/schedule",
		type:"GET",
		data:{empId:empId},
		success:function(result){
			//이벤트 제거
			calendar.getEvents().forEach((value)=>{
				//console.log(value);
				value.remove();
			});
			//이벤트 추가
			console.log(result);
			result.forEach((value)=>{
				calendar.addEvent(value);
				
			});
		}
	});
};
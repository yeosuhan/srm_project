var modalOpened=1;
var calendarEl=null;
var calendar=null;
$(document).ready(function(){
	/* 자원정보 추가 모달
	 * @author: 안한길
	 * */
	$("#addSrResourcesModal").on('show.bs.modal',function() 
	{
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
					});
				}
			});
		}
		if(modalOpened){
			/*달력*/
			if(calendar==null){
				modalOpened=0;
				calendarEl= $('#calendar')[0];
			
				calendar = new FullCalendar.Calendar(calendarEl,{
					headerToolbar:{
						left : 'prev, next',
						center: 'title',
						right:''
					},
					height:400,
					initialView: 'dayGridMonth',
					events:[
						{
							title:'test',
							start:'2023-02-14',
							backgroundColor:'#e74a3b'
						},
						{
							title:'test2',
							start:'2023-02-15',
							backgroundColor:'#f6c23e'
						}
					]
				});
				calendar.render();
				//처음 모달을 열때 달력이 안보이는 문제
				$(".fc-scroller td, th").css('width','50px');
				
			}
		}
	});
	
});
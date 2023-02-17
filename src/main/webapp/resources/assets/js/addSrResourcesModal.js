var modalOpened=1;
var calendarEl=null;
var calendar=null;
$(document).ready(function(){
	$("#addSrResourcesModal").on('show.bs.modal',function() 
	{
		if(modalOpened){
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
document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');
	var list = [];

	console.log("!!!");
	$.ajax({
		type : 'GET', 
		url : "/sr-resource/resource/schedule",
		dataType : "json",
		error : function() { 
			console.log('통신실패!');
		},
		success : function(data) { 
			console.log(data);
			var calendar = new FullCalendar.Calendar(calendarEl, {
				defaultDate : '2023-03-10',
				locale : "ko",
				contentHeight : 300,
				height : 300,
				eventLimit : true,
				events : data
		        });

			calendar.render();
			 $(".fc-scroller td, th").css('width','50px');

		}
	});
	


});

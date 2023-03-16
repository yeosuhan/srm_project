function showAdminGraph(dmndNo) {	
	console.log("graph dmndNo : " + dmndNo);
	$.ajax({
		url : "/progress/chart?dmndNo=" + dmndNo,
		type : "GET",
		success : function(res) {
			console.log("res  " + res);
			var gname = res.srNo;
			if(!res) {
				console.log("ㅁㅁ");
				res="계획이 모두 수립되지 않았습니다.";
			}
			const chart = Highcharts.chart('adGraph', {
		        title: {
		            text: res.srNo + ' 진척계획 및 현황'
		        },
		        xAxis: {
		            categories: res.dateList     
		        },
		        yAxis: {
		            title: {
		                text: '진척률'
		            }
		        },
		        series: [{
		        	type: 'line',
		            name: '계획',
		            data: res.prgrsList
		        }, { 
		        	type: 'column',
		            name: '현재',
		            data: res.nowArr
		        }]
		    });
		}
	});    
}
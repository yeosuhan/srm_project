$(document).ready(function(){
	$(".show-notification .nav-link").mouseover(function(){
		$(this).tab("show");
	});
	
	//getEventListener();
});
/* 서버와 연결
 * @author : 안한길
 * */
function getEventListener(){
	const sse = new EventSource("/alert/connect");
	
	sse.addEventListener('connect',(result)=>{
		console.log(result.data);
	});
	
	sse.addEventListener('alert',(result)=>{
		console.log(result.data);
		refreshAlert();
		$("#alertBadge").addClass("badge bg-c-red");
	});
}
/* 알림 목록 비우고 새로고침
 * 
 * */
function refreshAlert(){
	$("#rfltTab ul").empty();
	$("#chgDmndTab ul").empty();
	$("#developerTab ul").empty();
	$("#cancleTab ul").empty();
	getAlertList()
}
/* 알림 목록 조회
 * @author : 안한길
 * */
function getAlertList(){
	if($(".tab-content li").length==0){
		
		$.ajax({
			url:"/alert/list",
			type:"GET",
			success:function(result){
				result.forEach((value)=>{
					/*반영요청*/
					if(value.altType == 'RFLT'){
						$("#rfltTab ul").append(
								"<li class='waves-effect waves-light' onclick='location.href=\"/alert/checkalert?dmndNo="+value.dmndNo+"&alttype="+value.altType+"&altNo="+value.altNo+"\";'>" +
								"	<div class='media'>" +
								"		<div class='media-body'>" +
								"			<h5 class='notification-user'>"+value.dmndNo+"</h5>" +
								"			<p class='notification-msg'>"+value.altCn+"</p>" +
								"			<span class='notification-time'>"+value.trsmYmd+"</span>" +
								"		</div>" +
								"	</div>" +
								"</li>"
						);
					}
					/*예정일 변경*/
					if(value.altType == 'CHG_YMD'){
						$("#chgDmndTab ul").append(
								"<li class='waves-effect waves-light' onclick='location.href=\"/alert/checkalert?hstryId="+value.hstryId+"&alttype="+value.altType+"&altNo="+value.altNo+"\";'>" +
								"	<div class='media'>" +
								"		<div class='media-body'>" +
								"			<h5 class='notification-user'>"+value.hstryId+"</h5>" +
								"			<p class='notification-msg'>"+value.altCn+"</p>" +
								"			<span class='notification-time'>"+value.trsmYmd+"</span>" +
								"		</div>" +
								"	</div>" +
								"</li>"
						);
					}
					/*예정일 변경(개발자)*/
					if(value.altType == 'CHG_YMD_DVL'){
						$("#developerTab ul").append(
								"<li class='waves-effect waves-light' onclick='location.href=\"/alert/checkalert?hstryId="+value.hstryId+"&alttype="+value.altType+"&altNo="+value.altNo+"\";'>" +
								"	<div class='media'>" +
								"		<div class='media-body'>" +
								"			<h5 class='notification-user'>"+value.hstryId+"</h5>" +
								"			<p class='notification-msg'>"+value.altCn+"</p>" +
								"			<span class='notification-time'>"+value.trsmYmd+"</span>" +
								"		</div>" +
								"	</div>" +
								"</li>"
						);
					}
					/*개발취소*/
					if(value.altType == 'RTRCN'){
						$("#cancleTab ul").append(
								"<li class='waves-effect waves-light' onclick='location.href=\"/alert/checkalert?hstryId="+value.hstryId+"&alttype="+value.altType+"&altNo="+value.altNo+"\";'>" +
								"	<div class='media'>" +
								"		<div class='media-body'>" +
								"			<h5 class='notification-user'>"+value.dmndNo+"</h5>" +
								"			<p class='notification-msg'>"+value.altCn+"</p>" +
								"			<span class='notification-time'>"+value.trsmYmd+"</span>" +
								"		</div>" +
								"	</div>" +
								"</li>"
						);
					}
				});
			}
		});
	}
}

function sendTestMessage(){
	$.ajax({
		url:"/alert/testsend",
		type:"GET",
		data:{dmndNo:"SR230222_0001"},
		success:function(){
			console.log("메시지 전송");
		}
	});
}
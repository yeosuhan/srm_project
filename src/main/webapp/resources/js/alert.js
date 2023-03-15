$(function(){
	$(".show-notification .nav-link").click(function(event){
		$(this).tab("show");
		event.preventDefault(); //a태그 동작 비활성화
	});
	
	
	getEventListener();
	getAlertList();
	
	
});
/* 알림이 여부 확인후 뱃지 추가
 * 
 * */
function checkAlert(){
	if($(".alertLi").length==0){
		$("#alertBadge").removeClass("badge bg-c-yellow");
	}else{
		$("#alertBadge").addClass("badge bg-c-yellow");
	}
}
/* 알림 카운트
 * 
 * */
function countAlert(){
	$("#alertTab ul").each((index,value)=>{
		if($(value).children("li").length==0){
			$(value).append("<li class='noAlert' style='text-align:center;'>새로운 알림이 없습니다.</li>");
		}else if($(value).children(".alertLi").length!=0){
			$(value).children(".noAlert").remove();
			var href ="#"+ $(value).parent("div").attr("id");
			
			$("a[href='"+href+"']").append("<span class='badge badge-danger alertListCount' style='padding:4px;'>"+$(value).children("li").length+"</span>");
		}
	});
}
/* 서버와 연결
 * @author : 안한길
 * */
function getEventListener(){
	const sse = new EventSource("/alert/connect");
	if(sse!=null){
		sse.addEventListener('connect',(result)=>{
			console.log(result.data);
		});
		//이벤트가 수신되면 업데이트 하도록 설정
		sse.addEventListener('alert',(result)=>{
			console.log(result.data);
			refreshAlert();
			$("#alertBadge").addClass("badge bg-c-yellow");
		});
	}
}
/* 알림 목록 비우고 새로고침
 * 
 * */
function refreshAlert(){
	$("#rfltTab ul").empty();
	$("#chgDmndTab ul").empty();
	$("#developerTab ul").empty();
	$("#cancleTab ul").empty();
	$(".alertListCount").remove();
	getAlertList();
}
/* 알림 목록 조회
 * @author : 안한길
 * */
function getAlertList(){
	if($("#alertTab li").length==0){
		
		$.ajax({
			url:"/alert/list",
			type:"GET",
			success:function(result){
				result.forEach((value)=>{
					var alertLi= null;
					/*반영요청*/
					if(value.altType == 'RFLT'){
						$("#rfltTab ul").append(
								"<li class='waves-effect waves-light alertLi' onclick='location.href=\"/alert/checkalert?dmndNo="+value.dmndNo+"&altType="+value.altType+"&altNo="+value.altNo+"\";'>" +
								"	<div class='media'>" +
								"		<div class='media-body'>" +
								"			<h5>"+value.dmndNo+"</h5>" +
								"			<i class='fa fa open-card-option fa-times close' onclick='closeAlert(event,this,"+value.altNo+")'></i>" +
								"			<p class='notification-msg'>"+value.altCn+"</p>" +
								"			<span class='notification-time'>"+value.trsmYmd+"</span>" +
								"		</div>" +
								"	</div>" +
								"</li>"
						);
					}else{
						if(value.srNo!=null){
							alertLi=
								"<li class='waves-effect waves-light alertLi' onclick='location.href=\"/alert/checkalert?hstryId="+value.hstryId+"&altType="+value.altType+"&altNo="+value.altNo+"\";'>" +
								"	<div class='media'>" +
								"		<div class='media-body'>" +
								"			<h5>"+value.srNo+"</h5>" +
								"			<i class='fa fa open-card-option fa-times close' onclick='closeAlert(event,this,"+value.altNo+")'></i>" +
								"			<p class='notification-msg'>"+value.altCn+"</p>" +
								"			<span class='notification-time'>"+value.trsmYmd+"</span>" +
								"		</div>" +
								"	</div>" +
								"</li>";
						}else{
							alertLi=
								"<li class='waves-effect waves-light alertLi' onclick='location.href=\"/alert/checkalert?hstryId="+value.hstryId+"&altType="+value.altType+"&altNo="+value.altNo+"\";'>" +
								"	<div class='media'>" +
								"		<div class='media-body'>" +
								"			<h5>"+value.srInfoDmndNo+"</h5>" +
								"			<i class='fa fa open-card-option fa-times close' onclick='closeAlert(event,this,"+value.altNo+")'></i>" +
								"			<p class='notification-msg'>"+value.altCn+"</p>" +
								"			<span class='notification-time'>"+value.trsmYmd+"</span>" +
								"		</div>" +
								"	</div>" +
								"</li>";
						}
					}
					/*예정일 변경*/
					if(value.altType == 'CHG_YMD'){
						$("#chgDmndTab ul").append(alertLi);
					}
					/*예정일 변경(개발자)*/
					if(value.altType == 'CHG_YMD_DVL'){
						$("#chgDmndTab ul").append(alertLi);
					}
					/*개발취소*/
					if(value.altType == 'RTRCN'){
						$("#chgDmndTab ul").append(alertLi);
					}
				});
				countAlert();
				checkAlert();
			}
		});
	}
}
function closeAlert(event,clickedLi, altNo){
	$.ajax({
		url:"/alert/close",
		type:"GET",
		data:{"altNo":altNo},
		success:function(result){
			if(result!=0){
				$(clickedLi).parent("div").parent("div").parent("li").remove();
			}
			$(".alertListCount").remove();
			checkAlert();
			countAlert();
		}
	});
	
	event.stopPropagation();
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
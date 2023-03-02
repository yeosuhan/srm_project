$(document).ready(function(){
	$(".show-notification .nav-link").mouseover(function(){
		$(this).tab("show");
	});
});
/*see 방식으로 변경 고려 먼저 다른기능 구현 부터*/
function refreshAlert(){
	$("#rfltTab ul").empty();
	$("#chgDmndTab ul").empty();
	$("#developerTab ul").empty();
	$("#cancleTab ul").empty();
	getAlertList();
}
function getAlertList(){
	$.ajax({
		url:"/alert/list",
		type:"GET",
		success:function(result){
			result.forEach((value)=>{
				/*반영요청*/
				if(value.altType == 'a'){
					$("#rfltTab ul").append(
							"<li class='waves-effect waves-light'>" +
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
				if(value.altType == 'b'){
					$("#chgDmndTab ul").append(
							"<li class='waves-effect waves-light'>" +
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
				if(value.altType == 'c'){
					$("#developerTab ul").append(
							"<li class='waves-effect waves-light'>" +
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
				if(value.altType == 'd'){
					$("#cancleTab ul").append(
							"<li class='waves-effect waves-light'>" +
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
function getMemberId() {
	console.log("입력한 아이디: " + $("#memberId").val());
	$.ajax({
		url : '/join/check',
		type : 'GET',
		data : {
			memberId : $("#memberId").val()
		},
		success : function(plan) {

		}
	});
}
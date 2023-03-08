function checkMemberId() {
	var memberId =  $("#memberId").val();
	console.log("입력한 아이디: " + memberId);
	$.ajax({
		url : '/join/check/' + memberId,
		type : 'GET',
		success : function(check) {
			console.log("중복확인 성공 : " + check);
			if(check==1) {
				$("#checkId").html("이미 있는 아이디 입니다.");
				$("#checkId").attr('color', 'red')
				$("#memberId").val("");
			} else {
				$("#checkId").html("사용 가능한 아이디 입니다.");
				$("#checkId").attr('color', 'green')
			}
		}
	});
}
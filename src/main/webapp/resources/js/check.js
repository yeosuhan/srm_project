function checkMemberId() {
	var memberId =  $("#memberId").val();
	console.log("입력한 아이디: " + memberId);
	if(memberId=="") {
		memberId="공백";
	}
	$.ajax({
		url : '/join/check/' + memberId,
		type : 'GET',
		success : function(check) {
			console.log("중복확인 성공 : " + check);
			if(check==1) {
				$("#checkId").html("이미 있는 아이디 입니다.");
				$("#checkId").attr('color', 'red')
				$("#memberId").val("");
			} else if(check==0) {
				$("#checkId").html("사용 가능한 아이디 입니다.");
				$("#checkId").attr('color', 'green')
			} else if(check==2) {
				$("#checkId").html("아이디를 입력하세요.");
				$("#checkId").attr('color', 'red')
				$("#memberId").val("");
			}else if(check==3) {
				$("#checkId").html("아이디가 15자리를 초과합니다.");
				$("#checkId").attr('color', 'red')
				$("#memberId").val("");
			}else if(check==4) {
				$("#checkId").html("아이디가 8자리보다 모자릅니다.");
				$("#checkId").attr('color', 'red')
				$("#memberId").val("");
			}
		}
	});
}
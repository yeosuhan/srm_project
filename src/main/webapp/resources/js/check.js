function checkMemberId() {
	var memberId = $("#memberId").val();
	console.log("입력한 아이디: " + memberId);
	if (memberId == "") {
		memberId = "공백";
	}
	$.ajax({
		url : '/join/check/' + memberId,
		type : 'GET',
		success : function(check) {
			console.log("중복확인 성공 : " + check);
			if (check == 1) {
				$("#checkId").html("이미 있는 아이디 입니다.");
				$("#checkId").attr('color', 'red')
				$("#memberId").val("");
			} else if (check == 0) {
				$("#checkId").html("사용 가능한 아이디 입니다.");
				$("#checkId").attr('color', 'green')
			} else if (check == 2) {
				$("#checkId").html("아이디를 입력하세요.");
				$("#checkId").attr('color', 'red')
				$("#memberId").val("");
			} else if (check == 3) {
				$("#checkId").html("아이디가 15자리를 초과합니다.");
				$("#checkId").attr('color', 'red')
				$("#memberId").val("");
			} else if (check == 4) {
				$("#checkId").html("아이디가 8자리보다 모자릅니다.");
				$("#checkId").attr('color', 'red')
				$("#memberId").val("");
			}
		}
	});
}
document.getElementById("joinCheck").addEventListener('click',function() {
	const memberId = document.querySelector("#memberId")
	const pswd = document.querySelector("#pswd")
	const telNo = document.querySelector("#telNo")
	const eml = document.querySelector("#eml")

	const idPattern = new RegExp("^[a-z]+[a-z0-9]{8,16}$")
	const pwdPattern = new RegExp("^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,16}$")
	const telPattern = new RegExp("^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$")
	const emlPattern = new RegExp("^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]$")
	var check = true;
	if (!(idPattern.test(memberId.value))) {
		alert("아이디를 다시 입력하세요");
		return check = false;
	} else if (!(pwdPattern.test(pswd.value))) {
		alert("비밀번호를 다시 입력하세요");
		return check = false;
	} else if (!(telPattern.test(telNo.value))) {
		console.log(telNo.value);
		alert("전화번호를 다시 입력하세요");
		return check = false;
	} else if (!(emlPattern.test(eml.value))) {
		alert("이메일을 다시 입력하세요");
		return check = false;
	}
	if(check) {
		$('#joinCheck').prop("type", "submit");
	}
});
/* 비밀번호 찾기 기능 - 작성자 최은종 */

function checkVal() {

	var emlValidation = /[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]$/i;
	var telNoValidation = /^\d{2,3}-\d{3,4}-\d{4}$/;

	if ($("#eml").val() == null || $("#eml").val() == "") {
		alert("이메일을 입력해주세요.");
		$("#eml").focus();

		return false;
	}

	if ($("#telNo").val() == null || $("#telNo").val() == "") {
		alert("전화번호를 입력해주세요.");
		$("#telNo").focus();

		return false;
	}

	if (!telNoValidation.test($("#telNo").val())
			|| !emlValidation.test($("#eml").val())) {
		console.log($("#eml").val());
		console.log($("#telNo").val());
		alert("회원정보를 찾을 수 없습니다. 다시 입력해주세요.");
		return false;
	}

	$.ajax({
		type : 'POST',
		url : '/member/findPswd',
		data : {
			eml : "eml",
			memberId : "memberId",
			telNo : "telNo"
		},
		success : function(result) {
			console.log(result);
			alert("이메일로 임시 비밀번호가 전송되었습니다.")
		},
		error : function(result) {
			alert("[전송오류] 관리자에게 문의하세요.")
		}

	});
}
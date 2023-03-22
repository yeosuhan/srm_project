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
		alert("잘못된 형식입니다. 다시 입력해주세요.");
		return false;
	}

	var eml = $("#eml").val();
	var memberId = $("#memberId").val();
	var telNo = $("#telNo").val();
	$("#findPwModal button").html("<span class='spinner-border'></span>");
	$("#findPwModal button").prop("disabled",true);
	$.ajax({
		type : 'POST',
		url : '/member/findPswd',
		data : {
			eml : eml,
			memberId : memberId,
			telNo : telNo
		},
		success : function(result) {
			console.log("ajax 성공:" + result);
			if (result == 0) {
				console.log("회원정보 없음:" + result);
				alert("일치하는 회원정보가 없습니다. 다시 확인해주세요.")
				location.href = "/loginForm";
			} else {
				console.log("이메일 전송 완료:" + result);
				$("#findPwModal").modal("hide");
				showSuccessSraddAlert("이메일로 임시 비밀번호가 전송되었습니다.");
				$("#sradd button").on("click",function(){
					location.href="/loginForm";
				});
				
				$("#findPwModal button").removeClass("spinner-border text-muted");
				
			}
		},
		error : function(result) {
			console.log("ajax 성공:" + result);
			alert("[전송오류] 관리자에게 문의하세요.")
			location.href = "/loginForm";
		}
	});
}
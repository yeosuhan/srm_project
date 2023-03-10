/*로그인 시 아이디 저장 기능 구현 : 작성자 최은종*/

$(document).ready(function() {
	var rememberId = getCookie("rememberId");
	$("#memberId").val(rememberId);
	console.log(rememberId);

	if ($("input[name=memberId]").val() != "") {
		$("#checkId").attr("checked", true);
	}
	$("#checkId").change(function() {
		if ($("#checkId").is(":checked")) {
			var rememberId = $("input[name=memberId]").val();
			setCookie("rememberId", rememberId, 30);
			console.log(rememberId);
		} else {
			deleteCookie("rememberId");
		}
	});

	$("input[name=memberId]").keyup(function() {
		if ($("#checkId").is(":checked")) {
			var rememberId = $("input[name=memberId]").val();
			setCookie("rememberId", rememberId, 30);
			console.log(rememberId);
		}
	});
});

function setCookie(cookieName, value, exdays) {
	console.log("setCookie() 시작");
	var exdate = new Date();
	exdate.setDate(exdate.getDate() + exdays);
	var cookieValue = escape(value)
			+ ((exdays == null) ? "" : ";expires=" + exdate.toGMTString());
	console.log(cookieValue);
	document.cookie = cookieName + "=" + cookieValue;
}

function deleteCookie(cookieName) {
	console.log("deleteCookie() 시작");
	var expireDate = new Date();
	expireDate.setDate(expireDate.getDate() - 1);
	console.log(expireDate);
	document.cookie = cookieName + "=" + ";expires=" + expireDate.toGMTString();
}

function getCookie(cookieName) {
	console.log("getCookie() 시작");
	cookieName = cookieName + '=';
	var cookieDate = document.cookie;
	var start = cookieDate.indexOf(cookieName);
	var cookieValue = '';

	console.log(cookieDate);
	console.log(start);

	if (start != -1) {
		start += cookieName.length;
		var end = cookieDate.indexOf(';', start);
		if (end == -1)
			end = cookieDate.length;
		cookieValue = cookieDate.substring(start, end);
		console.log(cookieValue);
	}
	return unescape(cookieValue);
}
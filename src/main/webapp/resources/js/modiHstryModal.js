/*작성자: 최은종*/

/* 요청 유형(select box)에 따라 변경요청일 숨기기 */
$(document).ready(function() {
	$('#modiHstryType').change(function() {
		var value = $('#modiHstryType option:selected').val();
		if (value == 'C') {
			$('.AhstryType1').hide();
			$('.AhstryType2').hide();
		} else {
			$('.AhstryType1').show();
			$('.AhstryType2').show();
		}
	});
});

/* 유효성 체크 alert */
function checkVal() {
	if ($("#modiHstryType > option:selected").val() != 'C') {
		console.log($("#modiHstryType > option:selected").val());

		const cYmd2 = document.querySelector('#modiChgEndYmd');
		console.log(cYmd2.value);
		console.log(document.querySelector('#modiChgEndYmd').value);

		var now2 = Date.now();
		var timeOff2 = new Date().getTimezoneOffset() * 60000;
		var today2 = new Date(now2 - timeOff2).toISOString().split('T')[0];
		console.log(today2);
		// 완료일변경시 변경일자 지정 안하면 값이 넘어가는 것을 막기 + 오늘 이전의 날짜는 선택할 수 없게 제한하는 함수
		if (cYmd2.value == null || cYmd2.value == "" || cYmd2.value < today2) {
			console.log(cYmd2.value);
			alert("변경될 완료일을 다시 확인해주세요.");
			$('#modiChgEndYmd').focus();
			return false;
		}
	}

	// 제목이나 사유 빈값이면 안넘어가게
	const ttl2 = document.querySelector('#modiHstryTtl');
	const cn2 = document.querySelector('#modiHstryCn');
	if (ttl2.value == null || ttl2.value == "" || cn2.value == null
			|| cn2.value == "") {
		alert("미입력 칸이 있습니다. 모든 항목을 입력해주세요.");
		return false;
	}

	return true;
}
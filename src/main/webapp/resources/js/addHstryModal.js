/*작성자: 최은종*/

/* 고정값 넣어놓기 */
function addHistory(srNo) {
	var srNo = $("#srNo").val();
	var cmptnDmndYmd = $("#SRDCmptnDmndYmd").val();
	document.getElementById('HwrtYmd').valueAsDate = new Date();

	$("#HsrNo").val(srNo);
	$("#HcmptnDmndYmd").val(cmptnDmndYmd);

}

/* 요청 유형(select box)에 따라 변경요청일 숨기기 */
$(document).ready(function() {
	$('#hstryType').change(function() {
		var value = $('#hstryType option:selected').val();
		if (value == 'C') {
			$('#chg1').hide();
			$('#chg2').hide();
		} else {
			$('#chg1').show();
			$('#chg2').show();
		}
	});
});

/* 유효성 체크 alert */
function checkValue() {
	if ($("#hstryType > option:selected").val() != 'C') {
		console.log($("#hstryType > option:selected").val());

		const cYmd = document.querySelector('#HchgEndYmd');
		console.log(cYmd.value);
		console.log(document.querySelector('#HchgEndYmd').value);

		var now = Date.now();
		var timeOff = new Date().getTimezoneOffset() * 60000;
		var today = new Date(now - timeOff).toISOString().split('T')[0];
		console.log(today);
		// 완료일변경시 변경일자 지정 안하면 값이 넘어가는 것을 막기 + 오늘 이전의 날짜는 선택할 수 없게 제한하는 함수
		if (cYmd.value == null || cYmd.value == "" || cYmd.value < today) {
			console.log(cYmd.value);
			alert("요청 예정일을 다시 확인해주세요.");
			$('#HchgEndYmd').focus();
			return false;
		}
	}

	// 제목이나 사유 빈값이면 안넘어가게
	const ttl1 = document.querySelector('#HhstryTtl');
	const cn1 = document.querySelector('#HhstryCn');
	if (ttl1.value == null || ttl1.value == "" || cn1.value == null || cn1.value == "") {
		alert("미입력 칸이 있습니다. 모든 항목을 입력해주세요.");
		return false;
	}
	
	return true;
}

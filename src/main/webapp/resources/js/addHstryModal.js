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

/* 완료일변경시 변경일자 지정 안하면 값이 넘어가는 것을 막기 위한 함수 */
function checkValue() {
	if ($("#hstryType > option:selected").val() != 'C') {
		console.log($("#hstryType > option:selected").val());

		const cYmd = document.querySelector('#HchgEndYmd');
		console.log(cYmd.value);
		console.log(document.querySelector('#HchgEndYmd').value);

		if (cYmd.value == null || cYmd.value == "") {
			console.log(cYmd.value);
			alert("경고창입니다.");
			$('#HchgEndYmd').focus();
			return false;
		}
	}
	return true;
}
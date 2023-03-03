/* 고정값 넣어놓기 */
function addHistory(srNo) {
	var srNo = $("#srNo").val();
	var cmptnDmndYmd = $("#SRDCmptnDmndYmd").val();
	document.getElementById('HwrtYmd').valueAsDate = new Date();

	$.ajax({
		url : "/history/add?srNo=" + srNo,
		type : "GET",

		success : function(result) {
			console.log(result);
			$("#HsrNo").val(srNo);
			$("#HcmptnDmndYmd").val(cmptnDmndYmd);
		}
	});
}

/* 개발취소 선택 시 색상 바꿔서 강조하기 */
/*
 * $(document).ready(function() { $('#hstryType').change(function() { var value =
 * $('#hstryType option:selected').val(); if (value == 'C') {
 * $('#mHd').css({"background-color": "indianred"});
 * $('#mBt').css({"background-color": "indianred", "border-color" :
 * "indianred"}); } else { $('#mHd').css({"background-color": "dodgerblue"});
 * $('#mBt').css({"background-color": "dodgerblue", "border-color" :
 * "dodgerblue"}); } }); });
 */

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
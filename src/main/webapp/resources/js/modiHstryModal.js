/*작성자: 최은종*/

var element = document.createElement('div');
element.innerHTML = '<sec:authentication property="principal.authorities[0]"/>';
var auth = element.innerHTML;

var element = document.createElement('div');
element.innerHTML = '<sec:authentication property="principal.username"/>';
var user = element.innerHTML;

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

/* 완료일변경시 변경일자 지정 안하면 값이 넘어가는 것을 막기 위한 함수 */
function checkVal() {
	if ($("#modiHstryType > option:selected").val() != 'C') {
		console.log($("#modiHstryType > option:selected").val());

		const cYmd2 = document.querySelector('#modiChgEndYmd');
		console.log(cYmd2.value);
		console.log(document.querySelector('#modiChgEndYmd').value);

		if (cYmd2.value == null || cYmd2.value == "") {
			console.log(cYmd2.value);
			alert("경고창입니다.");
			$('#modiChgEndYmd').focus();
			return false;
		}
	}
	return true;
}
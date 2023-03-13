/* 작성자: 최은종 / 2023-03-12 */

function moveHstryTab() {
	$('.nav-link').removeClass('active');

	$('.hstry').addClass('active');

	$.ajax({
		url : "/myportal/mytodo/history",
		type : "GET",
		success : function(result) {
			$('#requesttable').html(result);
			console.log("ajax success");

		}
	});
}

/**
 * 
 * @param url
 * @returns
 * 
 */
function mytodoHstryPaging(pageNo) {
	var url = "/myportal/mytodo/history?page=" + pageNo;

	$.ajax({
		url : url,
		type : "GET",
		success : function(result) { // 목록
			$('#requesttable').html(result);
			console.log("ajax success" + pageNo);
		}

	});
}

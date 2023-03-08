/*작성자: 최은종*/

/* 히스토리 리스트 페이징 처리 (공통) */
function hstryPager(pager, url, onclickMethod) {
	console.log("userHstry pager 들어옴 ~~~~~");
	$('.hstryPager').empty();
	var tags;
	if (pager.startPageNo - 1 > 0) {
		tags = "<a class='hstryPager-newer' href='#' onclick='" + onclickMethod
				+ "(\"" + url + (pager.startPageNo - 1) + "\")'>PREV</a>";
	}
	for (var pageNo = pager.startPageNo; pageNo <= pager.endPageNo; pageNo++) {
		if (pager.pageNo == pageNo) {
			tags = tags + "<a class='hstryPager-active' href='#' onclick='"
					+ onclickMethod + "(\"" + url + pageNo + "\")'>" + pageNo
					+ "</a>";
		} else {
			tags = tags + "<a href='#' onclick='" + onclickMethod + "(\"" + url
					+ pageNo + "\")'>" + pageNo + "</a>";
		}
	}
	$('.hstryPager').html(tags);
}

/* 관리자&개발자 히스토리 */
function empHstry() {
	var srNo = $("#srNo").val();
	console.log("srHistoryList 글번호: " + srNo);

	$.ajax({
		url : "/history/emp/list?srNo=" + srNo,
		type : "GET",

		success : function(result) {

			// 히스토리 리스트
			getSrHistoryList(result.srInformationHistory);

			// 페이저
			var url = "/history/emp/list?srNo=" + srNo + "&pageNo=";
			hstryPager(result.pager, url, 'empHstryPager');
		}
	});
}

/* 히스토리 리스트 가져오기 */
function getSrHistoryList(srInformationHistory) {
	console.log("----getSrHistoryList()-----");
	var params;
	$('#srhistory1').empty();
	if (srInformationHistory.length == 0) {
		$("#srhistory1").html('<td colspan="5">히스토리 내역이 없습니다.</td>');
	}
	for (var i = 0; i < srInformationHistory.length; i++) {
		var historyId = srInformationHistory[i].hstryId;
		var historyCount = [ i + 1 ];

		var historyWriter = srInformationHistory[i].flnm;
		if (srInformationHistory[i].hstryType == 'A'
				|| srInformationHistory[i].hstryType == 'B') {
			var historyType = "완료일 변경";
		} else {
			var historyType = "개발 취소";
		}

		if (srInformationHistory[i].hstryType == 'C') {
			var historyChgEndYmd3 = "-";
		} else {
			var historyChgEndYmd1 = srInformationHistory[i].chgEndYmd;
			var historyChgEndYmd2 = new Date(historyChgEndYmd1);
			var historyChgEndYmd3 = new Date(historyChgEndYmd2.getTime()
					- (historyChgEndYmd2.getTimezoneOffset() * 60000))
					.toISOString().split('T')[0];

		}

		if (srInformationHistory[i].hstryStts == 'I') {
			var historyStts = "미승인";
		} else if (srInformationHistory[i].hstryStts == 'N') {
			var historyStts = "반려";
		} else {
			var historyStts = "승인";
		}

		var param = '<tr data-toggle="modal" data-target="#approvalInfoHistoryModal" onclick="getInfoHstryDetail('
				+ historyId + ')">';
		param += '<th scope="row">' + historyCount + '</th>';
		param += '<td>' + historyWriter + '</td>';
		param += '<td>' + historyType + '</td>';
		param += '<td>' + historyChgEndYmd3 + '</td>';
		param += '<td>' + historyStts + '</td>';
		param += '</tr>';

		params += param;
	}
	$("#srhistory1").html(params);
}

function empHstryPager(url) {
	console.log(url);
	var srNo = $("#srNo").val();

	$.ajax({
		url : url,
		type : "GET",

		success : function(result) {

			// 히스토리 리스트
			getSrHistoryList(result.srInformationHistory)

			// 페이저
			var url = "/history/emp/list?srNo=" + srNo + "&pageNo=";
			hstryPager(result.pager, url, 'empHstryPager');
		}
	});

}

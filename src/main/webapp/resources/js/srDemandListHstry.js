/*작성자: 최은종*/

var element = document.createElement('div');
element.innerHTML = '<sec:authentication property="principal.username"/>';
var user = element.innerHTML;

/* 히스토리 리스트 페이징 처리 (공통) */
function hstryPager(pager, url, onclickMethod) {
	console.log("userHstry pager 들어옴 ~~~~~");
	$('.hstryPager').empty();
	var tags = "";
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

/* 고객 히스토리 */
function userHstry() {
	var dmndNo = $(".dmndNo").text();
	console.log("srHistoryList 글번호: " + dmndNo);

	$.ajax({
		url : "/history/list?dmndNo=" + dmndNo,
		type : "GET",

		success : function(result) {
			// console.log(result.srInformationHistory);
			// console.log(result.pager);
			// informationHstry = result.srInformationHistory;
			// console.log(informationHstry);

			// 히스토리 리스트
			getHistoryList(result.srInformationHistory);

			// 페이저
			var url = "/history/list?dmndNo=" + dmndNo + "&pageNo=";
			hstryPager(result.pager, url, 'userHstryPager');
		}
	});
}

/* 히스토리 리스트 가져오기 */
function getHistoryList(srInformationHistory) {
	console.log("----getHistoryList()-----");
	var params;
	$('#history').empty();
	if (srInformationHistory.length == 0) {
		$("#history").html('<td colspan="4">히스토리 내역이 없습니다.</td>');
	}
	for (var i = 0; i < srInformationHistory.length; i++) {

		console.log("----getHistoryList() for문-----");
		var historyId = srInformationHistory[i].hstryId;
		var historyCount = [ i + 1 ];
		if (srInformationHistory[i].hstryType == 'B') {
			var historyType = "완료일 변경";
		} else if (srInformationHistory[i].hstryType == 'C') {
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

		var param = '<tr data-toggle="modal" data-target="#approvalHistoryModal" onclick="getHstryDetail('
				+ historyId + ')">';
		param += '<th scope="row">' + historyCount + '</th>';
		param += '<td>' + historyType + '</td>';
		param += '<td>' + historyChgEndYmd3 + '</td>';
		param += '<td>' + historyStts + '</td>';
		param += '</tr>';

		params += param;
	}
	$("#history").html(params);

}

function userHstryPager(url) {
	console.log(url);
	var dmndNo = $(".dmndNo").val();

	$.ajax({
		url : url,
		type : "GET",

		success : function(result) {
			console.log(result.srInformationHistory);
			console.log(result.pager);

			// 히스토리 리스트
			getHistoryList(result.srInformationHistory)

			// 페이저
			var url = "/history/list?dmndNo=" + dmndNo + "&pageNo=";
			hstryPager(result.pager, url, 'userHstryPager')
		}
	});

}

var element = document.createElement('div');
element.innerHTML = '<sec:authentication property="principal.username"/>';
var user = element.innerHTML;

function getHistoryList() {
	var dmndNo = $(".dmndNo").val();
	console.log("srHistoryList 글번호: " + dmndNo);
	$
			.ajax({
				url : "/history/list?dmndNo=" + dmndNo,
				type : "GET",

				success : function(result) {
				
					
					for (var i = 0; i < result.srInformationHistory.length; i++) {

						var historyId = result.srInformationHistory[i].hstryId;

						var historyCount = [ i +1];

						if (result.srInformationHistory[i].hstryType == 'B') {
							var historyType = "완료일 변경";
						} else if (result.srInformationHistory[i].hstryType == 'C') {
							var historyType = "개발 취소";
						}
						if (result.srInformationHistory[i].chgEndYmd == 'C') {
							var historyChgEndYmd3 = "-";
						} else {
							var historyChgEndYmd1 = result.srInformationHistory[i].chgEndYmd;
							var historyChgEndYmd2 = new Date(historyChgEndYmd1);
							var historyChgEndYmd3 = new Date(
									historyChgEndYmd2.getTime()
											- (historyChgEndYmd2
													.getTimezoneOffset() * 60000))
									.toISOString().split('T')[0];
						}
						if (result.srInformationHistory[i].hstryStts == 'I') {
							var historyStts = "미승인";
						} else if (result.srInformationHistory[i].hstryStts == 'N') {
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

						$("#history").append(param);

					}

				}
			});
}
function getSrHistoryList() {
	var srNo = $("#srNo").val();
	console.log("srHistoryList 글번호: " + srNo);
	$
			.ajax({
				url : "/history/emp/list?srNo=" + srNo,
				type : "GET",

				success : function(result) {
					console.log(result);
					console.log(result.srInformationHistory[0].hstryId);
					$("#srhistory1").empty();

					for (var i = 0; i < result.srInformationHistory.length; i++) {
						var historyId = result.srInformationHistory[i].hstryId;
						var historyCount = [ i + 1 ];

						var historyWriter = result.srInformationHistory[i].flnm;
						if (result.srInformationHistory[i].hstryType == 'A'
								|| result.srInformationHistory[i].hstryType == 'B') {
							var historyType = "완료일 변경";
						} else {
							var historyType = "개발 취소";
						}
						if (result.srInformationHistory[i].hstryType == 'C') {
							var historyChgEndYmd3 = "-";
						} else {
							var historyChgEndYmd1 = result.srInformationHistory[i].chgEndYmd;
							var historyChgEndYmd2 = new Date(historyChgEndYmd1);
							var historyChgEndYmd3 = historyChgEndYmd2
									.toISOString().split('T')[0];
						}
						if (result.srInformationHistory[i].hstryStts == 'I') {
							var historyStts = "미승인";
						} else if (result.srInformationHistory[i].hstryStts == 'N') {
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

						$("#srhistory1").append(param);
					}
				}
			});
}
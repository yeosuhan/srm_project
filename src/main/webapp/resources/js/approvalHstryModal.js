var element = document.createElement('div');
element.innerHTML = '<sec:authentication property="principal.authorities[0]"/>';
var auth = element.innerHTML;
console.log(auth);

function getHstryDetail(historyId) {
	console.log("historyId: " + historyId);

	$
			.ajax({
				url : '/history/detail/' + historyId,
				type : 'GET',
				success : function(result) {
					console.log(result);

					var appvHstryType = result.hstryType;
					var appvHstryStts = result.hstryStts;
					var appvRqstrId = result.rqstrId;
					console.log(appvHstryType);
					console.log(appvHstryStts);
					console.log(appvRqstrId);

					$('#appvSrNo').val(result.srNo);
					$('#appvInstNm').val(result.instNm);
					$('#appvSysNm').val(result.sysNm);
					$('#appvDeptNm').val(result.deptNm);
					$('#appvWrtYmd').val(result.wrtYmd);
					$('#appvCmptnDmndYmd').val(result.cmptnDmndYmd);
					// 이거 + empty 왜 안먹히는지 모르겠음
					if (appvHstryType != 'C') {
						$('#appvChgEndYmd').val(result.chgEndYmd);
					} else {
						$('#appvHstryType1').remove();
						$('#appvHstryType2').remove();
					}
					$('#appvHstryTtl').val(result.hstryTtl);
					$('#appvHstryCn').val(result.hstryCn);

					if (auth == 'ROLE_CLIENT'
							&& (appvHstryType == 'B' || appvHstryType == 'C')) {
						if (appvHstryStts == 'I') {
							$('#appvHstrySttsDiv2')
									.html(
											'<label class="mr-3"><input id="appvHstryStts1" type="radio" name="hstryStts" value="Y">승인</label>'
													+ '<label><input id="appvHstryStts2" type="radio" name="hstryStts" value="N">반려</label>');
							$('#footDivUSer')
									.html(
											'<button type="submit" form="approvalHistoryForm" formmethod="post" class="btn btn-info save center">등록</button>');

							$(document)
									.ready(
											function() {
												$("input[name='hstryStts']")
														.change(
																function() {
																	var hStatus = $(
																			"input[name='hstryStts']:checked")
																			.val();
																	console
																			.log("~~~~~~~~~~~~~");
																	if (hStatus == 'Y') {
																		$(
																				'#appvHstryType')
																				.val(
																						'B');
																	} else if (hStatus == 'N') {
																		$(
																				'#appvHstryType')
																				.val(
																						'A');
																	}
																});
											});
						} else if (appvHstryStts == 'Y') {
							$('#appvHstrySttsDiv2')
									.html(
											'<input id="bHstryStts" type="text" value="승인" readonly>');
							$('#footDivUSer').text("결재 처리 된 요청입니다.");
						} else if (appvHstryStts == 'N') {
							$('#appvHstrySttsDiv2')
									.html(
											'<input id="cHstryStts" type="text" value="반려" readonly>');
							$('#footDivUSer').text("결재 처리 된 요청입니다.");
						}
					} else if (auth != 'ROLE_CLIENT'
							&& (appvHstryType == 'B' || appvHstryType == 'C')) {
						if (appvHstryStts == 'I') {
							$('#appvHstrySttsDiv2')
									.html(
											'<label class="mr-3"><input id="appvHstryStts1" type="radio" name="hstryStts" value="Y" onclick="return(false);">승인</label>'
													+ '<label><input id="appvHstryStts2" type="radio" name="hstryStts" value="N" onclick="return(false);">반려</label>');
							$('#footDivUSer').text("결재 권한이 없습니다.");
						} else if (appvHstryStts == 'Y') {
							$('#appvHstrySttsDiv2')
									.html(
											'<input id="bHstryStts" type="text" value="승인" readonly>');
							$('#footDivUSer').text("결재 처리 된 요청입니다.");
						} else if (appvHstryStts == 'N') {
							$('#appvHstrySttsDiv2')
									.html(
											'<input id="cHstryStts" type="text" value="반려" readonly>');
							$('#footDivUSer').text("결재 처리 된 요청입니다.");
						}
					}
				}
			});
}
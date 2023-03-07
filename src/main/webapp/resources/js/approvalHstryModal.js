var element = document.createElement('div');
element.innerHTML = '<sec:authentication property="principal.username"/>';
var user = element.innerHTML;

function getHstryDetail(historyId) {
	console.log("historyId: " + historyId);

	$
			.ajax({
				url : '/history/detail/' + historyId,
				type : 'GET',
				success : function(result) {
					console.log(result);
					console.log(result.auth);

					var auth = result.auth;
					var appvHstryType = result.hstryType;
					var appvHstryStts = result.hstryStts;
					var appvRqstrId = result.rqstrId;
					var appvHstryId = result.hstryId;
					console.log(appvHstryStts);
					$('.AsrNo').val(result.srNo);
					$('.AinstNm').val(result.instNm);
					$('.AsysNm').val(result.sysNm);
					$('.AdeptNm').val(result.deptNm);
					$('.AwrtYmd').val(result.wrtYmd);
					$('.AcmptnDmndYmd').val(result.cmptnDmndYmd);
					// 이거 + empty 왜 안먹히는지 모르겠음
					if (appvHstryType != 'C') {
						$('.AchgEndYmd').val(result.chgEndYmd);
					} else {
						$('.AhstryType1').remove();
						$('.AhstryType2').remove();
					}
					$('.AhstryTtl').val(result.hstryTtl);
					$('.AhstryCn').val(result.hstryCn);
					console.log(appvHstryType);
					if (auth == 'ROLE_CLIENT'
							&& (appvHstryType == 'B' || appvHstryType == 'C')) {
						console.log("!!!@@!!");
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
																				'.bHstryType')
																				.val(
																						'B');
																	} else if (hStatus == 'N') {
																		$(
																				'.bHstryType')
																				.val(
																						'A');
																	}
																});
											});
						} else if (appvHstryStts == 'Y') {
							$('#appvHstrySttsDiv2')
									.html(
											'<input id="ubHstryStts" type="text" value="승인" readonly>');
							$('#footDivUSer').text("결재 처리 된 요청입니다.");
						} else if (appvHstryStts == 'N') {
							console.log("!!!!!!!!!");
							$('#appvHstrySttsDiv2')
									.html(
											'<input id="ucHstryStts" type="text" value="반려" readonly>');
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
											'<input id="ubHstryStts" type="text" value="승인" readonly>');
							$('#footDivUSer').text("결재 처리 된 요청입니다.");
						} else if (appvHstryStts == 'N') {
							$('#appvHstrySttsDiv2')
									.html(
											'<input id="ucHstryStts" type="text" value="반려" readonly>');
							$('#footDivUSer').text("결재 처리 된 요청입니다.");
						}
					}
				}
			});
}
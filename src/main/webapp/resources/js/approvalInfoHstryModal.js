var element = document.createElement('div');
element.innerHTML = '<sec:authentication property="principal.authorities[0]"/>';
var auth = element.innerHTML;
console.log(auth);

function getInfoHstryDetail(historyId) {
	console.log("historyId: " + historyId);

	$
			.ajax({
				url : '/history/detail/' + historyId,
				type : 'GET',
				success : function(result) {
					console.log(result);

					var AhstryType = result.hstryType;
					var AhstryStts = result.hstryStts;
					var ArqstrId = result.rqstrId;
					console.log(AhstryType);
					console.log(AhstryStts);
					console.log(ArqstrId);

					$('#AsrNo').val(result.srNo);
					$('#AinstNm').val(result.instNm);
					$('#AsysNm').val(result.sysNm);
					$('#AdeptNm').val(result.deptNm);
					$('#AwrtYmd').val(result.wrtYmd);
					$('#AcmptnDmndYmd').val(result.cmptnDmndYmd);
					// 이거 + empty 왜 안먹히는지 모르겠음
					if (AhstryType != 'C') {
						$('#AchgEndYmd').val(result.chgEndYmd);
					} else {
						$('#AhstryType1').remove();
						$('#AhstryType2').remove();
					}
					$('#AhstryTtl').val(result.hstryTtl);
					$('#AhstryCn').val(result.hstryCn);

					if (auth == 'ROLE_ADMIN' && AhstryType == 'A') {
						if (ArqstrId != '<sec:authentication property="principal.username"/>'
								&& AhstryStts == 'I') {
							$('#HstrySttsDiv2')
									.html(
											'<label class="mr-3"><input id="AHstryStts1" type="radio" name="hstryStts" value="Y">승인</label>'
													+ '<label><input id="AHstryStts2" type="radio" name="hstryStts" value="N">반려</label>');
							$('#footDiv')
									.html(
											'<button type="submit" form="historyDetailForm" formmethod="post" class="btn btn-info save center">등록</button>');

							$(document)
									.ready(
											function() {
												$("input[name='hstryStts']")
														.change(
																function() {
																	var hstatus = $(
																			"input[name='hstryStts']:checked")
																			.val();
																	console
																			.log("~~~~~~~~~~~~~");
																	if (hstatus == 'Y') {
																		$(
																				'#bHstryType')
																				.val(
																						'B');
																	} else if (hstatus == 'N') {
																		$(
																				'#bHstryType')
																				.val(
																						'A');
																	}
																});
											});
						} else if (ArqstrId == '<sec:authentication property="principal.username"/>'
								&& AhstryStts == 'I') {
							$('#HstrySttsDiv2')
									.html(
											'<label class="mr-3"><input id="AHstryStts1" type="radio" name="hstryStts" value="Y" onclick="return(false);">승인</label>'
													+ '<label><input id="AHstryStts2" type="radio" name="hstryStts" value="N" onclick="return(false);">반려</label>');
							$('#footDiv').text("결재 권한이 없습니다.");
						} else if (ArqstrId != '<sec:authentication property="principal.username"/>'
								&& AhstryStts == 'Y') {
							$('#HstrySttsDiv2')
									.html(
											'<input id="BHstryStts" type="text" value="승인" readonly>');
							$('#footDiv').text("결재 처리 된 요청입니다.");
						} else if (ArqstrId != '<sec:authentication property="principal.username"/>'
								&& AhstryStts == 'N') {
							$('#HstrySttsDiv2')
									.html(
											'<input id="CHstryStts" type="text" value="반려" readonly>');
							$('#footDiv').text("결재 처리 된 요청입니다.");
						}
					} else if (auth == 'ROLE_ADMIN' && AhstryType != 'A') {
						if (AhstryStts == 'I') {
							$('#HstrySttsDiv2')
									.html(
											'<label class="mr-3"><input id="AHstryStts1" type="radio" name="hstryStts" value="Y" onclick="return(false);">승인</label>'
													+ '<label><input id="AHstryStts2" type="radio" name="hstryStts" value="N" onclick="return(false);">반려</label>');
							$('#footDiv').text("결재 권한이 없습니다.");
						} else if (AhstryStts == 'Y') {
							$('#HstrySttsDiv2')
									.html(
											'<input id="BHstryStts" type="text" value="승인" readonly>');
							$('#footDiv').text("결재 권한이 없습니다.");
						} else if (AhstryStts == 'N') {
							$('#HstrySttsDiv2')
									.html(
											'<input id="CHstryStts" type="text" value="반려" readonly>');
							$('#footDiv').text("결재 권한이 없습니다.");
						}
					} else if (auth != 'ROLE_ADMIN') {
						if (AhstryStts == 'I') {
							$('#HstrySttsDiv2')
									.html(
											'<label class="mr-3"><input id="AHstryStts1" type="radio" name="hstryStts" value="Y" onclick="return(false);">승인</label>'
													+ '<label><input id="AHstryStts2" type="radio" name="hstryStts" value="N" onclick="return(false);">반려</label>');
							$('#footDiv').text("결재 권한이 없습니다.");
						} else if (AhstryStts == 'Y') {
							$('#HstrySttsDiv2')
									.html(
											'<input id="BHstryStts" type="text" value="승인" readonly>');
							$('#footDiv').text("결재 처리 된 요청입니다.");
						} else if (AhstryStts == 'N') {
							$('#HstrySttsDiv2')
									.html(
											'<input id="CHstryStts" type="text" value="반려" readonly>');
							$('#footDiv').text("결재 처리 된 요청입니다.");
						}
					}
				}
			});
}
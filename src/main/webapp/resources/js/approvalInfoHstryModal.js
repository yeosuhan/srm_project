/*작성자: 최은종*/

var element = document.createElement('div');
element.innerHTML = '<sec:authentication property="principal.authorities[0]"/>';
var auth = element.innerHTML;
console.log(auth);

var element = document.createElement('div');
element.innerHTML = '<sec:authentication property="principal.username"/>';
var user = element.innerHTML;

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
					var AhstryId = result.hstryId;
					console.log(AhstryType);
					console.log(AhstryStts);
					console.log(ArqstrId);
					console.log(AhstryId);

					$('.AsrNo').val(result.srNo);
					$('.AinstNm').val(result.instNm);
					$('.AsysNm').val(result.sysNm);
					$('.AdeptNm').val(result.deptNm);
					$('.AwrtYmd').val(result.wrtYmd);
					$('.AcmptnDmndYmd').val(result.cmptnDmndYmd);
					// 이거 + empty 왜 안먹히는지 모르겠음
					if (AhstryType != 'C') {
						$('.AchgEndYmd').val(result.chgEndYmd);
					} else {
						$('.AhstryType1').hide();
						$('.AhstryType2').hide();
					}
					$('.AhstryTtl').val(result.hstryTtl);
					$('.AhstryCn').val(result.hstryCn);

					if (auth == 'ROLE_ADMIN' && AhstryType == 'A') {
						if (ArqstrId != user && AhstryStts == 'I') {
							$('#HstrySttsDiv2')
									.html(
											'<label class="mr-3"><input id="AHstryStts1" type="radio" name="hstryStts" value="Y">승인</label>'
													+ '<label><input id="AHstryStts2" type="radio" name="hstryStts" value="N">반려</label>' + '<input type="hidden" class="AhstryId" name="hstryId" value="">');
							$('.AhstryId').val(AhstryId);
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
																				'.bHstryType')
																				.val(
																						'B');
																	} else if (hstatus == 'N') {
																		$(
																				'.bHstryType')
																				.val(
																						'A');
																	}
																});
											});
						} else if (ArqstrId == user && AhstryStts == 'I') {

							$('#HstrySttsDiv2')
									.html(
											'<label class="mr-3"><input id="AHstryStts1" type="radio" name="hstryStts" value="Y" onclick="return(false);">승인</label>'
													+ '<label><input id="AHstryStts2" type="radio" name="hstryStts" value="N" onclick="return(false);">반려</label>');
							$('#footDiv').text("결재 권한이 없습니다.");
						} else if (ArqstrId != user && AhstryStts == 'Y') {
							$('#HstrySttsDiv2')
									.html(
											'<input id="BHstryStts" type="text" value="승인" readonly>');
							$('#footDiv').text("결재 처리 된 요청입니다.");
						} else if (ArqstrId != user && AhstryStts == 'N') {
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

					if (ArqstrId == user && AhstryStts == 'I') {
						if (auth != 'ROLE_ADMIN' && AhstryType == 'A') {
							console.log(AhstryType);
							$('#mheadDiv')
									.html(
											'<input type="button" class="btn btn-primary pb-0" value="수정" data-toggle="modal" data-target="#modifyHistoryModal">'
													+ '<input type="hidden" class="AhstryId" value="">');
						} else if (auth == 'ROLE_ADMIN' && AhstryType != 'A') {
							$('#mheadDiv')
									.html(
											'<input type="button" class="btn btn-primary pb-0" value="수정" data-toggle="modal" data-target="#modifyHistoryModal">'
													+ '<input type="hidden" class="AhstryId" value="">');
						}
					}
				}
			});
}

$(document).ready(function() {
	$('#modifyHistoryModal').on('show.bs.modal', function() {
		$('#approvalInfoHistoryModal').modal('hide')
	});

});

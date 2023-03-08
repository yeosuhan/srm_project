/*
 * 작성자 : 신정은 내용 
 * 
 */
function writeQna() {
	console.log(" !!!!  버튼 눌림")
	$.ajax({
		url : '/board/write?type=qna',
		type : 'GET',
		success : function(data) {
			console.log(data);
			
			$("#writeQna").html(data);
			$("#writeQna").css('display', 'block');
		}
	});
}

function qnaDetail(bbsNo) {
	$.ajax({
		url : '/board/detail?bbsNo='+ bbsNo,
		type : 'GET',
		success : function(data) {
			console.log(data);
			
			$("#qnaDetail").html(data);
		}
	});
}

/*********  notice board   ********* */
function writeNotice() {
	console.log(" !!!!  버튼 눌림")
	$.ajax({
		url : '/board/write?type=notice',
		type : 'GET',
		success : function(data) {
			console.log(data);
			
			$("#writeNotice").html(data);
			$("#writeNotice").css('display', 'block');
		}
	});
}

function noticeDetail(bbsNo) {
	$.ajax({
		url : '/board/detail?bbsNo='+ bbsNo,
		type : 'GET',
		success : function(data) {
			console.log(data);
			
			$("#noticeDetail").html(data);
		}
	});
}
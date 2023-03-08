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
			
		//$("#writeQna").html(data);
		$("#writeQna").modal('show');		
		}
	});
}
/*
 * 작성자 : 신정은  
 * 
 */
/*******************  공통 ****************/
// 폼 유효성 검사
function goPost() {
	var bbsTtl = $('#bbsTtl').val();
	var bbsCn = $('#bbsCn').val();
	
	if(!bbsTtl) {
		alert('제목 입력하여주세요.');
	      $('#bbsTtl').focus();
	}
	else if(!bbsCn){
		alert('내용을 입력하여주세요.');
	      $('#bbsCn').focus();
	}
	else {
		var formData = new FormData();
		
		var bbsType =  $('input[name=bbsType]').val();
		var wrtrId =  $('input[name=wrtrId]').val();
		var srNo =  $('select[name=srNo]').val();
		var bbsTtl = $('input[name=bbsTtl]').val();
		var bbsCn = $('input[name=bbsCn]').val();
		var attachFile = $('input[name=attachFile]')[0].files[0];
		
		formData.append("bbsType", bbsType);
		formData.append("wrtrId", wrtrId);
		formData.append("srNo", srNo);
		formData.append("bbsTtl", bbsTtl);
		formData.append("bbsCn", bbsCn);
		formData.append("attachFile", attachFile);
					 		
		console.log($('input[name=attachFile]')[0].files.length);
		
		var fileInput = $('input[name=attachFile]')[0].files;
		// fileInput 개수를 구한다.
		for (var i = 0; i < fileInput.length; i++) {
			console.log(" fileInput[i].files[j] :::"+ fileInput[i]);
			
			formData.append('file', fileInput[i]);					
		}
		
		$.ajax({
			url : '/board/write',
			type : 'POST',
			data : formData ,
			enctype: "multipart/form-data",
			processData: false, //프로세스 데이터 설정 : false 값을 해야 form data로 인식함
	        contentType: false,
			success : function(res) {
				alert("성공");
			},
			error : function(error) {
		       console.log("사류");
		    }
		
		});
	}
	
	
}
/*******************   Qna board ****************/
function writeQna() {
	$.ajax({
		url : '/board/write?type=qna',
		type : 'GET',
		success : function(data) {			
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
			$("#qnaDetail").html(data);
		}
	});
}

/*********  notice board   ********* */
function writeNotice() {
	$.ajax({
		url : '/board/write?type=notice',
		type : 'GET',
		success : function(data) {			
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
			$("#noticeDetail").html(data);
		}
	});
}
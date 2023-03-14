/*
 * 작성자 : 신정은  
 * 
 */
/*******************  공통 ****************/
// 폼 유효성 검사
function goPost(type) {
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
		
		if(type == "QNA") {
			var srNo =  $('select[name=srNo]').val();
			formData.append("srNo", srNo);
		}
		
		var bbsTtl = $('input[name=bbsTtl]').val();
		var bbsCn = $('#bbsCn').val();
		var flist = $('input[name=attachFile]')[0].files;
		
		formData.append("bbsType", bbsType);
		formData.append("wrtrId", wrtrId);
		formData.append("bbsTtl", bbsTtl);
		formData.append("bbsCn", bbsCn);
		//formData.append("attachFile", attachFile);
					 		
		console.log(bbsCn);
		
		
		// fileInput 개수를 구한다.
		for (var i = 0; i < flist.length; i++) {
			console.log(flist[i]);
			
			formData.append('attachFile', flist[i]);					
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

// 선택한 파일 삭제
function deleteFile(fileSn) {
	console.log("삭제 ~~~ ");
	console.log(fileSn);
	$.ajax({
		url : '/file/delete/' + fileSn,
		type : 'GET',
		success : function(data) {			
			alert("삭제 성공");
		}
	});
}

//게시판 필터링
function boardSearch() {
	$("#boardSearchForm input").each((index,value)=>{
		if(!$(value).val()){
			$(value).prop("disabled",true);
		}
	});
	$("#boardSearchForm select").each((index,value)=>{
		if(!$(value).children("option:selected").val()||$(value).children(" option").length==0){
			$(value).prop("disabled",true);
		}
	});
	return true;
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

function updateQna(bbsNo) {
	console.log("수정하러 옴~~ qna");
	$.ajax({
		url : '/board/update/' + bbsNo,
		type : 'GET',
		success : function(data) {
			$("#qnaDetail").html(data);
		}
	});
}

function getNextList(url) {
	console.log(" 여기 !!!");
	$.ajax({
		url :"/board/list" + url + "&view=myportal",
		type : 'GET',
		success : function(data) {
			$("#qnaList").html(data);
		}
	});
}


//댓글 더 보기
function getComments(bbsNo, page) {
	console.log("댓글 더 보기");
	console.log(bbsNo);
	console.log(page);
	var url = "/comment/list/" + bbsNo + "?page=" + page;
	$.ajax({
		url : url,
		type : 'GET',
		success : function(data) {
			$(".commentList:last").html(data);
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

function updateNotice(bbsNo) {
	console.log("수정하러 옴~~ notice");
	$.ajax({
		url : '/board/update/' + bbsNo,
		type : 'GET',
		success : function(data) {
			$("#noticeDetail").html(data);
		}
	});
}

function getNextNoticeList(url) {
	console.log(" 여기  getNextNoticeList");
	$.ajax({
		url :"/board/list" + url + "&view=myportal",
		type : 'GET',
		success : function(data) {
			$("#noticeList").html(data);
		}
	});
}

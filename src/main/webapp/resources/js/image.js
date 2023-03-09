function loadFile(input, memberId) {
	/*이미지 미리보기*/
	 $(".Img").remove();	
    var file = input.files[0];
    var newImage = document.createElement("img");
    newImage.setAttribute("class", 'img');
    console.log(" 아이디 : " + memberId);
    newImage.src = URL.createObjectURL(file);   

    newImage.style.width = "200px";
    newImage.style.height = "200px";
    $("#defaultImage").remove();
    $("#addImg").hide();
    newImage.style.objectFit = "contain";
    $("#newImg").append(newImage);	
    /* ---------------------------------- */
    /*파일 업로드*/
    var fileType = input.files[0].type;
    console.log("fileType : " + fileType);
    
    var form = new FormData();
    form.append( "file", $("#chooseFile")[0].files[0] );
    console.log("ajax실행 바로 전");
  
    $.ajax({
		url : '/member/profile',
		type : 'POST',
		enctype: 'multipart/form-data',
		contentType: false,
		processData: false,
		data : form,
		success : function(file) {
			console.log("프로필 사진 등록 성공!");
		}
    });
}
/*작성자: 최은종*/

/* textarea 글자수 세기 
 * 
 * jsp에 추가 할 것
 * 1. <p class="textCount" style="margin-top: 3px"></p>
 * 2. <textarea> 태그에 style="resize: none;" maxlength="500;" 추가
 * 3. <script src="${pageContext.request.contextPath}/resources/js/textarea.js"></script> 추가
 * 
 * */
$(function() {
	$('#tarea1').keyup(function(e) {
		var content = $(this).val();
		console.log("durld");
		// 글자수 세기
		if (content.length == 0 || content == "") {
			$('.textCount1').html('(0/500자)');
		} else {
			$('.textCount1').html('('+ content.length + '/500자)');
		}

		// 글자수 제한
		if (content.length > 500) {
			console.log("500자 초과")
			$(this).val($(this).val().substring(0, 500));
			//alert('글자수는 최대 500자까지 입력 가능합니다.');
			showSraddAlert("글자수는 최대 500자까지 입력 가능합니다.");
		}
	});	
	$('textarea').keyup();
});

$(function() {
	$('#tarea2').keyup(function(e) {
		var content = $(this).val();

		// 글자수 세기
		if (content.length == 0 || content == "") {
			$('.textCount2').html('(0/500자)');
		} else {
			$('.textCount2').html('('+ content.length + '/500자)');
		}

		// 글자수 제한
		if (content.length > 500) {
			console.log("500자 초과")
			$(this).val($(this).val().substring(0, 500));
			//alert('글자수는 최대 500자까지 입력 가능합니다.');
			showSraddAlert("글자수는 최대 500자까지 입력 가능합니다.");
		}
	});	
	$('textarea').keyup();
});

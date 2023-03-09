window.onload = function(){	
	document.getElementById("address_kakao1").addEventListener("click", function(){
		new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("address_kakao1").value = data.address; // 주소 넣기
                document.querySelector("input[name=address_detail]").focus(); //상세입력 포커싱
            }
        }).open();
    });
	document.getElementById("address_kakao2").addEventListener("click", function(){
		new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("address_kakao2").value = data.address; // 주소 넣기
                document.querySelector("input[name=InstDetailAddr").focus(); //상세입력 포커싱
            }
        }).open();
    });
}



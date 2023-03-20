window.onload = function(){   
   document.getElementById("address_kakao").addEventListener("click", function(){
      new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("address_kakao").value = data.address; // 주소 넣기
                document.querySelector("input[name=addrDetail]").focus(); //상세입력 포커싱
            }
        }).open();
    });
   
   document.getElementById("address_kakao1").addEventListener("click", function(){
      new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("address_kakao1").value = data.address; // 주소 넣기
                document.querySelector("input[name=instDetailAddr]").focus(); //상세입력 포커싱
            }
        }).open();
    });
}

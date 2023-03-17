<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script>
	function showOtiAlert(content) {
		$("#otiAlert").addClass("show");
		console.log(content);
		/* $(".modal-body").text(content); */
	}
	
	function closeOtiAlert(){
		$("#otiAlert").removeClass("show");
		location.href="/loginForm";
	}
</script>    
<!-- Modal -->
<div class="modal fade" id="otiAlert" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
      <img src="${pageContext.request.contextPath}/resources/assets/images/otilogo.png" style="margin:0;" width="60px" height="60px"/>
        <h5 class="modal-title" id="title"></h5>
      </div>
      <div class="modal-body text-center">
        	<h3>죄송합니다.</h3>
        	<img src="${pageContext.request.contextPath}/resources/assets/images/auth/Logo-small-bottom.png"/>
        	<h5>세션 유효기간이 초과되어 접속이 끊겼습니다.</h5>
        	<h5>다시 접속해주세요.</h5>
      </div>
      <div class="modal-footer">
       <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="closeOtiAlert()">확인</button>
      </div>
    </div>
  </div>
</div>
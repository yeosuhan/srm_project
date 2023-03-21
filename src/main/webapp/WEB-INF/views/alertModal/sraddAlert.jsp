<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script>
	function showSraddAlert(content) {
		
		console.log(content);
		
		var tags = "<h3>죄송합니다.</h3> "  +
        	"<img src='${pageContext.request.contextPath}/resources/assets/images/auth/Logo-small-bottom.png'/> " + 
            	"<h5>" + content + " </h5>"
		$("#sraddBody").html(tags);
		$("#sradd").addClass("show");
	}
	
	//등록 성공일때
	function showSuccessSraddAlert(content) {
		
		console.log(content);
		
		var tags = 
        	"<img src='${pageContext.request.contextPath}/resources/assets/images/auth/Logo-small-bottom.png'/> " + 
            	"<h5>" + content + " </h5>"
		$("#sraddBody").html(tags);
		$("#sradd").addClass("show");
	}
	
	//관리자에게 반려사유를 입력하라고할 때 사용함
	function adminAlert(content) {
		
		console.log(content);
		
		var tags = 
        	"<img src='${pageContext.request.contextPath}/resources/assets/images/auth/Logo-small-bottom.png'/> " + 
            	"<h5>" + content + " </h5>"
		$("#sraddBody").html(tags);
		$("#sradd").addClass("show");
	}
	
	function closeSraddAlert(){
		$("#sradd").removeClass("show");
		//location.href="/loginForm";
	}
</script>    
<!-- Modal -->
<div style=" z-index: 1050;"class="modal fade" id="sradd" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header" style="padding: 0 4;">
      	<img src="${pageContext.request.contextPath}/resources/assets/images/otilogo.png" style="margin:0;" width="60px"/>
        <h5 class="modal-title" id="title"></h5>
      </div>
      <div class="modal-body text-center" id="sraddBody">

      </div>
      <div class="modal-footer">
       <button type="button" class="btn  btn-oti btn-sm" data-dismiss="modal" onclick="closeSraddAlert()">확인</button>
      </div>
    </div>
  </div>
</div>
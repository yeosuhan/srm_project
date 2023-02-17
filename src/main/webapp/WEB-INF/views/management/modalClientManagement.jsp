<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
function show(){	
	$("#ModalView").modal("show");	
}
</script>

<style>
.modal-header {
	background-color:#4778FF;
	color:white;
}
</style>

<!------------- Modal --------------->
<!-- div id값으로 모달 호출 -->
<div class="modal fade" id="ModalView" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="ModalClientInfo" style="text-center">고객정보 조회</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true" style="color:white">×</span>
				</button>
			</div>
			
			<div class="modal-body">		
				<div class="card" id="InfoDetail">                                      
	              <div>
	                 <div class="card-block" style="justify-content: center; text-align: center;">
	                    <div class="mb-2">
	                       <img src="/resources/assets/images/ejexample.png" style="height: 200px; width:200px; align-content: center;">
	                    </div>
	                 </div>
	                
	                 <div class="card-block">    
	                      <div class="row">
	                          <p class="col-sm-3 font-weight-bold">아이디</p>
	                          <div class="col-sm-9" id="MClientId">je1234</div>
	                       </div>	                       
	                       <div class="row">
	                          <p class="col-sm-3 font-weight-bold">이름</p>
	                          <div class="col-sm-9" id="MClientName">신정은</div>
	                       </div>                       
	                        <div class="row">
	                          <p class="col-sm-3 font-weight-bold">전화번호</p>
	                          <div class="col-sm-9" id="MClientTel">010-1234-5678</div>
	                       </div>
	                       <div class="row">
	                          <p class="col-sm-3 font-weight-bold">이메일</p>
	                          <div class="col-sm-9" id="MClientemail">abc@gmail.com</div>                      
	                       </div>                       
	                       <div class="row">
	                          <p class="col-sm-3 font-weight-bold">주소</p>
	                          <div class="col-sm-9" id="MClientAddr">서울</div>
	                       </div>                       
	                       <div class="row">
	                          <p class="col-sm-3 font-weight-bold">소속기관</p>
	                          <div class="col-sm-9" id="MClientIns">한국고용원</div>
	                       </div>                       
	                       <div class="row">
	                          <p class="col-sm-3 font-weight-bold">기관 전화번호</p>
	                          <div class="col-sm-9" id="MClientInsTel">02-123-1234</div>
	                       </div>                
	                 </div>
	              </div>              
	              <div class="card-footer">     
	              	<div align="center">              	      				
						<button type="button" class="btn btn-primary btn-sm btn-round waves-effect waves-light" data-dismiss="modal">확인</button>	
	             	</div> 
	              </div>	              
	           </div>
			</div>
		</div>
	</div>
</div>
    
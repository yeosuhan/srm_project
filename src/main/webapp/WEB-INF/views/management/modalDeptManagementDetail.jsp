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
	
	p{	
		margin:auto;
	} 
</style>

<!------------- Modal --------------->
<!-- div id값으로 모달 호출 -->
<div class="modal fade" id="ModalView" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="ModalDepartmentInfo" style="text-center">부서정보 조회</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true" style="color:white">×</span>
				</button>
			</div>
			
			<div class="modal-body">		
				<div class="card" id="InfoDetail">                                      

	                 <div class="card-block">   
                     	<form class="form-material">          
	                        <div class="form-group row">
	                           <p class="col-sm-4 font-weight-bold">부서코드</p>
	                           <div class="col-sm-8" id="MDepartmentCode">DEV1</div>
	                        </div>	                        
		                    <div class="form-group row">
	                           <p class="col-sm-4 font-weight-bold">부서명</p>
	                           <div class="col-sm-8" id="MDepartmentKorName">
	                           		<input type="text" class="form-control" required="" style="width: 70%" value="개발1팀">
	                           </div>
	                        </div>
	                        <div class="form-group form-default row">
	                        	<p class="col-sm-4 font-weight-bold">사무실 전화번호</p>
	                            <div class="col-sm-8" id="MDepartmentTel">
	                          	 	<input type="text" class="form-control" required="" style="width: 70%" value="02-999-9999">
	                          	</div>
	                        </div>
	                        <div class="form-group row">
	                           <p class="col-sm-4 font-weight-bold">부서 담당자</p>
	                           <div class="col-sm-8" id="MDepartmentManager">
	                           		<input type="text" class="form-control" required="" style="width: 70%" value="최은종">
	                           </div>
	                        </div>	 	
	                   </form>                
	                 </div>
	                   
	              <div class="card-footer">           
	              		<div align="center"> 
		              		<form method="post">
		              			<button type="button" id="deleteInfo" class="btn btn-primary btn-sm btn-round waves-effect waves-light">삭제</button>      	      				
			              		<button type="button" id="modifyInfo" class="btn btn-primary btn-sm btn-out btn-round waves-effect waves-light">저장</button>      	      						           
		              		</form>  
	              		</div>       
	              </div>	              
	           </div>
			</div>
		</div>
	</div>
</div>
    
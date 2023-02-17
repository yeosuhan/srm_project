<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 카카오 주소 js  -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/js/kakaoAddress.js"></script>
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
	<div class="modal-dialog modal-lg" role="document">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="ModalEmployeeInfo" style="text-center">사원정보 조회</h4>
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
                     	<form class="form-material">          
	                        <div class="form-group row">
	                           <p class="col-sm-3 font-weight-bold">아이디</p>
	                           <div class="col-sm-9" id="MEmployeeId">je1234</div>
	                        </div>	                        
	                        <div class="form-group row">
	                           <p class="col-sm-3 font-weight-bold">이름</p>
	                           <div class="col-sm-9" id="MEmployeeName">신정은</div>
	                        </div>
	                        <div class="form-group form-default row">
	                        	<p class="col-sm-3 font-weight-bold">전화번호</p>
	                            <div class="col-sm-9" id="MEmployeeTel">
	                          	 	<input type="text" class="form-control" required="" style="width: 70%" value="01012345678">
	                          	</div>
	                        </div>
	                        <div class="form-group form-default row">
	                            <p class="col-sm-3 font-weight-bold">이메일</p>
	                            <div class="col-sm-9" id="MEmployeeEmail">
	                       			<input type="text" class="form-control" required="" style="width: 70%" value="abc@gmail.com">	                      
	                          	</div>
	                        </div>
	                        <div class="form-group form-default row">
	                            <p class="col-sm-3 font-weight-bold">주소</p>
	                            <div class="col-sm-9" id="MEmployeeAddr">
	                           		<input type="text" id="address_kakao" class="form-control" required="" style="width: 70%" placeholder="도로명주소">
	                           		<input type="text" name="address_detail" class="form-control" required="" style="width: 70%" placeholder="상세주소">
	                          	</div>
	                        </div>
	                        <div class="form-group form-default row">
	                           <p class="col-sm-3 font-weight-bold">부서</p>
	                           <div class="col-sm-9" id="MEmployeeDepartment">
	                               <select name="selectDepartment" class="form-control" style="width: 30%">
	                               	  <option value="" disabled selected>유지보수1팀</option>
	                                  <option value="opt1">개발1팀</option>
	                                  <option value="opt2">개발2팀</option>
	                                  <option value="opt3">유지보수2팀</option>
	                                  <option value="opt4">유지보수3팀</option>
	                              	</select >	                
	                           </div>	                           
	                        </div>	                    
	                        <div class="form-group form-default row">
	                           <p class="col-sm-3 font-weight-bold">직급</p>
	                           <div class="col-sm-9" id="MEmployeeJobGrade">
	                               <select name="selectJobGrade" class="form-control" style="width: 30%">
	                               	  <option value="" disabled selected>사원</option>
	                                  <option value="opt1">대표이사</option>
	                                  <option value="opt2">이사</option>
	                                  <option value="opt3">부장</option>
	                                  <option value="opt4">차장</option>
	                                  <option value="opt5">과장</option>
	                                  <option value="opt6">대리</option>
	                                  <option value="opt7">사원</option>	                             
	                              	</select >	  	                           
	                           </div>
	                        </div>
	                   </form>                
	                 </div>
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
    
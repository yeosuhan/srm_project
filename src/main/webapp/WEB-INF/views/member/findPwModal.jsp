<%-- 작성자 : 최은종 작성날짜 : 2023-03-11 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script
	src="${pageContext.request.contextPath}/resources/js/findPwModal.js"></script>
<script>
	
</script>
<style>
.modal-header {
	background-color: linear-gradient(135deg, #92344B 10%, #F05F57 100%);
	color: white;
}
</style>

<div  class="modal fade" id="findPwModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">비밀번호 찾기</h5>
			</div>
			<div class="modal-body">
				<form class="form-material" id="findPswd">
					<div class="form-group form-primary">
						<input type="text" id="eml" name="eml" class="form-control"
							required="" value=""> <span class="form-bar"></span> <label
							class="float-label">이메일</label>
					</div>
					<input type="hidden" id="memberId" name="memberId"
						class="form-control">
					<div class="form-group form-primary">
						<input type="text" id="telNo" name="telNo" class="form-control"
							required="" value=""> <span class="form-bar"></span> <label
							class="float-label">전화번호</label>
					</div>
				</form>
			</div>
			<div style="margin: 20px; font-size: 12px; color: orangered;">
				<span> 회원정보와 일치하면 임시 비밀번호가 이메일로 발급됩니다.</span></br>
			</div>

			<div class="modal-footer" align="center">
				<button type="button" onclick="checkVal()" class="btn btn-oti">
	    			<div id="confirmBtn">확인</div>
	    			<div id="loadingBtn" style=" width: 30px;height: 30px; border-radius:50px; border: 2px solid currentColor;border-right-color: transparent;
	    				animation: spin 1s linear infinite;display:none"></div>
    			</button>
			</div>
		</div>
	</div>
</div>

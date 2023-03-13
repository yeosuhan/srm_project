<%-- 작성자 : 최은종 작성날짜 : 2023-03-11 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	
</script>
<style>
.modal-header {
	background-color: linear-gradient(135deg, #92344B 10%, #F05F57 100%);
	color: white;
}
</style>

<div class="modal fade" id="findPwModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">비밀번호 찾기</h5>
			</div>
			<div class="modal-body">
				<form class="form-material" id="findPswd" action="<c:url value='/member/findPwForm'/>" method="post">
					<div class="form-group form-primary">
						<input type="text" name="memberId"
							class="form-control" required="" value=""> <span class="form-bar"></span>
						<label class="float-label">아이디</label>
					</div>
					<div class="form-group form-primary">
						<input type="text" name="telNo" class="form-control"
							required="" value=""> <span class="form-bar"></span> <label
							class="float-label">전화번호</label>
					</div>
				</form>
			</div>
			<!-- 만약 올바른 이름과 전화번호를 입력하면 보여질 내용 !!!!!!!!!!!!! -->
			<c:if test="${randomPw ne null}">	
			<div style="margin: 20px; font-size: 12px; color: orangered;">
				<span> 확인되었습니다.</span></br> <span> 임시 비밀번호가 ${randomPw} 로 설정되었습니다.</span></br> <span>로그인
					후 비밀번호를 변경해주세요.</span>
			</div>
					</c:if>
					
								<c:if test="${randomPw eq null}">	
			<div style="margin: 20px; font-size: 12px; color: orangered;">
				<span> 확인되었습니다.</span></br> <span> ${undefinedUserMessage} </span></br> <span>로그인
					후 비밀번호를 변경해주세요.</span>
			</div>
					</c:if>
					
			<div class="modal-footer" align="center">
				<button type="submit" form="findPswd" formmethod="post" class="btn btn-oti">확인</button>
			</div>
		</div>
	</div>
</div>

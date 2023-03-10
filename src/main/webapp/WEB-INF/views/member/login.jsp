<%-- 작성자 : 신정은 작성날짜 : 2023-02-20 --%>
<%-- 작성자 : 최은종 작성날짜 : 2023-03-10 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<%@include file="/WEB-INF/views/fragments/header.jsp"%>
<script
	src="${pageContext.request.contextPath}/resources/js/rememberId.js"></script>
<script>
	
</script>
<style>
.modal-header {
	background-color: linear-gradient(135deg, #92344B 10%, #F05F57 100%);
	color: white;
}
</style>
</head>
<body themebg-pattern="theme1">
	<!-- Pre-loader start -->
	<div class="theme-loader">
		<div class="loader-track">
			<div class="preloader-wrapper">
				<div class="spinner-layer spinner-blue">
					<div class="circle-clipper left">
						<div class="circle"></div>
					</div>
					<div class="gap-patch">
						<div class="circle"></div>
					</div>
					<div class="circle-clipper right">
						<div class="circle"></div>
					</div>
				</div>
				<div class="spinner-layer spinner-red">
					<div class="circle-clipper left">
						<div class="circle"></div>
					</div>
					<div class="gap-patch">
						<div class="circle"></div>
					</div>
					<div class="circle-clipper right">
						<div class="circle"></div>
					</div>
				</div>

				<div class="spinner-layer spinner-yellow">
					<div class="circle-clipper left">
						<div class="circle"></div>
					</div>
					<div class="gap-patch">
						<div class="circle"></div>
					</div>
					<div class="circle-clipper right">
						<div class="circle"></div>
					</div>
				</div>

				<div class="spinner-layer spinner-green">
					<div class="circle-clipper left">
						<div class="circle"></div>
					</div>
					<div class="gap-patch">
						<div class="circle"></div>
					</div>
					<div class="circle-clipper right">
						<div class="circle"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Pre-loader end -->

	<section class="login-block">
		<!-- Container-fluid starts -->
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<!-- 로그인 및 아이디 저장 기능 구현 (최은종) -->
					<form:form class="md-float-material form-material" id="loginForm"
						action="/login" method="post">
						<div class="text-center"></div>
						<div class="auth-box card">
							<div class="card-block">
								<div class="row m-b-20">
									<div class="col-md-12">
										<h3 class="text-center">Sign In</h3>
									</div>
								</div>
								<div class="form-group form-primary">
									<input type="text" id="memberId" name="memberId"
										class="form-control" required=""> <span
										class="form-bar"></span> <label class="float-label">ID</label>
								</div>
								<div class="form-group form-primary">
									<input type="password" name="pswd" class="form-control"
										required=""> <span class="form-bar"></span> <label
										class="float-label">Password</label>
								</div>
								<div class="row m-t-25 text-left">
									<div class="col-12">
										<div class="checkbox-fade fade-in-primary d-">
											<label> <input type="checkbox" id="checkId"
												value="true"> <span class="cr"><i
													class="cr-icon icofont icofont-ui-check txt-primary"></i></span> <span
												class="text-inverse">Remember me</span>
											</label>
										</div>
					</form:form>

					<!-- 비밀번호 찾기 -->
					<div class="forgot-phone text-right f-right mb-4">
						<a href="#" class="text-right f-w-600" data-toggle="modal"
							data-target="#findPwModal"> Forgot Password?</a>
					</div>
					<!-- 비번 찾기 모달 -->
					<div class="modal fade" id="findPwModal" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">비밀번호 찾기</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<form class="form-material">
										<div class="form-group form-default">
											<input type="text" name="footer-email" class="form-control"
												required="" style="width: 50%"> <span
												class="form-bar"></span> <label class="float-label">이름</label>
										</div>
										<div class="form-group form-default">
											<input type="text" name="footer-email" class="form-control"
												required="" style="width: 50%"> <span
												class="form-bar"></span> <label class="float-label">전화번호</label>
										</div>
									</form>
								</div>
								<!-- 만약 올바른 이름과 전화번호를 입력하면 보여질 내용 !!!!!!!!!!!!! -->
								<div style="margin: 20px; font-size: 12px; color: orangered;">
									<span> 확인되었습니다.</span></br> <span> 임시 비밀번호가 00000000로
										설정되었습니다.</span></br> <span>로그인 후 비밀번호를 변경해주세요.</span>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-oti" data-dismiss="modal">취소</button>
									<button type="button" class="btn btn-oti">확인</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<button type="submit" form="loginForm"
						class="btn btn-oti btn-md btn-block waves-effect waves-light text-center m-b-20">Sign
						in</button>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<button type="button" onclick="location.href='/join-client' "
						class="btn btn-oti btn-md btn-block waves-effect waves-light text-center m-b-20">Sign
						Up for Client</button>
				</div>
				<div class="col-md-6">
					<button type="button" onclick="location.href='/join-employee' "
						class="btn btn-oti btn-md btn-block waves-effect waves-light text-center m-b-20">Sign
						Up for Employee</button>
				</div>
			</div>
			<hr />
			<div class="row">
				<div class="col-md-10">
					<p class="text-inverse text-left m-b-0"></p>
				</div>
				<div class="col-md-12" align="center">
					<img
						src="${pageContext.request.contextPath}/resources/assets/images/auth/Logo-small-bottom.png"
						alt="small-logo.png">
				</div>
			</div>
		</div>
	</section>
	<%@include file="/WEB-INF/views/fragments/bottom.jsp"%>
</body>
</html>
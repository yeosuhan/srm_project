<%-- 작성자 : 신정은
	작성날짜 : 2023-02-20 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<%@include file="/WEB-INF/views/fragments/header.jsp"%>
<script src="/resources/js/kakaoAddress.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/image.js"></script>
</head>
<style>
.box {
	width: 200px;
	border: 1px solid #F05F57;
	box-sizing: border-box;
	border-radius: 10px;
	padding: 12px 13px;
	font-family: 'Roboto';
	font-style: normal;
	font-weight: 400;
	font-size: 14px;
	line-height: 16px;
}

.box:focus {
	border: 1px solid #F05F57;
	box-sizing: border-box;
	border-radius: 10px;
	outline: 3px solid #F05F57;
	border-radius: 10px;
}

#chooseFile {
	visibility: hidden;
}

label>img {
	margin-top: 50px;
	border-radius: 50%;
}
</style>
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
	<!--  -->
	<section class="login-block">
		<!-- Container-fluid starts -->
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<!-- Authentication card start -->
					<form class="md-float-material form-material" name="joinForm"
						action="${pageContext.request.contextPath}/join" method="post">
						<input type="hidden" name="memberType" value="ROLE_CLIENT">
						<input type="hidden" name="jbgdCd" value=""> <input
							type="hidden" name="deptCd" value=""> <input
							type="hidden" name="fileType" value=""> <input
							type="hidden" name="fileData" value="">
						<div class="text-center"></div>
						<div class="auth-box card">
							<div class="card-block">
								<div class="row m-b-20">
									<div class="col-md-12">
										<h3 class="text-center">회원가입 (고객용)</h3>
									</div>
								</div>
								<hr />
								<div class="form-group form-primary">
									<input type="text" id="memberId" name="memberId" class="form-control"  maxlength='15'
									oninput="this.value = this.value.replace(/[^0-9a-zA-Z]/g,'')" id="memberId" required style="width: 74%;" placeholder="                    ex)영어,숫자 포함 8~15자리">
								 <label
										class="float-label">아이디</label>
									<button type="button" onclick="checkMemberId()"
										class="btn btn-sm waves-effect waves-light hor-grd btn-oti ml-2"
										style="width: 80px;">중복확인</button>
									<font id="checkId" size="2" style="padding-left: 10px;"></font>
								</div>
								<div class="form-group form-primary">
									<input type="password" id="pswd" name="pswd" class="form-control" placeholder="                    ex)영어,숫자 포함 15자리 이상"
										required="" style="width: 97%"> <span class="form-bar"></span> <label
										class="float-label">비밀번호</label>
								</div>
								<div class="form-group form-primary">
									<input type="text" name="flnm" class="form-control" id="flnm"placeholder="                    ex)홍길동"
										required="" style="width: 97%;"> <span class="form-bar"></span> <label
										class="float-label">이름</label>
								</div>
								<div class="form-group form-primary">
									<input type="text" id="telNo" name="telNo" class="form-control" placeholder="                    ex)010-1234-5678"
										required="" style="width: 97%"> <span class="form-bar"></span> <label
										class="float-label">전화번호</label>
								</div>
								<div class="form-group form-primary">
									<input type="text" name="eml" id="eml" class="form-control" placeholder="                    ex)example@naver.com"
										required="" style="width: 97%;"> <span class="form-bar"></span> <label
										class="float-label">이메일</label>
								</div>
								<div class="form-group form-primary">
									<input type="text" name="addr" id="addr"
										class="form-control" required="" style="width: 70%">
										<button type="button"   id="address_kakao"
										class="btn btn-sm waves-effect waves-light hor-grd btn-oti ml-2"
										style="width: 100px;">우편번호 찾기</button>
										 <label
										class="float-label">주소</label>
								</div>
								<div class="form-group form-primary">
									<input class="form-control" type="text" name="addrDetail"
										placeholder="상세주소" style="width: 97%"> <span class="form-bar"></span>
								</div>
								<div class="form-group form-primary">
									<select name="instCd" id="instCd" class="box" required="">
										<option disabled selected>내 기관</option>
										<c:forEach var="instList" items="${instList}">
											<option value="${instList.instCd}">${instList.instNm}</option>
										</c:forEach>
									</select>
								</div>
								<hr />
								<div class="row">
									<div class="col-md-12">
										<button type="button" id="joinCheck"
											class="btn btn-oti btn-md btn-block waves-effect waves-light text-center">Sign
											Up</button>
									</div>
								</div>
					</form>
				</div>
	</section>
	<script src="${pageContext.request.contextPath}/resources/js/check.js"></script>
	<%@include file="/WEB-INF/views/fragments/bottom.jsp"%>
</body>
</html>
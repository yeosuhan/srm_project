<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="card">
	<div class="card-header">
		<h5>공지사항</h5>
	</div>
	<div class="card-block">
		<form enctype="multipart/form-data">
			<div class="form-group row">
				<div class="col-sm-2 font-weight-bold">글번호</div>
				<div class="col-sm-1">37</div>
				<div class="col-sm-2 font-weight-bold text-right">작성자</div>
				<div class="col-sm-3">신정은(관리자)</div>
				<div class="col-sm-2 font-weight-bold text-right">조회수</div>
				<div class="col-sm-2">128</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-2 font-weight-bold">제목</div>
				<div class="col-sm-6">제목a</div>
				<div class="col-sm-2 font-weight-bold text-right">작성일자</div>
				<div class="col-sm-2">2023-02-14</div>
			</div>
			<div class="form-group row">
				<p class="col-sm-2 font-weight-bold">내용</p>
				<div class="col-sm-10">
					<textarea rows="20" cols="5" class="form-control"
						style="border: none; opacity: 0.5;" readonly></textarea>
				</div>
			</div>
			<div class="form-group row">
				<p class="col-sm-2 font-weight-bold">첨부파일</p>
				<div class="col-sm-5">
					<img class="mr-2" src="/resources/oti_images/user.png"
						style="height: 100px; align-content: center;"> <img
						class="mr-2" src="/resources/oti_images/user.png"
						style="height: 100px; align-content: center;"> <img
						class="mr-2" src="/resources/oti_images/user.png"
						style="height: 100px; align-content: center;"> <img
						class="mr-2" src="/resources/oti_images/user.png"
						style="height: 100px; align-content: center;"> <img
						class="mr-2" src="/resources/oti_images/user.png"
						style="height: 100px; align-content: center;">
				</div>
				<div class="col-sm-5">
					<a href="#" class="mr-3">2023-02-07_공지내용.pdf</a> <a href="#"
						class="mr-3">2023-02-07_공지내용.pdf</a>
				</div>
			</div>
		</form>
		<div class="d-flex justify-content-center">
			<button
				class="btn btn-inverse btn-round waves-effect waves-light mr-4"
				onclick="toUpdate()">수정</button>
			<form action="#">
				<button class="btn btn-inverse btn-round waves-effect waves-light">삭제</button>
			</form>
		</div>
	</div>
</div>
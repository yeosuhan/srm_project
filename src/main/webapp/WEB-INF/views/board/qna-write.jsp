<%-- 작성자 : 신정은
	작성날짜 : 2023-02-20 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
$(document).on('click', '#closewq', function(e) {
	console.log("click event");
	$('#writeQna').hide();
});

</script>

<style>
.modal {
	position: block;
	top: 0;
	left: 0;
	bottom: 0;
	right: 0;
	background: rgba(0, 0, 0, 0.4);
}

.m.body {
	height: 50vh;
	overflow-y: auto;
}
</style>
<!-- Basic Form Inputs card start------------------------------------------------------ -->
<div class="mt-5 pr-5 pl-5" id="writeQna" style="width: 60%; margin: auto;">
	<div class="modal-content">
		<div class="modal-header">
			<h5 style="color:white;">문의사항 작성</h5>
		</div>
		<div class="modal-body">
			<form enctype="multipart/form-data" method="POST"
				action="/board/write" id="qnaForm" onSubmit="return false;">
				<div class="form-group row">
					<input type="hidden" name="wrtrId" value="${clientId}"> <input
						type="hidden" name="bbsType" value="QNA"> <label
						class="col-sm-2 col-form-label">요청번호</label>
					<div class="col-sm-10">
						<select name="srNo" id="lang">
							<c:forEach var="sr" items="${srList}">
								<option value="${sr.srNo}">${sr.dmndNo}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2 col-form-label">제목</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="bbsTtl" id="bbsTtl">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2 col-form-label">내용</label>
					<div class="col-sm-10">
						<textarea rows="20" cols="5" class="form-control"
							placeholder="내용을 입력해주세요" name="bbsCn" id="bbsCn"></textarea>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2 col-form-label">첨부파일</label>
					<div class="col-sm-10">
						<input type="file" class="form-control" name="attachFile" multiple>
					</div>
				</div>
			</form>
			<div class="modal-footer d-flex justify-content-center">
				<button type="button" onclick="goPost('QNA')"
					class="btn btn-oti waves-effect waves-light mr-4">저장</button>
				<button type="button" class="btn btn-oti waves-effect waves-light mr-4" id="closewq">닫기</button>
			</div>
			
		</div>
	</div>
</div>

<script src="/resources/js/board.js"></script>
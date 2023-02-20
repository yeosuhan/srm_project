<%-- 작성자 : 신정은
	작성날짜 : 2023-02-20 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="modal" tabindex="-1" id="writeNotice">
	<!-- Basic Form Inputs card start------------------------------------------------------ -->
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5>공지사항 작성</h5>
			</div>
			<div class="modal-body">
				<form enctype="multipart/form-data">
					<div class="form-group row">
						<label class="col-sm-2 col-form-label">제목</label>
						<div class="col-sm-10">
							<input type="text" class="form-control">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label">내용</label>
						<div class="col-sm-10">
							<textarea rows="20" cols="5" class="form-control"
								placeholder="내용을 입력해주세요"></textarea>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label">첨부파일</label>
						<div class="col-sm-10">
							<input type="file" class="form-control" multiple>
						</div>
					</div>
				</form>
				<div class="modal-footer d-flex justify-content-center">
					<button
						class="btn btn-inverse btn-round waves-effect waves-light mr-4">저장</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Input Alignment card end -->
</div>

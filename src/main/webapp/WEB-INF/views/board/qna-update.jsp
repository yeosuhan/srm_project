<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="/resources/js/board.js"></script>
<!------------------- 수정 버튼 누르면 바뀌는 화면 ----------------------------->
<div class="card">
	<div class="card-header">
		<h5>글 수정</h5>
	</div>
	<div class="card-block">
		<form enctype="multipart/form-data" method="POST"
			action="/board/update" id="updateForm">
			<input type="hidden" value="${board.bbsNo}" name="bbsNo" id="bbsNo"> <input
				type="hidden" value="${board.bbsType}" name="bbsType">
			<div class="form-group row">
				<div class="col-sm-2 font-weight-bold">작성일자</div>
				<div class="col-sm-6">${board.wrtYmd}</div>
				<div class="col-sm-2 font-weight-bold text-right">답변상태</div>
				<c:if test="${board.ansYn == false}">
					<div class="col-sm-2">미답변</div>
				</c:if>
				<c:if test="${board.ansYn == true}">
					<div class="col-sm-2">답변완료</div>
				</c:if>

			</div>
			<div class="form-group row">
				<div class="col-sm-2 font-weight-bold">제목</div>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="bbsTtl" id="bbsTtl"
						value="${board.bbsTtl}">
				</div>
				<div class="col-sm-2 font-weight-bold text-right">작성자</div>
				<div class="col-sm-2">${board.wrtrNm}</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-2 font-weight-bold">SR번호</div>
				<div class="col-sm-6">${board.srNo}</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">내용</label>
				<div class="col-sm-10">
					<input class="form-control"
						style="border: none; background-color: #DFDEDE" name="bbsCn"
						value="${board.bbsCn}"></input>
				</div>
			</div>
			<div class="form-group row">
				<p class="col-sm-2 font-weight-bold">첨부파일</p>
				<div class="col-sm-10">
					<c:forEach var="f" items="${board.srcList}">
						
							<a href="<c:url value='/file/download/${f.fileSn}' />"> <span
								class="glyphicon glyphicon-save" aria-hidden="true"></span> <span>
									${f.orgnlFileNm} </span>
							</a> <span> Size : ${f.fileSz} Bytes</span>
						
						<img src="${pageContext.request.contextPath}/resources/oti_images/trash.png"
							 width="20px" height="20px" onclick="deleteFile(${f.fileSn})">
					</c:forEach>
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-2"></div>
				<div class="col-sm-10">
					<input type="file" name="nattachFile" multiple>
				</div>
			</div>
		</form>
		<div class="d-flex justify-content-center">
			<button type="submit" form="updateForm"
				class="btn btn-oti waves-effect waves-light mr-4">저장</button>
		</div>
	</div>
</div>
<!-- Input Alignment card end -->
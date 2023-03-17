<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="card" style="height: 650px;">
	<div class="card-header" style="height: 50px;">
		<h5>상세보기</h5>
	</div>
	<div class="card-block">
		<form enctype="multipart/form-data" style="font-size: 15px;">
			<input type="hidden" value="${board.bbsNo}">
			<div class="form-group row ">
				<div class="col-sm-2 font-weight-bold">작성일자</div>
				<div class="col-sm-6">${board.wrtYmd}</div>
				<div class="col-sm-2 font-weight-bold text-right">조회수</div>
				<div class="col-sm-2 text-right">${board.inqCnt}</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-2 font-weight-bold">제목</div>
				<div class="col-sm-6">${board.bbsTtl}</div>
				<div class="col-sm-2 font-weight-bold text-right">작성자</div>
				<div class="col-sm-2 text-right">${board.wrtrNm}</div>
			</div>
			<div class="form-group row">
				<p class="col-sm-2 font-weight-bold">내용</p>
				<div class="col-sm-10">
					<textarea class="form-control"
						style="border: none;  height: 300px; background-color: #DFDEDE;">${board.bbsCn}</textarea>
				</div>
			</div>
			<div class="form-group row" style="font-size: 15px;">
				<p class="col-sm-2 font-weight-bold">첨부파일</p>
				<div class="col-sm-5">
					<c:forEach var="f" items="${board.srcList}">
						<div>
							<a href="<c:url value='/file/download/${f.fileSn}' />"> <span
								class="glyphicon glyphicon-save" aria-hidden="true"></span> <span>
									${f.orgnlFileNm} </span>
							</a> <span> Size : ${f.fileSz} Bytes</span>
						</div>
					</c:forEach>
				</div>
			</div>
		</form>
		<c:if test="${board.wrtrId eq memberId}">
			<div class="d-flex justify-content-center" style="margin-top: 70px;">
				<div>
					<button onclick="updateNotice(${board.bbsNo})"
						class="btn btn-oti waves-effect waves-light mr-4">수정</button>
				</div>
				<div>
					<button
						onclick='location.href="/board/delete/${board.bbsNo}?type=notice"'
						class="btn btn-oti waves-effect waves-light">삭제</button>
				</div>
			</div>
		</c:if>
	</div>
</div>

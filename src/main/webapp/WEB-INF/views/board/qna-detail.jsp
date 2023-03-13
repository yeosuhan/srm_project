<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<div class="card">
	<div class="card-header">
		<h5>문의사항</h5>
	</div>
	<div class="card-block">
		<form enctype="multipart/form-data">
			<input type="hidden" value="${board.bbsNo}">
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
				<div class="col-sm-6">${board.bbsTtl}</div>
				<div class="col-sm-2 font-weight-bold text-right">작성자</div>
				<div class="col-sm-2">${board.wrtrNm}</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-2 font-weight-bold">SR번호</div>
				<div class="col-sm-6">${board.srNo}</div>
			</div>
			<div class="form-group row">
				<p class="col-sm-2 font-weight-bold">내용</p>
				<div class="col-sm-10">
					<input class="form-control"
						style="border: none; background-color: #DFDEDE" readonly
						value="${board.bbsCn}"></input>
				</div>
			</div>
			<div class="form-group row">
				<p class="col-sm-2 font-weight-bold">첨부파일</p>
				<div class="col-sm-10">
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
			<div class="d-flex justify-content-center">
				<div>
					<button onclick="updateQna(${board.bbsNo})"
						class="btn btn-oti waves-effect waves-light">수정</button>
				</div>
				<form action="#">
					<button class="btn btn-oti waves-effect waves-light">삭제</button>
				</form>
			</div>
		</c:if>
	</div>
</div>
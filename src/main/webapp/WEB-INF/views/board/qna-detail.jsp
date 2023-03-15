<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script src="/resources/js/board.js"></script>
<style>
.cmntCn ul {
	padding: 0;
	margin: 0;
	list-style-type: none;
}

.cmntCn ul li {
	border-top: 1px solid #888; /* li 의 윗쪽 경계선 */
}

.cmntCn dt {
	margin-top: 5px;
}

.cmntCn dd {
	margin-left: 26px;
}

.cmntCn form textarea, .cmntCn form button {
	float: left;
}

.cmntCn li {
	clear: left;
}

.cmntCn form textarea {
	width: 85%;
	height: 100px;
}

.cmntCn form button {
	width: 15%;
	height: 100px;
}
</style>
<div class="card" id="asd" style="height: 800px;">
	<div class="card-header">
		<h5>문의사항</h5>
	</div>
	<div class="card-block px-0 py-50">
		<form enctype="multipart/form-data">
			<input type="hidden" value="${board.bbsNo}">
			<div class="form-group row">
				<div class="col-sm-2 font-weight-bold">작성일자</div>
				<div class="col-sm-4">${board.wrtYmd}</div>
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
				<div class="col-sm-4">${board.bbsTtl}</div>
				<div class="col-sm-2 font-weight-bold text-right">작성자</div>
				<div class="col-sm-2">${board.wrtrNm}</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-2 font-weight-bold">SR번호</div>
				<div class="col-sm-4">${board.srNo}</div>
			</div>
			<div class="form-group row">
				<p class="col-sm-2 font-weight-bold" style="line-height: 150px;">내용</p>
				<div class="col-sm-9">
					<input class="form-control"
						style="border: none; height: 150px; background-color: #DFDEDE"
						readonly value="${board.bbsCn}"></input>
				</div>
			</div>
			<div class="form-group row m-0">
				<p class="col-sm-2 font-weight-bold">첨부파일</p>
				<div class="col-sm-6">
					<c:forEach var="f" items="${board.srcList}">
						<div>
							<a href="<c:url value='/file/download/${f.fileSn}' />"> <span
								class="glyphicon glyphicon-save" aria-hidden="true"></span> <span>
									${f.orgnlFileNm} </span>
							</a> <span> Size : ${f.fileSz} Bytes</span>
						</div>
					</c:forEach>
				</div>
				<div class="col-sm-3 p-0">
					<c:if test="${board.wrtrId eq memberId}">
						<div class="d-flex justify-content-center">
							<div class="p-0">
								<button onclick="updateQna(${board.bbsNo})" type="button"
									class="btn btn-oti waves-effect waves-light">수정</button>
							</div>
							<div class="p-0">
								<button
									onclick='location.href="/board/delete/${board.bbsNo}?type=qna"'
									class="btn btn-oti waves-effect waves-light">삭제</button>
							</div>
						</div>
					</c:if>
				</div>
			</div>
			<hr />
		</form>
		<h6 class="col-sm-2 font-weight-bold">댓글
			${board.comments.commpager.totalRows}</h6>
		<hr style="margin-bottom: 0px;" />
		<div class="card-block p-0">
			<!-- 댓글 작성 -->
			<!-- 여기에 댓글 id  -->
			<form action="/comment/write" method="POST"
				class="col-sm-12 text-left d-flex p-0 justify-content-start"
				style="margin: auto;">
				<input type="hidden" value="1"> <input type="hidden"
					name="bbsNo" value="${board.bbsNo}"> <input type="hidden"
					name="wrtrId"
					value="<sec:authentication property="principal.username"/>">
				<input type="text" name="cmntCn" class="form-control"
					style="width: 100%;" placeholder="댓글을 작성해주세요">
				<button style="padding-top: 9px">저장</button>

			</form>
			<div class="col-2"></div>
			<div class="col-1 "></div>
			<!-- 댓글 조회  -->
			<table class="table table-hover text-center" style="font-size: 12;">
				<thead>
					<tr>
						<th class="col-2 text-center">작성자</th>
						<th class="col-6 text-center">내용</th>
						<th class="col-3 text-center">작성일</th>
						<th class="col-1 text-center"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${board.comments.commentList}" var="comm"
						varStatus="i">
						<tr>
							<td>${comm.wrtrNm}</td>
							<td>${comm.cmntCn}</td>
							<td>${comm.wrtYmd}</td>
							<td class="justify-content-end"><sec:authentication
									property="principal.username" var="username" /> <c:if
									test="${comm.wrtrId eq username}">
									<a href="/comment/delete/${board.bbsNo}?cmntNo=${comm.cmntNo}"
										style="color: #A1A6A6; margin: auto;"> <img
										src="${pageContext.request.contextPath}/resources/oti_images/remove.png"
										width="10px" height="10px">
									</a>
								</c:if></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
				<c:forEach items="${board.comments.commentList}" var="comm"
						varStatus="i">
				<c:if
					test="${i.last and (board.comments.commpager.pageNo lt board.comments.commpager.endPageNo)}">
					<div class="text-center commentList">
						<a
							onclick="getComments(${board.bbsNo},${board.comments.commpager.pageNo + 1})"
							class="font-weight-bold">더 보기</a>
					</div>
				</c:if>
				</c:forEach>
		</div>
	</div>
</div>
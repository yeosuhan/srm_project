<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script src="/resources/js/board.js"></script>

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
				<div>
					<button
						onclick='location.href="/board/delete/${board.bbsNo}?type=qna"'
						class="btn btn-oti waves-effect waves-light">삭제</button>
				</div>
			</div>
		</c:if>
	</div>
</div>
<!--     댓글      -->
<div class="row">
	<div class="col-sm-12">
		<div class="card">
			<div class="card-header text-right">
				<h6>댓글 ${board.comments.commpager.totalRows}</h6>
			</div>
			<div class="card-block">
				<!-- 댓글 작성 -->
				<div class="row mb-2">
					<input type="hidden" value="1">
					<!-- 여기에 댓글 id  -->
					<div class="col-2 text-left" style="margin: auto;">
						<sec:authentication property="principal.flnm" />
					</div>
					<form action="/comment/write" method="POST"
						class="col-7 text-left d-flex justify-content-start"
						style="margin: auto;">
						<input type="hidden" name="bbsNo" value="${board.bbsNo}">
						<input type="hidden" name="wrtrId"
							value="<sec:authentication property="principal.username"/>">
						<input type="text" name="cmntCn" class="form-control"
							style="width: 90%;" placeholder="댓글을 작성해주세요">
						<button class="ml-3" style="color: blue; padding-top: 9px">저장</button>
					</form>
					<div class="col-2"></div>
					<div class="col-1 "></div>
				</div>
				<!-- 댓글 조회  -->
				<c:forEach items="${board.comments.commentList}" var="comm"
					varStatus="i">
					<div class="row mb-2">
						<input type="hidden" value="1">
						<div class="col-2 text-left" style="margin: auto;">${comm.wrtrNm}</div>
						<div class="col-7 text-left">${comm.cmntCn}</div>
						<div class="col-2 text-right">${comm.wrtYmd}</div>

						<div class="col-1 d-flex justify-content-end">
							<sec:authentication property="principal.username" var="username" />
							<c:if test="${comm.wrtrId eq username}">
								<a href="/comment/delete/${board.bbsNo}?cmntNo=${comm.cmntNo}"
									style="color: #A1A6A6; margin: auto;"> <img
									src="${pageContext.request.contextPath}/resources/oti_images/remove.png"
									width="10px" height="10px">
								</a>
							</c:if>
						</div>

					</div>
					<c:if test="${i.last and (board.comments.commpager.pageNo lt board.comments.commpager.endPageNo)}">
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
</div>

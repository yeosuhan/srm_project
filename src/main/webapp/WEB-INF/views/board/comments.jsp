<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<c:forEach items="${comments.commentList}" var="comm" varStatus="i">
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
		<div class="text-center">
			<a onclick="getComments(${board.bbsNo},${board.comments.commpager.pageNo + 1})"
				class="font-weight-bold">더 보기</a>
		</div>
	</c:if>
</c:forEach>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<table class="table table-hover text-center" style="font-size: 12;">
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


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<c:forEach items="${comments.commentList}" var="comm" varStatus="i">
	<tr class="commentList">
		<td>${comm.wrtrNm}</td>
		<td>${comm.cmntCn}</td>
		<td>${comm.wrtYmd}</td>
		<td class="justify-content-end"><sec:authentication
				property="principal.username" var="username" /> <c:if
				test="${comm.wrtrId eq username}">
				<a href="/comment/delete/${comm.bbsNo}?cmntNo=${comm.cmntNo}"
					style="color: #A1A6A6; margin: auto;"> <img
					src="${pageContext.request.contextPath}/resources/oti_images/remove.png"
					width="10px" height="10px">
				</a>
			</c:if></td>
	</tr>
	<c:if
		test="${i.last and (comments.commpager.pageNo lt comments.commpager.totalPageNo)}">
		<tr class="commentList">
			<td></td>
			<td><a
				onclick="getComments(${comm.bbsNo},${comments.commpager.pageNo + 1})"
				class="font-weight-bold"
				href="#">더 보기</a></td>
			<td></td>
		</tr>
	</c:if>
</c:forEach>
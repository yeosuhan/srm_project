<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- paging 처리 함수 --%>
<script src="${pageContext.request.contextPath}/resources/js/pagination.js"></script>
<div class="pagination-container">
	<div class="pagination">
		<c:if test="${qPager.startPageNo -1 > 0 }">
			<a class="pagination-newer" href="?type=qna&page=${qPager.startPageNo - 1}">PREV</a>
		</c:if>
		<c:if test="${qPager.startPageNo -1 <= 0 }">
			<a style="visibility: hidden" class="pagination-newer" href="#">PREV</a>
		</c:if>
		<span class="pagination-inner"> <c:forEach var="num"
				begin="${qPager.startPageNo}" end="${qPager.endPageNo}" step="1">
				<c:if test="${qPager.pageNo == num }">
					<a class="pagination-active" href="?type=qna&page=${num}">${num}</a>
				</c:if>
				<c:if test="${qPager.pageNo != num }">
					<a href="?type=qna&page=${num}">${num}</a>
				</c:if>
			</c:forEach>
		</span>
		<c:if test="${qPager.endPageNo < qPager.totalPageNo }">
			<a class="pagination-older" href="?type=qna&page=${pager.endPageNo + 1}">NEXT</a>
		</c:if>
		<c:if test="${qPager.endPageNo >= qPager.totalPageNo }">
			<a style="visibility: hidden" class="pagination-older" href="#">NEXT</a>
		</c:if>
	</div>
</div>

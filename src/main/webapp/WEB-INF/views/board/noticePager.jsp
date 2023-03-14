<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- paging 처리 함수 --%>
<div class="pagination-container">
	<div class="pagination">
		<c:if test="${nPager.startPageNo -1 > 0 }">
			<a class="pagination-newer" href="?page=${nPager.startPageNo - nPager.pagesPerGroup}">PREV</a>
		</c:if>
		<c:if test="${nPager.startPageNo -1 <= 0 }">
			<a style="visibility: hidden" class="pagination-newer" href="#">PREV</a>
		</c:if>
		<span class="pagination-inner"> <c:forEach var="num"
				begin="${nPager.startPageNo}" end="${nPager.endPageNo}" step="1">
				<c:if test="${nPager.pageNo == num }">
					<a class="pagination-active" href="?page=${num}">${num}</a>
				</c:if>
				<c:if test="${nPager.pageNo != num }">
					<a href="?page=${num}">${num}</a>
				</c:if>
			</c:forEach>
		</span>
		<c:if test="${nPager.endPageNo < nPager.totalPageNo }">
			<a class="pagination-older" href="?page=${nPager.endPageNo + 1}">NEXT</a>
		</c:if>
		<c:if test="${nPager.endPageNo >= nPager.totalPageNo }">
			<a style="visibility: hidden" class="pagination-older" href="#">NEXT</a>
		</c:if>
	</div>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:if test="${fn:length(qnaList) gt 0}">
	<div class="pagination-container">
		<div class="pagination">
			<c:if test="${qPager.startPageNo -1 > 0 }">
				<a class="pagination-newer"
					href="?page=${qPager.startPageNo - qPager.pagesPerGroup}">PREV</a>
			</c:if>
			<c:if test="${qPager.startPageNo -1 <= 0 }">
				<a style="visibility: hidden" class="pagination-newer" href="#">PREV</a>
			</c:if>
			<span class="pagination-inner"> <c:forEach var="num"
					begin="${qPager.startPageNo}" end="${qPager.endPageNo}" step="1">
					<c:if test="${qPager.pageNo == num }">
						<a class="pagination-active" href="?page=${num}">${num}</a>
					</c:if>
					<c:if test="${qPager.pageNo != num }">
						<a href="?page=${num}">${num}</a>
					</c:if>
				</c:forEach>
			</span>
			<c:if test="${qPager.endPageNo < qPager.totalPageNo }">
				<a class="pagination-older"
					href="?page=${qPager.endPageNo + 1}">NEXT</a>
			</c:if>
			<c:if test="${qPager.endPageNo >= qPager.totalPageNo }">
				<a style="visibility: hidden" class="pagination-older" href="#">NEXT</a>
			</c:if>
		</div>
	</div>
</c:if>
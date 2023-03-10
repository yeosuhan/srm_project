<%--
	작성자 : 신정은
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="pagination-container">
	<c:if test="${sttsCd ne null}">
		<div class="pagination">
			<c:if test="${pager.startPageNo -1 > 0 }">
				<a class="pagination-newer" href="#" onclick="mytodoPaging(${sttsCd},1)">PREV</a>
			</c:if>
			<c:if test="${pager.startPageNo -1 <= 0 }">
				<a style="visibility:hidden" class="pagination-newer" href="#">PREV</a>
			</c:if>
			<span class="pagination-inner">
				<c:forEach var="num" begin="${pager.startPageNo}" end="${pager.endPageNo}" step="1">
					<c:if test="${pager.pageNo == num }">
						<a class="pagination-active" href="#" onclick="mytodoPaging(${sttsCd},${num})">${num}</a>
					</c:if>
					<c:if test="${pager.pageNo != num }">
						<a href="?page=${num}${mytodoUrl}">${num}</a>
					</c:if>
				</c:forEach>
			</span>
			<c:if test="${pager.endPageNo < pager.totalPageNo }">
				<a class="pagination-older" href="#" onclick="mytodoPaging(${sttsCd},${num})">NEXT</a>
			</c:if>
			<c:if test="${pager.endPageNo >= pager.totalPageNo }">
				<a style="visibility:hidden" class="pagination-older" href="#">NEXT</a>
			</c:if>
		</div>
	</c:if>
	
	<c:if test="${mytodoUrl eq null}">
		<div class="pagination">
			<c:if test="${pager.startPageNo -1 > 0 }">
				<a class="pagination-newer" href="?page=${pager.startPageNo - 1}">PREV</a>
			</c:if>
			<c:if test="${pager.startPageNo -1 <= 0 }">
				<a style="visibility:hidden" class="pagination-newer" href="#">PREV</a>
			</c:if>
			<span class="pagination-inner">
				<c:forEach var="num" begin="${pager.startPageNo}" end="${pager.endPageNo}" step="1">
					<c:if test="${pager.pageNo == num }">
						<a class="pagination-active" href="?page=${num}">${num}</a>
					</c:if>
					<c:if test="${pager.pageNo != num }">
						<a href="?page=${num}">${num}</a>
					</c:if>
				</c:forEach>
			</span>
			<c:if test="${pager.endPageNo < pager.totalPageNo }">
				<a class="pagination-older" href="?page=${pager.endPageNo + 1}">NEXT</a>
			</c:if>
			<c:if test="${pager.endPageNo >= pager.totalPageNo }">
				<a style="visibility:hidden" class="pagination-older" href="#">NEXT</a>
			</c:if>
		</div>
	</c:if>

</div>

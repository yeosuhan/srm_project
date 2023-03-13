<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:if test="${fn:length(srList) gt 0}">
	<div class="pagination">
		<c:if test="${pager.startPageNo -1 > 0 }">
			<a class="pagination-newer" href="#"
				onclick="mytodoPaging(${sttsCd},1); event.preventDefault()">PREV</a>
		</c:if>
		<c:if test="${pager.startPageNo -1 <= 0 }">
			<a style="visibility: hidden" class="pagination-newer" href="#">PREV</a>
		</c:if>
		<span class="pagination-inner"> <c:forEach var="num"
				begin="${pager.startPageNo}" end="${pager.endPageNo}" step="1">
				<c:if test="${pager.pageNo == num }">
					<a class="pagination-active" href="#"
						onclick="mytodoPaging(${sttsCd},${num}); event.preventDefault()">${num}</a>
				</c:if>
				<c:if test="${pager.pageNo != num }">
					<a href="#" onclick="mytodoPaging(${sttsCd},${num}); event.preventDefault()">${num}</a>
				</c:if>
			</c:forEach>
		</span>
		<c:if test="${pager.endPageNo < pager.totalPageNo }">
			<a class="pagination-older" href="#"
				onclick="mytodoPaging(${sttsCd},${pager.endPageNo+1}); event.preventDefault()">NEXT</a>
		</c:if>
		<c:if test="${pager.endPageNo >= pager.totalPageNo }">
			<a style="visibility: hidden" class="pagination-older" href="#">NEXT</a>
		</c:if>
	</div>
</c:if>

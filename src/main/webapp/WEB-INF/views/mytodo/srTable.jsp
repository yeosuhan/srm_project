<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="${pageContext.request.contextPath}/resources/js/mytodo.js"></script>
<table class="table table-hover" style="table-layout: fixed;">
	<thead>
		<tr>
			<th width="15%" class="text-left">SR번호</th>
			<th width="15%" class="text-left">시스템구분</th>
			<th width="15%" class="text-left">업무구분</th>
			<th width="20%" class="text-center">SR제목</th>
			<th width="7%" class="text-center">담당자</th>
			<th width="10%" class="text-center">완료요청일</th>
			<th width="10%" class="text-center">진행상태</th>
			<sec:authorize access="hasAnyRole('ROLE_DEVELOPER', 'ROLE_ADMIN')">
				<th width="5%">우선순위</th>
			</sec:authorize>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="sr" items="${srList}">
			<tr>
				<td id="dmndNo" class="text-left font-weight-bold">${sr.dmndNo}</td>
				<td id="sysNm" class="text-left">${sr.sysNm}</td>
				<td id="taskNm" class="text-left">${sr.taskNm}</td>
				<c:choose>
					<c:when test="${fn:length(sr.ttl) > 10}">
						<td id="ttl" class="text-center"><c:out
								value="${fn:substring(sr.ttl,0,9)}" />...</td>
					</c:when>
					<c:otherwise>
						<td id="ttl" class="text-center"><c:out value="${sr.ttl}" /></td>
					</c:otherwise>
				</c:choose>
				<td id="picNm" class="text-center">${sr.picNm}</td>
				<td id="cmptnDmndYmd" class="text-center text-center">${sr.cmptnDmndYmd}</td>
				<td><c:if test="${(sr.sttsCd) eq 0}">
						<label class="badge badge-warning text-center">${sr.sttsNm}</label>
					</c:if> <c:if test="${(sr.sttsCd) eq 1}">
						<label class="badge badge-danger text-center">${sr.sttsNm}</label>
					</c:if> <c:if test="${(sr.sttsCd) eq 2}">
						<label class="badge badge-inverse-success text-center">${sr.sttsNm}</label>
					</c:if> <c:if test="${(sr.sttsCd) eq 3}">
						<label class="badge badge-success text-center">${sr.sttsNm}</label>
					</c:if> <c:if test="${(sr.sttsCd) eq 4}">
						<label class="badge badge-primary text-center">${sr.sttsNm}</label>
					</c:if> <c:if test="${(sr.sttsCd) eq 5}">
						<label class="badge badge-danger text-center">${sr.sttsNm}</label>
					</c:if> <c:if test="${(sr.sttsCd) eq 6}">
						<label class="badge badge-inverse-primary text-center">${sr.sttsNm}</label>
					</c:if></td>
				<c:if test="${sr.sttsCd} > 1">
					<sec:authorize access="hasAnyRole('ROLE_DEVELOPER', 'ROLE_ADMIN')">
						<td id="rnk" class="text-center">${sr.rnk}</td>
					</sec:authorize>
				</c:if>
			</tr>
		</c:forEach>
	</tbody>
</table>
<div class="d-flex justify-content-center">
	<%@ include file="/WEB-INF/views/fragments/mytodoPager.jsp"%>
</div>
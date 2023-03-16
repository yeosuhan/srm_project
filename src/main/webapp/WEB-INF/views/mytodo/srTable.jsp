<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="${pageContext.request.contextPath}/resources/js/mytodo.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/graph.js"></script>
<table class="table table-hover" style="table-layout: fixed;">
		<c:if test="${fn:length(srList) == 0 }">
			<div class="text-center d-flex justify-content-center" style="height: 100px;">
				<div style="margin: auto;">내역이 없습니다.</div>
			</div>
		</c:if>
		<c:if test="${fn:length(srList) gt 0}">
			<thead>
				<tr>
					<th width="15%" class="text-left">SR번호</th>
					<th width="15%" class="text-left">시스템구분</th>
					<th width="15%" class="text-left">업무구분</th>
					<th width="20%" class="text-center">제목</th>
					<c:if test="${sttsCd ne 0}">
						<th width="7%" class="text-center">담당자</th>
					</c:if>
					<th width="10%" class="text-center">완료요청일</th>
					<th width="10%" class="text-center">진행상태</th>
					<c:if test="${sttsCd gt 1}">
						<sec:authorize access="hasAnyRole('ROLE_DEVELOPER', 'ROLE_ADMIN')">
							<th width="5%">우선순위</th>
						</sec:authorize>
					</c:if>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="sr" items="${srList}">
				<tr onclick="showAdminGraph('${sr.dmndNo}')">
					<td id="dmndNo" class="text-left font-weight-bold">${sr.dmndNo}</td>
					<td id="sysNm" class="text-left">${sr.sysNm}</td>
					<td id="taskNm" class="text-left">${sr.taskNm}</td>
					<c:choose>
						<c:when test="${fn:length(sr.ttl) > 30}">
							<td id="ttl" class="text-center"><c:out
									value="${fn:substring(sr.ttl,0,29)}" />...</td>
						</c:when>
						<c:otherwise>
							<td id="ttl" class="text-center"><c:out value="${sr.ttl}" /></td>
						</c:otherwise>
					</c:choose>
					<c:if test="${sttsCd ne 0}">
						<td id="picNm" class="text-center">${sr.picNm}</td>
					</c:if>
					<td id="cmptnDmndYmd" class="text-center text-center">${sr.cmptnDmndYmd}</td>
					<td class="text-center"><c:if test="${(sr.sttsCd) eq 0}">
							<label class="badge badge-warning">${sr.sttsNm}</label>
						</c:if> <c:if test="${(sr.sttsCd) eq 1}">
							<label class="badge badge-danger">${sr.sttsNm}</label>
						</c:if> <c:if test="${(sr.sttsCd) eq 2}">
							<label class="badge badge-inverse-success">${sr.sttsNm}</label>
						</c:if> <c:if test="${(sr.sttsCd) eq 3}">
							<label class="badge badge-success">${sr.sttsNm}</label>
						</c:if> <c:if test="${(sr.sttsCd) eq 4}">
							<label class="badge badge-primary">${sr.sttsNm}</label>
						</c:if> <c:if test="${(sr.sttsCd) eq 5}">
							<label class="badge badge-danger">${sr.sttsNm}</label>
						</c:if> <c:if test="${(sr.sttsCd) eq 6}">
							<label class="badge badge-inverse-primary">${sr.sttsNm}</label>
						</c:if></td>
					<c:if test="${sttsCd gt 1}">
						<sec:authorize access="hasAnyRole('ROLE_DEVELOPER', 'ROLE_ADMIN')">
							<td id="rnk" class="text-center">${sr.rnk}</td>
						</sec:authorize>
					</c:if>
				</tr>
			</c:forEach>
	</c:if>
	</tbody>
</table>
<div class="d-flex justify-content-center">
	<%@ include file="/WEB-INF/views/fragments/mytodoPager.jsp"%>
</div>
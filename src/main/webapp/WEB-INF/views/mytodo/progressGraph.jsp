<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/graph.js"></script>
<sec:authorize access="hasRole('ROLE_ADMIN')">
	<script>
	document.addEventListener('DOMContentLoaded', function () {
		console.log("aaaa");
		showAdminGraph("");    
	});
	</script>
</sec:authorize>

<div class="card">
	<div class="card-header">
		<h5 class="card-header-text">진행률</h5>
	</div>
	<div id="adGraph" style="width:100%; height:400px;"></div>
</div>

<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<%@include file="/WEB-INF/views/fragments/header.jsp"%>
	</head>	
	<body>
		<div id="pcoded" class="pcoded">
			<div class="pcoded-overlay-box"></div>
			<div class="pcoded-container navbar-wrapper">
				<%@include file="/WEB-INF/views/fragments/top.jsp"%>
				<div class="pcoded-main-container">
					<div class="pcoded-wrapper">
						<c:if test="${role eq 1 }">
							<%@include file="/WEB-INF/views/fragments/sidebar.jsp"%>
						</c:if>
						<c:if test="${role eq 2 }">
							<%@include file="/WEB-INF/views/fragments/srSidebar.jsp"%>
						</c:if>
						<c:if test="${role eq 3 }">
							<%@include file="/WEB-INF/views/fragments/manageSidebar.jsp"%>
						</c:if>
						<div class="pcoded-content">
							<%@include file="/WEB-INF/views/fragments/pageHeader.jsp"%>
							<div class="pcoded-inner-content pt-4">
								<div class="main-body">
									<div id="pageWrapper" class="page-wrapper">
										<!-- Page-body start -->
										<div class="page-body">
											<!-- *********** -->
	
	
											여기에 내용 붙여넣으세요
											<a href="example?role=1">사용자</a>
											<a href="example?role=2">개발자</a>
											<a href="example?role=3">관리자</a>
	
											<!-- *********** -->
										</div>
										<!-- Page-body end -->
									</div>
									<div id="styleSelector"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@include file="/WEB-INF/views/fragments/bottom.jsp"%>
	</body>
</html>
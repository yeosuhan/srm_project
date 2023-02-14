<%@page contentType="text/html; charset=UTF-8"%>

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
						<%@include file="/WEB-INF/views/fragments/sidebar.jsp"%>
						<div class="pcoded-content">
							<%@include file="/WEB-INF/views/fragments/pageHeader.jsp"%>
							<div class="pcoded-inner-content pt-4">
								<div class="main-body">
									<div id="pageWrapper" class="page-wrapper">
										<!-- Page-body start -->
										<div class="page-body">
											<!-- *********** -->
	
	
											여기에 내용 붙여넣으세요
	
	
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<title>Mega Able bootstrap admin template by codedthemes</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description"
	content="Mega Able Bootstrap admin template made using Bootstrap 4 and it has huge amount of ready made feature, UI components, pages which completely fulfills any dashboard needs." />
<meta name="keywords"
	content="bootstrap, bootstrap admin template, admin theme, admin dashboard, dashboard template, admin template, responsive" />
<meta name="author" content="codedthemes" />
<!-- Favicon icon -->
<link rel="icon" href="/resources/assets/images/favicon.ico"
	type="image/x-icon">
<!-- Google font-->
<link href="https://fonts.googleapis.com/css?family=Roboto:400,500"
	rel="stylesheet">
<!-- Required Fremwork -->
<link rel="stylesheet" type="text/css"
	href="/resources/assets/css/bootstrap/css/bootstrap.min.css">
<!-- themify-icons line icon -->
<link rel="stylesheet" type="text/css"
	href="/resources/assets/icon/themify-icons/themify-icons.css">
<!-- ico font -->
<link rel="stylesheet" type="text/css"
	href="/resources/assets/icon/icofont/css/icofont.css">
<!-- Font Awesome -->
<link rel="stylesheet" type="text/css"
	href="/resources/assets/icon/font-awesome/css/font-awesome.min.css">
<!-- waves.css -->
<link rel="stylesheet"
	href="/resources/assets/pages/waves/css/waves.min.css" type="text/css"
	media="all">
<!-- Style.css -->
<link rel="stylesheet" type="text/css"
	href="/resources/assets/css/style.css">
<link rel="stylesheet" type="text/css"
	href="/resources/assets/css/jquery.mCustomScrollbar.css">
	
	<link rel="stylesheet" type="text/css"
	href="/resources/srButton.css">
</head>
<body>
	<!-- Pre-loader start -->
	<div class="theme-loader">
		<div class="loader-track">
			<div class="preloader-wrapper">
				<div class="spinner-layer spinner-blue">
					<div class="circle-clipper left">
						<div class="circle"></div>
					</div>
					<div class="gap-patch">
						<div class="circle"></div>
					</div>
					<div class="circle-clipper right">
						<div class="circle"></div>
					</div>
				</div>
				<div class="spinner-layer spinner-red">
					<div class="circle-clipper left">
						<div class="circle"></div>
					</div>
					<div class="gap-patch">
						<div class="circle"></div>
					</div>
					<div class="circle-clipper right">
						<div class="circle"></div>
					</div>
				</div>

				<div class="spinner-layer spinner-yellow">
					<div class="circle-clipper left">
						<div class="circle"></div>
					</div>
					<div class="gap-patch">
						<div class="circle"></div>
					</div>
					<div class="circle-clipper right">
						<div class="circle"></div>
					</div>
				</div>

				<div class="spinner-layer spinner-green">
					<div class="circle-clipper left">
						<div class="circle"></div>
					</div>
					<div class="gap-patch">
						<div class="circle"></div>
					</div>
					<div class="circle-clipper right">
						<div class="circle"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Pre-loader end -->
	<div id="pcoded" class="pcoded">
		<div class="pcoded-overlay-box"></div>
		<div class="pcoded-container navbar-wrapper">
			<nav class="navbar header-navbar pcoded-header">
				<div class="navbar-wrapper">
					<div class="navbar-logo">
						<a class="mobile-menu waves-effect waves-light"
							id="mobile-collapse" href="#!"> <i class="ti-menu"></i>
						</a>
						<div class="mobile-search waves-effect waves-light">
							<div class="header-search">
								<div class="main-search morphsearch-search">
									<div class="input-group">
										<span class="input-group-addon search-close"><i
											class="ti-close"></i></span> <input type="text" class="form-control"
											placeholder="Enter Keyword"> <span
											class="input-group-addon search-btn"><i
											class="ti-search"></i></span>
									</div>
								</div>
							</div>
						</div>
						<a href="index.html"> <img class="img-fluid"
							src="assets/images/logo.png" alt="Theme-Logo" />
						</a> <a class="mobile-options waves-effect waves-light"> <i
							class="ti-more"></i>
						</a>
					</div>

					<div class="navbar-container container-fluid">
						<ul class="nav-left">
							<li>
								<div class="sidebar_toggle">
									<a href="javascript:void(0)"><i class="ti-menu"></i></a>
								</div>
							</li>
							<li class="header-search">
								<div class="main-search morphsearch-search">
									<div class="input-group">
										<span class="input-group-addon search-close"><i
											class="ti-close"></i></span> <input type="text" class="form-control">
										<span class="input-group-addon search-btn"><i
											class="ti-search"></i></span>
									</div>
								</div>
							</li>
							<li><a href="#!" onclick="javascript:toggleFullScreen()"
								class="waves-effect waves-light"> <i class="ti-fullscreen"></i>
							</a></li>
						</ul>
						<ul class="nav-right">
							<li class="header-notification"><a href="#!"
								class="waves-effect waves-light"> <i class="ti-bell"></i> <span
									class="badge bg-c-red"></span>
							</a>
								<ul class="show-notification">
									<li>
										<h6>Notifications</h6> <label class="label label-danger">New</label>
									</li>
									<li class="waves-effect waves-light">
										<div class="media">
											<img class="d-flex align-self-center img-radius"
												src="assets/images/avatar-2.jpg"
												alt="Generic placeholder image">
											<div class="media-body">
												<h5 class="notification-user">John Doe</h5>
												<p class="notification-msg">Lorem ipsum dolor sit amet,
													consectetuer elit.</p>
												<span class="notification-time">30 minutes ago</span>
											</div>
										</div>
									</li>
									<li class="waves-effect waves-light">
										<div class="media">
											<img class="d-flex align-self-center img-radius"
												src="assets/images/avatar-4.jpg"
												alt="Generic placeholder image">
											<div class="media-body">
												<h5 class="notification-user">Joseph William</h5>
												<p class="notification-msg">Lorem ipsum dolor sit amet,
													consectetuer elit.</p>
												<span class="notification-time">30 minutes ago</span>
											</div>
										</div>
									</li>
									<li class="waves-effect waves-light">
										<div class="media">
											<img class="d-flex align-self-center img-radius"
												src="assets/images/avatar-3.jpg"
												alt="Generic placeholder image">
											<div class="media-body">
												<h5 class="notification-user">Sara Soudein</h5>
												<p class="notification-msg">Lorem ipsum dolor sit amet,
													consectetuer elit.</p>
												<span class="notification-time">30 minutes ago</span>
											</div>
										</div>
									</li>
								</ul></li>
							<li class="user-profile header-notification"><a href="#!"
								class="waves-effect waves-light"> <img
									src="assets/images/avatar-4.jpg" class="img-radius"
									alt="User-Profile-Image"> <span>John Doe</span> <i
									class="ti-angle-down"></i>
							</a>
								<ul class="show-notification profile-notification">
									<li class="waves-effect waves-light"><a href="#!"> <i
											class="ti-settings"></i> Settings
									</a></li>
									<li class="waves-effect waves-light"><a
										href="user-profile.html"> <i class="ti-user"></i> Profile
									</a></li>
									<li class="waves-effect waves-light"><a
										href="email-inbox.html"> <i class="ti-email"></i> My
											Messages
									</a></li>
									<li class="waves-effect waves-light"><a
										href="auth-lock-screen.html"> <i class="ti-lock"></i> Lock
											Screen
									</a></li>
									<li class="waves-effect waves-light"><a
										href="auth-normal-sign-in.html"> <i
											class="ti-layout-sidebar-left"></i> Logout
									</a></li>
								</ul></li>
						</ul>
					</div>
				</div>
			</nav>

			<div class="pcoded-main-container">
				<div class="pcoded-wrapper">
					<nav class="pcoded-navbar">
						<div class="sidebar_toggle">
							<a href="#"><i class="icon-close icons"></i></a>
						</div>
						<div class="pcoded-inner-navbar main-menu">
							<div class="">
								<div class="main-menu-header">
									<img class="img-80 img-radius" src="assets/images/avatar-4.jpg"
										alt="User-Profile-Image">
									<div class="user-details">
										<span id="more-details">John Doe<i
											class="fa fa-caret-down"></i></span>
									</div>
								</div>

								<div class="main-menu-content">
									<ul>
										<li class="more-details"><a href="user-profile.html"><i
												class="ti-user"></i>View Profile</a> <a href="#!"><i
												class="ti-settings"></i>Settings</a> <a
											href="auth-normal-sign-in.html"><i
												class="ti-layout-sidebar-left"></i>Logout</a></li>
									</ul>
								</div>
							</div>
							<div class="p-15 p-b-0">
								<form class="form-material">
									<div class="form-group form-primary">
										<input type="text" name="footer-email" class="form-control"
											required=""> <span class="form-bar"></span> <label
											class="float-label"><i class="fa fa-search m-r-10"></i>Search
											Friend</label>
									</div>
								</form>
							</div>
							<div class="pcoded-navigation-label"
								data-i18n="nav.category.navigation">Layout</div>
							<ul class="pcoded-item pcoded-left-item">
								<li class=""><a href="index.html"
									class="waves-effect waves-dark"> <span class="pcoded-micon"><i
											class="ti-home"></i><b>D</b></span> <span class="pcoded-mtext"
										data-i18n="nav.dash.main">Dashboard</span> <span
										class="pcoded-mcaret"></span>
								</a></li>
								<li class="pcoded-hasmenu active pcoded-trigger"><a
									href="javascript:void(0)" class="waves-effect waves-dark">
										<span class="pcoded-micon"><i
											class="ti-layout-grid2-alt"></i></span> <span class="pcoded-mtext"
										data-i18n="nav.basic-components.main">Components</span> <span
										class="pcoded-mcaret"></span>
								</a>
									<ul class="pcoded-submenu">
										<li class="active"><a href="accordion.html"
											class="waves-effect waves-dark"> <span
												class="pcoded-micon"><i class="ti-angle-right"></i></span> <span
												class="pcoded-mtext" data-i18n="nav.basic-components.alert">Accordion</span>
												<span class="pcoded-mcaret"></span>
										</a></li>
										<li class=" "><a href="breadcrumb.html"
											class="waves-effect waves-dark"> <span
												class="pcoded-micon"><i class="ti-angle-right"></i></span> <span
												class="pcoded-mtext"
												data-i18n="nav.basic-components.breadcrumbs">Breadcrumbs</span>
												<span class="pcoded-mcaret"></span>
										</a></li>
										<li class=" "><a href="button.html"
											class="waves-effect waves-dark"> <span
												class="pcoded-micon"><i class="ti-angle-right"></i></span> <span
												class="pcoded-mtext" data-i18n="nav.basic-components.alert">Button</span>
												<span class="pcoded-mcaret"></span>
										</a></li>
										<li class=" "><a href="tabs.html"
											class="waves-effect waves-dark"> <span
												class="pcoded-micon"><i class="ti-angle-right"></i></span> <span
												class="pcoded-mtext"
												data-i18n="nav.basic-components.breadcrumbs">Tabs</span> <span
												class="pcoded-mcaret"></span>
										</a></li>
										<li class=" "><a href="color.html"
											class="waves-effect waves-dark"> <span
												class="pcoded-micon"><i class="ti-angle-right"></i></span> <span
												class="pcoded-mtext" data-i18n="nav.basic-components.alert">Color</span>
												<span class="pcoded-mcaret"></span>
										</a></li>
										<li class=" "><a href="label-badge.html"
											class="waves-effect waves-dark"> <span
												class="pcoded-micon"><i class="ti-angle-right"></i></span> <span
												class="pcoded-mtext"
												data-i18n="nav.basic-components.breadcrumbs">Label
													Badge</span> <span class="pcoded-mcaret"></span>
										</a></li>
										<li class=" "><a href="tooltip.html"
											class="waves-effect waves-dark"> <span
												class="pcoded-micon"><i class="ti-angle-right"></i></span> <span
												class="pcoded-mtext" data-i18n="nav.basic-components.alert">Tooltip</span>
												<span class="pcoded-mcaret"></span>
										</a></li>
										<li class=" "><a href="typography.html"
											class="waves-effect waves-dark"> <span
												class="pcoded-micon"><i class="ti-angle-right"></i></span> <span
												class="pcoded-mtext"
												data-i18n="nav.basic-components.breadcrumbs">Typography</span>
												<span class="pcoded-mcaret"></span>
										</a></li>
										<li class=" "><a href="notification.html"
											class="waves-effect waves-dark"> <span
												class="pcoded-micon"><i class="ti-angle-right"></i></span> <span
												class="pcoded-mtext" data-i18n="nav.basic-components.alert">Notification</span>
												<span class="pcoded-mcaret"></span>
										</a></li>
										<li class=" "><a href="icon-themify.html"
											class="waves-effect waves-dark"> <span
												class="pcoded-micon"><i class="ti-angle-right"></i></span> <span
												class="pcoded-mtext"
												data-i18n="nav.basic-components.breadcrumbs">Themify</span>
												<span class="pcoded-mcaret"></span>
										</a></li>

									</ul></li>
							</ul>
							<div class="pcoded-navigation-label"
								data-i18n="nav.category.forms">Forms &amp; Tables</div>
							<ul class="pcoded-item pcoded-left-item">
								<li><a href="form-elements-component.html"
									class="waves-effect waves-dark"> <span class="pcoded-micon"><i
											class="ti-layers"></i><b>FC</b></span> <span class="pcoded-mtext"
										data-i18n="nav.form-components.main">Form Components</span> <span
										class="pcoded-mcaret"></span>
								</a></li>
								<li><a href="bs-basic-table.html"
									class="waves-effect waves-dark"> <span class="pcoded-micon"><i
											class="ti-layers"></i><b>FC</b></span> <span class="pcoded-mtext"
										data-i18n="nav.form-components.main">Basic Table</span> <span
										class="pcoded-mcaret"></span>
								</a></li>

							</ul>

							<div class="pcoded-navigation-label"
								data-i18n="nav.category.forms">Chart &amp; Maps</div>
							<ul class="pcoded-item pcoded-left-item">
								<li><a href="chart.html" class="waves-effect waves-dark">
										<span class="pcoded-micon"><i class="ti-layers"></i><b>FC</b></span>
										<span class="pcoded-mtext"
										data-i18n="nav.form-components.main">Chart</span> <span
										class="pcoded-mcaret"></span>
								</a></li>
								<li><a href="map-google.html"
									class="waves-effect waves-dark"> <span class="pcoded-micon"><i
											class="ti-layers"></i><b>FC</b></span> <span class="pcoded-mtext"
										data-i18n="nav.form-components.main">Maps</span> <span
										class="pcoded-mcaret"></span>
								</a></li>
								<li class="pcoded-hasmenu"><a href="javascript:void(0)"
									class="waves-effect waves-dark"> <span class="pcoded-micon"><i
											class="ti-layout-grid2-alt"></i></span> <span class="pcoded-mtext"
										data-i18n="nav.basic-components.main">Pages</span> <span
										class="pcoded-mcaret"></span>
								</a>
									<ul class="pcoded-submenu">
										<li class=" "><a href="auth-normal-sign-in.html"
											class="waves-effect waves-dark"> <span
												class="pcoded-micon"><i class="ti-angle-right"></i></span> <span
												class="pcoded-mtext" data-i18n="nav.basic-components.alert">Login</span>
												<span class="pcoded-mcaret"></span>
										</a></li>
										<li class=" "><a href="auth-sign-up.html"
											class="waves-effect waves-dark"> <span
												class="pcoded-micon"><i class="ti-angle-right"></i></span> <span
												class="pcoded-mtext"
												data-i18n="nav.basic-components.breadcrumbs">Register</span>
												<span class="pcoded-mcaret"></span>
										</a></li>
										<li class=" "><a href="sample-page.html"
											class="waves-effect waves-dark"> <span
												class="pcoded-micon"><i class="ti-angle-right"></i></span> <span
												class="pcoded-mtext"
												data-i18n="nav.basic-components.breadcrumbs">Sample
													Page</span> <span class="pcoded-mcaret"></span>
										</a></li>
									</ul></li>

							</ul>

							<div class="pcoded-navigation-label"
								data-i18n="nav.category.other">Other</div>
							<ul class="pcoded-item pcoded-left-item">
								<li class="pcoded-hasmenu "><a href="javascript:void(0)"
									class="waves-effect waves-dark"> <span class="pcoded-micon"><i
											class="ti-direction-alt"></i><b>M</b></span> <span
										class="pcoded-mtext" data-i18n="nav.menu-levels.main">Menu
											Levels</span> <span class="pcoded-mcaret"></span>
								</a>
									<ul class="pcoded-submenu">
										<li class=""><a href="javascript:void(0)"
											class="waves-effect waves-dark"> <span
												class="pcoded-micon"><i class="ti-angle-right"></i></span> <span
												class="pcoded-mtext"
												data-i18n="nav.menu-levels.menu-level-21">Menu Level
													2.1</span> <span class="pcoded-mcaret"></span>
										</a></li>
										<li class="pcoded-hasmenu "><a href="javascript:void(0)"
											class="waves-effect waves-dark"> <span
												class="pcoded-micon"><i class="ti-direction-alt"></i></span>
												<span class="pcoded-mtext"
												data-i18n="nav.menu-levels.menu-level-22.main">Menu
													Level 2.2</span> <span class="pcoded-mcaret"></span>
										</a>
											<ul class="pcoded-submenu">
												<li class=""><a href="javascript:void(0)"
													class="waves-effect waves-dark"> <span
														class="pcoded-micon"><i class="ti-angle-right"></i></span>
														<span class="pcoded-mtext"
														data-i18n="nav.menu-levels.menu-level-22.menu-level-31">Menu
															Level 3.1</span> <span class="pcoded-mcaret"></span>
												</a></li>
											</ul></li>
										<li class=""><a href="javascript:void(0)"
											class="waves-effect waves-dark"> <span
												class="pcoded-micon"><i class="ti-angle-right"></i></span> <span
												class="pcoded-mtext"
												data-i18n="nav.menu-levels.menu-level-23">Menu Level
													2.3</span> <span class="pcoded-mcaret"></span>
										</a></li>

									</ul></li>
							</ul>
						</div>
					</nav>
					<div class="pcoded-content">
						<!-- Page-header start -->
						<div class="page-header">
							<div class="page-block">
								<div class="row align-items-center">
									<div class="col-md-8">
										<div class="page-header-title">
											<h5 class="m-b-10">Accordion</h5>
											<p class="m-b-0">Lorem Ipsum is simply dummy text of the
												printing</p>
										</div>
									</div>
									<div class="col-md-4">
										<ul class="breadcrumb-title">
											<li class="breadcrumb-item"><a href="index.html"> <i
													class="fa fa-home"></i>
											</a></li>
											<li class="breadcrumb-item"><a href="#!">Basic
													Components</a></li>
											<li class="breadcrumb-item"><a href="#!">Accordion</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<!------------------------------------------- Page-header end --------------------------------------------------------------------->
						<div class="pcoded-inner-content">
							<div class="main-body">
								<div class="page-wrapper">

									<!-- Page-body start -->
									<div class="page-body">
										<!-- Row start -->
										<div class="row">
											<!-- Color Open Accordion start -->
											<div class="col-lg-12">
												<div class="card">
													<div class="card-header">
														<h5 class="card-header-text">나의 할일</h5>
													</div>
													<table class="table table-hover">
														<thead>
															<tr>
																<th scope="col"> </th>
																<th scope="col">SR번호</th>
																<th scope="col">시스템구분</th>
																<th scope="col">업무구분</th>
																<th scope="col">SR제목</th>
																<th scope="col">담당자</th>
																<th scope="col">완료요청일</th>
																<th scope="col">진행상태</th>
																<th scope="col">상세보기</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<th scope="row">1</th>
																<td>SR0003</td>
																<td>워크넷(외부망)</td>
																<td>모바일</td>
																<td>워크넷 모바일 화면 수정3</td>
																<td>신정은</td>
																<td>2023-02-19</td>
																<td>요청</td>
																<td><button class="srbutton">요청수정</button></td>
															</tr>
															<tr>
																<th scope="row">2</th>
																<td>SR0002</td>
																<td>워크넷(외부망)</td>
																<td>모바일</td>
																<td>워크넷 모바일 화면 수정3</td>
																<td>신정은</td>
																<td>2023-02-18</td>
																<td>반려</td>
																<td><button class="srbutton">요청상세</button></td>
															</tr>
															<tr>
																<th scope="row">3</th>
																<td>SR0001</td>
																<td>워크넷(외부망)</td>
																<td>모바일</td>
																<td>워크넷 모바일 화면 수정3 </td>
																<td>신정은</td>
																<td>2023-02-17</td>
																<td>개발중</td>
																<td><button class="srbutton">요청상세</button></td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
											<!-- Color Open Accordion ends -->
										</div>
										<!-- Row end -->
										<!-- Row start -->
										<div class="row">
											<!-- Multiple Open Accordion start -->
											<div class="col-lg-6">
												<div class="card">
													<div class="card-header">
														<h5 class="card-header-text">공지사항</h5>
													</div>
													<div class="card-block accordion-block"></div>
												</div>
											</div>
											<!-- Multiple Open Accordion ends -->
											<!-- Single Open Accordion start -->
											<div class="col-lg-6">
												<div class="card">
													<div class="card-header">
														<h5 class="card-header-text">문의사항</h5>
													</div>
													<div class="card-block accordion-block"></div>
												</div>
											</div>
											<!-- Single Open Accordion ends -->
										</div>
										<!-- Row end -->

									</div>
									<!-- Page-body end -->
								</div>
							</div>
							<div id="styleSelector"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Required Jquery -->
	<script type="text/javascript"
		src="/resources/assets/js/jquery/jquery.min.js"></script>
	<script type="text/javascript"
		src="/resources/assets/js/jquery-ui/jquery-ui.min.js "></script>
	<script type="text/javascript"
		src="/resources/assets/js/popper.js/popper.min.js"></script>
	<script type="text/javascript"
		src="/resources/assets/js/bootstrap/js/bootstrap.min.js "></script>
	<!-- jquery slimscroll js -->
	<script type="text/javascript"
		src="/resources/assets/js/jquery-slimscroll/jquery.slimscroll.js "></script>
	<!-- modernizr js -->
	<script type="text/javascript"
		src="/resources/assets/js/SmoothScroll.js"></script>
	<script
		src="/resources/assets/js/jquery.mCustomScrollbar.concat.min.js "></script>
	<!-- waves js -->
	<script src="/resources/assets/pages/waves/js/waves.min.js"></script>

	<!-- Accordion js -->
	<script type="text/javascript"
		src="/resources/assets/pages/accordion/accordion.js"></script>
	<!-- Custom js -->
	<script src="/resources/assets/js/pcoded.min.js"></script>
	<script src="/resources/assets/js/vertical-layout.min.js "></script>
	<script
		src="/resources/assets/js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script type="text/javascript" src="/resources/assets/js/script.js"></script>
</body>

</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>
<title>Mega Able bootstrap admin template by codedthemes</title>
<!-- Meta -->
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
<!-- waves.css -->
<link rel="stylesheet"
	href="/resources/assets/pages/waves/css/waves.min.css" type="text/css"
	media="all">
<!-- Required Fremwork -->
<link rel="stylesheet" type="text/css"
	href="/resources/assets/css/bootstrap/css/bootstrap.min.css">
<!-- waves.css -->
<link rel="stylesheet"
	href="/resources/assets/pages/waves/css/waves.min.css" type="text/css"
	media="all">
<!-- themify-icons line icon -->
<link rel="stylesheet" type="text/css"
	href="/resources/assets/icon/themify-icons/themify-icons.css">
<!-- ico font -->
<link rel="stylesheet" type="text/css"
	href="/resources/assets/icon/icofont/css/icofont.css">
<!-- Font Awesome -->
<link rel="stylesheet" type="text/css"
	href="/resources/assets/icon/font-awesome/css/font-awesome.min.css">
<!-- Style.css -->
<link rel="stylesheet" type="text/css"
	href="/resources/assets/css/style.css">
<link rel="stylesheet" type="text/css"
	href="/resources/assets/css/jquery.mCustomScrollbar.css">

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
					<div class="pcoded-content ml-0">
						<!-- Page-header start -->
						<div class="page-header">
							<div class="page-block">
								<div class="row align-items-center">
									<div class="col-md-8">
										<div class="page-header-title">
											<h5 class="m-b-10">Basic Form Inputs</h5>
											<p class="m-b-0">Lorem Ipsum is simply dummy text of the
												printing</p>
										</div>
									</div>
									<div class="col-md-4">
										<ul class="breadcrumb-title">
											<li class="breadcrumb-item"><a href="index.html"> <i
													class="fa fa-home"></i>
											</a></li>
											<li class="breadcrumb-item"><a href="#!">Form
													Components</a></li>
											<li class="breadcrumb-item"><a href="#!">Basic Form
													Inputs</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<!-- Page-header end -->
						<div class="pcoded-inner-content">
							<!-- Main-body start -->
							<div class="main-body">
								<div class="page-wrapper">

									<!-- Page body start -->
									<div class="page-body">
										<div class="row">
											<div class="col">
												<div class="card">
													<div class="card-header">
														<h5>Sign Up for Employee</h5>
													</div>
													<div class="row">
														<div class="col-1" ></div>
														<div class="col-4" style="justify-content:center; text-align: center;">
															<div class="mb-2"><img src="/resources/oti_images/user.png" style="height: 200px; align-content: center; margin-top: 50px;"></div>
															<span style="color: gray">프로필 사진을 등록해주세요.</span>
															
														</div>
														
														<div class="col-7 card-block">
															<form class="form-material">
																<div class="form-group form-default" style="display: flex;">
																	<input type="text" name="footer-email" class="form-control" required="" style="width: 50%">
																	<label class="float-label">아이디</label>
																	<button class="btn waves-effect waves-light hor-grd btn-grd-inverse ml-2" style="width: 100px;">중복확인</button>
																</div>

																<div class="form-group form-default">
																	<input type="password" name="footer-email"
																		class="form-control" required="" style="width: 50%">
																		<label class="float-label">비밀번호</label>
																</div>

																<div class="form-group form-default">
																	<input type="text" name="footer-email"
																		class="form-control" required="" style="width: 50%">
																		<label class="float-label">이름</label>
																</div>

																<div class="form-group form-default">
																	<input type="text" name="footer-email"
																		class="form-control" required="" style="width: 50%">
																		<label class="float-label">전화번호</label>
																</div>

																<div class="form-group form-default">
																	<input type="text" name="footer-email"
																		class="form-control" required="" style="width: 50%">
																		<label class="float-label">이메일
																		(exa@gmail.com)</label>
																</div>

																<div class="form-group form-default">
																	<input type="text" name="footer-email"
																		class="form-control" required="" style="width: 50%">
																		<label class="float-label">주소</label>
																</div>

																<div class="form-group form-default" style="display: flex;">
																	<input type="text" name="footer-email"
																		class="form-control" required="" style="width: 50%"> 
																		<label class="float-label">부서</label>
																		<div class="btn-group dropright">
																			<button type="button" class="dropdown-toggle btn waves-effect waves-light hor-grd btn-grd-inverse ml-2" data-toggle="dropdown" aria-expanded="false">
																		    찾기
																		    </button>
																		    <div class="dropdown-menu" style="padding: 10px; width: 300px; height: 300px; overflow-y: scroll">
																		    	<!-- Dropdown menu links -->
																		    	<div style="display: flex;">
																			    	<input type="text" name="footer-email" class="form-control" required="" style="margin-left: 10px; width: 60%;"> 
																			    	<button class="btn-sm ml-4" style="border: none;">검색</button>	
																		    	</div>
																		    	<a class="dropdown-item" href="#">워크넷(외부망)</a>
																		    	<a class="dropdown-item" href="#">워크넷(내부망)</a>
																		    	<a class="dropdown-item" href="#">외국인고용관리</a>
																		    	<a class="dropdown-item" href="#">고용보험</a>
																		    	<a class="dropdown-item" href="#">HRD-NET 시스템</a>
																		    	<a class="dropdown-item" href="#">일모아템</a>
																		    	<a class="dropdown-item" href="#">MDM(바로원시스템)</a>
																		    	<a class="dropdown-item" href="#">EIS</a>
																		    	<a class="dropdown-item" href="#">부정수급모니터링</a>
																		    	<a class="dropdown-item" href="#">기타</a>
																		    </div> 
																		</div>														
																</div>
																
																<div class="form-group form-default" style="display: flex;">
																	<input type="text" name="footer-email"
																		class="form-control" required="" style="width: 50%"> 
																		<label class="float-label">직급</label>
																		<div class="btn-group dropright">
																			<button type="button" class="dropdown-toggle btn waves-effect waves-light hor-grd btn-grd-inverse ml-2" data-toggle="dropdown" aria-expanded="false">
																		    찾기
																		    </button>
																		    <div class="dropdown-menu" style="padding: 10px; width: 300px;">
																		    	<!-- Dropdown menu links -->
																		    	<a class="dropdown-item" href="#">부장</a>
																		    	<a class="dropdown-item" href="#">차장</a>
																		    	<a class="dropdown-item" href="#">과장</a>
																		    	<a class="dropdown-item" href="#">대리</a>
																		    	<a class="dropdown-item" href="#">사원</a>
																		    </div> 
																		</div>											
																</div>

															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div style="justify-content: center; text-align: center;">
											<button class="btn waves-effect waves-light hor-grd btn-grd-primary ">Sign Up</button>
										</div>


									</div>
									<!-- Page body end -->
								</div>
							</div>
							<!-- Main-body end -->
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
	<!-- waves js -->
	<script src="/resources/assets/pages/waves/js/waves.min.js"></script>

	<!-- modernizr js -->
	<script type="text/javascript"
		src="/resources/assets/js/SmoothScroll.js"></script>
	<script
		src="/resources/assets/js/jquery.mCustomScrollbar.concat.min.js "></script>
	<!-- Custom js -->
	<script src="/resources/assets/js/pcoded.min.js"></script>
	<script src="/resources/assets/js/vertical-layout.min.js "></script>
	<script
		src="/resources/assets/js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script type="text/javascript" src="/resources/assets/js/script.js"></script>
</body>

</html>

<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<nav class="navbar header-navbar pcoded-header">
	<div class="navbar-wrapper">
		<div class="navbar-logo">
			<a class="mobile-menu waves-effect waves-light" id="mobile-collapse"
				href="#!"> <i class="ti-menu"></i></a>
			<div class="mobile-search waves-effect waves-light">
				<div class="header-search">
					<div class="main-search morphsearch-search">
						<div class="input-group">
							<span class="input-group-addon search-close"> <i
								class="ti-close"></i>
							</span> <input type="text" class="form-control"
								placeholder="Enter Keyword"> <span
								class="input-group-addon search-btn"> <i
								class="ti-search"></i>
							</span>
						</div>
					</div>
				</div>
			</div>
			<a href="/"> <img class="img-fluid"
				src="${pageContext.request.contextPath}/resources/assets/images/otilogo.png"
				alt="Theme-Logo" />
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
				<li class="header-fullscreen" style="margin-top: 20px"><a
					href="#!" onclick="javascript:toggleFullScreen()"
					class="waves-effect waves-light"> <i class="ti-fullscreen"></i>
				</a></li>
			</ul>
			<ul class="nav-right">
				<li class="header-notification" style="margin-top: 20px"><a
					href="#!" class="waves-effect waves-light"> <i class="ti-bell"></i>
						<h4>
							<span class="badge bg-c-red"></span>
						</h4>
				</a>
					<ul class="show-notification">
						<li>
							<h6>Notifications</h6> <label class="label label-danger">New</label>
						</li>
						<li class="waves-effect waves-light">
							<div class="media">
								<img class="d-flex align-self-center img-radius"
									src="${pageContext.request.contextPath}/resources/assets/images/avatar-2.jpg"
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
									src="${pageContext.request.contextPath}/resources/assets/images/avatar-4.jpg"
									alt="Generic placeholder image">
								<div class="media-body">
									<h5 class="notification-user">Joseph William</h5>
									<p class="notification-msg">Lorem ipsum dolor sit
										amet,consectetuer elit.</p>
									<span class="notification-time">30 minutes ago</span>
								</div>
							</div>
						</li>
						<li class="waves-effect waves-light">
							<div class="media">
								<img class="d-flex align-self-center img-radius"
									src="${pageContext.request.contextPath}/resources/assets/images/avatar-3.jpg"
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
					
				<li class="user-profile header-notification">
					<a href="#!" class="waves-effect waves-light"> 
						<img src="${pageContext.request.contextPath}/resources/assets/images/avatar-4.jpg" class="img-radius" alt="User-Profile-Image"> 
						<sec:authorize access="isAuthenticated()">
							<span><sec:authentication property="principal.flnm"/> 님</span> 
						</sec:authorize>
						<i class="ti-angle-down"></i>
					</a>
					<ul class="show-notification profile-notification">
						<li class="waves-effect waves-light"><a
							href="${pageContext.request.contextPath}/myportal"><i
								class="ti-home"></i> My Portal</a></li>
						<li class="waves-effect waves-light"><a
							href="${pageContext.request.contextPath}/member/myinfo"><i
								class="ti-user"></i> Profile</a></li>
						<sec:authorize access="isAuthenticated()">
							<li class="waves-effect waves-light">
							<form:form action="/logout" method="POST">
									<input type="submit" value="LOGOUT"/>
								</form:form></li>
						</sec:authorize>
						<li class="waves-effect waves-light"><a
							href="${pageContext.request.contextPath}/example?role=1"> <i
								class="ti-layout-sidebar-left"></i> 고객 로그인
						</a></li>
						<li class="waves-effect waves-light"><a
							href="${pageContext.request.contextPath}/example?role=2"> <i
								class="ti-layout-sidebar-left"></i> 개발자 로그인
						</a></li>
						<li class="waves-effect waves-light"><a
							href="${pageContext.request.contextPath}/example?role=3"> <i
								class="ti-layout-sidebar-left"></i> 관리자 로그인
						</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</nav>
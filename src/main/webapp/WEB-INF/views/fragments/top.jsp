<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="${pageContext.request.contextPath}/resources/js/alert.js"></script>

<%-- <%!HttpServletRequest req;

	String getCookieValue(String cname) {
	    Cookie[] cookies = req.getCookies();
	    String cookieValue = null;
	    if (cookies != null) {
	        for (Cookie c : cookies) {
	            if (cname.equals(c.getName())) {
	            	cookieValue = c.getValue();
	                break;
	            }
	        }
	    }
	    System.out.println("top.jsp의 getCookie 실행 됨~~~~");
	    return cookieValue;
	}
%>
<% 
	String expiryTime = getCookieValue("expiryTime");
%> --%>

<jsp:include page="/WEB-INF/views/member/checkPw.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<div id="pcoded" class="pcoded iscollapsed" theme-layout="vertical"
	vertical-placement="left" vertical-layout="wide"
	pcoded-device-type="phone" vertical-nav-type="offcanvas"
	vertical-effect="overlay" vnavigation-view="view1" nav-type="st2"
	fream-type="theme1" sidebar-img="false" sidebar-img-type="img1"
	layout-type="light">

	<div class="pcoded-container navbar-wrapper">

		<nav class="navbar header-navbar pcoded-header iscollapsed"
			header-theme="theme1" pcoded-header-position="fixed">
			<div class="navbar-wrapper">
				<div class="navbar-logo">
					<a href="/"> <img class="img-fluid"
						src="${pageContext.request.contextPath}/resources/assets/images/otilogo.png"
						alt="Theme-Logo" style="margin-left: 7px;" />
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

						<li class="header-mobile-menu" style="margin-top: 20px"><a
							class="mobile-menu waves-effect waves-light" id="mobile-collapse"
							href="#!"> <i class="ti-menu"></i></a></li>

						<li class="header-fullscreen" style="margin-top: 20px"><a
							href="#!" onclick="javascript:toggleFullScreen()"
							class="waves-effect waves-light"> <i class="ti-fullscreen"></i>
						</a></li>
						<li style="color:white;">
							<div id="serverTime"></div>
							<div id="sessionExpiry"></div>
						</li>
					</ul>
					<ul class="nav-right">
						<%-- 알림 --%>
						<li class="header-notification" style="margin-top: 20px"><span
							id="alertBadge" class="badge bg-c-yellow" style=""></span> <a
							href="#!" id="alertBtn" class="waves-effect waves-light"
							onclick="getAlertList();event.preventDefault();"
							style="display: block; padding-right: 4px"> <i
								class="far fa-bell" style="font-size: 19px;"></i>
						</a>

							<div class="show-notification" onclick='event.stopPropagation()'
								style="display: none;">
								<ul>
									<li>
										<h6>Notifications</h6>
									</li>
								</ul>
								<!-- Nav tabs -->
								<ul class="nav nav-tabs md-tabs " role="tablist"
									style="width: 100%; margin: 0px">
									<sec:authorize access="hasRole('ROLE_CLIENT')">
										<li class="nav-item" style="padding: 0px"><a
											class="nav-link active" style="font-size: 10px;"
											data-toggle="tab" href="#rfltTab" role="tab">반영 요청</a>
											<div class="slide"></div></li>
										<li class="nav-item" style="padding: 0px"><a
											class="nav-link" style="font-size: 10px;" data-toggle="tab"
											href="#chgDmndTab" role="tab">예정일 변경</a>
											<div class="slide"></div></li>
										<li class="nav-item" style="padding: 0px"><a
											class="nav-link" style="font-size: 10px;" data-toggle="tab"
											href="#cancleTab" role="tab">개발 취소</a>
											<div class="slide"></div></li>
									</sec:authorize>
									<sec:authorize access="hasRole('ROLE_DEVELOPER')">
										<li class="nav-item" style="padding: 0px"><a
											class="nav-link active" style="font-size: 10px;"
											data-toggle="tab" href="#rfltTab" role="tab">반영 요청</a>
											<div class="slide"></div></li>
										<li class="nav-item" style="padding: 0px"><a
											class="nav-link" style="font-size: 10px;" data-toggle="tab"
											href="#developerTab" role="tab">예정일 변경</a>
											<div class="slide"></div></li>
									</sec:authorize>
									<sec:authorize access="hasRole('ROLE_ADMIN')">
										<li class="nav-item" style="padding: 0px"><a
											class="nav-link active" style="font-size: 10px;"
											data-toggle="tab" href="#rfltTab" role="tab">반영 요청</a>
											<div class="slide"></div></li>
										<li class="nav-item" style="padding: 0px"><a
											class="nav-link" style="font-size: 10px;" data-toggle="tab"
											href="#chgDmndTab" role="tab">예정일 변경</a>
											<div class="slide"></div></li>
										<li class="nav-item" style="padding: 0px"><a
											class="nav-link" style="font-size: 10px;" data-toggle="tab"
											href="#developerTab" role="tab">예정일 변경(개발자)</a>
											<div class="slide"></div></li>
										<li class="nav-item" style="padding: 0px"><a
											class="nav-link" style="font-size: 10px;" data-toggle="tab"
											href="#cancleTab" role="tab">개발 취소</a>
											<div class="slide"></div></li>
									</sec:authorize>
								</ul>
								<div id="alertTab" class="tab-content card-block ">
									<!-- 반영 요청 알림 -->
									<div class="tab-pane active" id="rfltTab" role="tabpanel">
										<ul>
											<%-- 디자인 참고용
                                 <li class="waves-effect waves-light">
                                    <div class="media">
                                       <img class="d-flex align-self-center img-radius"
                                          src="${pageContext.request.contextPath}/resources/assets/images/avatar-2.jpg"
                                          alt="Generic placeholder image">
                                       <div class="media-body">
                                          <h5 class="notification-user">John Doe</h5>
                                          <p class="notification-msg"></p>
                                          <span class="notification-time">30 minutes ago</span>
                                       </div>
                                    </div>
                                 </li> --%>
										</ul>
									</div>
									<%-- 요청일 변경 알림 --%>
									<div class="tab-pane" id="chgDmndTab" role="tabpanel">
										<ul>

										</ul>
									</div>
									<%-- 요청일 변경 알림 --%>
									<div class="tab-pane" id="developerTab" role="tabpanel">
										<ul>

										</ul>
									</div>
									<%-- 개발취소알림 --%>
									<div class="tab-pane" id="cancleTab" role="tabpanel">
										<ul>

										</ul>
									</div>
								</div>
							</div></li>

						<%-- 로그아웃 --%>
						<li class="user-profile header-notification"><sec:authorize
								access="isAuthenticated()">
								<li class="waves-effect waves-light">
									<form method="POST" action="<c:url value='/logout'/>">
										<button class="btn btn-sm btn-oti"
											style="margin-top: 12px; margin-left: 5px; border-color: white; border-width: 2; background-color: #4C1342;"
											type="submit">LOGOUT</button>
									</form>
								</li>
							</sec:authorize></li>
					</ul>
				</div>
			</div>
		</nav>

		<!-- ./top -->s
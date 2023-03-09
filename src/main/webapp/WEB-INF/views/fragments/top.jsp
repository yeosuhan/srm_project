<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
				<li ><button class="btn btn-sm btn-primary" onclick="sendTestMessage()">메시지 전송 테스트</button></li>
				<%-- 알림 --%>
				<li class="header-notification" style="margin-top: 20px">
					<a href="#!" class="waves-effect waves-light" onclick="getAlertList()"> 
						<i class="ti-bell"></i>
						<h4>
							<span id="alertBadge" ></span>
						</h4>
					</a>
					<div class="show-notification" onclick='event.stopPropagation()'>
						<ul>
							<li>
								<h6>Notifications</h6>
								<i class="close fa fa-refresh" onclick="refreshAlert()"></i>
							</li>
						</ul>
						<!-- Nav tabs -->
						<ul class="nav nav-tabs md-tabs " role="tablist" style="width:100%; margin:0px">
							<li class="nav-item" style="padding:0px"><a class="nav-link active" style="font-size:10px;"
								data-toggle="tab" href="#rfltTab" role="tab">반영 요청</a>
								<div class="slide"></div></li>
							<li class="nav-item" style="padding:0px"><a class="nav-link" style="font-size:10px;"
								data-toggle="tab" href="#chgDmndTab" role="tab">예정일 변경</a>
								<div class="slide"></div></li>
							<li class="nav-item" style="padding:0px"><a class="nav-link" style="font-size:10px;"
								data-toggle="tab" href="#developerTab" role="tab">예정일 변경(개발자)</a>
								<div class="slide"></div></li>
							<li class="nav-item" style="padding:0px"><a class="nav-link" style="font-size:10px;"
								data-toggle="tab" href="#cancleTab" role="tab">개발 취소</a>
								<div class="slide"></div></li>
							
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
					</div>
				</li>
				<%-- 사용자 드롭다운 --%>
				<li class="user-profile header-notification"><a href="#!"
					class="waves-effect waves-light"> <img
						src="${pageContext.request.contextPath}/resources/assets/images/avatar-4.jpg"
						class="img-radius" alt="User-Profile-Image"> <sec:authorize
							access="isAuthenticated()">
							<span><sec:authentication property="principal.flnm" /> 님</span>
						</sec:authorize> <i class="ti-angle-down"></i>
				</a>
					<ul class="show-notification profile-notification">
						<li class="waves-effect waves-light"><a
							href="${pageContext.request.contextPath}/myportal"><i
								class="ti-home"></i> My Portal</a></li>
						<li class="waves-effect waves-light"><a
							href="${pageContext.request.contextPath}/member/myinfo"><i
								class="ti-user"></i> Profile</a></li>
						<sec:authorize access="isAuthenticated()">
							<li class="waves-effect waves-light"><form:form
									action="/logout" method="POST">
									<input type="submit" value="LOGOUT" />
								</form:form></li>
						</sec:authorize>

					</ul>
				</li>
			</ul>
		</div>
	</div>
</nav>
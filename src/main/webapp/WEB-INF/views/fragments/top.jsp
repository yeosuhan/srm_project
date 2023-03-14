<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="${pageContext.request.contextPath}/resources/js/alert.js"></script>
<sec:authorize access="isAuthenticated()">
	<script>
		$(function() {
			//세션스토리지에 값 검사 후 뷰에 제공
			if(localStorage.getItem('logintime')) {
				var stime = localStorage.getItem('logintime');
				var myLoginTime = parseInt(stime, 10);
				
				var timer = setInterval(function() {
					// 세션 만료 5분 전일 경우
					if(parseInt(localStorage.getItem('logintime'), 10) > 0) {
						$("#loginTime").text(timeFormate(parseInt(localStorage.getItem('logintime'), 10)));
						localStorage.setItem('logintime', "" + (parseInt(localStorage.getItem('logintime'), 10)-1));
					} else {
						//로그아웃 요청
						$.ajax({
							url : "/logout",
							type : "POST",
							success : function(res) {
								localStorage.removeItem('logintime');
								localStorage.setItem('logintime', "${pageContext.session.maxInactiveInterval}");
								//location.href="/loginForm";
								showOtiAlert();
								localStorage.removeItem('logintime');
								clearInterval(timer);
							}
						});
						
					}			
				}, 1000);
																				
			} else {
				localStorage.removeItem('logintime');
				localStorage.setItem('logintime', "${pageContext.session.maxInactiveInterval}");
			}
		});
		
		//로그인 연장
		function resetLoginTime() {
			if(localStorage.getItem('logintime')) {
				console.log("로그인 연장 함");
				localStorage.setItem('logintime', "${pageContext.session.maxInactiveInterval}");
			}
			else localStorage.setItem('logintime', "${pageContext.session.maxInactiveInterval}");
		}
		
		//날짜 포맷
		function timeFormate(myNum) {
		    var hours   = Math.floor(myNum / 3600);
		    var minutes = Math.floor((myNum - (hours * 3600)) / 60);
		    var seconds = myNum - (hours * 3600) - (minutes * 60);

		    if (hours   < 10) {hours   = "0"+hours;}
		    if (minutes < 10) {minutes = "0"+minutes;}
		    if (seconds < 10) {seconds = "0"+seconds;}
		    return hours+':'+minutes+':'+seconds;
		}
	</script>
</sec:authorize>

<sec:authorize access="isAnonymous()">
	<script>
		localStorage.removeItem('logintime');
		$("#loginTime").html("<p>없음2</p>");
	</script>
</sec:authorize>

<jsp:include page="/WEB-INF/views/member/checkPw.jsp" />
<jsp:include page="/WEB-INF/views/fragments/otiAlert.jsp" />
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
					<ul class="nav-left ml-5">
						<li style="color: white; margin: auto;justify-content: center; font-weight: bolder; font-size: 18px;">
							세션 만료시간 <span id="loginTime" ></span>
						</li> 
					</ul>
					<ul class="nav-left">
						<li><button class="btn btn-sm btn-oti"
									style="background-color: #4C1342; margin-top: 10px;"
									onclick="resetLoginTime()">로그인 시간 연장</button></li>
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

								</ul>
								<div id="alertTab" class="tab-content card-block ">
									<!-- 반영 요청 알림 -->
									<div class="tab-pane active" id="rfltTab" role="tabpanel">
										<ul>
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
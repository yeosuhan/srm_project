<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="pcoded-navbar">
    <div class="sidebar_toggle"><a href="#"><i class="icon-close icons"></i></a></div>
    <div class="pcoded-inner-navbar main-menu">
        <div class="">
            <div class="main-menu-header">
                <img class="img-80 img-radius" src="${pageContext.request.contextPath}/resources/assets/images/avatar-4.jpg" alt="User-Profile-Image">
                <div class="user-details">
                    <span id="more-details">John Doe<i class="fa fa-caret-down"></i></span>
                </div>
            </div>

            <div class="main-menu-content">
                <ul>
                    <li class="more-details">
                        <a href="user-profile.html"><i class="ti-user"></i>View Profile</a>
                        <a href="#!"><i class="ti-settings"></i>Settings</a>
                        <a href="auth-normal-sign-in.html"><i class="ti-layout-sidebar-left"></i>Logout</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="p-15 p-b-0">
            <form class="form-material">
                <div class="form-group form-primary">
                    <input type="text" name="footer-email" class="form-control" required="">
                    <span class="form-bar"></span>
                    <label class="float-label"><i class="fa fa-search m-r-10"></i>Search Friend</label>
                </div>
            </form>
        </div>
        <div class="pcoded-navigation-label" data-i18n="nav.category.navigation">MyPortal</div>
        <ul class="pcoded-item pcoded-left-item">
            <li class="">
                <a href="myTodo" class="waves-effect waves-dark">
                    <span class="pcoded-micon"><i class="ti-home"></i><b>D</b></span>
                    <span class="pcoded-mtext" data-i18n="nav.dash.main">MyPortal</span>
                    <span class="pcoded-mcaret"></span>
                </a>
            </li>
            
        </ul>
        <div class="pcoded-navigation-label" data-i18n="nav.category.forms">게시판</div>
        <ul class="pcoded-item pcoded-left-item">
            <li>
                <a href="noticeList" class="waves-effect waves-dark">
                    <span class="pcoded-micon"><i class="ti-layers"></i><b>FC</b></span>
                    <span class="pcoded-mtext" data-i18n="nav.form-components.main">공지사항</span>
                    <span class="pcoded-mcaret"></span>
                </a>
            </li>
            <li>
                <a href="qnaList" class="waves-effect waves-dark">
                    <span class="pcoded-micon"><i class="ti-layers"></i><b>FC</b></span>
                    <span class="pcoded-mtext" data-i18n="nav.form-components.main">QnA</span>
                    <span class="pcoded-mcaret"></span>
                </a>
            </li>

        </ul>

        <div class="pcoded-navigation-label" data-i18n="nav.category.forms">나의 정보 관리</div>
        <ul class="pcoded-item pcoded-left-item">
            <li>
                <a href="myinfo" class="waves-effect waves-dark">
                    <span class="pcoded-micon"><i class="ti-layers"></i><b>FC</b></span>
                    <span class="pcoded-mtext" data-i18n="nav.form-components.main">나의 정보 수정</span>
                    <span class="pcoded-mcaret"></span>
                </a>
            </li>
            <c:if test="${role eq 1 }">
	            <li>
	                <a href="addInst" class="waves-effect waves-dark">
	                    <span class="pcoded-micon"><i class="ti-layers"></i><b>FC</b></span>
	                    <span class="pcoded-mtext" data-i18n="nav.form-components.main">나의 기관 관리</span>
	                    <span class="pcoded-mcaret"></span>
	                </a>
	            </li>
            </c:if>
        </ul>
		<div class="pcoded-navigation-label" data-i18n="nav.category.navigation">SR 관리</div>
        <ul class="pcoded-item pcoded-left-item">
        	<c:if test="${role ne 2}">
	            <li class="">
	                <a href="srDemandList" class="waves-effect waves-dark">
	                    <span class="pcoded-micon"><i class="ti-home"></i><b>D</b></span>
	                    <span class="pcoded-mtext" data-i18n="nav.dash.main">SR 요청 관리</span>
	                    <span class="pcoded-mcaret"></span>
	                </a>
	            </li>
            </c:if>
            <c:if test="${role ne 1}">
	            <li>
	                <a href="srInformationList" class="waves-effect waves-dark">
	                    <span class="pcoded-micon"><i class="ti-layers"></i><b>FC</b></span>
	                    <span class="pcoded-mtext" data-i18n="nav.form-components.main">SR 진척 관리</span>
	                    <span class="pcoded-mcaret"></span>
	                </a>
	            </li>
            </c:if>
        </ul>
        <c:if test="${role eq 3 }">
	        <div class="pcoded-navigation-label" data-i18n="nav.category.navigation">회원 관리</div>
	        <ul class="pcoded-item pcoded-left-item">
	            <li class="">
	                <a href="clientsList" class="waves-effect waves-dark">
	                    <span class="pcoded-micon"><i class="ti-home"></i><b>D</b></span>
	                    <span class="pcoded-mtext" data-i18n="nav.dash.main">고객 관리</span>
	                    <span class="pcoded-mcaret"></span>
	                </a>
	            </li>
	            <li class="">
	                <a href="employeesList" class="waves-effect waves-dark">
	                    <span class="pcoded-micon"><i class="ti-layers"></i><b>D</b></span>
	                    <span class="pcoded-mtext" data-i18n="nav.dash.main">사원관리</span>
	                    <span class="pcoded-mcaret"></span>
	                </a>
	            </li>
	            <li class="">
	                <a href="departmentsList" class="waves-effect waves-dark">
	                    <span class="pcoded-micon"><i class="ti-layers"></i><b>FC</b></span>
	                    <span class="pcoded-mtext" data-i18n="nav.dash.main">부서관리</span>
	                    <span class="pcoded-mcaret"></span>
	                </a>
	            </li>
	            
	        </ul>
        </c:if>
    </div>
</nav>
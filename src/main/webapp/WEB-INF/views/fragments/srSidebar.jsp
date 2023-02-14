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
        <div class="pcoded-navigation-label" data-i18n="nav.category.navigation">SR 관리</div>
        <ul class="pcoded-item pcoded-left-item">
            <li class="">
                <a href="index.html" class="waves-effect waves-dark">
                    <span class="pcoded-micon"><i class="ti-home"></i><b>D</b></span>
                    <span class="pcoded-mtext" data-i18n="nav.dash.main">SR 요청 관리</span>
                    <span class="pcoded-mcaret"></span>
                </a>
            </li>
            <c:if test="${role eq 3 || role eq 2}">
	            <li>
	                <a href="form-elements-component.html" class="waves-effect waves-dark">
	                    <span class="pcoded-micon"><i class="ti-layers"></i><b>FC</b></span>
	                    <span class="pcoded-mtext" data-i18n="nav.form-components.main">SR 진척 관리</span>
	                    <span class="pcoded-mcaret"></span>
	                </a>
	            </li>
            </c:if>
        </ul>
        

       

        
    </div>
</nav>
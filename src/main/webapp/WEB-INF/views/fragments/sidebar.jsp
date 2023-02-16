<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="pcoded-navbar">
    <div class="sidebar_toggle"><a href="#"><i class="icon-close icons"></i></a></div>
    <div class="pcoded-inner-navbar main-menu">
        <div class="">
            <div class="main-menu-header">
                <img class="img-80 img-radius" src="${pageContext.request.contextPath}/resources/assets/images/avatar-4.jpg" alt="User-Profile-Image">
                <div class="user-details" style="color:white">
                    John Doe
                </div>
            </div>
        </div>

        <div class="pcoded-navigation-label mt-3" data-i18n="nav.category.navigation">MY PORTAL</div>
	        <ul class="pcoded-item pcoded-left-item">
	            <li class="">
	                <a href="/myportal" class="waves-effect waves-dark">
	                    <span class="pcoded-micon"><i class="ti-home pt-1"></i><b>D</b></span>
	                    <span class="pcoded-mtext" data-i18n="nav.dash.main">나의 할 일</span>
	                    <span class="pcoded-mcaret"></span>
	                </a>
	            </li>
	        </ul>
	        
        <div class="pcoded-navigation-label" style="font-weight: bold;" data-i18n="nav.category.forms">회원정보 관리</div>
	        <ul class="pcoded-item pcoded-left-item">
	            <li>
	                <a href="/myinfo" class="waves-effect waves-dark">
	                    <span class="pcoded-micon"><i class="ti-user pt-1"></i><b>FC</b></span>
	                    <span class="pcoded-mtext" data-i18n="nav.form-components.main">내 정보 관리</span>
	                    <span class="pcoded-mcaret"></span>
	                </a>
	            </li>
	            <c:if test="${role eq 1 }">
		            <li>
		                <a href="/addinst" class="waves-effect waves-dark">
		                    <span class="pcoded-micon"><i class="far fa-building pt-1"></i><b>FC</b></span>
		                    <span class="pcoded-mtext" data-i18n="nav.form-components.main">내 기관 관리</span>
		                    <span class="pcoded-mcaret"></span>
		                </a>
		            </li>
	            </c:if>
	        </ul>	        
	        
		<div class="pcoded-navigation-label" style="font-weight: bold;" data-i18n="nav.category.navigation">SR 관리</div>
	        <ul class="pcoded-item pcoded-left-item">
	            <c:if test="${role ne 2}">
		            <li class="">
		                <a href="/srdemandList" class="waves-effect waves-dark">
		                    <span class="pcoded-micon"><i class="far fa-file-alt pt-1"></i><b>D</b></span>
		                    <span class="pcoded-mtext" data-i18n="nav.dash.main">SR 요청 관리</span>
		                    <span class="pcoded-mcaret"></span>
		                </a>
		            </li>
	            </c:if>
	            <c:if test="${role eq 2 || role eq 3}">
		            <li>
		                <a href="/srinformationList" class="waves-effect waves-dark">
		                    <span class="pcoded-micon"><i class="fas fa-file-alt pt-1"></i><b>FC</b></span>
		                    <span class="pcoded-mtext" data-i18n="nav.form-components.main">SR 진척 관리</span>
		                    <span class="pcoded-mcaret"></span>
		                </a>
		            </li>
	            </c:if>
	        </ul>	        
	        
        
        <div class="pcoded-navigation-label" style="font-weight: bold;" data-i18n="nav.category.forms">게시판</div>
	        <ul class="pcoded-item pcoded-left-item">
	            <li>
	                <a href="/noticelist" class="waves-effect waves-dark">
	                    <span class="pcoded-micon"><i class="fas fa-bullhorn pt-1"></i><b>FC</b></span>
	                    <span class="pcoded-mtext" data-i18n="nav.form-components.main">공지사항</span>
	                    <span class="pcoded-mcaret"></span>
	                </a>
	            </li>
	            <li>
	                <a href="/qnalist" class="waves-effect waves-dark">
	                    <span class="pcoded-micon"><i class="far fa-comments pt-1"></i><b>FC</b></span>
	                    <span class="pcoded-mtext" data-i18n="nav.form-components.main">QnA</span>
	                    <span class="pcoded-mcaret"></span>
	                </a>
	            </li>
	        </ul>
  
	        <c:if test="${role eq 3 }">
				<div class="pcoded-navigation-label" style="font-weight: bold;" data-i18n="nav.category.navigation">회원 관리</div>
			        <ul class="pcoded-item pcoded-left-item">
			            <li class="">
			                <a href="/clientslist" class="waves-effect waves-dark">
			                    <span class="pcoded-micon"><i class="far fa-id-card pt-1"></i><b>D</b></span>
			                    <span class="pcoded-mtext" data-i18n="nav.dash.main">고객 관리</span>
			                    <span class="pcoded-mcaret"></span>
			                </a>
			            </li>
			            <li class="">
			                <a href="/employeeslist" class="waves-effect waves-dark">
			                    <span class="pcoded-micon"><i class="fas fa-id-card pt-1"></i><b>D</b></span>
			                    <span class="pcoded-mtext" data-i18n="nav.dash.main">사원 관리</span>
			                    <span class="pcoded-mcaret"></span>
			                </a>
			            </li>
			            <li class="">
			                <a href="/departmentslist" class="waves-effect waves-dark">
			                    <span class="pcoded-micon"><i class="fas fa-sitemap pt-1"></i><b>FC</b></span>
			                    <span class="pcoded-mtext" data-i18n="nav.dash.main">부서 관리</span>
			                    <span class="pcoded-mcaret"></span>
			                </a>
			            </li>
			        </ul>
	        </c:if>
    </div>
</nav>
<%-- 작성자 : 신정은
   작성날짜 : 2023-02-20 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<%@include file="/WEB-INF/views/fragments/header.jsp"%>
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/css/srButton.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/css/pagination.css">
<script src="${pageContext.request.contextPath}/resources/js/mytodo.js"></script>
<!-- 모달 -->
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/css/srModal.css">
</head>
<body>
   <%@include file="/WEB-INF/views/fragments/top.jsp"%>
   <%@include file="/WEB-INF/views/fragments/sidebar.jsp"%>
   <!-- Page-body start -->
   <div class="page-body">
      <div class="row">
         <!-- Color Open Accordion start -->
         <div class="col-lg-12">
            <div class="card" id="mytodo">
               <div class="card-header">
                  <h5 class="card-header-text">나의 할일</h5>
               </div>
               <div class="col-12">
                  <!-- Nav tabs -->
                  <ul class="nav nav-tabs md-tabs" role="tablist">
                     <sec:authorize access="hasAnyRole('ROLE_CLIENT', 'ROLE_ADMIN')">
                        <li class="nav-item btn"><div
                              class="nav-link sttsCd0 active" onclick="moveTab(0)">
                              요청
                              <sec:authorize access="hasRole('ROLE_ADMIN')">
                                 <span class="badge badge-danger">${atotal}</span>
                              </sec:authorize>
                           </div>
                           <div class="slide"></div></li>
                        <li class="nav-item btn"><div class="nav-link sttsCd1"
                              onclick="moveTab(1)">반려</div>
                           <div class="slide"></div></li>
                        <li class="nav-item btn"><div class="nav-link sttsCd2"
                              onclick="moveTab(2)">
                              접수
                              <sec:authorize access="hasRole('ROLE_CLIENT')">
                                 <span class="badge badge-danger">${rtotal}</span>
                              </sec:authorize>
                           </div>
                           <div class="slide"></div></li>
                     </sec:authorize>
                     <sec:authorize access="hasRole('ROLE_DEVELOPER')">
                        <li class="nav-item btn"><div
                              class="nav-link sttsCd3 active" onclick="moveTab(3)">
                              개발중 <span class="badge badge-danger">${rtotal}</span>
                           </div>
                           <div class="slide"></div></li>
                     </sec:authorize>
                     <sec:authorize access="hasAnyRole('ROLE_CLIENT', 'ROLE_ADMIN')">
                        <li class="nav-item btn"><div class="nav-link sttsCd3"
                              onclick="moveTab(3)">개발중</div>
                           <div class="slide"></div></li>
                     </sec:authorize>
                     <li class="nav-item btn"><div class="nav-link sttsCd4"
                           onclick="moveTab(4)">테스트</div>
                        <div class="slide"></div></li>
                     <li class="nav-item btn"><div class="nav-link sttsCd5"
                           onclick="moveTab(5)">개발완료</div>
                        <div class="slide"></div></li>
                     <li class="nav-item btn"><div class="nav-link sttsCd6"
                           onclick="moveTab(6)">개발 취소</div>
                        <div class="slide"></div></li>
                  </ul>
                  <!-- Tab panes -->
                  <div class="tab-content card-block"
                     style="padding: 0px 20px 20px 20px;">
                     <!---------------------------------------------------------------나의 할일 : 요청-------->
                     <div class="tab-pane active" id="requesttable" role="tabpanel">
                        <%@ include file="/WEB-INF/views/mytodo/srTable.jsp"%>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <!-- Color Open Accordion ends -->
      </div>
      <!-- Row end -->
      <!-- Row start -->
      <div class="row">
         <!-- Multiple Open Accordion start -->
         <div class="col-lg-6" id="notie">
            <jsp:include page="/WEB-INF/views/mytodo/notice.jsp" />
         </div>
         <!-- Multiple Open Accordion ends -->
         <!-- Single Open Accordion start -->
         <div class="col-lg-6" id="qna">
            <jsp:include page="/WEB-INF/views/mytodo/qna.jsp" />
         </div>
         <!-- Single Open Accordion ends -->
      </div>
      <!-- Row end -->
   </div>
   <!-- Page-body end -->
   <%@include file="/WEB-INF/views/fragments/bottom.jsp"%>
   <!-- 모달 -->
   <jsp:include page="/WEB-INF/views/srDemand/srDemandDetail.jsp" />
   <jsp:include page="/WEB-INF/views/srDemand/modal.jsp" />
</body>
</html>
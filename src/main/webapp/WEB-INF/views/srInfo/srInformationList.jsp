<%@page contentType="text/html; charset=UTF-8"%>

<%-- 작성자 : 여수한 / 작성 날짜 : 2023-02-17 --%>

<html>
<head>
<%@include file="/WEB-INF/views/fragments/header.jsp"%>
<%-- 캘린더css --%>
<link
   href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css'
   rel='stylesheet' />
</head>
<script src="${pageContext.request.contextPath}/resources/js/srResources.js"></script>

<script>
   
<%-- 모달 실행 --%>
   $(document).on('click', '#addbtn', function(e) {
      console.log("click event");
      $('#addmodal').addClass('show');
      document.body.style = `overflow: hidden`;
   });
   $(document).on('click', '#closebtn', function(e) {
      console.log("click event");
      $('#addmodal').removeClass('show');
      document.body.style = `overflow: scroll`;
   });
<%-- SR요청 상세보기 --%>
   function getDetail(Detail) {
      console.log("Detail: " + Detail);
      $.ajax({
         url : '/srinformation/' + Detail,
         type : 'GET',
         data : {
            Detail : Detail
         },
         success : function(detail) {
            console.log(detail);
            $("#SRDDmndNo").text(detail.dd.dmndNo);
            $("#SRDTitle").text(detail.dd.ttl);
            $("#SRDRelgrund").text(detail.dd.relGrund);
            $("#SRDSys").text(detail.dd.sysNm);
            $("#SRDTask").text(detail.dd.taskSeNm);
            $("#SRDInst").text(detail.dd.instNm);
            $("#SRDFlnm").text(detail.dd.flnm);
            $("#SRDDmndymd").text(detail.dd.dmndYmd);
            $("#SRDCmptnDmndYmd").text(detail.dd.cmptnDmndYmd);
            $("#SRDCn").text(detail.dd.cn);
            $("#SRDFile").text(detail.dd.fileNm);
            
            $("#SRPDeptNm").text(detail.pi.deptNm);
            $("#SRPFlnm").text(detail.pi.flnm);
            $("#SRPBgngYmd").text(detail.pi.bgngYmd);
            $("#SRPEndYmd").text(detail.pi.endYmd);
            $("#SRPRvwCn").text(detail.pi.rvwCn);
            
            $("")
         }
      });
   }
<%-- SR요청 계획정보 --%>
   function getPlan() {
      $("#SRDDmndNo").text();
      console.log("Plan: " + $("#SRDDmndNo").text());
      $.ajax({
         url : '/srinformation1/' + $("#SRDDmndNo").text(),
         type : 'GET',
         data : {
            Plan : $("#SRDDmndNo").text()
         },
         success : function(Plan) {
            $("#SRPDeptNm").text(Plan.deptNm);
            $("#SRPFlnm").text(Plan.flnm);
            $("#SRPBgngYmd").text(Plan.bgngYmd);
            $("#SRPEndYmd").text(Plan.endYmd);
            $("#SRPRvwCn").text(Plan.rvwCn);
         }
      });
   }
</script>
<style>
.ui-datepicker-trigger {
   width: 29px;
   vertical-align: top;
}
#startDatepicker, #endDatepicker, #addDatepicker {
   width: 90px;
}
#requestDatepicker, #endRequestDatepicker, #firStartDatepicker,
   #firEndDatepicker, #secStartDatepicker, #secEndDatepicker,
   #thrStartDatepicker, #thrEndDatepicker, #fiveStartDatepicker,
   #fiveEndDatepicker, #fourStartDatepicker, #fourEndDatepicker,
   #sixStartDatepicker, #sixEndDatepicker {
   width: 70px;
   padding-right: 0px;
}
div.left {
   width: 65%;
   float: left;
   box-sizing: border-box;
}
div.right {
   width: 35%;
   float: right;
   box-sizing: border-box;
   border-left: 1px solid black;
}
div .right .form-control {
   height: 20px;
}
th {
   text-align: center;
}
.col-sm-4 {
   padding: 0px;
}
/* 
.table td, .table th {
   padding: 0.75rem;
} */
.card .card-block {
   padding: 0px 5px !important;
}
.col-xl-1 {
   padding-top: 8px;
   padding-right: 0px;
   padding-left: 10px;
}
.modal {
   position: fixed;
   top: 0;
   left: 0;
   bottom: 0;
   right: 0;
   background: rgba(0, 0, 0, 0.4);
}
.m.body {
   height: 50vh;
   overflow-y: auto;
}
</style>
<body>
   <div id="pcoded" class="pcoded">
      <div class="pcoded-overlay-box"></div>
      <div class="pcoded-container navbar-wrapper">
         <%@include file="/WEB-INF/views/fragments/top.jsp"%>
         <div class="pcoded-main-container">
            <div class="pcoded-wrapper">
               <%@include file="/WEB-INF/views/fragments/sidebar.jsp"%>
               <div class="pcoded-content">
                  <%@include file="/WEB-INF/views/fragments/pageHeader.jsp"%>
                  <div class="pcoded-inner-content pt-4">
                     <div class="main-body">
                        <div id="pageWrapper" class="page-wrapper">
                           <!-- Page-body start -->
                           <div class="page-body text">
                              <!-- *********** -->
                              <%-- *********************************** [ 산출물 추가 모달 ] ***********************************--%>
                              <div class="modal" id="addmodal">
                                 <div class="modal_body">
                                    <div class="m_head">
                                       <div class="modal_title" style="color: white;">산출물 추가</div>
                                    </div>
                                    <div class="m_body">
                                       <div class="form-group row">
                                          <div class="col-sm-6">
                                             <div class="col col-sm-4">산출물 구분</div>
                                             <div class="col col-sm-6">
                                                <div class="dropdown dropdown open">
                                                   <form action="#">
                                                      <select name="languages" id="lang">
                                                         <option value="워크넷">분석</option>
                                                         <option value="굴국밥">설계</option>
                                                         <option value="고소미">개발</option>
                                                         <option value="고소미">시험</option>
                                                      </select>
                                                   </form>
                                                </div>
                                             </div>
                                          </div>
                                          <div class="col-sm-6">
                                             <div class="col col-sm-4">등록일</div>
                                             <div class="col col-sm-6">
                                                <input type="date" id="addDatepicker">
                                             </div>
                                          </div>

                                       </div>

                                       <div class="form-group row">
                                          <label class="col-sm-2 col-form-label">첨부파일</label>
                                          <div class="col-sm-9">
                                             <input type="file" class="">
                                          </div>
                                       </div>

                                    </div>
                                    <div class="m_footer">
                                       <div class="modal_btn save center" id="savebtn">등록</div>
                                       <div class="modal_btn danger cancle" id="closebtn">닫기</div>
                                    </div>
                                 </div>
                              </div>
                              <div class="row">
                                 <%-- *********************************** [SR 진척 관리 ] ***********************************--%>
                                 <div class="col-xl-12">
                                    <div class="card">
                                       <div class="card-header">
                                          <h5>SR 진척 관리</h5>
                                          <hr />
                                          <div class="col col-xl-1" style="width: 90px;">시스템
                                             구분</div>
                                          <div class="col col-xl-1" style="">
                                             <div class="dropdown dropdown open">
                                                <form action="#">
                                                   <select name="languages" id="lang">
                                                      <option value="워크넷">시스템3</option>
                                                      <option value="굴국밥">시스템2</option>
                                                      <option value="고소미">시스템1</option>
                                                   </select>
                                                </form>
                                             </div>
                                          </div>
                                          <div class="col col-xl-1" style="width: 80px;">업무 구분</div>
                                          <div class="col col-xl-1" style="">
                                             <div class="dropdown dropdown open">
                                                <form action="#">
                                                   <select name="languages" id="lang">
                                                      <option value="워크넷">업무구분1</option>
                                                      <option value="굴국밥">업무2</option>
                                                      <option value="고소미">업무3</option>
                                                   </select>
                                                </form>
                                             </div>
                                          </div>
                                          <div class="col col-xl-1" style="width: 80px;">진행 상태</div>
                                          <div class="col col-xl-1" style="">
                                             <div class="dropdown dropdown open">
                                                <form action="#">
                                                   <select name="languages" id="lang">
                                                      <option value="워크넷">개발중</option>
                                                      <option value="굴국밥">테스트</option>
                                                      <option value="고소미">반영요청</option>
                                                   </select>
                                                </form>
                                             </div>
                                          </div>
                                          <div class="col col-xl-1"
                                             style="width: 80px; padding-left: 20px;">SR 제목</div>
                                          <div class="col col-xl-1" style="">
                                             <input type="text" class="form-control">
                                          </div>
                                          <div class="col col-xl-1"
                                             style="width: 80px; padding-left: 30px">SR 번호</div>
                                          <div class="col col-xl-1" style="">

                                             <input type="text" class="form-control">
                                          </div>
                                          <div class="col col-xl-1" style="padding-left: 30px">
                                             내 처리건 <input type="checkbox">
                                          </div>
                                          <div class="col col-xl-1">
                                             <button onclick="srSearch()" type="button"
                                                class="btn btn-lg btn-info">
                                                <i class="ti-search"></i>
                                             </button>
                                          </div>
                                          <div class="col col-xl-1">
                                             <button class="btn btn-info">엑셀 다운로드</button>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                                 <%-- *********************************** [SR 처리 목록 ] ***********************************--%>

                                 <div class="col-xl-8 col-md-12">
                                    <div class="card">
                                       <div class="card-header">
                                          <h5>SR 처리 목록</h5>

                                          <div class="card-header-right">
                                             <ul class="list-unstyled card-option">
                                                <li><i class="fa fa fa-wrench open-card-option"></i></li>
                                                <li><i class="fa fa-window-maximize full-card"></i></li>
                                                <li><i class="fa fa-minus minimize-card"></i></li>
                                                <li><i class="fa fa-refresh reload-card"></i></li>
                                                <li><i class="fa fa-trash close-card"></i></li>
                                             </ul>
                                          </div>
                                       </div>
                                       <div class="card-block" id="list">
                                          <div id="sales-analytics" class="p-2">
                                             <div class="card-block table-border-style">
                                                <div class="table-responsive">
                                                   <table class="table table-hover text-center"
                                                      style="font-size: 12;">
                                                      <thead>
                                                         <tr>
                                                            <th style="width: 1px;">#</th>
                                                            <th>SR번호</th>
                                                            <th>시스템구분</th>
                                                            <th>업무구분</th>
                                                            <th style="width: 200px;">SR명</th>
                                                            <th>요청자</th>
                                                            <th>완료요청일</th>
                                                            <th>완료예정일</th>
                                                            <th>진행상태</th>
                                                         </tr>
                                                      </thead>
                                                      <tbody>
                                                         <c:forEach var="srlist" items="${srlist}"
                                                            varStatus="num">
                                                            <tr onclick="getDetail('${srlist.dmndNo}')">
                                                               <th scope="row">${num.count}</th>
                                                               <td>${srlist.srNo}</td>
                                                               <td>${srlist.sysNm}</td>
                                                               <td>${srlist.taskSeNm}</td>
                                                               <td>${srlist.ttl}</td>
                                                               <td>${srlist.flnm}</td>
                                                               <td>${srlist.bgngYmd}</td>
                                                               <td>${srlist.endYmd}</td>
                                                               <td>${srlist.sttsNm}</td>
                                                            </tr>
                                                         </c:forEach>
                                                      </tbody>
                                                   </table>
                                                </div>
                                             </div>

                                          </div>
                                       </div>
                                    </div>
                                 </div>
                                 <%-- *********************************** [SR요청 상세정보 ] ***********************************--%>
                                 <div class="col-xl-4 col-md-12">
                                    <div class="card">
                                       <div class="card-header">
                                          <div class="row">
                                             <div class="col-6">
                                                <h5>SR요청 상세정보</h5>
                                             </div>
                                             <div class="col-3">
                                                <button type="button" class="btn btn-primary btn-sm"
                                                   data-toggle="modal" data-target="#addHistoryModal">
                                                   예정일 변경</button>
                                             </div>
                                             <div class="col-3">
                                                <button type="button" class="btn btn-primary btn-sm"
                                                   data-toggle="modal" data-target="#addHistoryModal">
                                                   개발 취소</button>
                                             </div>
                                          </div>
                                       </div>
                                       <div class="card-block" style="height: 600px;">
                                          <div class="card_body "
                                             style="font-size: 12px; padding-top: 20px;">
                                             <div class="form-group row">
                                                <div class="col-sm-6">
                                                   <div class="col col-sm-4">요청 번호</div>
                                                   <div class="col col-sm-8" id="SRDDmndNo"></div>
                                                </div>
                                             </div>
                                             <hr />
                                             <div class="form-group row">
                                                <div class="col col-sm-2">SR 제목</div>
                                                <div class="col col-sm-9" id="SRDTitle"></div>
                                             </div>
                                             <hr />
                                             <div class="form-group row">
                                                <div class="col col-sm-3">관련 근거</div>
                                                <div class="col col-sm-9" id="SRDRelgrund"></div>
                                             </div>
                                             <hr />
                                             <div class="form-group row">
                                                <div class="col-sm-6">
                                                   <div class="col col-sm-4">시스템구분</div>
                                                   <div class="col col-sm-6" id="SRDSys"></div>
                                                </div>
                                                <div class="col-sm-6">
                                                   <div class="col col-sm-4">업무구분</div>
                                                   <div class="col col-sm-6" id="SRDTask"></div>
                                                </div>
                                             </div>
                                             <hr />
                                             <div class="form-group row">
                                                <div class="col-sm-6">
                                                   <div class="col col-sm-4">요청기관</div>
                                                   <div class="col col-sm-6" id="SRDInst"></div>
                                                </div>
                                                <div class="col-sm-6">
                                                   <div class="col col-sm-4">요청자</div>
                                                   <div class="col col-sm-6" id="SRDFlnm"></div>
                                                </div>
                                             </div>
                                             <hr />
                                             <div class="form-group row">
                                                <div class="col-sm-6">
                                                   <div class="col col-sm-4">요청일</div>
                                                   <div class="col col-sm-8" id="SRDDmndymd"></div>
                                                </div>
                                                <div class="col-sm-6">
                                                   <div class="col col-sm-4">완료요청일</div>
                                                   <div class="col col-sm-8" id="SRDCmptnDmndYmd"></div>
                                                </div>
                                             </div>
                                             <hr />
                                             <div class="form-group row">
                                                <label class="col-sm-2 col-form-label"
                                                   style="line-height: 100px; font-size: 12px;">SR
                                                   내용</label>
                                                <div class="col-sm-9" id="SRDCn"></div>
                                             </div>
                                             <hr />
                                             <div class="form-group row">
                                                <label class="col-sm-3 col-form-label"
                                                   style="font-size: 12px;">첨부파일</label>
                                                <div class="col-sm-9">
                                                   <input type="file" class="" id="SRDFile">
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                                 <%-- *********************************** [SR요청 처리정보 ] ***********************************--%>
                                 <div class="col-xl-12 col-md-12">
                                    <div class="card">
                                       <div class="card-header">
                                          <h5>SR요청 처리정보</h5>
                                       </div>
                                       <div class="card-block" style="padding-top: 10px;">
                                          <ul class="nav nav-tabs  md-tabs" role="tablist">
                                             <li class="nav-item" onclick="getPlan()"><a
                                                class="nav-link active" data-toggle="tab" href="#home1"
                                                role="tab">SR 계획정보</a>
                                                <div class="slide"></div></li>
                                             <li class="nav-item"><a class="nav-link"
                                                data-toggle="tab" href="#profile1" role="tab">SR
                                                   자원정보</a>
                                                <div class="slide"></div></li>
                                             <li class="nav-item"><a class="nav-link"
                                                data-toggle="tab" href="#messages1" role="tab">SR
                                                   진척율</a>
                                                <div class="slide"></div></li>
                                             <li class="nav-item"><a class="nav-link"
                                                data-toggle="tab" href="#settings1" role="tab">SR
                                                   산출물</a>
                                                <div class="slide"></div></li>
                                             <li class="nav-item"><a class="nav-link"
                                                data-toggle="tab" href="#history1" role="tab">SR
                                                   히스토리</a>
                                                <div class="slide"></div></li>
                                          </ul>
                                          <%-- *********************************** [ 계획정보 ] ***********************************--%>
                                          <div class="tab-content tabs card-block"
                                             style="padding: 0px; padding-top: 20px;">
                                             <div class="tab-pane active" id="home1" role="tabpanel"
                                                style="padding: 20px;">
                                                <div class="form-group row">
                                                   <div class="col-sm-6">
                                                      <div class="col col-sm-4">처리팀</div>
                                                      <div class="col col-sm-6" id="SRPDeptNm"></div>

                                                   </div>
                                                   <div class="col-sm-6">
                                                      <div class="col col-sm-4">담당자</div>
                                                      <div class="col col-sm-6" id="SRPFlnm"></div>
                                                   </div>
                                                </div>
                                                <div class="form-group row">
                                                   <div class="col-sm-6">
                                                      <div class="col col-sm-4">계획시작일</div>
                                                      <div class="col col-sm-8" id="SRPBgngYmd"></div>

                                                   </div>
                                                   <div class="col-sm-6">
                                                      <div class="col col-sm-4">계획종료일</div>
                                                      <div class="col col-sm-8" id="SRPEndYmd"></div>
                                                   </div>
                                                </div>
                                                <div class="form-group row">
                                                   <div class="col col-sm-2" style="line-height: 90px;">검토
                                                      내용</div>
                                                   <div class="col col-sm-9">
                                                      <textarea rows="5" cols="5" class="form-control" id="SRPRvwCn"></textarea>

                                                   </div>
                                                </div>
                                                <button class="btn btn-info"
                                                   style="float: right; padding-bottom: 10px; margin-bottom: 10px;">수정</button>
                                             </div>
                                             <%-- *********************************** [ 자원정보 ] ***********************************--%>
                                             <div class="tab-pane" id="profile1" role="tabpanel"
                                                style="padding-bottom: 20px;">
                                                <div class="card-block table-border-style"
                                                   style="padding: 0px;">
                                                   <div class="table-responsive">
                                                      <table class="table table-hover text-center"
                                                         style="font-size: 12px; padding: 0px;">
                                                         <thead>
                                                            <tr>
                                                               <th style="width: 1px;">#</th>
                                                               <th style="width: 1px;"><input type="checkbox"
                                                                  name="resource" value="selectResourceAll"
                                                                  onclick="selectResourceAll(this)"></th>
                                                               <th>개발자명</th>
                                                               <th>역할</th>
                                                               <th>투입시작일</th>
                                                               <th>투입종료일</th>
                                                            </tr>
                                                         </thead>
                                                         <tbody id="resourceTableRow">
                                                            
                                                         </tbody>
                                                      </table>
                                                   </div>
                                                </div>
                                                <button class="btn btn-info"
                                                   style="float: right; padding-bottom: 10px; margin-bottom: 10px;">저장</button>
                                                <button onclick="deleteResource()" class="btn btn-info"
                                                   style="float: right; padding-bottom: 10px; margin-bottom: 10px; margin-right: 10px;">선택
                                                   삭제</button>
                                                <button class="btn btn-info"
                                                   style="float: right; padding-bottom: 10px; margin-bottom: 10px; margin-right: 10px;"data-toggle="modal"
                                       data-target="#addSrResourcesModal">추가</button>
                                             </div>
                                             <%-- *********************************** [ 진척률 ] ***********************************--%>
                                             <div class="tab-pane" id="messages1" role="tabpanel"
                                                style="padding-bottom: 20px;">
                                                <div class="tab-pane" id="profile1" role="tabpanel">
                                                   <div class="card-block table-border-style"
                                                      style="padding: 0px;">
                                                      <div class="table-responsive">
                                                         <table class="table table-hover text-center"
                                                            style="font-size: 12px; padding: 0px;">
                                                            <thead>
                                                               <tr>
                                                                  <th style="width: 1px;">#</th>
                                                                  <th style="width: 50px;">작업구분</th>
                                                                  <th style="width: 300px;">시작일</th>
                                                                  <th style="width: 300px;">종료일</th>
                                                                  <th style="width: 50px;">진척률(누적)</th>
                                                                  <th>산출물</th>
                                                               </tr>
                                                            </thead>
                                                            <tbody>
                                                               <tr>
                                                                  <th scope="row">1</th>
                                                                  <td>요구정의</td>
                                                                  <td><input type="date"></td>
                                                                  <td><input type="date"></td>
                                                                  <td><input type="text" class="form-control"
                                                                     id="progress"></td>
                                                                  <td><div class="accordion"
                                                                        id="accordionExample">
                                                                        <button
                                                                           class="btn btn-link btn-block text-center"
                                                                           type="button" data-toggle="collapse"
                                                                           data-target="#collapseOne" aria-expanded="true"
                                                                           aria-controls="collapseOne">첨부파일1</button>
                                                                        <div id="collapseOne" class="collapse"
                                                                           aria-labelledby="headingOne"
                                                                           data-parent="#accordionExample">
                                                                           <div class="card-body">첨부파일2</div>
                                                                        </div>
                                                                     </div></td>
                                                               </tr>
                                                               <tr>
                                                                  <th scope="row">2</th>
                                                                  <td>분석/설계</td>
                                                                  <td><input type="date"></td>
                                                                  <td><input type="date"></td>
                                                                  <td><input type="text" class="form-control"
                                                                     id="progress"></td>
                                                                  <td><div class="accordion"
                                                                        id="accordionExample">
                                                                        <button
                                                                           class="btn btn-link btn-block text-center"
                                                                           type="button" data-toggle="collapse"
                                                                           data-target="#collapseTwo" aria-expanded="true"
                                                                           aria-controls="collapseTwo">첨부파일1</button>
                                                                        <div id="collapseTwo" class="collapse"
                                                                           aria-labelledby="headingOne"
                                                                           data-parent="#accordionExample">
                                                                           <div class="card-body">첨부파일2</div>
                                                                        </div>
                                                                     </div></td>
                                                               </tr>
                                                               <tr>
                                                                  <th scope="row">3</th>
                                                                  <td>구현</td>
                                                                  <td><input type="date"></td>
                                                                  <td><input type="date"></td>
                                                                  <td><input type="text" class="form-control"
                                                                     id="progress"></td>
                                                                  <td><div class="accordion"
                                                                        id="accordionExample">
                                                                        <button
                                                                           class="btn btn-link btn-block text-center"
                                                                           type="button" data-toggle="collapse"
                                                                           data-target="#collapseThr" aria-expanded="true"
                                                                           aria-controls="collapseThr">첨부파일1</button>
                                                                        <div id="collapseThr" class="collapse"
                                                                           aria-labelledby="headingOne"
                                                                           data-parent="#accordionExample">
                                                                           <div class="card-body">첨부파일2</div>
                                                                        </div>
                                                                     </div></td>
                                                               </tr>
                                                               <tr>
                                                                  <th scope="row">4</th>
                                                                  <td>시험</td>
                                                                  <td><input type="date"></td>
                                                                  <td><input type="date"></td>
                                                                  <td><input type="text" class="form-control"
                                                                     id="progress"></td>
                                                                  <td><div class="accordion"
                                                                        id="accordionExample">
                                                                        <button
                                                                           class="btn btn-link btn-block text-center"
                                                                           type="button" data-toggle="collapse"
                                                                           data-target="#collapsefour"
                                                                           aria-expanded="true"
                                                                           aria-controls="collapsefour">첨부파일1</button>
                                                                        <div id="collapsefour" class="collapse"
                                                                           aria-labelledby="headingOne"
                                                                           data-parent="#accordionExample">
                                                                           <div class="card-body">첨부파일2</div>
                                                                        </div>
                                                                     </div></td>
                                                               </tr>
                                                               <tr>
                                                                  <th scope="row">5</th>
                                                                  <td>반영요청</td>
                                                                  <td><input type="date"></td>
                                                                  <td><input type="date"></td>
                                                                  <td><input type="text" class="form-control"
                                                                     id="progress"></td>
                                                                  <td><div class="accordion"
                                                                        id="accordionExample">
                                                                        <button
                                                                           class="btn btn-link btn-block text-center"
                                                                           type="button" data-toggle="collapse"
                                                                           data-target="#collapsefive"
                                                                           aria-expanded="true"
                                                                           aria-controls="collapsefive">첨부파일1</button>
                                                                        <div id="collapsefive" class="collapse"
                                                                           aria-labelledby="headingOne"
                                                                           data-parent="#accordionExample">
                                                                           <div class="card-body">첨부파일2</div>
                                                                        </div>
                                                                     </div></td>
                                                               </tr>
                                                               <tr>
                                                                  <th scope="row">6</th>
                                                                  <td>운영반영</td>
                                                                  <td><input type="date"></td>
                                                                  <td><input type="date"></td>
                                                                  <td><input type="text" class="form-control"
                                                                     id="progress"></td>
                                                                  <td><div class="accordion"
                                                                        id="accordionExample">
                                                                        <button
                                                                           class="btn btn-link btn-block text-center"
                                                                           type="button" data-toggle="collapse"
                                                                           data-target="#collapsesix" aria-expanded="true"
                                                                           aria-controls="collapsesix">첨부파일1</button>
                                                                        <div id="collapsesix" class="collapse"
                                                                           aria-labelledby="headingOne"
                                                                           data-parent="#accordionExample">
                                                                           <div class="card-body">첨부파일2</div>
                                                                        </div>
                                                                     </div></td>
                                                               </tr>
                                                            </tbody>
                                                         </table>
                                                      </div>
                                                   </div>
                                                </div>
                                                <button class="btn btn-info"
                                                   style="float: right; padding-bottom: 10px; margin-bottom: 10px;">저장</button>
                                                <button class="btn btn-info"
                                                   style="float: right; padding-bottom: 10px; margin-bottom: 10px; margin-right: 10px;">선택
                                                   삭제</button>
                                             </div>
                                             <%-- *********************************** [ 산출물  ] ***********************************--%>
                                             <div class="tab-pane" id="settings1" role="tabpanel"
                                                style="padding-bottom: 20px;">
                                                <div class="tab-pane" id="profile1" role="tabpanel">
                                                   <div class="card-block table-border-style"
                                                      style="padding: 0px;">
                                                      <div class="table-responsive">
                                                         <table class="table table-hover text-center"
                                                            style="font-size: 12px; padding: 0px;">
                                                            <thead>
                                                               <tr>
                                                                  <th style="width: 1px;">#</th>
                                                                  <th style="width: 1px;"><input
                                                                     type="checkbox" name="output"
                                                                     value="selectOutputAll"
                                                                     onclick="selectOutputAll(this)"></th>
                                                                  <th>산출물구분</th>
                                                                  <th>첨부파일명</th>
                                                                  <th>등록일</th>
                                                               </tr>
                                                            </thead>
                                                            <tbody>
                                                               <tr>
                                                                  <th scope="row">1</th>
                                                                  <td><input type="checkbox" name="output"></td>
                                                                  <td>Otto</td>
                                                                  <td>@mdo</td>
                                                                  <td>@mdo</td>
                                                               </tr>
                                                               <tr>
                                                                  <th scope="row">2</th>
                                                                  <td><input type="checkbox" name="output"></td>
                                                                  <td>Thornton</td>
                                                                  <td>@fat</td>
                                                                  <td>Jacob</td>
                                                               </tr>
                                                               <tr>
                                                                  <th scope="row">3</th>
                                                                  <td><input type="checkbox" name="output"></td>
                                                                  <td>the Bird</td>
                                                                  <td>@twitter</td>
                                                                  <td>Larry</td>
                                                               </tr>
                                                            </tbody>
                                                         </table>
                                                      </div>
                                                   </div>
                                                </div>
                                                <button class="btn btn-info"
                                                   style="float: right; padding-bottom: 10px; margin-bottom: 10px;">저장</button>
                                                <button class="btn btn-info"
                                                   style="float: right; padding-bottom: 10px; margin-bottom: 10px; margin-right: 10px;">선택
                                                   삭제</button>
                                                <div class="btn btn-info" id="addbtn"
                                                   style="float: right; padding-bottom: 10px; margin-bottom: 10px; margin-right: 10px;">추가</div>
                                             </div>


                                             <%-- *********************************** [ SR 히스토리  ] ***********************************--%>
                                             <div class="tab-pane" id="history1" role="tabpanel"
                                                style="padding-bottom: 20px;">
                                                <div class="tab-pane" id="profile1" role="tabpanel">
                                                   <div class="card-block table-border-style"
                                                      style="padding: 0px;">
                                                      <div class="table-responsive">
                                                         <table class="table table-hover text-center"
                                                            style="font-size: 12px; padding: 0px;">
                                                            <thead>
                                                               <tr>
                                                                  <th style="width: 1px;">순번</th>
                                                                  <th>담당자명</th>
                                                                  <th>기존 완료예정일</th>
                                                                  <th>변경된 완료예정일</th>
                                                                  <th>수락여부</th>
                                                                  <th>상세조회</th>
                                                               </tr>
                                                            </thead>
                                                            <tbody>
                                                               <tr>
                                                                  <th scope="row">1</th>
                                                                  <td>Otto</td>
                                                                  <td>@mdo</td>
                                                                  <td>@mdo</td>
                                                                  <td>@mdo</td>
                                                                  <td><button class="btn btn-info btn-sm"
                                                                        data-toggle="modal"
                                                                        data-target="#addHistoryModalDetail">상세조회</button></td>
                                                               </tr>
                                                               <tr>
                                                                  <th scope="row">2</th>
                                                                  <td>Thornton</td>
                                                                  <td>@fat</td>
                                                                  <td>Jacob</td>
                                                                  <td>@fat</td>
                                                                  <td><button class="btn btn-info btn-sm"
                                                                        data-toggle="modal"
                                                                        data-target="#addHistoryModalDetail">상세조회</button></td>
                                                               </tr>
                                                               <tr>
                                                                  <th scope="row">3</th>
                                                                  <td>the Bird</td>
                                                                  <td>@twitter</td>
                                                                  <td>Larry</td>
                                                                  <td>@twitter</td>
                                                                  <td><button class="btn btn-info btn-sm"
                                                                        data-toggle="modal"
                                                                        data-target="#addHistoryModalDetail">상세조회</button></td>
                                                               </tr>
                                                            </tbody>
                                                         </table>
                                                      </div>
                                                   </div>
                                                </div>

                                             </div>



                                          </div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>

                  </div>
                  <!-- *********** -->
               </div>
               <!-- Page-body end -->
            </div>
            <div id="styleSelector"></div>
         </div>
      </div>
   </div>
   <%@include file="/WEB-INF/views/history/addHistoryModal.jsp"%>
   <%@include file="/WEB-INF/views/history/addHistoryModalDetail.jsp"%>
   <%@include file="/WEB-INF/views/srInfo/addSrResourcesModal.jsp"%>
   <%@include file="/WEB-INF/views/fragments/bottom.jsp"%>
</body>
</html>
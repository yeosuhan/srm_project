<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<html>
	<head>
		<%@include file="/WEB-INF/views/fragments/header.jsp"%>
	    <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
	    
	    <style>
			.modal {
			   position: absolute;
			   top: 0;
			   left: 0;
			   /* width: 100%; */
			   /* height: 100%; */
			   display: none;
			   background-color: rgba(0, 0, 0, 0.4);
			   padding: 20px;
			}
			
			.modal.show {
			   display: block;
			}
			
			.modal_body {
			   position: absolute;
			   top: 50%;
			   left: 50%;
			   width: 800px;
			  /*  height: 600px; */
			   /* padding: 40px; */
			   /* text-align: center; */
			   background-color: rgb(255, 255, 255);
			   border-radius: 10px;
			   box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
			   transform: translateX(-50%) translateY(-50%);
			}
			
			.m_head {
			  /*  height: 10%; */
			   padding: 20px;
			   display: flex;
			   justify-content: space-between;
			   background-color: #448aff;
			   border-top-left-radius: 10px;
			   border-top-right-radius: 10px;
			}
			
			.m_body {
			   /* height: 82%; */
			   padding: 20px;
			}
			
			.m_footer {
			   height: 8%;
			   padding: 10px;
			   border-bottom-left-radius: 10px;
			   border-bottom-right-radius: 10px;
			   display: flex;
			   justify-content: end;
			}
			
			.modal_title {
			   font-size: 18px;
			   color: gray;
			   font-weight: 500;
			}
			
			.close_btn {
			   font-size: 20px;
			   color: rgb(139, 139, 139);
			   font-weight: 900;
			   cursor: pointer;
			}
			
			.modal_label {
			   padding-top: 10px;
			}
			
			.input_box {
			   width: 100%;
			   border: 1px solid rgb(189, 189, 189);
			   height: 30px;
			}
			
			.modal_btn {
			   width: 80px;
			   height: 30px;
			   border-radius: 5px;
			   text-align: center;
			   font-size: 14px;
			   font-weight: bolder;
			   padding-top: 5px;
			   margin-left: 5px;
			   font-family: sans-serif;
			}
			
			.cancle {
			   background-color: #448aff;
			   color: white;
			}
			
			.save {
			   background-color: #448aff;
			   color: white;
			}
			div .col {
			   float: left;
			}
			.form-group {
			   margin-left: 5px;
			}
		</style>
	</head>

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
		                    <div class="pcoded-inner-content">
		                        <div class="main-body">
		                            <div class="page-wrapper">
		                                <!-- Page-body start -->
		                                <div class="page-body">
		                                    <div class="row">
		                                        <div class="col-sm-12">
		                                            <!-- SRDemand card start -->
		                                            <div class="card">
		                                                <div class="card-header">
		                                                	<div class="row">
		                                                		<div class="col-10">
				                                                    <h5>SR 요청 관리</h5>
		                                                		</div>
		                                                		<div class="col-2">
				                                                    <button class="btn btn-info">요청 등록</button>
		                                                		</div>
		                                                	</div>
		                                                </div>
		                                                <div class="card-block ">
		                                                    <div class="row">
		                                                        <div class="col-12 ">
		                                                            <form action="/">
		                                                            	<div class="row">
		                                                            		<div class="col-5">
		                                                            			<label for="dmndYmdStart">조회 기간</label>
		                                                            			<input type="date" name="dmndYmdStart" id="dmndYmdStart">
		                                                            			<span>~</span>
		                                                            			<input type="date" name="dmndYmdEnd" id="dmndYmdEnd">
		                                                            		</div>
		                                                            		<div class="col-5">
		                                                            			<label for="sttsCd">진행 상태</label>
		                                                            			<select id="sttsCd" name="sttsCd">
		                                                            				<option value="0">요청</option>
		                                                            				<option value="1">반려</option>
		                                                            				<option value="2">접수</option>
		                                                            				<option value="3">개발중</option>
		                                                            				<option value="4">테스트</option>
		                                                            				<option value="5">개발 완료</option>
		                                                            			</select>
		                                                            		</div>
		                                                            		<div class="col-2"></div>
		                                                            		<div class="col-5">
		                                                            			<label for="">관련 시스템</label>
		                                                            			<select id="" name="">
		                                                            				<option value="0">워크넷</option>
		                                                            				<option value="1">고용정보원</option>
		                                                            				
		                                                            			</select>
		                                                            			<select id="" name="">
		                                                            				<option value="0">내부망</option>
		                                                            				<option value="1">외부망</option>
		                                                            				
		                                                            			</select>
		                                                            		</div>
		                                                            		<div class="col-5">
		                                                            			<label for="keyWord">키워드</label>
		                                                            			<input type="text" name="keyWord" id="keyWord">
		                                                            		</div>
		                                                            		<div class="col-2">
		                                                            			<button class="btn btn-info"><i class="ti-search"></i></button>
		                                                            		</div>
		                                                            	</div>
		                                                            </form>
		                                                        </div>
		                                                       	<div class="col-12" style="overflow-x: auto ">
		                                                       		<table class="table table-hover">
		                                                       			<thead>
		                                                       				<tr>
		                                                       					<th>순번</th>
		                                                       					<th>SR번호</th>
		                                                       					<th>시스템 구분</th>
		                                                       					<th>업무 구분</th>
		                                                       					<th>SR제목</th>
		                                                       					<th>담당자</th>
		                                                       					<th>완료 요청일</th>
		                                                       					<th>완료 예정일</th>
		                                                       					<th>진행 상태</th>
		                                                       					<th>상세보기</th>
		                                                       					
		                                                       				</tr>
		                                                       			</thead>
		                                                       			<tbody>
		                                                       				<tr>
		                                                       					<td>1</td>
		                                                       					<td>wok-1</td>
		                                                       					<td>워크넷</td>
		                                                       					<td>내부망</td>
		                                                       					<td>시스템 개선</td>
		                                                       					<td>홍길동</td>
		                                                       					<td>2023.2.18</td>
		                                                       					<td>2023.2.18</td>
		                                                       					<td>개발중</td>
		                                                       					<td><button class="btn btn-info btn-sm" data-toggle="modal"
														data-target="#srDemandModal">요청 상세</button></td>
		                                                       				</tr>
		                                                       				<tr>
		                                                       					<td>2</td>
		                                                       					<td>wok-2</td>
		                                                       					<td>워크넷</td>
		                                                       					<td>외부망</td>
		                                                       					<td>테스트</td>
		                                                       					<td>홍길동</td>
		                                                       					<td>2023.2.28</td>
		                                                       					<td>2023.2.28</td>
		                                                       					<td>요청</td>
		                                                       					<td><button class="btn btn-info btn-sm"  data-toggle="modal"
														data-target="#resourceSelectModal">요청 수정</button></td>
		                                                       				</tr>
		                                                       			</tbody>
		                                                       			<tfoot></tfoot>
		                                                       		</table>
		                                                       	</div>
		                                                    </div>
		                                                </div>
		                                            </div>
		                                            <!-- SRDemand card end -->
		                                        </div>
		                                    </div>
		                                </div>
		                                <!-- Page-body end -->
		                            </div>
		                        </div>
		                    </div>
		                </div>
		                <!-- Main-body end -->
		                <div id="styleSelector">
		                
		                </div>
		                    
		            </div>
		        </div>
		    </div>
		</div>
		
		<%@include file="/WEB-INF/views/fragments/bottom.jsp"%>
			
		
		<!-- fullcalendar CDN -->
		<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
		<!-- fullcalendar 언어 CDN -->
		<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
		
		<!-- 모달 -->
		<script src="/resources/assets/js/resourceSelectModal.js"></script>
		<jsp:include page="/WEB-INF/views/srDemandDetail.jsp"/>
		<jsp:include page="/WEB-INF/views/resourceSelectModal.jsp"/><!-- 임시 -->
	</body>

</html>

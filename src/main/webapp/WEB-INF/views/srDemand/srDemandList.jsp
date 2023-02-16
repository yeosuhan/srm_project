<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<html>
	<head>
		<%@include file="/WEB-INF/views/fragments/header.jsp"%>
	   
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
				                                                    <button class="btn btn-info" id="addbtn">요청 등록</button>
		                                                		</div>
		                                                	</div>
		                                                </div>
		                                                <div class="card-block ">
		                                                    <div class="row">
	                                                            <form  id="srSearchForm" >
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
	                                                            			<label for="sysCd">관련 시스템</label>
	                                                            			<select id="sysCd" name="sysCd">
	                                                            				<option value="0">워크넷</option>
	                                                            				<option value="1">고용정보원</option>
	                                                            				
	                                                            			</select>
	                                                            			<select id="taskSeCd" name="taskSeCd">
	                                                            				<option value="0">내부망</option>
	                                                            				<option value="1">외부망</option>
	                                                            				
	                                                            			</select>
	                                                            		</div>
	                                                            		<div class="col-5">
	                                                            			<label for="keyWord">키워드</label>
	                                                            			<input type="text" name="keyWord" id="keyWord">
	                                                            		</div>
	                                                            		<div class="col-2">
				                                                            <button onclick="srSearch()" type="button" class="btn btn-info"><i class="ti-search"></i></button>
	                                                            		</div>
	                                                            	</div>
	                                                            </form>
	                                                        </div>
	                                                       	<div class="row" style="width:100%;overflow-x: auto!important ">
	                                                       		<table class="table table-hover" id="srDemandTable">
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
	                                                       					<td><button class="btn btn-info btn-sm"  id="modbtn">요청 수정</button></td>
	                                                       				</tr>
	                                                       				<tr>
	                                                       					<td>3</td>
	                                                       					<td>wok-3</td>
	                                                       					<td>워크넷2</td>
	                                                       					<td>외부망</td>
	                                                       					<td>테스트</td>
	                                                       					<td>홍길동</td>
	                                                       					<td>2023.2.28</td>
	                                                       					<td>2023.2.28</td>
	                                                       					<td>접수</td>
	                                                       					<td><button class="btn btn-info btn-sm"  id="devbtn">개발등록</button></td>
	                                                       				</tr>
	                                                       			</tbody>
	                                                       		</table>
	                                                       	</div>
	                                                       	<div class="row">
	                                                       	<!-- 이곳에 페이징 -->
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
			
		
		<!-- 검색 -->
		<script src="/resources/assets/js/srDemandList.js"></script>
		
		<!-- 모달 -->
		
		<jsp:include page="/WEB-INF/views/srDemand/srDemandDetail.jsp"/>
		<jsp:include page="/WEB-INF/views/srDemand/modal.jsp"/>
		
	</body>

</html>

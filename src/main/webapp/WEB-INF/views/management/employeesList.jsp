<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
	<head>
		<%@include file="/WEB-INF/views/fragments/header.jsp"%>
		
		<style>
			table,th,td{			
				text-align:center;
				line-height:35px;		
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
							<div class="pcoded-inner-content pt-4">
								<div class="main-body">
									<div id="pageWrapper" class="page-wrapper">
										<!-- Page-body start -->
										<div class="page-body">
											<!-- *********** -->
											<!-- Hover table card start -->
											<div class="card">
												<div class="card-header">
													<h5>사원 관리</h5>
									
												<!-- 검색 -->	
												<div class="mt-4 mr-5">							
													<form>
								                       <div class="form-group row">
								                        	<label class="col-sm-1 col-form-label text-right">이름</label>
								                            <div class="col-sm-2">
								                                <input type="text" class="form-control">
								                            </div>
								                            <label class="col-sm-1 col-form-label text-right">부서</label>
								                            <div class="col-sm-2">
								                                <input type="text" class="form-control">
								                            </div>  
								                            <label class="col-sm-1 col-form-label text-right">직급</label>
								                            <div class="col-sm-2">
								                                <input type="text" class="form-control">
								                            </div>                       
								                            <div class="col-sm-3 d-flex justify-content-end pr-5">                      
								                            	<button class="btn btn-primary btn-round waves-effect waves-light">검색</button>
								                            </div> 
								                        </div>
													</form>
												</div>

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
												
												<div class="card-block table-border-style">
													<div class="table-responsive">
														<table class="table table-hover">
															<thead>
																<tr>
																	<th>번호</th>
																	<th>아이디</th>
																	<th>이름</th>											
																	<th>부서</th>
																	<th>직급</th>
																	<th>이메일</th>																
																</tr>
															</thead>
															<tbody>
																<tr onclick="show()" data-toggle="modal" data-target="ModalView">	
																	<th scope="row">1</th>
																	<td>test1</td>
																	<td>test1</td>
																	<td>test1</td>
																	<td>test1</td>
																	<td>test1</td>																
																</tr>
																<tr onclick="show()" data-toggle="modal" data-target="ModalView">
																	<th scope="row">2</th>
																	<td>test2</td>
																	<td>test2</td>
																	<td>test2</td>
																	<td>test2</td>
																	<td>test2</td>																															
																</tr>
																<tr onclick="show()" data-toggle="modal" data-target="ModalView">
																	<th scope="row">3</th>
																	<td>test3</td>
																	<td>test3</td>
																	<td>test3</td>
																	<td>test3</td>
																	<td>test3</td>	
																</tr>
															</tbody>
														</table>
													</div>
												</div>
												<!-- Modal 호출 include -->
												<%@include file="/WEB-INF/views/management/modalEmployeeManagement.jsp"%>												
											</div>
											<!-- Hover table card end -->	
										</div>
										<!-- *********** -->
										</div>
										<!-- Page-body end -->
									</div>
									<div id="styleSelector"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		<%@include file="/WEB-INF/views/fragments/bottom.jsp"%>
	</body>
</html>
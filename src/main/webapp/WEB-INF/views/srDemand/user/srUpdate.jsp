<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="${pageContext.request.contextPath}/resources/js/srDemand.js"></script>

<div class="card_body" id="sdupdate"
	style="font-size: 12px; padding-top: 20px; display: none;">
	<form action="/srdemand/modify" method="post" id="sdUpdateForm">
		<input type="hidden" name="dmndNo" class="dmndNo" value="${sd.dmndNo}">
		<div class="form-group row">
			<div class="col-sm-6">
				<div class="col col-sm-4 font-weight-bold">SR번호</div>
				<div class="col col-sm-6">
					<div type="text" class="dmndNo">${sd.dmndNo}</div>
				</div>
			</div>
		</div>
		<div class="form-group row">
			<div class="col col-sm-2 font-weight-bold">SR 제목</div>
			<div class="col col-sm-9">
				<input type="text" class="form-control ttl" name="ttl">
			</div>
		</div>
		<div class="form-group row">
			<div class="col col-sm-2 font-weight-bold">관련 근거</div>
			<div class="col col-sm-9">
				<input type="text" class="form-control relGrund" name="relGrund">
			</div>
		</div>
		<div class="form-group row">
			<div class="col-sm-6">
				<div class="col col-sm-4 font-weight-bold">시스템구분</div>
				<div class="col col-sm-6 sysNm">${sd.sysNm}</div>
			</div>
			<div class="col-sm-6">
				<div class="col col-sm-4 font-weight-bold">업무구분</div>
				<div class="col col-sm-4 taskSeNm">${sd.taskSeNm}</div>
			</div>
		</div>
		<div class="form-group row">
			<div class="col-sm-6">
				<div class="col col-sm-4 font-weight-bold">요청기관</div>
				<div class="col col-sm-6 instNm"></div>

			</div>
			<div class="col-sm-6">
				<div class="col col-sm-4 font-weight-bold">요청자</div>
				<div class="dropdown dropdown open clientNm"></div>
			</div>
		</div>
		<div class="form-group row">
			<div class="col-sm-6">
				<div class="col col-sm-4 font-weight-bold">요청일</div>
				<div class="col col-sm-8 dmndYmd"></div>
			</div>
			<div class="col-sm-6">
				<div class="col col-sm-4 font-weight-bold">완료요청일</div>
				<div class="col col-sm-8 cmptnDmndYmd">
					<input type="date" name="cmptnDmndYmd" name="cmptnDmndYmd">
				</div>
			</div>
		</div>
		<div class="row mt-3">
			<div class="col-6">
				<div class="col col-sm-4 font-weight-bold">진행 상태</div>
				<div class="col col-sm-6">
					<div class="form-control sttsNm" disabled></div>
				</div>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 col-form-label font-weight-bold"
				style="line-height: 100px; font-size: 12px;">SR 내용</label>
			<div class="col-sm-9">
				<textarea rows="5" cols="5" class="form-control cn"
					style="height: 100px;" name="cn"></textarea>
			</div>
		</div>
		<div class="form-group row">
		<p class="col-sm-2 font-weight-bold">첨부파일</p>
		<div class="col-sm-5">
			<c:forEach var="f" items="${sd.attachFile}">
				<div>
					<a href="<c:url value='/file/download/${f.fileSn}' />"> <span
						class="glyphicon glyphicon-save" aria-hidden="true"></span> <span>
							${f.orgnlFileNm} </span>
					</a> <span> Size : ${f.fileSz} Bytes</span>
				</div>
			</c:forEach>
		</div>
	</div>
	</form>
	<div class="row">
		<div class="col-6"></div>
		<div class="col-6" style="text-align: right">
			<button type="submit" class="modal_btn save center"
				form="sdUpdateForm">저장</button>
			<button class="btn btn-oti danger cancle">삭제</button>
		</div>
	</div>
</div>
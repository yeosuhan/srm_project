<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script
	src="${pageContext.request.contextPath}/resources/js/srDemand.js"></script>

<div class="card_body" id="sdupdate"
	style="font-size: 12px; padding-top: 20px;">
	<form action="/srdemand/modify" method="post" id="sdUpdateForm">
		<input type="hidden" name="dmndNo" class="dmndNo" value="${sd.dmndNo}">
		<div class="form-group row">
			<div class="col col-sm-2 font-weight-bold  px-0">SR번호</div>
			<div class="col col-sm-9">
				<div class="form-control dmndNo"
					style="font-size: 12px; width: 325px;">${sd.dmndNo}</div>
			</div>
		</div>
		<div class="form-group row">
			<div class="col col-sm-2 font-weight-bold px-0">SR 제목</div>
			<div class="col col-sm-10">
				<input type="text" class="form-control ttl" name="ttl"
					value="${sd.ttl}">
			</div>
		</div>
		<div class="form-group row">
			<div class="col col-sm-2 font-weight-bold px-0">관련 근거</div>
			<div class="col col-sm-10">
				<texarea class="form-control relGrund" name="relGrund">${sd.relGrund}</texarea>
			</div>
		</div>
		<div class="form-group row">
			<div class="col-sm-6 px-0">
				<div class="col col-sm-4 font-weight-bold px-0">시스템구분</div>
				<div class="col col-sm-6 sysNm">${sd.sysNm}</div>
			</div>
			<div class="col-sm-6 px-0">
				<div class="col col-sm-4 font-weight-bold px-0">업무구분</div>
				<div class="col col-sm-4 taskSeNm">${sd.taskSeNm}</div>
			</div>
		</div>
		<div class="form-group row">
			<div class="col-sm-6">
				<div class="col col-sm-4 font-weight-bold px-0" >요청기관</div>
				<div class="col col-sm-6 instNm">${sd.instNm}</div>

			</div>
			<div class="col-sm-6">
				<div class="col col-sm-4 font-weight-bold px-0">요청자</div>
				<div class="col col-sm-6 clientNm">${sd.clientNm}</div>
			</div>
		</div>
		<div class="form-group row">
			<div class="col-sm-6 px-0">
				<div class="col col-sm-4 font-weight-bold px-0">요청일</div>
				<div class="col col-sm-8 dmndYmd">${sd.dmndYmd}</div>
			</div>
			<div class="col-sm-6 px-0">
				<div class="col col-sm-4 font-weight-bold">완료요청일</div>
				<div class="col col-sm-8 cmptnDmndYmd">
					<input type="date" name="cmptnDmndYmd" name="cmptnDmndYmd"
						value="${sd.cmptnDmndYmd}">
				</div>
			</div>
		</div>
		<div class="row mt-3">
			<div class="col-6">
				<div class="col col-sm-4 font-weight-bold px-0">진행 상태</div>
				<div class="col col-sm-6">
					<div class=" sttsNm">${sd.sttsNm}</div>
				</div>
			</div>
		</div>
		<div class="form-group row">
			<label class=" px-0 col-sm-2 col-form-label font-weight-bold"
				style="line-height: 100px; font-size: 12px;">SR 내용</label>
			<div class="col-sm-9">
				<textarea rows="5" cols="5" class="form-control cn"
					style="height: 100px;" name="cn">${sd.cn}</textarea>
			</div>
		</div>
		<div class="form-group row">
			<p class="col-sm-2 font-weight-bold px-0">첨부파일</p>
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
			<button type="submit" class="btn-oti save center" form="sdUpdateForm">저장</button>
			<button class="btn-oti">삭제</button>
		</div>
	</div>
</div>
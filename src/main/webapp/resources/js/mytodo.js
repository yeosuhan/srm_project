/**
 * 
 * @param sttsCd
 * @returns
 */
var sttsCode;
function moveTab(sttsCd) {
	$('.nav-link').removeClass('active');
	
	sttsCode = sttsCd;
	var className = ".sttsCd" + sttsCd;
	$(className).addClass('active');
	
	$.ajax({
		url : "/myportal/mytodo",
		type : "GET",
		data : {
			"sttsCd" : sttsCd 
		},
		success : function(res) {		
			// 목록
			makeSrRows(res.srList);
			
			//pager
			var url = "/myportal/mytodo?sttsCd=" + sttsCd + "&page=";
			reloadPager(res.pager, url, 'mytodoPaging')
		}			
	});
}

/**
 * json타입의 srList , pager 을 받아 다시 데이터를 재로드
 * @param data : ajax 통신 후 응답객체
 * @author : 신정은
 */
function makeSrRows(srList) {
	var element = document.createElement('div');
	element.innerHTML = '<sec:authentication property="principal.authorities[0]"/>';
	// 목록
	var trs;
	$('tbody').empty();
	for (var idx = 0; idx < srList.length; idx++) {
		var tr = "<tr> " 
				+	"<td class='text-left'>" + srList[idx].dmndNo + "</td>"
				+	"<td class='text-left'>" + srList[idx].sysNm + "</td>"
				+	"<td class='text-left'>" + srList[idx].taskNm + "</td>";
		
		var ttl = srList[idx].ttl;
		if(ttl.length > 10) {
			ttl = ttl.substr(0,10) + "...";
		}
			tr = tr +	"<td class='text-center'>" + ttl + "</td>";
			
		var picNm = srList[idx].picNm;
		if(picNm !== "null") {
			console.log("들어옴~~~~~~~~~~~~~~   " + picNm);
			tr = tr +"<td class='text-center'>" + srList[idx].picNm + "</td>"
			
		}else if(picNm === "null") {
			console.log("pic 널 들어옴~~~~~~~~~~~~~~   " + picNm);
			tr = tr +"<td class='text-center'></td>";
		}
			tr = tr + "<td class='text-center'>" + srList[idx].cmptnDmndYmd + "</td>"					
					+	"<td class='text-center'>" + srList[idx].sttsNm + "</td>";

		if((srList[idx].sttsCd > 1) && (srList[idx].rn != "null")) {
		/*	console.log("111111");
			console.log("11  " + srList[idx].rnk);
			console.log("11  " +srList[idx].sttsCd);*/
			tr = tr 
				+	"<td class='text-center'>" + srList[idx].rnk + "</td>"
				+ 	"</tr>";
		} else {
			/*console.log("222222");
			console.log("22  " + srList[idx].rnk);
			console.log("22  " +srList[idx].sttsCd);*/
			tr = tr 
			+ 	"</tr>";
		}
				
		trs = trs + tr;
		
		$("#dmndNo" + idx).text(srList[idx].dmndNo);
		$("#sysNm" + idx).text(srList[idx].sysNm);
		$("#taskNm" + idx).text(srList[idx].taskSeNm);
		$("#ttl" + idx).text(srList[idx].ttl);
		$("#picNm" + idx).text(srList[idx].picNm);
		$("#cmptnDmndYmd" + idx).text(srList[idx].cmptnDmndYmd);
		$("#sttsNm" + idx).text(srList[idx].sttsNm);
		$("#rnk" + idx).text(srList[idx].rnk);		
	}
	$('tbody').html(trs);
}


/**
 * 
 * @param url
 * @returns
 */
function mytodoPaging(url) {
	console.log(url);
	
	$.ajax({
		url : url,
		type : "GET",
		success : function(res) {			
			//목록
			makeSrRows(res.srList);
			
			//pager
			var url = "/myportal/mytodo?sttsCd=" + sttsCode + "&page=";
			reloadPager(res.pager, url, 'mytodoPaging')
			
		}
	
	});
}
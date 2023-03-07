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
	console.log(sttsCd);
	$(className).addClass('active');
	
	$.ajax({
		url : "/myportal/mytodo",
		type : "GET",
		data : {
			"sttsCd" : sttsCd 
		},
		success : function(res) {
			console.log(res.srList);
			console.log(res.pager);
			
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
	// 목록
	var trs;
	$('tbody').empty();
	for (var idx = 0; idx < srList.length; idx++) {
		var tr = "<tr> " 
				+	"<td>" + srList[idx].dmndNo + "</td>"
				+	"<td>" + srList[idx].sysNm + "</td>"
				+	"<td>" + srList[idx].taskNm + "</td>"
				+	"<td>" + srList[idx].ttl + "</td>"
				+	"<td>" + srList[idx].picNm + "</td>"
				+	"<td>" + srList[idx].cmptnDmndYmd + "</td>"
				+	"<td>" + srList[idx].sttsNm + "</td>";
		if(srList[idx].sttsCd > 1) {
			tr = tr 
				+	"<td>" + srList[idx].rnk + "</td>"
				+ 	"</tr>";
		} else {
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
		$("#sttsNm" + idx).text(srList[idx].rnk);
		
		var test = $("#dmndNo" + idx).text();
		console.log("test :  " + test);
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
			console.log(res.srList);
			console.log(res.pager);
			
			//목록
			makeSrRows(res.srList);
			
			//pager
			var url = "/myportal/mytodo?sttsCd=" + sttsCode + "&page=";
			reloadPager(res.pager, url, 'mytodoPaging')
			
		}
	
	});
}
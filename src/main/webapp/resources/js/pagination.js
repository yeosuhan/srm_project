/* json의 Pager을 받을 경우 해당 데이터를 기반으로 pager 재로드하기 위함
 * pager : ajax 통신 후 pager를 가진 응답객체
 * url : 이동시킬 url을 전달해준다.
 * onclickMethod : 각자 onclick시 사용되는 메소드 이름을 전달해준다.
 * 
 * @author : 신정은
 * */
function reloadPager(pager, url, onclickMethod) {
	console.log("공용 pager 들어옴 ~~~~~");
	$('.pagination').empty();
	var tags = "";
	if(pager.startPageNo -1 > 0) {
		tags = "<a class='pagination-newer' href='#' onclick='" + onclickMethod + "(\"" + url + (pager.startPageNo - 1) +"\")'>PREV</a>";
	}
	for (var pageNo = pager.startPageNo; pageNo <= pager.endPageNo; pageNo++) {
		if(pager.pageNo == pageNo){
			tags = tags + "<a class='pagination-active' href='#' onclick='" + onclickMethod + "(\"" + url + pageNo +"\")'>" + pageNo +"</a>";					
		} else {
			tags = tags + "<a href='#' onclick='" + onclickMethod + "(\"" + url + pageNo +"\")'>" + pageNo +"</a>";					
		}
	}
	$('.pagination').html(tags);
}

/*
* @author : 안한길
* */
$('.pagination-inner a').on('click', function() {
		$(this).siblings().removeClass('pagination-active');
		$(this).addClass('pagination-active');
})

$(document).ready(function(){	
	var currentUrl=window.location.href;
	//파라미터 여부
	if(currentUrl.indexOf('?')!=-1 && currentUrl.indexOf('?')!=currentUrl.length-1){
		
		var indexOfFilter = currentUrl.indexOf('&');
		var filter=null;
		//page파라미터와 다른 파라미터가 있는경우
		if(indexOfFilter!=-1&&currentUrl.indexOf('page')!=-1){
			filter=currentUrl.substring(indexOfFilter,currentUrl.length);
			$(".pagination a").each((index,value)=>{

				$(value).attr("href",$(value).attr("href")+filter)
				//console.log($(value).attr("href"));
			});
		}else if(currentUrl.indexOf('page')==-1){//파라미터가 page가 아닌경우
			indexOfFilter=currentUrl.indexOf('?');
			filter=currentUrl.substring(indexOfFilter+1,currentUrl.length);
			$(".pagination a").each((index,value)=>{
				$(value).attr("href",$(value).attr("href")+"&"+filter)
				//console.log($(value).attr("href"));
			});
		}
	}
});

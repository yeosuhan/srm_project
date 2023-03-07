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
	var tags;
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
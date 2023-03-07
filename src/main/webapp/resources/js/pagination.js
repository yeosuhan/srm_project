/*
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
		//page파라미터를 제외한 파라미터가 있는경우
		if(indexOfFilter!=-1){
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
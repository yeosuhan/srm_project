/* js파일에서 사용할 contextPath구하는 함수
 * 출처:https://m.blog.naver.com/PostView.naver?isHttpsRedirect=true&blogId=mk1126sj&logNo=221019411361
 * 
 * 
 * */
function getContextPath(){
	var hostIndex = location.href.indexOf( location.host )+location.host.length; //host의 주소값 인덱스
	var contextPath = location.href.substring( hostIndex, location.href.indexOf('/',hostIndex+1)); //host주소값 부터 '/'까지
	console.log(contextPath);
	return contextPath;
}
function srSearch(){
	var formData = $("#srSearchForm").serialize();
	console.log(formData);
	$.ajax({
		url:"srSearch",
		type:"post",
		data:formData,
		success:function (result){
			/*result.forEach((value,index)=>{
				var tableRow="<tr>" +
				"	<td>"+index+"</td>" +
				"	<td>"+value.dmndNo+"</td>" +
				"	<td>"+value.sysNm+"</td>" +
				"	<td>"+value.taskSeNm+"</td>" +
				"	<td>"+value.ttl+"</td>" +
				"	<td>"+value.picNm+"</td>" +
				"	<td>"+value.cmptnDmndYmd+"</td>" +
				"	<td>"+value.endYmd+"</td>" +
				"	<td>"+value.sttsNm+"</td>" +
				"	<td><button class='btn btn-info btn-sm' data-toggle='modal' data-target='#srDemandModal'>";
				if(value.sttsNm=='요청' && ${memberType}=='Client'){
					tableRow +="요청수정</button></td></tr>";
				}else if(value.sttsNm == '접수' && ${memberType}=='Admin'){
					tableRow +="개발 등록</button></td></tr>";
				}else{
					tableRow +="요청상세</button></td></tr>";
				}
				$("#srDemandTable tbody").empty();
				$("#srDemandTable tbody").append(tableRow);
				
			});*/
			console.log(result);
			$("#srDemandTable tbody").empty();
			$("#srDemandTable tbody").append("<tr><td colSpan='10'>테스트</td></tr>");
		}
	});
}
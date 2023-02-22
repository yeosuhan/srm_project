$(document).ready(function(){
	/* sr자원 정보 가져오는 함수
	 * @author:안한길
	 * 
	 */	
	$("#srResourceTab").on("show.bs.tab",function(){
		var srNo=$("#srNo").val();
		if($("#resourceTableRow tr").length==0){
			
			$.ajax({
				url:"/sr-resource/list",
				type:"GET",
				data:{srNo:srNo},
				success:function(result){
					//console.log(result);
					result.forEach((value,index)=>{
						var count = index+1;
						$("#resourceTableRow").append(
								"<tr>" +
								"	<th scope='row'>"+count+"</th>" +
								"	<td>" +
								"		<input value='"+value.srSrc+"' name='resource' type='checkbox'>" +
								"	</td>" +
								"	<td>"+value.empId+"</td>" +
								"	<td>"+value.ptcptnRoleCd+"</td>" +
								"	<td>"+value.schdlBgngYmd+"</td>" +
								"	<td>"+value.schdlEndYmd+"</td>" +
								"</tr>"
						);
						
					});
				}
			});
		}
		
	});
	
	
});

function addResource(){
	//var resourceForm = $("#resourceForm").serialize();//serialize()로 생성되는 데이터는 json형식과 맞지 않는다.
	var resourceForm ={
			"srNo":$("#resourceForm #srNo").val(),
			"empId":$("#resourceForm #empId").val(),
			"ptcptnRoleCd":$("#resourceForm #ptcptnRoleCd").val(),
			"schdlBgngYmd":$("#resourceForm #schdlBgngYmd").val(),
			"schdlEndYmd":$("#resourceForm #schdlEndYmd").val()
	}
	console.log(resourceForm);
	$.ajax({
		url:"/sr-resource/resource/add",
		type:"POST",
		contentType:"application/json", //form데이터를 json 형식으로
		data:resourceForm,
		success:function(result){
			console.log(result);
			
		}
	});
}
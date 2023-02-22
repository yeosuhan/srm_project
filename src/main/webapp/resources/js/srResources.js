function getResourceList(){
	var srNo=$("#srNo").val();
	$.ajax({
		url:"/sr-resource/list",
		type:"GET",
		data:{srNo:srNo},
		success:function(result){
			console.log(result);
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
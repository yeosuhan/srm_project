$(document).ready(function(){
	/* sr자원 정보 가져오는 함수
	 * @author:안한길
	 * 
	 */	
	$("#srResourceTab").on("shown.bs.tab",function(){
		getResourceTableRow();
		});
	
});

function getResourceTableRow(){
	var srNo=$("#srNo").val();
	console.log(srNo);
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
							"	<td>"+value.empNm+"</td>" +
							"	<td>"+value.ptcptnRoleNm+"</td>" +
							"	<td>"+value.schdlBgngYmd+"</td>" +
							"	<td>"+value.schdlEndYmd+"</td>" +
							"</tr>"
					);
					
				});
			}
		});
	}
	
}
function deleteResource(){
	var srSrcList=new Array();
	
	$("#resourceTableRow input[name='resource']:checked").each(function(){
		srSrcList.push($(this).val());
	});
	
	console.log(srSrcList);
	$.ajax({
		url:"/sr-resource/resource/delete",
		type:"GET",
		dataType:"json",
		data:{srSrc:srSrcList},
		success:function(result){
			//console.log(result+""+srSrcList.length);
			if(result==srSrcList.length){
				$("#resourceTableRow input[name='resource']:checked").each(function(){
					$(this).parent("td").parent("tr").remove();
				});
			}
		}
	});
}
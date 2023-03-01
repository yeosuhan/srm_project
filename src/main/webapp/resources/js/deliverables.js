$(document).ready(function(){
	/* sr산출물 정보 가져오는 함수
	 * @author:안한길
	 * 
	 */	
	$(".collapse").on("shown.bs.collapse",function(){
		//console.log($(this).parent("tbody").children("tr").children(".prgrsIdTd").children("input").val());
		console.log($(this).attr("id"));
		getDeliverablesTableRow($(this).attr("id")); //진척율 아이디
		});
	$("a[href='#messages1']").on("hide.bs.tab",function(){
		
		$(".collapse").collapse("hide");
	});
	/* 산출물 추가 모달 (산출물 구분 목록 가져오는 기능)
    * @author: 안한길
    * */
   $("#addModal").on('show.bs.modal',function() 
   {
      var srNo=$("#srNo").val();
      console.log(srNo);

      console.log(getContextPath());
      if($("#addModal option").length==0){
         //산출뭏 구분 목록
         /*$.ajax({
            url:"",
            type:"GET",
            data:srNo,
            success:function(result){
               result.forEach((value,index)=>{
               	  $("#addModal select").empty();
                  $("#addModal select").append(
                        "<option value='"+value.prgrsId+"'>" +value.prgrsSeNm+"</option>"
                  );
               });
            }
         });*/
      }
      
   });
});

function getDeliverablesTableRow(collapseId){
	
	var prgrsId=$("#SRPgPrgrsId"+collapseId.charAt(8)).val();
    console.log(prgrsId);
	if($("#"+collapseId+" .deliverableTable tbody tr").length==0){
		
		$.ajax({
			url:"/deliverable/list",
			type:"GET",
			data:{prgrsId:prgrsId},
			success:function(result){
				//console.log(result);
				if(result != null){
					result.forEach((value,index)=>{
						var count = index+1;
						$("#"+collapseId+" .deliverableTable tbody").append(
								"<tr>" +
								"	<th scope='row'>"+count+"</th>" +
								"	<td>" +
								"		<input value='"+value.delivId+"' name='delivId' type='checkbox'>" +
								"	</td>" +
								"	<td>"+value.prgrsSeNm+"</td>" +
								"	<td>"+value.delivNm+"</td>" +
								"	<td>"+value.delivUrl+"</td>" +
								"	<td>"+value.rgtrNm+"</td>" +
								"	<td>"+value.regYmd+"</td>" +
								"</tr>"
						);
					});
				}else{
					$("#"+collapseId).collapse("hide");
				}
			}
		});
	}
	
}
/* 산출물 삭제
 * @author : 안한길
 * */
function deleteDeliverable(){
	var srDeliverableList=new Array();
	
	$(".deliverableTable tbody input[name='delivId']:checked").each(function(){
		srDeliverableList.push($(this).val());
	});
	
	console.log(srDeliverableList);
	$.ajax({
		url:"/deliverable/delete",
		type:"GET",
		dataType:"json",
		data:{delivId:srDeliverableList},
		success:function(result){
			//console.log(result+""+srDeliverableList.length);
			if(result==srDeliverableList.length){
				$(".deliverableTable tbody input[name='delivId']:checked").each(function(){
					$(this).parent("td").parent("tr").remove();
				});
			}
		}
	});
}

/* 입력한 산출물 정보 추가
 * @author : 안한길
 * */
function addDeliverable(){
   //var deliverableForm = $("#deliverableForm").serialize();//serialize()로 생성되는 데이터는 json형식과 맞지 않는다.
   var deliverableForm ={
         "prgrsId":$("#prgrsIdSelect").val(),
         "delivUrl":$("#delivUrl").val(),
         "delivNm":$("#delivNm").val()
   }
   console.log(deliverableForm);
   $.ajax({
      url:"/deliverable/add",
      type:"POST",
      //contentType:"application/json", //form데이터를 json 형식으로
      data:deliverableForm,
      success:function(result){
         //console.log(result);
         if(result!=0){
            $(".deliverableTable tbody").empty();
            $(".collapse").collapse("hide");
         }
      }
   });
   
}
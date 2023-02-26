$(document).ready(function(){
	/* sr산출물 정보 가져오는 함수
	 * @author:안한길
	 * 
	 */	
	$("a[href='#settings1']").on("shown.bs.tab",function(){
		getDeliverablesTableRow();
		});
	
	/* 산출물 추가 모달 (산출물 구분 목록 가져오는 기능)
    * @author: 안한길
    * */
   $("#addModal").on('show.bs.modal',function() 
   {
      var deptCd=$("#deptCd").val();
      console.log(deptCd);

      console.log(getContextPath());
      if($("#addModal option").length==0){
         //산출뭏 구분 목록
         $.ajax({
            url:"/member/department",
            type:"GET",
            success:function(result){
               result.forEach((value,index)=>{
                  $("#addModal select").append(
                        "<option value='"+value.prgrsId+"'>" +value.prgrsSeNm+"</option>"
                  );
               });
            }
         });
      }
      
   });
});

function getDeliverablesTableRow(){
	var srNo=$("#srNo").val();
	console.log(srNo);
	$("#settings1 tbody").empty();//상세정보 변경 함수에 넣기
    console.log(getContextPath());
	if($("#settings1 tr").length==0){
		
		$.ajax({
			url:"/deliverable/list",
			type:"GET",
			data:{srNo:srNo},
			success:function(result){
				//console.log(result);
				result.forEach((value,index)=>{
					var count = index+1;
					$("#settings1 tbody").append(
							"<tr>" +
							"	<th scope='row'>"+count+"</th>" +
							"	<td>" +
							"		<input value='"+value.delivId+"' name='resource' type='checkbox'>" +
							"	</td>" +
							"	<td>"+value.prgrsSeNm+"</td>" +
							"	<td>"+value.delivNm+"</td>" +
							"	<td>"+value.regYmd+"</td>" +
							"</tr>"
					);
					console.log(value.delivUrl);
					console.log(value.rgtrId);
				});
			}
		});
	}
	
}
/* 산출물 삭제
 * @author : 안한길
 * */
function deleteDeliverable(){
	var srDeliverableList=new Array();
	
	$("#settings1 tbody input[name='resource']:checked").each(function(){
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
				$("#settings1 tbody input[name='resource']:checked").each(function(){
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
         "prgrsId":$("#addModal select").val(),
         //"delivUrl":$("#addResourceForm #empId").val(),
         //"delivNm":$("#addResourceForm #ptcptnRoleCd").val(),
         //"rgtrId":$("#addResourceForm #schdlBgngYmd").val(),
         "regYmd":$("#addModal input[type='date']").val()
   }
   //console.log(resourceForm);
   $.ajax({
      url:"/deliverable/add",
      type:"POST",
      //contentType:"application/json", //form데이터를 json 형식으로
      data:deliverableForm,
      success:function(result){
         //console.log(result);
         if(result!=0){
            $("#settings1 tbody").empty();
            getDeliverablesTableRow();
         }
      }
   });
   
}
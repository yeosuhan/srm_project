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
	$("#addmodal .modal_btn").on("click",function(){
		$("#addmodal select option:selected").prop("selected",false);
		$("#addmodal input").val("");
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
								"<tr id='tr"+value.delivId+"' class='deliverableTr' onclick='modifyDeliverable(this)'>" +
								"	<th scope='row'>"+count+"</th>" +
								"	<td class='delivIdTd' onclick='event.cancelBubble=true'>" +
								"		<input value='"+value.delivId+"' name='delivId' type='checkbox'>" +
								"		<button style='display:none' class='btn btn-info' onclick='modifyDeliverableSubmit("+value.delivId+")'>수정</button>"+
								"	</td>" +
								"	<td>"+value.prgrsSeNm+"</td>" +
								"	<td class='delivNmTd'>"+value.delivNm+"</td>" +
								"	<td class='delivUrlTd'>"+value.delivUrl+"</td>" +
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
         "prgrsId":$("#SRPgPrgrsId"+($("#prgrsIdSelect").val()-1)).val(),
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

function modifyDeliverable(e){
	var delivNm=null;
	var delivUrl=null;
	if(!$(e).children(".delivNmTd").children("div").children(".modifyDelivNm").length){
		
		$(e).children(" .delivIdTd").children( "input").css("display","none");
		$(e).children(".delivIdTd").children("button").css("display","");
		delivNm=$(e).children(" .delivNmTd").text();
		$(e).children(" .delivNmTd").text("");
		$(e).children(" .delivNmTd").append(
				"<div onclick='event.cancelBubble=true'>" +
				"	<input class='modifyDelivNm changed' value='"+delivNm+"'>" +
				"	<input type='hidden' class='modifyDelivNm preValue' value='"+delivNm+"'>" +
				"</div>"
		);
		delivUrl=$(e).children(" .delivUrlTd").text();	
		$(e).children(" .delivUrlTd").text("");		
		$(e).children(" .delivUrlTd").append(
				"<div onclick='event.cancelBubble=true'>" +
				"	<input class='modifyDelivUrl changed' value='"+delivUrl+"'>" +
				"	<input type='hidden' class='modifyDelivUrl preValue' value='"+delivUrl+"'>" +
				"</div>"
		);
	}else{
		$(e).children(" .delivIdTd").children( "input").css("display","");
		$(e).children(".delivIdTd").children("button").css("display","none");
		
		delivNm = $(e).children(".delivNmTd").children("div").children(".modifyDelivNm.preValue").val();
		delivUrl = $(e).children(".delivUrlTd").children("div").children(".modifyDelivUrl.preValue").val();
		$(e).children(".delivUrlTd").children("div").remove();
		$(e).children(".delivNmTd").children("div").remove();
		//수정된 파일명
		$(e).children(" .delivNmTd").text(delivNm);
		//수정된 경로
		$(e).children(" .delivUrlTd").text(delivUrl);	
	}
	
}
/* 산출물 수정
 * @author:안한길
 * 
 */
function modifyDeliverableSubmit(delivId){
	var delivUrl=null;
	var delivNm=null;
	if($("#tr"+delivId+" .modifyDelivNm.changed").val()!=$("#tr"+delivId+" .modifyDelivNm.preValue").val()){
		delivNm=$("#tr"+delivId+" .modifyDelivNm.changed").val();
	}
	if($("#tr"+delivId+" .modifyDelivUrl.changed").val()!=$("#tr"+delivId+" .modifyDelivUrl.preValue").val()){
		delivUrl=$("#tr"+delivId+" .modifyDelivUrl.changed").val();
	}
	var deliverableForm = {
		  "delivId":delivId,
	      "delivUrl":delivUrl,
	      "delivNm":delivNm
	 }
	 $.ajax({
	      url:"/deliverable/modify",
	      type:"POST",
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

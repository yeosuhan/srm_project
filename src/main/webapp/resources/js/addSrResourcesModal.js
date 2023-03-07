var calendar=null;

$(document).ready(function(){
   /* 자원정보 추가 모달
    * @author: 안한길
    * */
   $("#addSrResourcesModal").on('show.bs.modal',function(){
      var calendarEl=null;
      var deptCd=$("#dept").val();
      //console.log(deptCd);
      $("#addSrResourceModalDept option[value='"+deptCd+"']").prop("selected",true);
      //console.log(getContextPath());
      if($("#empId option").length==0){
    	  /*달력*/
          calendarEl= $('#calendar')[0];
       
          calendar = new FullCalendar.Calendar(calendarEl,{
             headerToolbar:{
                left : 'prev, next',
                center: 'title',
                right:''
             },
             height:400,
             initialView: 'dayGridMonth',
             eventDataTransform: function(events) {                                                                                                                                
           	  if(events.allDay) {                                                                                                                                               
           		  events.end = moment(events.end,'YYYY-MM-DD').add(1, 'days').format('YYYY-MM-DD HH:mm:SS')                                                                                                                 
           	  }
           	  return event;  
             }  ,
          });
          calendar.render();
          //처음 모달을 열때 달력이 안보이는 문제
          $(".fc-scroller td, th").css('width','50px');
          $(".fc-event-time").empty();
          
         /*개발자 목록*/
         getEmployeeList(deptCd);
      }else{
    	  showSchedule();
      }
      
   });
   
   /*모달 닫을때*/
   $("#addSrResourcesModal").on('hide.bs.modal',function(){
	   $("#addResourceForm #schdlEndYmd").val("");
	   $("#addResourceForm #schdlBgngYmd").val("");
	   $("#addResourceForm #empId option:selected").prop("selected",false);
	   $("#addResourceForm #ptcptnRoleCd option:selected").prop("selected",false);
	   if($("#addResourceForm #updateSrSrc").length){
		   $(".changed").removeClass("changed");
	       $("#addResourceForm #updateSrSrc").remove();
	         
	       $("#addResourceBtn").css("display","");
	       $("#modifyResourceBtn").css("display","none");
	         
	       $("#empId").attr("disabled",false);
	   }
   });
   
   /*자원 정보 수정값 입력시*/
   $("#ptcptnRoleCd").change(function(){
	  $(this).addClass("changed"); 
   });
   $("#schdlBgngYmd").change(function(){
		  $(this).addClass("changed"); 
   });
   $("#schdlEndYmd").change(function(){
		  $(this).addClass("changed"); 
   });
   //부서 변경시 개발자 목록 불러오기
   $("#addSrResourceModalDept").change(function(){
	  getEmployeeList($("#addSrResourceModalDept option:selected").val()); 
   });
});
/* 개발자 목록 가져오는 함수
 * @author : 안한길
 * */
function getEmployeeList(deptCd){
	$("#empId").empty();
	$("#empId").append(
            "<option>선택</option>"
    );
	calendar.getEvents().forEach((value)=>{
        //console.log(value);
        value.remove();
    });
	$.ajax({
        url:"/member/department",
        type:"GET",
        async: false,
        data:{deptCd:deptCd},
        success:function(result){
           result.developers.forEach((value,index)=>{
              $("#empId").append(
                    "<option value='"+value.empId+"'>" +value.flnm+"</option>"
              );
           });
        }
     });
}
/* 선택된 개발자 일정 가져오는 함수
 * @author: 안한길
 * */
function showSchedule(){
   var empId=$("#empId option:selected").val();
   $.ajax({
      url:"/sr-resource/resource/schedule",
      type:"GET",
      data:{empId:empId},
      success:function(result){
         //이벤트 제거
         calendar.getEvents().forEach((value)=>{
            //console.log(value);
            value.remove();
         });
         //이벤트 추가
         //console.log(result);
         result.forEach((value)=>{
            calendar.addEvent(value);
         });
         $(".fc-event-time").empty();
      }
   });

};
/* 입력한 자원정보 추가
 * @author : 안한길
 * */
function addResource(){
   //var resourceForm = $("#addResourceForm").serialize();//serialize()로 생성되는 데이터는 json형식과 맞지 않는다.
   var resourceForm ={
         "srNo":$("#addResourceForm #srNo").val(),
         "empId":$("#addResourceForm #empId").val(),
         "ptcptnRoleCd":$("#addResourceForm #ptcptnRoleCd").val(),
         "schdlBgngYmd":$("#addResourceForm #schdlBgngYmd").val(),
         "schdlEndYmd":$("#addResourceForm #schdlEndYmd").val()
   }
   //console.log(resourceForm);
   $.ajax({
      url:"/sr-resource/resource/add",
      type:"POST",
      //contentType:"application/json", //form데이터를 json 형식으로
      data:resourceForm,
      success:function(result){
         //console.log(result);
         if(result!=0){
            $("#resourceTableRow").empty();
            getResourceTableRow();
         }
      }
   });
   
}
/* 개발자의 역할 목록을 가져오는 함수
 * @Author : 안한길
 * */
function getPtcptnRoleCd(){
	
	if(!$("#ptcptnRoleCd option").length){
		$.ajax({
			url:"/roles",
			type:"GET",
            async: false,
			success:function(result){
				result.forEach((value)=>{
					$("#ptcptnRoleCd").append(
							"<option value='"+value.roleCd+"'>" +
									value.roleNm+
							"</option>"
					);
				});
			}
		})
	}
	
}


/*자원 정보 수정 모달로 변경*/
function openUpdateResourceModal(srSrc,empId,ptcptnRoleCd){
	$("#addSrResourcesModal").modal("show");
	
	//개발자
	$("#addSrResourceModalDept").attr("disabled",true);
	$("#empId option[value='"+empId+"']").prop("selected",true);
	showSchedule();
	$("#empId").attr("disabled",true);
	
	//역할 
	getPtcptnRoleCd();
	$("#ptcptnRoleCd option[value='"+ptcptnRoleCd+"']").prop("selected",true);
	
	
	//투입 시작일
	$("#schdlBgngYmd").val($("#schdlBgngYmd"+srSrc).text());
	//투입 종료일
	$("#schdlEndYmd").val($("#schdlEndYmd"+srSrc).text());
	//srSrc 값 추가
	$("#addResourceForm").append(
			"<input type='hidden' id='updateSrSrc' value='"+srSrc+"'>"
	);
	
	$("#addResourceBtn").css("display","none");
	$("#modifyResourceBtn").css("display","");
	
}

function modifyResource(){
	//변경된 값이 있다면
	console.log($(".changed").length);
	if($(".changed").length){
		var resourceForm ={
	         "srSrc":$("#addResourceForm #updateSrSrc").val(),
	         "ptcptnRoleCd":$("#addResourceForm #ptcptnRoleCd.changed").val(),
	         "schdlBgngYmd":$("#addResourceForm #schdlBgngYmd.changed").val(),
	         "schdlEndYmd":$("#addResourceForm #schdlEndYmd.changed").val()
	   }
	   //console.log(resourceForm);
	   $.ajax({
	      url:"/sr-resource/resource/modify",
	      type:"POST",
	      data:resourceForm,
	      success:function(result){
	         //console.log(result);
	         if(result!=0){
	            $("#resourceTableRow").empty();
	            getResourceTableRow();
	         }
	         
	      }
	   });
	}
}
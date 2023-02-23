var calendar=null;

$(document).ready(function(){
   /* 자원정보 추가 모달
    * @author: 안한길
    * */
   $("#addSrResourcesModal").on('show.bs.modal',function() 
   {
      var calendarEl=null;
      var deptCd=$("#deptCd option:selected").val();
      //console.log(deptCd);
      if($("#empId option").length==0){
         /*개발자 목록*/
         $.ajax({
            url:"/member/department",
            type:"GET",
            data:{deptCd:deptCd},
            success:function(result){
               result.developers.forEach((value,index)=>{
                  $("#empId").append(
                        "<option value='"+value.empId+"'>" +value.flnm+"</option>"
                  );
               });
               /*달력*/
               console.log(result.schedule);
               calendarEl= $('#calendar')[0];
            
               calendar = new FullCalendar.Calendar(calendarEl,{
                  headerToolbar:{
                     left : 'prev, next',
                     center: 'title',
                     right:''
                  },
                  height:400,
                  initialView: 'dayGridMonth',
                  events:
                     result.schedule
                  
               });
               calendar.render();
               //처음 모달을 열때 달력이 안보이는 문제
               $(".fc-scroller td, th").css('width','50px');
               
               
            }
         });
      }
      
   });
   
});
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
         console.log(result);
         result.forEach((value)=>{
            calendar.addEvent(value);
            
         });
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
   console.log(resourceForm);
   $.ajax({
      url:"/sr-resource/resource/add",
      type:"POST",
      //contentType:"application/json", //form데이터를 json 형식으로
      data:resourceForm,
      success:function(result){
         console.log(result);
         
      }
   });
}
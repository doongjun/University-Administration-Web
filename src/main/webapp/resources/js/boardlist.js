/**
 * boardlist.jsp
*/

$(function(){
   //하단의 페이지 번호 클릭시
   var actionForm = $("#actionForm");
   
   $(".mypage-item a").click(function(e){
      e.preventDefault();  //a 속성 중지
      
      //actionForm의 안의 pageNum의 값을 사용자가 선택한 번호로 변경
      actionForm.find("input[name='page']").val($(this).attr("href"));
      
      //actionForm 보내기
      actionForm.submit();
   })
   
   
   //게시글 제목 클릭시 해당 게시글로 이동
   $(".viewarticle").click(function(e){
      e.preventDefault();
      
      //actionForm.append("<input type='hidden' name='b_no' value='"+$(this).attr('href')+"'>");
      //actionForm.getAttribute("action","view");
      
      //actionForm.submit();
      
      let b_noval = $(this).attr('href');
      console.log(b_noval);
      
      $.ajax({
         url:'addviews',
         type:'post',
         processData:false,
         contentType:false,
         //beforeSend:function(xhr){
            //xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
         //},
         data:b_noval,
         success:function(result){
            console.log("아작스성공성공성공성공"+result);
            actionForm.append("<input type='hidden' name='b_views' value='"+result+"'>");
            actionForm.append("<input type='hidden' name='b_no' value='"+b_noval+"'>");
            actionForm.attr('action','view');
            actionForm.submit();
         },
         //error:function(xhr,status,error){
            //console.log("아작스에러에러에러에러");
         //}
           //error:function(request,status,error){
       // alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
       //}
      });
      
      
   })
   
   //검색
   //type or keyword 가 값이 없는 경우 경고 메세지를 주기
   //둘 다 값이 있다면 submit 하기
   $("#search_btn").click(function(){
      //검색 폼 가져오기
      
      var searchForm = $("#searchForm");
      
      //type 가져오기
      var sort = $("select[name='sort']").val();
      
      //keyword 가져오기
      var keyword = $("input[name='keyword']").val();
      
      if(type===''){
         alert("검색 기준을 확인하세요");
         $("select[name='sort']").focus();
         return false;
      }else if(keyword===''){
         alert("검색어를 확인하세요");
         $("input[name='keyword']").focus();
         return false;
      }
      
      //검색 처음에는 1page 보여주기
      searchForm.find("input[name='page']").val("1");
      
      searchForm.submit();
   })
   
   
   
   
   
   
   })
    
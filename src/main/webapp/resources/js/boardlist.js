/**
 * boardlist.jsp


$(function(){
	
	
	//게시글 제목 클릭시 해당 게시글로 이동
	$(".viewarticle").click(function(e){
		e.preventDefault();
		
		//actionForm.append("<input type='hidden' name='b_no' value='"+$(this).attr('href')+"'>");
		//actionForm.getAttribute("action","view");
		
		//actionForm.submit();
		
		let b_noval = $(this).attr('href');
		console.log(b_noval);
		
		$.ajax({
			url:'board/addviews',
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
		//});
		
		
	})
	 */
/**
 * boardlist.jsp
*/

$(function(){
	
	let actionForm = $("#actionForm");
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
				actionForm.append("<input type='hidden' name='b_view' value='"+result+"'>");
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
	$(".btn-default").click(function(){
		//검색 폼 가져오기
		var searchForm = $("#searchForm");
		
		//type 가져오기
		var type = $("select[name='type']").val();
		
		//keyword 가져오기
		var keyword = $("input[name='keyword']").val();
		
		if(type===''){
			alert("검색 기준을 확인하세요");
			$("select[name='type']").focus();
			return false;
		}else if(keyword===''){
			alert("검색어를 확인하세요");
			$("input[name='keyword']").focus();
			return false;
		}
		
		//검색 처음에는 1page 보여주기
		searchForm.find("input[name='pageNum']").val("1");
		
		searchForm.submit();
	})
	
	//검색
	$(".searchbutton").click(function(e){
		
		e.preventDefault();
		
		let searchForm = $("#searchForm");
		
		var sort = $("select[name='sort']").val();
		
		var keyword = $("input[name='keyword']").val();
		
		if(sort === ''){
			alert("검색 기준을 다시 한번 확인해 주세요!");
			$("select[name='sort']").focus();
			return false;
		}

		searchForm.find("input[name='page']").val("1");
		
		searchForm.submit();
		
	})
	})
	 
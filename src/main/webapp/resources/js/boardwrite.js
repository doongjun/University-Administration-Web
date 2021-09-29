/**
 *  board/write.jsp
 */

$("button[type='submit']").click(function(e){
	e.preventDefault();
	
	let sort=$("select[name='b_sort']").val();
	let title=$("input[name='b_title']").val();
	//let content=$("textarea[name='b_content']").val();
	let content=CKEDITOR.instances.b_content.getData();
	console.log(content);
	
	if(sort==""){
		swal("분류를 선택해 주세요");
		$("select[name='b_sort']").focus();
		return;
	}
	if(title==""){
		swal("제목을 작성해 주세요");
		$("input[name='b_title']").focus();
		return;
	}
 	if(content==""){
		swal("내용을 작성해 주세요");
		$("#b_content").focus();
		return;
	}
	
	swal({
		text : '글을 등록하시겠습니까?',
		icon:'info',
		closeOnclickOutside : false,
		buttons:{
			cancle:{
				text : '취소',
				value:false
			},
			confirm:{
				text : '등록',
				value : true
			}
		}
	}).then((result) => {
		if(result){
			swal('글 작성','글을 작성합니다','success',{
			closeOnclickOutside : false
			
			})
		var form=$("#write_board");
		form.attr("action","write");
		form.submit();
					
		}else{
			return;
		}
	});
	
	
	})
	
$("#list_button").click(function(e){
	e.preventDefault();
	swal({
		text : '글 작성을 취소하시겠습니까?',
		icon:'info',
		closeOnclickOutside : false,
		buttons:{
			cancle:{
				text : '취소',
				value:false
			},
			confirm:{
				text : '네',
				value : true
			}
		}
	}).then((result) => {
		if(result){
		$(location).attr('href', '/board/boardlist');
					
		}else{
			return;
		}
	});
	})
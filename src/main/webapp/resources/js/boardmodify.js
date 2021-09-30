/**
 *  board/modify.jsp
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
		text : '글을 수정하시겠습니까?',
		icon:'info',
		closeOnclickOutside : false,
		buttons:{
			cancle:{
				text : '취소',
				value:false
			},
			confirm:{
				text : '수정',
				value : true
			}
		}
	}).then((result) => {
		if(result){
			swal('글 수정','글을 수정합니다','success',{
			closeOnclickOutside : false
			
			}).then(function(){
				var form=$("#write_board");
		form.attr("action","modify");
		form.submit();
			})
		
					
		}
	});
	
	
	})

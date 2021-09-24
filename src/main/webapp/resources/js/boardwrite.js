/**
 *  board/write.jsp
 */

$("button[type='submit']").click(function(e){
	e.preventDefault();
	
	let title=$("#b_title").val();
	let sort=$("select[name='b_sort']").val();
	let content=$("#b_content").val();
	
	console.log(content);
	
	if(title==""){
		alert("제목을 작성해 주세요");
		$("#b_title").focus();
		return;
	}
	if(sort==""){
		alert("분류를 선택해 주세요");
		$("#b_sort").focus();
		return;
	}
	if(content==""){
		alert("내용을 작성해 주세요");
		$("#b_content").focus();
		return;
	}
	
	var form=$("#write_board");

	
	form.submit();
	
	})
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<body>

	<!--*******************
        Preloader start
    ********************-->
	<jsp:include page="/WEB-INF/views/common/preloader.jsp" />
	<!--*******************
        Preloader end
    ********************-->


	<!--**********************************
        Main wrapper start
    ***********************************-->
	<div id="main-wrapper">

		<!--**********************************
            Nav header start
        ***********************************-->
		<jsp:include page="/WEB-INF/views/common/top.jsp" />
		<!--**********************************
            Header end ti-comment-alt
        ***********************************-->


		<!--**********************************
            Sidebar start
        ***********************************-->

		<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />

		<!--**********************************
            Sidebar end
        ***********************************-->

		<!--**********************************
            Content body start
        ***********************************-->
		<div class="content-body">
			<div class="container-fluid">
				<div class="row page-titles mx-0">
					<div class="col-sm-6 p-md-0">
						<div class="welcome-text">
							<h4>학사 공지</h4>
						</div>
					</div>
					<div
						class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="javascript:void(0)">공지사항</a></li>
							<li class="breadcrumb-item active"><a
								href="javascript:void(0)">공지게시판</a></li>
						</ol>
					</div>
				</div>

				<!-- 게시글 조회부분 -->
				<!-- 디자인 찾을거,, -->
				<!-- 학사공지 게시글 -->
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-header">
								<div class="table-responsive">
									<table class="table table-responsive-sm" style=" border: 1px solid #eaeaea;">
											<tbody style="color: black">
											<tr>
												<td style="color: white; background-color: gray; text-align: center;">제목</td>
												<td colspan="5">${vo.b_title}</td>
											</tr>
											<tr>
												<td style="color: white; background-color: gray; text-align: center;">작성자</td>
												<td style="width:50%">${vo.writer}</td>
												<td style="color: white; background-color: gray; text-align: center; width:8%">조회수</td>
												<td>${vo.b_views}</td>
												<td style="color: white; background-color: gray; text-align: center; width:8%">등록일</td>
												<td><fmt:formatDate
															value="${vo.b_sysdate}" pattern="yyyy-MM-dd" /></td>
											</tr>
											<tr></tr>
											
											</tbody>
										
									</table>



								</div>

							</div>
							<div></div>
							<br>
							<!-- ckeditor 추가부분 -->
							<div class="row justify-content-md-center" style="">
								<div class="col_c" style="margin-bottom: 30px">
									<div class="input-group"
										style="height: 500px; width: 1115px; white-space: pre-wrap; color: black;">

										<textarea class="form-control" id="b_content"
											readonly="readonly" name="content" style="display: none">${vo.b_content}</textarea>
										<script>
										val = $("#b_content").val();
										document.write(val);
										console.log(val);
										var input = document.getElementById("input-group");
										//input.innerHTML = "<b><font color='red'>"+val+"</font></b>";
										//console.log(input);
										</script>

									</div>
								</div>
							</div>

							<!-- 버튼추가 -->


							<div class="card-body">
								<button type="button" class="btn btn-primary" id="list_btn">목록</button>
								<sec:authorize access="hasRole('ROLE_ADMIN')">
									<!-- 추후 글 작성자 전용 -->

									<button type="button" class="btn btn-light" id="modify_btn">수정</button>
									<button type="button" class="btn btn-dark" id="del_btn">삭제</button>

								</sec:authorize>
							</div>

							<form id="viewForm" action="" method="get">
								<input type="hidden" name="b_writer_code" value="${member.id}" />
								<input type="hidden" id="b_no" name="b_no" value="${vo.b_no}">
							</form>
							<!-- onclick="location.href='/board/boardlist'"
 onclick="location.href='modify'"
 -->
						</div>
					</div>
				</div>
				<style>
.card-body {
	text-align: center;
}
</style>


			</div>
		</div>
		<!--**********************************
            Content body end
        ***********************************-->


		<!--**********************************
            Footer start
        ***********************************-->
		<div class="footer">
			<div class="copyright">
				<p>
					Copyright © Designed &amp; Developed by <a href="#" target="_blank">Quixkit</a>
					2019
				</p>
			</div>
		</div>
		<!--**********************************
            Footer end
        ***********************************-->

		<!--**********************************
           Support ticket button start
        ***********************************-->

		<!--**********************************
           Support ticket button end
        ***********************************-->


	</div>
	<!--**********************************
        Main wrapper end
    ***********************************-->

	<!--**********************************
        Scripts
    ***********************************-->
	<!-- Required vendors -->
	<script src="../resources/vendor/global/global.min.js"></script>
	<script src="../resources/js/quixnav-init.js"></script>
	<script src="../resources/js/custom.min.js"></script>

	<!-- ckeditor -->
	<script src="../resources/ckeditor/ckeditor.js"></script>


	<script>
      let viewForm = $("#viewForm");
      //sweetalert-warning 추가예정
      //Modify버튼 클릭시  get방식 /board/modify
      $("#modify_btn").click(function(e) {
         
         e.preventDefault();
         
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
               
               viewForm.attr('action', '/board/modify');
               viewForm.submit();
                     
            }else{
               return;
            }
         });
         
         
      })
      
      
      //List버튼 클릭시 get /board/boardlist
      $("#list_btn").click(function() {
    	  
         viewForm.find("input[name='b_no']").remove();
         viewForm.find("input[name='b_writer_code']").remove();
         viewForm.find("input[name='b_view']").remove();
         viewForm.attr('action', '/board/boardlist');
         viewForm.submit();
      })
      
      //delete 버튼 클릭시  post방식 /board/delete
      $("#del_btn").click(function(e) {
         e.preventDefault();
         
         swal({
            text : '글을 삭제하시겠습니까?',
            icon:'warning',
            closeOnclickOutside : false,
            buttons:{
               cancle:{
                  text : '취소',
                  value:false
               },
               confirm:{
                  text : '삭제',
                  value : true
               }
            }
         }).then((result) => {
            if(result){
               swal('글 삭제','글을 삭제합니다','success',{
               closeOnclickOutside : false
               
               })
               viewForm.attr("method","POST");
               viewForm.attr('action', '/board/delete');
               viewForm.submit();
                     
            }else{
               return;
            }
         });
         
         
      })
      
   </script>





</body>

</html>
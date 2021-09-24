<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


<!-- ckeditor -->
<script src="../resources/ckeditor/ckeditor.js"></script>
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
							<p class="mb-0">제육대학교 학사공지</p>
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
						<form action="" id="write_board" method="post">
							<div class="card-header">

								<div class="card-body">
									<div class="basic-form">
										<div class="input-group mb-3">
											<input name="b_title" id="b_title" type="text" class="form-control" placeholder="제목">
										</div>

										<select id="single-select b_sort" name="b_sort">
											<option value="">분류</option>
											<option value="학사">학사</option>
											<option value="행정">행정</option>
											<option value="행사">행사</option>
										</select>
									</div>

								</div>

								
							</div>
							

							<!-- ckeditor 추가부분 -->
							<div class="row justify-content-md-center">
								<div class="col_c" style="margin-bottom: 30px">
									<div class="input-group">
										<label for="b_content">작성</label>
										<textarea class="ckeditor" id="b_content" name="b_content"></textarea>
										<script type="text/javascript">
		
		$(function(){
			CKEDITOR.replace( 'b_content',{ 
				customConfig : '../resources/ckeditor/config.js'
			});
		});
		if(CKEDITOR.instances.b_content.getData().length < 1){
			alert("내용을 입력해 주세요.");
			return;
		}

										</script>
									</div>
								</div>
							</div>
							
							
							
							<input type="hidden" name="b_writer_code" value="${admin.id}"/>
							
							<!-- 버튼추가 -->
							<button type="submit" class="btn btn-primary" id="write_button">등록</button>
							</form>
						</div>
					</div>
				</div>
					<script src="/resources/js/boardwrite.js"></script>
<script>
	$(document).ready(function(){
	    
	    let result = '<c:out value="${result}"/>';
	
	});
</script>



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




	<!-- 구글링 깃허브 -->
	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="//feather.aviary.com/imaging/v3/editor.js"></script>

	<script src="//unpkg.com/grapesjs@0.10.7/dist/grapes.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/grapesjs-plugin-export@0.1.5/dist/grapesjs-plugin-export.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/ckeditor/4.9.2/ckeditor.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/grapesjs-plugin-ckeditor@0.0.9/dist/grapesjs-plugin-ckeditor.min.js"></script>



</body>

</html>
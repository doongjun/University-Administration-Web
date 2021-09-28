<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>


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
							<li class="breadcrumb-item">공지사항</li>
							<li class="breadcrumb-item active">공지게시판</li>
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


								<div class="card-body"  style="text-align: center">
									<div class="col-lg-2"
										style="float: left; margin-bottom: 10px; margin-left: 0px; padding-left: -15px">
										<select name="b_sort" id="single-select b_sort"
											class="form-control">
											<option value="">분류</option>
											<option value="학사">학사</option>
											<option value="행정">행정</option>
											<option value="행사">행사</option>
										</select>
									</div>
									<div class="form-group col-md-6" style="float: left; margin-right: 6px">
										<input type="text" name="b_title" class="form-control"
											placeholder="제목" value="" />
									</div>
								</div>
								
								<br>
								
								<div class="card-body">
									<!-- ckeditor 추가부분 -->
									<div class="row justify-content-md-center">
										<div class="col_c" style="margin-bottom: 30px">
											<div class="input-group">
												<textarea class="ckeditor" id="b_content" name="b_content"style="width: 1000px; height: 500px"></textarea>
												<script type="text/javascript">
													$(function() {
													CKEDITOR.replace("description",{
													    filebrowserUploadUrl : "board/imageUpload.do"
													    //filebrowserUploadUrl : "${pageContext.request.contextPath}/adm/fileupload.do"
													});
														CKEDITOR
																.replace(
																	'b_content',
								{width:'1000px',height:'500px',
									customConfig : '../resources/ckeditor/configg.js'
								});
													});
													if (CKEDITOR.instances.b_content
															.getData().length < 1) {
														alert("내용을 입력해 주세요.");
														return;
													}
												</script>
											</div>
											<div class="custom-file">
											<input id="input-tuition" type="file" name="file" class="custom-file-input"> <label id="label-tuition" class="custom-file-label">Choose File</label>
										</div>
										
										
										</div>
									</div>



									<input type="hidden" name="b_writer_code" value="${member.id}" />
									</div >
									<!-- 버튼추가 -->
									<div class="card-body" style="text-align:center">
									<button type="submit" class="btn btn-primary" id="list_button">취소</button>
									<button type="submit" class="btn btn-primary" id="write_button">등록</button>
								</div>
							</form>


						</div>
					</div>
				</div>
				<script src="/resources/js/boardwrite.js"></script>
				<script>
					$(document).ready(function() {

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


<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction('콜백의 식별 ID 값', '파일의 URL', '전송완료 메시지')</script>
<script>
/*파일 업로드 부분*/
$(document).ready(
		function() {
			var fileTarget = $('#input-tuition');

			fileTarget.on('change', function() {
				if (window.FileReader) {
					var fileName = $(this)[0].files[0].name;
				} else {
					var fileName = $(this).val().split('/').pop()
							.split('\\').pop();
				}

				$('#label-tuition').text(fileName);
			})

			var table = $('#example2').DataTable();
		})
</script>

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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

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
							<div class="card-header">

								<div class="card-body">
									<div class="basic-form">
										<div class="input-group mb-3">
											<input type="text" class="form-control" placeholder="제목">
										</div>
									</div>

									<div class="basic-form">
										<select id="single-select">
											<option selected>분류</option>
											<option value="1">학사</option>
											<option value="2">행정</option>
											<option value="3">행사</option>
										</select>
									</div>

								</div>

								<!--  0
								<c:set var="now" value="<%=new java.util.Date()%>" />
								<c:set var="sys">
									<fmt:formatDate pattern="yyyy-MM-dd" value="${now}" />
								</c:set>
								<h4 class="card-title">[${vo.b_no}] ${vo.b_title}</h4>
								<ol>
									<li><p class="mb-0">작성자 : ${vo.writer}</p></li>
									<li><p class="mb-0">
											등록일 :
											<c:out value="${sys}" />
										</p></li>
									<li><p class="mb-0">조회수 : ${vo.b_views}</p></li>
								</ol>
								-->
							</div>

							<!-- ckeditor 추가부분 -->
							<div class="row justify-content-md-center">
								<div class="col_c" style="margin-bottom: 30px">
									<div class="input-group">
										<label for ="b_content">작성</label>
										<textarea class="form-control" id="b_content"></textarea>
										<script>
											var ckeditor_config = {
												resize_enaleb : false,
												enterMode : CKEDITOR.ENTER_BR,
												shiftEnterMode : CKEDITOR.ENTER_P,
												filebrowserUploadUrl : "/admin/goods/ckUpload"
											};

											CKEDITOR.replace("b_content",
													ckeditor_config);
										</script>
									</div>
								</div>
							</div>

							<!-- 버튼추가 -->


							<div class="card-body">
								<button type="button" class="btn btn-primary">등록</button>

							</div>

						</div>
					</div>
				</div>




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
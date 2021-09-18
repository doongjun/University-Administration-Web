<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
				<!-- row -->


				<!-- 학사공지 게시글 -->
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title">학사공지</h4>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-responsive-sm">
										<thead>
											<tr>
												<th>번호</th>
												<th>제목</th>
												<th>작성자</th>
												<th>등록일</th>
												<th>조회수</th>
											</tr>
										</thead>
										<tbody>
											<!-- DB에서 데이터 받아오기 -->
											<c:forEach var="vo" items="${list}">
												<tr>
													<th>${vo.b_no}</th>
													<td>${vo.b_title}</td>
													<td>${vo.writer}</td>
													<td>${vo.b_sysdate}</td>
													<td>${vo.b_views}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									
									<!-- 검색기능 추가 필요 -->
									<!-- 페이징 추가 필요 -->
								</div>
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




</body>

</html>
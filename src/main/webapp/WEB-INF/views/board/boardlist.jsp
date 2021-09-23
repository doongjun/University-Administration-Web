<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
								<div class="basic-form">
									<select id="single-select">
										<option selected>분류</option>
										<option value="AL">제목</option>
										<option value="WY">내용</option>
										<option value="WY">작성자</option>
									</select>

									<form>
										<div class="form-group">
											<input type="text" class="form-control input-default "
												placeholder="입력">
											<button type="button" class="btn btn-primary" id="search_btn">검색</button>
										</div>
									</form>
								</div>
								<!-- 테이블 시작 -->
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
													<td><a class="viewarticle"
														href='<c:out value="${vo.b_no}"/>'>[${vo.b_sort}]
															${vo.b_title}</a></td>
													<td>${vo.writer}</td>
													<td><fmt:formatDate value="${vo.b_sysdate}"
															pattern="yyyy-MM-dd" /></td>
													<td>${vo.b_views}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>



								</div>
							</div>
							<!-- 페이징 부분 -->

							<div class="col-xl-6">
								<div class="card-body">
									<ul class="btn-group mr-2 mb-2">

										<c:if test="${BoardVO.prev}">
											<li class="mypage-item prev"><a
												href="${BoardVO.startPage-1}" class="mypage-link"><button
														type="button" class="btn btn-primary"><<</button></a></li>
										</c:if>

										<c:forEach var="i" begin="${BoardVO.startPage}"
											end="${BoardVO.endPage}">
											<li class="mypage-item"><a href="${i}"
												class="mypage-link ${BoardVO.cri.page==i?'activecolor':''}">
													<button type="button" class="btn btn-primary">${i}</button>
											</a></li>
										</c:forEach>

										<c:if test="${BoardVO.next}">
											<li class="mypage-item next"><a
												href="${BoardVO.endPage+1}" class="mypage-link"><button
														type="button" class="btn btn-primary">>></button></a></li>
										</c:if>

									</ul>

									<!-- 관리자용 작성버튼 -->
									<sec:authorize access="hasRole('ROLE_ADMIN')">
										<button type="button" class="btn btn-primary" id="write_btn"
											onclick="location.href='write'">글쓰기</button>
									</sec:authorize>
								</div>
							</div>
							<!--  -->
							<form method="get" id="actionForm">
								<input type="hidden" name="" value="${BoardPageVO.cri.sort}" />
								<input type="hidden" name="" value="${BoardPageVO.cri.keyword}" />
								<input type="hidden" name="" value="${BoardPageVO.cri.page}" />
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<style>
.col-xl-6 {
	text-align: center;
}
</style>

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



	<script src="/resources/js/boardlist.js"></script>
	<script>
		let actionForm = $("#actionForm");

		$(".viewarticle").on(
				"click",
				function(e) {
					e.preventDefault();

					actionForm.attr("action", "view");
					actionForm
							.append("<input type='hidden' name='b_no' value='"
									+ $(this).attr("href") + "'>");
					actionForm.submit();
				});

		/*아작스 시도하다가 실패*/
		let result = '${result}';

		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
	</script>



</body>

</html>
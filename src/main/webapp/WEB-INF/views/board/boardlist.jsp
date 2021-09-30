<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<link href="../resources/vendor/sweetalert2/dist/sweetalert2.min.css"
	rel="stylesheet">
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
							<h4 style="font-weight:bold;">학사 공지</h4>
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
								<h4 class="card-title" style="font-weight:bold;">학사공지</h4>
							</div>
							<!-- 검색창
									<div class="basic-form"> -->
							<div class="card-body">
								<form action="" id="searchForm" class="">
									<div class="col-lg-2" style="float: left; padding-left: 0px">
										<select name="sort" id="type" class="form-control">
											<option value="">분류</option>
											<option value="제목"
												<c:out value="${BoardPageVO.cri.sort=='제목'?'selected':''}"/>>제목</option>
											<option value="내용"
												<c:out value="${BoardPageVO.cri.sort=='내용'?'selected':''}"/>>내용</option>
											<option value="작성자"
												<c:out value="${BoardPageVO.cri.sort=='작성자'?'selected':''}"/>>작성자</option>
										</select>
									</div>
									<div class="col-lg-2" style="float: left; margin-left: -20px">
										<input type="text" name="keyword" class="form-control"
											placeholder="검색어를 입력하세요." value="" />
									</div>
									<input type="hidden" name="page"
										value="${BoardPageVO.cri.page}" />
									<button name="rep-btn" type="button" class="btn btn-primary"
										style="float: left" id="search_btn">검색</button>

									<!-- 관리자용 작성버튼 -->
									<div class="col-lg-2" style="float: right; margin-left: 350px; margin-right:-11em">
									<sec:authorize access="hasRole('ROLE_ADMIN')">
										<button type="button" class="btn btn-primary" id="write_btn"
											onclick="location.href='write'">글쓰기</button>
									</sec:authorize>
									</div>
								</form>


							</div>

							<div class="card-body">



								<!-- 테이블 시작 -->
								<div class="table-responsive">
									<table class="table table-responsive-sm">
										<thead class="table-light"
											style="color: white; background-color: gray; text-align: center;">
											<tr>
												<th>번호</th>
												<th>분류</th>
												<th>제목</th>
												<th>작성자</th>
												<th>등록일</th>
												<th>조회수</th>
											</tr>
										</thead>
										<tbody style="color: black">
											<!-- DB에서 데이터 받아오기 -->
											<c:forEach var="vo" items="${list}">
												<tr>
													<td style="text-align: center;">${vo.b_no}</td>
													<td style="text-align: center;">${vo.b_sort}</td>
													<td><a class="viewarticle"
														href='<c:out value="${vo.b_no}"/>' style="color: black">
															${vo.b_title}</a></td>
													<td style="text-align: center;">${vo.writer}</td>
													<td style="text-align: center;"><fmt:formatDate
															value="${vo.b_sysdate}" pattern="yyyy-MM-dd" /></td>
													<td style="text-align: center;">${vo.b_views}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>



								</div>
							</div>

							<!-- 검색창
									<div class="basic-form"> -->
							<div class="card-body">
								<form action="" id="searchForm" class="">
									<div class="col-lg-2"
										style="float: left; margin-bottom: 10px; margin-left: 0px; padding-left: -15px">
										<select name="sort" id="type" class="form-control">
											<option value="">분류</option>
											<option value="제목"
												<c:out value="${BoardPageVO.cri.sort=='제목'?'selected':''}"/>>제목</option>
											<option value="내용"
												<c:out value="${BoardPageVO.cri.sort=='내용'?'selected':''}"/>>내용</option>
											<option value="작성자"
												<c:out value="${BoardPageVO.cri.sort=='작성자'?'selected':''}"/>>작성자</option>
										</select>
									</div>
									<div class="col-lg-2" style="float: left; margin-left: -20px">
										<input type="text" name="keyword" class="form-control"
											placeholder="검색어를 입력하세요." value="" />
									</div>
									<input type="hidden" name="page"
										value="${BoardPageVO.cri.page}" />
									<button name="rep-btn" type="button" class="btn btn-primary"
										style="float: left" id="search_btn">검색</button>
								</form>


							<!-- 관리자용 작성버튼 -->
									<div class="col-lg-2" style="float: right; margin-left: 350px; margin-right:-100px">
									<sec:authorize access="hasRole('ROLE_ADMIN')">
										<button type="button" class="btn btn-primary" id="write_btn"
											onclick="location.href='write'">글쓰기</button>
									</sec:authorize>
									</div>
								</form>


							</div>
							<!-- 페이징 부분-->


							<div class="card-body" style= "text-align:center">
									<ul class="btn-group mr-2 mb-2">

										<c:if test="${BoardPageVO.prev}">
											<li class="mypage-item prev"><a
												href="${BoardPageVO.startPage-1}" class="mypage-link"><button
														type="button" class="btn btn-primary"> << </button></a></li>
										</c:if>
										<c:forEach var="i" begin="${BoardPageVO.startPage}" end="${BoardPageVO.endPage}">
											<li class="mypage-item" style="padding: 0 3px">
												<a href="${i}" class="mypage-link ${BoardPageVO.cri.page==i?'active':''}"> ${i} </a>
											</li>
										</c:forEach>

										<c:if test="${BoardPageVO.next}">
											<li class="mypage-item next"><a
												href="${BoardPageVO.endPage+1}" class="mypage-link"><button
														type="button" class="btn btn-primary"> >> </button></a></li>
										</c:if>

									</ul>
							
								</div>

							<!--  -->
							<form method="get" id="actionForm">
								<input type="hidden" name="sort" value="${BoardPageVO.cri.sort}" />
								<input type="hidden" name="keyword"
									value="${BoardPageVO.cri.keyword}" /> <input type="hidden"
									name="page" value="${BoardPageVO.cri.page}" />
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
		/*아작스 시도하다가 실패*/
		let result = '${result}';
	</script>

</body>

</html>
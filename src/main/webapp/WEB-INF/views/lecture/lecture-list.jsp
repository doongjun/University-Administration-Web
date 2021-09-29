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
							<h4 style="font-weight:bold;">강의계획서 조회</h4>
						</div>
					</div>
					<div
						class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="javascript:void(0)">강의관리</a></li>
							<li class="breadcrumb-item active"><a
								href="javascript:void(0)">강의계획서 조회</a></li>
						</ol>
					</div>
				</div>

				<!-- 검색 -->
				
				<div class="row page-titles mx-0">
					<div class="justify-content-start p-md-0" style="float:left;">
					<form class="form-inline">
						<label>학수번호</label> <input name="lecture-code" type="text"
							class="form-control">
						<label>과목명</label> <input name="lecture-name" type="text"
							class="form-control">
						<button type="submit" class="btn btn-primary mb-2">검색</button>
						
						
					</form>
					</div>
				</div>
				
				
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12">
						<div class="card">
							<div class="card-header"> 
								<h4 class="card-title">수강내역</h4>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered table-scroll">
										<thead class="table-light" style="color: black;">
											<tr>
												<th>강의번호</th>
												<th>학기</th>
												<th>강의이름</th>
												<th>강의실</th>
												<th>강의시간</th>
												<th>학점</th>
												<th>강의계획서</th>
											</tr>
										</thead>
										<tbody>
											<!-- 게시판 리스트 반복문 -->
											<c:forEach var="vo" items="${vo}">
												<tr>
													<td>${vo.lecture_code}</td>
													<td>${vo.grade}-${vo.semester}</td>
													<td>${vo.lecture_name}</td>
													<td>${vo.classroom}</td>
													<td>${vo.lecture_time}</td>
													<td>${vo.credit}</td>
													<td><button>강의계획서</button></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div align="center">
									<label>${fileName }</label>
									<iframe src="${saveFilePath }" style="width:1000px;height:700px;"></iframe>
								</div>
								
							</div>
						</div>
					</div>
					
					<%-- <div class="col-xl-7 col-lg-7 col-md-07">
						<div class="card">
							<div class="card-body text-center">
								<jsp:include page="syllabus.jsp" flush="false" />
							</div>
						</div>
					</div> --%>
					
				</div>
				<!-- 검색결과 -->

				
			</div>
		</div>


		<!--**********************************
            Content body end
        ***********************************-->


		<!--**********************************
            Footer start
        ***********************************-->
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
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



	<!-- Datatable -->
	<script
		src="../resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
	<script src="../resources/js/plugins-init/datatables.init.js"></script>
</body>

</html>
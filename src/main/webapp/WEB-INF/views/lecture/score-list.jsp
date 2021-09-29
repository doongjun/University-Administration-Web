<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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
							<h4 style="font-weight:bold;">성적조회</h4>
						</div>
					</div>
					<div
						class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="javascript:void(0)">강의관리</a></li>
							<li class="breadcrumb-item active"><a
								href="javascript:void(0)">성적 조회</a></li>
						</ol>
					</div>
				</div>
				<!-- row -->
				<!-- 검색 -->
				
				<div class="row page-titles mx-0">
					<div class="justify-content-start p-md-0" style="float:left;">
					<form class="form-inline">
							<label>수강년도</label>
							 <select id="lecture_year" class="form-control" value="${lecture_year}" style="margin-left:10px;">
								<option value="2021" selected="">2021</option>
								<option value="2020">2020</option>
								<option value="2019">2019</option>
								<option value="2018">2018</option>
								<option value="2017">2017</option>
								<option value="2016">2016</option>
							</select> 
							
							<label style="margin-left:20px;" >학기</label> 
							<select id="semester" class="form-control" style="margin-left:10px;" value="${semester}">
								<option value="1학기"selected="">1학기</option>
								<option value="2학기">2학기</option>
								<option value="여름계절학기">여름계절학기</option>
								<option value="겨울계절학기">겨울계절학기</option>
							</select>
							
							<button id="searchBtn" type="button" class="btn btn-primary" style="margin-left:15px;" >조회</button>
								
					</form>
					</div>
				</div>

				<div class="row">
					<div class="col-12">
					<div class="card">
							<div class="card-body">
								<input id="student_id" name="student_id" type="hidden" value="${student_id}">
								<div class="table-responsive">
									<table class="table table-bordered table-scroll">
										<thead class="table-light"
											style="color: white; background-color: gray; text-align: center;">
											<tr>
												<th>강의번호</th>
												<th>강의이름</th>
												<th>구분</th>
												<th>분반</th>
										        <th>학점</th>
												<th>중간</th>
												<th>기말</th>
												<th>과제</th>
												<th>출석</th>
												<th>총점</th>
												<th>학점</th>
											</tr>
										</thead>
										<tbody style="color: black; text-align: center;">
											<!-- 리스트 반복문 -->
											<c:forEach var="vo" items="${vo}" varStatus="cnt">
												<tr>
													<td>${vo.lecture_code}</td>
													<td>${vo.lecture_name}</td>
													<td>${vo.section}</td>
													<td>${vo.division}</td>
													<td>${vo.credit}</td>
													<td style="width: 10%;">${vo.midterm_exam}</td>
													<td style="width: 10%;">${vo.final_exam}</td>
													<td style="width: 10%;">${vo.assignment}</td>
													<td style="width: 10%;">${vo.attendance}</td>
													<td style="width: 10%;">${vo.total}</td>
													<td style="width: 10%;">${vo.score}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<c:if test="${empty vo}">
												  	<div style="text-align: center; margin-top: 10px;">검색결과가 없습니다</div>
									</c:if>
								</div>
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
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
		<!--**********************************
            Footer end
        ***********************************-->




	<!--**********************************
        Main wrapper end
    ***********************************-->

	<!--**********************************
        Main wrapper end
    ***********************************-->

	<!--**********************************
        Modal start
    ***********************************-->

	<!--**********************************
        Modal end
    ***********************************-->

	<!--**********************************
        Scripts
    ***********************************-->
	<!-- Required vendors -->
	<script src="../resources/vendor/global/global.min.js"></script>
	<script src="../resources/js/quixnav-init.js"></script>
	<script src="../resources/js/custom.min.js"></script>
	<!--removeIf(production)-->
	<!-- Demo scripts -->
	<script src="../resources/js/styleSwitcher.js"></script>



	<script src="../resources/vendor/jqueryui/js/jquery-ui.min.js"></script>
	<script src="../resources/vendor/moment/moment.min.js"></script>

	<script src="../resources/vendor/fullcalendar/js/fullcalendar.min.js"></script>
	<script src="../resources/js/plugins-init/fullcalendar-init.js"></script>

	<script>
	$(document).ready(function(){
		$("#lecture_year").val("${year}").prop("selected",true);
		$("#semester").val("${semester}").prop("selected",true);
	});

		$('#searchBtn').click(function(){
			var student_id = document.getElementById('student_id').value;
			var lecture_year = document.getElementById('lecture_year').value;
			var semester = document.getElementById('semester').value;
			console.log(student_id +","+ lecture_year + ','+semester);
			if(lecture_year == ""){
				swal("수강년도를 선택하세요");
			}else if(semester == ""){
				swal("학기를 선택하세요");
			}else{
			location.href = "/lecture/get-score-list?student_id="+student_id+"&lecture_year="+lecture_year+"&semester="+semester ;
			}
		
		});

	</script>
</body>
</html>
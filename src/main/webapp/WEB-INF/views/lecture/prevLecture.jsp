<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
							<h4>이전 수강내역 조회</h4>
						</div>
					</div>
					<div
						class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="javascript:void(0)">강의관리</a></li>
							<li class="breadcrumb-item active"><a
								href="javascript:void(0)">이전 수강내역 조회</a></li>
						</ol>
					</div>
				</div>

				<!-- 검색 -->
				
				<div class="row page-titles mx-0">
					<div class="justify-content-start p-md-0" style="float:left;">
					<form class="form-inline">
							<label>수강년도</label>
							 <select id="lecture_year" class="form-control" style="margin-left:10px;">
								<option value="2021" selected="">2021</option>
								<option value="2020">2020</option>
								<option value="2019">2019</option>
								<option value="2018">2018</option>
								<option value="2017">2017</option>
								<option value="2016">2016</option>
							</select> 
							
							<label style="margin-left:20px;" >학기</label> 
							<select id="semester" class="form-control" style="margin-left:10px;">
								<option value="1학기" selected="">1학기</option>
								<option value="2학기">2학기</option>
								<option value="여름계절학기">여름계절학기</option>
								<option value="겨울계쩔학기">겨울계절학기</option>
							</select>
							
							<button id="searchBtn" type="button" class="btn btn-primary" style="margin-left:15px;" >조회</button>
								
					</form>
					</div>
				</div>

				<!-- 검색결과 -->

				<!-- row -->


                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">이전 수강 내역</h4>
                            </div>
                            <div class="card-body">
                            	<div class="row-sm-8" style="overflow-y:scroll; width:100%; height:650px;">
                                <div class="table-responsive">
                                    <table class="table table-bordered table-scroll">
										<thead class="table-light" style="color:white; background-color:gray; text-align:center;">
											<tr>
										        <th>강의번호</th>
										        <th>수강년도</th>
										        <th>학기</th>
										        <th>학년</th>
										        <th>구분</th>
										        <th>강의이름</th>
										        <th>강의실</th>
										        <th>강의시간</th>
										        <th>분반</th>
										        <th>학점</th>
									        </tr>
										</thead>
										<tbody style="color:black; text-align:center;">
											<!-- 리스트 반복문 -->
											<c:forEach var="vo" items="${vo}" varStatus="cnt">
												<tr>
													<td style="display:none;">${vo.id}</td>
													<td>${vo.lecture_code}</td>
													<td>${vo.lecture_year}</td>
													<td>${vo.semester}</td>
													<td>${vo.grade}</td>
													<td>${vo.section}</td>
													<td>${vo.lecture_name}</td>
													<td>${vo.classroom}</td>
													<td>${vo.lecture_time}</td>
													<td>${vo.division}</td>
													<td>${vo.credit}</td>
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

		
		<input type="hidden" id="student_id" value="${student_id}">
		

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
	<script>
	//검색결과저장, select 초기화
	$(document).ready(function(){
		$("#lecture_year").val("${year}").prop("selected",true);
		$("#semester").val("${semester}").prop("selected",true);
	});
	
		
		$('#searchBtn')
				.click(
						function() {
							var student_id = document
									.getElementById('student_id').value;
							var lecture_year = document
									.getElementById('lecture_year').value;
							var semester = document.getElementById('semester').value;
							console.log(student_id + "," + lecture_year + ','
									+ semester);
							if(lecture_year == ""){
								swal("수강년도를 선택하세요");
							}else if(semester == ""){
								swal("학기를 선택하세요");
							}else{
							location.href = "/lecture/selected-prevLecture?student_id="
									+ student_id
									+ "&lecture_year="
									+ lecture_year + "&semester=" + semester;
							}
						});
	</script>
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
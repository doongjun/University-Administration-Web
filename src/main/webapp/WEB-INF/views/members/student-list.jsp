<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
							<h4>학생 관리</h4>
							<span class="ml-1">관리자</span>
						</div>

					</div>
					<div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="javascript:void(0)">학적</a></li>
							<li class="breadcrumb-item active"><a href="javascript:void(0)">학생 관리</a></li>
						</ol>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title">Student List</h4>
								<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#studentAddModal">학생 추가</button>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table id="example2" class="display" style="width: 100%">
										<thead>
											<tr>
												<th>학번</th>
												<th>이름</th>
												<th>학과</th>
												<th>학년</th>
												<th>학적상태</th>
											</tr>
										</thead>
										<tbody>
											<!-- fileList 리스트 반복문 -->
											<c:forEach var="student" items="${studentList}">
												<tr>
													<td>${student.code}</td>
													<td>${student.name}</td>
													<td>${student.departmentName}</td>
													<td>${student.grade}</td>
													<td>${student.academicStatus}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 학생 수정 Modal -->
				<div class="modal fade" id="studentInfoModal">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">학생 상세정보</h5>
								<button type="button" class="close" data-dismiss="modal">
									<span>&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<form id="studentForm" class="form-valide">
									<div class="row">
										<div class="col-xl-6">
											<div class="form-group row">
												<label class="col-lg-5 col-form-label">이름 <span class="text-danger">*</span></label>
												<div class="col-lg-10">
													<input type="text" class="form-control" id="infoName" name="name">
												</div>
											</div>
											<div class="form-group row">
												<label class="col-lg-5 col-form-label">학번 <span class="text-danger">*</span></label>
												<div class="col-lg-10">
													<input type="text" class="form-control" id="infoCode" name="code">
												</div>
											</div>
											<div class="form-group row">
												<label class="col-lg-5 col-form-label">Phone <span class="text-danger">*</span></label>
												<div class="col-lg-10">
													<input type="text" class="form-control" id="infoPhone" name="phone">
												</div>
											</div>
											<div class="form-group row">
												<label class="col-lg-5 col-form-label">Email <span class="text-danger">*</span></label>
												<div class="col-lg-10">
													<input type="text" class="form-control" id="infoEmail" name="email">
												</div>
											</div>
											<div class="form-group row">
												<label class="col-lg-5 col-form-label">생년월일 <span class="text-danger">*</span></label>
												<div class="col-lg-10">
													<input type="text" class="form-control" id="infoBirthday" name="birthday">
												</div>
											</div>	
										</div>
										<div class="col-xl-6">
											<div class="form-group row">
												<label class="col-lg-5 col-form-label">학년 <span class="text-danger">*</span></label>
												<div class="col-lg-10">
													<input type="text" class="form-control" id="infoGrade" name="grade">
												</div>
											</div>
											<div class="form-group row">
												<label class="col-lg-5 col-form-label">학적상태 <span class="text-danger">*</span></label>
												<div class="col-lg-10">
													<input type="text" class="form-control" id="infoAcademicStatus" name="academicStatus">
												</div>
											</div>
											<div class="form-group row">
												<label class="col-lg-5 col-form-label">입학날짜 <span class="text-danger">*</span></label>
												<div class="col-lg-10">
													<input type="text" class="form-control" id="infoAdmissionDate" name="admissionDate">
												</div>
											</div>
											<div class="form-group row">
												<label class="col-lg-5 col-form-label">학과 <span class="text-danger">*</span></label>
												<div class="col-lg-10">
													<input type="text" class="form-control" id="infoDepartmentName" name="departmentName">
												</div>
											</div>							
										</div>
									</div>
								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-danger">Delete</button>
								<button type="button" class="btn btn-primary">Save changes</button>
								<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
								
							</div>
						</div>
					</div>
				</div>
				
				<!-- 학생 추가 Modal -->
				<div class="modal fade" id="studentAddModal">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">학생 추가</h5>
								<button type="button" class="close" data-dismiss="modal">
									<span>&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<form id="studentForm" class="form-valide">
									<div class="row">
										<div class="col-xl-6">
											<div class="form-group row">
												<label class="col-lg-5 col-form-label">이름 <span class="text-danger">*</span></label>
												<div class="col-lg-10">
													<input type="text" class="form-control" id="addName" name="name">
												</div>
											</div>
											<div class="form-group row">
												<label class="col-lg-5 col-form-label">학번 <span class="text-danger">*</span></label>
												<div class="col-lg-10">
													<input type="text" class="form-control" id="addCode" name="code">
												</div>
											</div>
											<div class="form-group row">
												<label class="col-lg-5 col-form-label">비밀번호 <span class="text-danger">*</span></label>
												<div class="col-lg-10">
													<input type="password" class="form-control" id="addPassword" name="password">
												</div>
											</div>
											<div class="form-group row">
												<label class="col-lg-5 col-form-label">Phone <span class="text-danger">*</span></label>
												<div class="col-lg-10">
													<input type="text" class="form-control" id="addPhone" name="phone">
												</div>
											</div>
											<div class="form-group row">
												<label class="col-lg-5 col-form-label">Email <span class="text-danger">*</span></label>
												<div class="col-lg-10">
													<input type="text" class="form-control" id="addEmail" name="email">
												</div>
											</div>
												
										</div>
										<div class="col-xl-6">
											<div class="form-group row">
												<label class="col-lg-5 col-form-label">학년 <span class="text-danger">*</span></label>
												<div class="col-lg-10">
													<input type="text" class="form-control" id="addGrade" name="grade">
												</div>
											</div>
											<div class="form-group row">
												<label class="col-lg-5 col-form-label">학적상태 <span class="text-danger">*</span></label>
												<div class="col-lg-10">
													<input type="text" class="form-control" id="addAcademicStatus" name="academicStatus">
												</div>
											</div>
											<div class="form-group row">
												<label class="col-lg-5 col-form-label">입학날짜 <span class="text-danger">*</span></label>
												<div class="col-lg-10">
													<input type="text" class="form-control" id="addAdmissionDate" name="admissionDate">
												</div>
											</div>
											<div class="form-group row">
												<label class="col-lg-5 col-form-label">학과 <span class="text-danger">*</span></label>
												<div class="col-lg-10">
													<input type="text" class="form-control" id="addDepartmentName" name="departmentName">
												</div>
											</div>
											<div class="form-group row">
												<label class="col-lg-5 col-form-label">생년월일 <span class="text-danger">*</span></label>
												<div class="col-lg-10">
													<input type="text" class="form-control" id="addBirthday" name="birthday">
												</div>
											</div>							
										</div>
									</div>
								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary">Add</button>
								<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
								
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
	<script>
		$(document).ready(function() {
			var table = $('#example2').DataTable();
			
			$('#example2 tbody').on('click', 'tr', function() {
				var data = table.row(this).data();
				$.ajax({
					url:"/members/student-info",
					data: {'code' : data[0]},
					type:"GET",
					dataType:'json',
					error:function(request, status, error){
						alert("error");
					},
					success:function(data){
						$('#studentInfoModal').modal('show');
						console.log(data);
						$('#infoName').val(data.name);
						$('#infoCode').val(data.code);
						$('#infoPhone').val(data.phone);
						$('#infoEmail').val(data.email);
						$('#infoBirthday').val(data.birthday);
						$('#infoGrade').val(data.grade);
						$('#infoAcademicStatus').val(data.academicStatus);
						$('#infoAdmissionDate').val(data.admissionDate);
						$('#infoDepartmentName').val(data.departmentName);
					}
				})
				
				$('#modal-title').text(data[3]);
				$('#studentCode').text("학번 : " + data[0]);
				$('#downloadCodeVal').val(data[0]);
				$('#deleteCodeVal').val(data[0]);
				$('#studentName').text("이름 : " + data[1]);
			});

		});
	</script>

	<!-- Required vendors -->
	<script src="../resources/vendor/global/global.min.js"></script>
	<script src="../resources/js/quixnav-init.js"></script>
	<script src="../resources/js/custom.min.js"></script>

	<!-- Datatable -->
	<script src="../resources/vendor/datatables/js/jquery.dataTables.min.js"></script>

</body>

</html>


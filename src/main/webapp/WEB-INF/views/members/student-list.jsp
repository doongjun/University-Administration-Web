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
								<h4 class="card-title">Tuition File List</h4>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table id="example2" class="display" style="width: 100%">
										<thead>
											<tr>
												<th>학번</th>
												<th>이름</th>
												<th>학과</th>
											</tr>
										</thead>
										<tbody>
											<!-- fileList 리스트 반복문 -->
											<c:forEach var="fileList" items="${fileList}">
												<tr>
													<td>${fileList.code}</td>
													<td>${fileList.name}</td>
													<td>${fileList.departmentName}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Modal -->
				<div class="modal fade bd-example-modal-sm" id="fileDownAndDelete" tabindex="-1" role="dialog" aria-hidden="true">
					<div class="modal-dialog modal-sm">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="modal-title"></h5>
								<button type="button" class="close" data-dismiss="modal">
									<span>&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<p id="studentCode"></p>
								<p id="studentName"></p>

							</div>
							<div class="modal-footer">
								<form action="/tuition/download-tuition">
									<input id="downloadCodeVal" type="hidden" name="code">
									<button type="submit" class="btn btn-primary" onclick="">Download</button>
								</form>
								<form action="/tuition/delete-tuition">
									<input id="deleteCodeVal" type="hidden" name="code">
									<button type="submit" class="btn btn-danger">Delete</button>
								</form>
								<button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
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

					$('#example2 tbody').on('click', 'tr', function() {
						var data = table.row(this).data();

						$('#fileDownAndDelete').modal('show');
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


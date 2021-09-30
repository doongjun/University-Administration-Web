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
							<h4 style="font-weight:bold;">등록금 고지서</h4>
						</div>

					</div>
					<div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="javascript:void(0)">학적</a></li>
							<li class="breadcrumb-item active"><a href="javascript:void(0)">등록금 고지서 조회</a></li>
						</ol>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title" style="font-weight:bold;">등록금 고지서 미리보기</h4>
							</div>
							<div class="card-body">
								<label>${fileName }</label>
								<br>
								<iframe src="${saveFilePath }" style="width:102em;height:700px;"></iframe>
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
		function fn_registTuition() {
			if ($("#code").val() == '') {
				alert("학번을 입력하세요.");
				return false;
			}

			if ($("#label-tuition").text() == 'Choose File') {
				alert("등록금 고지서 파일을 첨부하세요.");
				return false;
			}
		}

		var msg = "${message}";
		if (msg === "noStudent") {
			alert("해당 학생이 존재하지 않습니다.");
		} else if (msg === "overFile") {
			alert("해당 학생은 파일이 이미 등록되어 있습니다.");
		}

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


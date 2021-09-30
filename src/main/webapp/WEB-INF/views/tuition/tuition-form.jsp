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
							<h4 style="font-weight:bold;">등록금 고지서 관리</h4>
						</div>

					</div>
					<div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="javascript:void(0)">학적</a></li>
							<li class="breadcrumb-item active"><a href="javascript:void(0)">등록금 고지서 관리</a></li>
						</ol>
					</div>
				</div>
				<div class="row">
					<div class="col-xl-6 col-xxl-12">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title" style="font-weight:bold;">등록금 파일 업로드</h4>
							</div>
							<div class="card-body">
								<div class="basic-form custom_file_input">
									<form method="post" action="upload-tuition" enctype="multipart/form-data" onsubmit="return fn_registTuition();">
										<label>학번</label>
										<div class="form-group">
											<input id="code" class="form-control" type="text" name="code" placeholder="학번을 입력하세요.">
										</div>
										<label>등록금 고지서</label>
										<div class="custom-file">
											<input id="input-tuition" type="file" name="file" class="custom-file-input"> <label id="label-tuition" class="custom-file-label">파일 선택</label>
										</div>
										<label></label>
										<div class="input-group-append">
											<input class="btn btn-primary" type="submit" value="등록">
										</div>
									</form>
								</div>
							</div>
							<br>
						</div>
					</div>
					<div class="col-xl-6 col-xxl-12">
						<div class="card">
                            <div class="card-header">
                                <h5 class="card-title">Information</h5>
                            </div>
                            <div class="card-body" style="padding:1.52rem;">
                                <p class="card-text">
                                	 해당 학생 학번을 입력 후, 등록금 고지서 업로드 해주세요.
                                     <br/><br/><br/><br/><br/><br/>
                                </p>
                            </div>
                            <div class="card-footer">
                                <p class="card-text d-inline">메타 대학교</p>
                                <a href="/board/boardlist" class="card-link float-right">Board link</a>
                            </div>
                        </div>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title" style="font-weight:bold;">등록금 파일 목록</h4>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table id="example2" class="display" style="width: 100%">
										<thead>
											<tr>
												<th>학번</th>
												<th>이름</th>
												<th>학과</th>
												<th>파일명</th>
											</tr>
										</thead>
										<tbody>
											<!-- fileList 리스트 반복문 -->
											<c:forEach var="fileList" items="${fileList}">
												<tr>
													<td>${fileList.code}</td>
													<td>${fileList.name}</td>
													<td>${fileList.departmentName}</td>
													<td>${fileList.fileName}</td>
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
									<button type="submit" class="btn btn-primary" onclick="">다운로드</button>
								</form>
								<form action="/tuition/delete-tuition">
									<input id="deleteCodeVal" type="hidden" name="code">
									<button type="submit" class="btn btn-danger">삭제</button>
								</form>
								<button type="button" class="btn btn-dark" data-dismiss="modal">닫기</button>
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
				swal("학번을 입력하세요.");
				return false;
			}

			if ($("#label-tuition").text() == 'Choose File') {
				swal("등록금 고지서 파일을 첨부하세요.");
				return false;
			}
		}

		var msg = "${message}";
		if (msg === "noStudent") {
			swal("등록금 고지서 등록 실패","해당 학생이 존재하지 않습니다.","error");
		} else if (msg === "overFile") {
			swal("등록금 고지서 등록 실패","해당 학생은 파일이 이미 등록되어 있습니다.","warning");
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


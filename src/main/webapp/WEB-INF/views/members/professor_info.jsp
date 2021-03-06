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
							<h4 style="font-weight:bold;">내 정보</h4>
						</div>
					</div>
					<div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="javascript:void(0)">마이페이지</a></li>
							<li class="breadcrumb-item active"><a href="javascript:void(0)">내 정보</a></li>
						</ol>
					</div>
				</div>
				<!-- row -->
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title" style="font-weight:bold;">교수 정보</h4>
							</div>
							<div class="card-body">
								<div class="form-validation">
									<form id="myForm" class="form-valide">
										<div class="row">
											<div class="col-xl-6">
												<div class="form-group row">
													<label class="col-lg-4 col-form-label">교수 이름 <span class="text-danger">*</span>
													</label>
													<div class="col-lg-6">
														<input type="text" class="form-control" value="${professor.name }" readonly>
													</div>
												</div>
												<div class="form-group row">
													<label class="col-lg-4 col-form-label">교수 ID <span class="text-danger">*</span>
													</label>
													<div class="col-lg-6">
														<input type="text" class="form-control" name="code" value="${professor.code }" readonly>
													</div>
												</div>
												<div class="form-group row">
													<label class="col-lg-4 col-form-label">생년월일 <span class="text-danger">*</span>
													</label>
													<div class="col-lg-6">
														<fmt:formatDate var="birthday" value="${professor.birthday}" pattern="yyyy-MM-dd" />
														<input type="text" class="form-control" value="${birthday }" readonly>
													</div>
												</div>
											</div>
											<div class="col-xl-6">
												<div class="form-group row">
													<label class="col-lg-4 col-form-label">학과 <span class="text-danger">*</span>
													</label>
													<div class="col-lg-6">
														<input type="text" class="form-control" value="${professor.departmentName }" readonly>
													</div>
												</div>
												<div class="form-group row">
													<label class="col-lg-4 col-form-label">교수 직급 <span class="text-danger">*</span>
													</label>
													<div class="col-lg-6">
														<input type="text" class="form-control" value="${professor.degree }" readonly>
													</div>
												</div>
												<div class="form-group row">
													<label class="col-lg-4 col-form-label">Phone <span class="text-danger">*</span>
													</label>
													<div class="col-lg-6">
														<input type="text" id="phone" class="form-control" name="phone" value="${professor.phone }">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-lg-4 col-form-label">Email <span class="text-danger">*</span>
													</label>
													<div class="col-lg-6">
														<input type="text" id="email" class="form-control" name="email" value="${professor.email }">
													</div>
												</div>
											</div>
										</div>
									</form>
									<div class="form-group row">
										<div class="col-lg-2 ml-auto">
											<button class="btn btn-primary" onclick="fn_revise();">수정</button>
										</div>
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
	<script type="text/javascript">
		function fn_revise() {
			if ($('#phone').val() === '') {
				swal("핸드폰 번호를 입력하세요.");
				return;
			} else if ($('#email').val() === '') {
				swal("이메일을 입력하세요.")
				return;
			}

			var params = $('#myForm').serializeArray();

			$.ajax({
				url : "/members/update-professor-info",
				type : "POST",
				data : params,
				error : function(request, status, error) {
					swal("error","","error");
				},

				success : function(data) {
					swal("성공적으로 저장되었습니다.", "" ,"success").then((value) => {
						if(value){
							document.location.href = "/members/mypage";
						}
					});
				}
			})
		}
	</script>

	<!-- Required vendors -->
	<script src="../resources/vendor/global/global.min.js"></script>
	<script src="../resources/js/quixnav-init.js"></script>
	<script src="../resources/js/custom.min.js"></script>

	<!-- Jquery Validation -->
	<script src="../resources/vendor/jquery-validation/jquery.validate.min.js"></script>
	<!-- Form validate init -->
	<script src="../resources/js/plugins-init/jquery.validate-init.js"></script>
</body>
</html>
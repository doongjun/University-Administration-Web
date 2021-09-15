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
							<h4>My Page</h4>
							<p class="mb-1">${admin.name } 관리자</p>
						</div>
					</div>
					<div
						class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="javascript:void(0)">Form</a></li>
							<li class="breadcrumb-item active"><a
								href="javascript:void(0)">Validation</a></li>
						</ol>
					</div>
				</div>
				<!-- row -->
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title">Form Validation</h4>
							</div>
							<div class="card-body">
								<div class="form-validation">
									<form class="form-valide" action="#" method="post">
										<div class="row">
											<div class="col-xl-6">
												<div class="form-group row">
													<label class="col-lg-4 col-form-label">Admin Name
														<span class="text-danger">*</span>
													</label>
													<div class="col-lg-6">
														<input type="text" class="form-control" value="${admin.name }" readonly>
													</div>
												</div>
												<div class="form-group row">
													<label class="col-lg-4 col-form-label">관리자 번호
														<span class="text-danger">*</span>
													</label>
													<div class="col-lg-6">
														<input type="text" class="form-control" value="${admin.code }" readonly>
													</div>
												</div>
												<div class="form-group row">
													<label class="col-lg-4 col-form-label" for="val-password">Password
														<span class="text-danger">*</span>
													</label>
													<div class="col-lg-6">
														<input type="password" class="form-control"
															id="val-password" name="val-password"
															placeholder="변경할 비밀번호">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-lg-4 col-form-label"
														for="val-confirm-password">Confirm Password <span
														class="text-danger">*</span>
													</label>
													<div class="col-lg-6">
														<input type="password" class="form-control"
															id="val-confirm-password" name="val-confirm-password"
															placeholder="비밀번호 확인">
													</div>
												</div>
												<div class="form-group row">
													<div class="col-lg-8 ml-auto">
														<button type="submit" class="btn btn-primary">Submit</button>
													</div>
												</div>
												<div class="form-group row">
													<label class="col-lg-4 col-form-label">email
														<span class="text-danger">*</span>
													</label>
													<div class="col-lg-6">
														<input type="text" class="form-control" value="${admin.email }" readonly>
													</div>
												</div>
											</div>
											<div class="col-xl-6">
												<div class="form-group row">
													<label class="col-lg-4 col-form-label">부서
														<span class="text-danger">*</span>
													</label>
													<div class="col-lg-6">
														<input type="text" class="form-control" value="${admin.division }" readonly>
													</div>
												</div>
												<div class="form-group row">
													<label class="col-lg-4 col-form-label">직급
														<span class="text-danger">*</span>
													</label>
													<div class="col-lg-6">
														<input type="text" class="form-control" value="${admin.position }" readonly>
													</div>
												</div>
												<div class="form-group row">
													<label class="col-lg-4 col-form-label">Phone
														<span class="text-danger">*</span>
													</label>
													<div class="col-lg-6">
														<input type="text" class="form-control" value="${admin.phone }" readonly>
													</div>
												</div>
											</div>
										</div>
									</form>
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
	<!-- Required vendors -->
	<script src="../resources/vendor/global/global.min.js"></script>
	<script src="../resources/js/quixnav-init.js"></script>
	<script src="../resources/js/custom.min.js"></script>




	<!-- Jquery Validation -->
	<script
		src="../resources/vendor/jquery-validation/jquery.validate.min.js"></script>
	<!-- Form validate init -->
	<script src="../resources/js/plugins-init/jquery.validate-init.js"></script>
</body>
</html>
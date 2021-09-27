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
							<h4>My Page</h4>
							<p class="mb-1">${member.name } 관리자</p>
						</div>
					</div>
					<div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="javascript:void(0)">학적</a></li>
							<li class="breadcrumb-item active"><a href="javascript:void(0)">내 학적 정보</a></li>
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
									<form id="myForm" class="form-valide">
										<div class="row">
											<div class="col-xl-6">
												<div class="form-group row">
													<label class="col-lg-4 col-form-label">Admin Name <span class="text-danger">*</span>
													</label>
													<div class="col-lg-6">
														<input type="text" class="form-control" value="${admin.name }" readonly>
													</div>
												</div>
												<div class="form-group row">
													<label class="col-lg-4 col-form-label">관리자 번호 <span class="text-danger">*</span>
													</label>
													<div class="col-lg-6">
														<input type="text" class="form-control" name="code" value="${admin.code }" readonly>
													</div>
												</div>
												<div class="form-group row">
													<label class="col-lg-4 col-form-label">Phone <span class="text-danger">*</span>
													</label>
													<div class="col-lg-6">
														<input type="text" id="phone" class="form-control" name="phone" value="${admin.phone }">
													</div>
												</div>
											</div>
											<div class="col-xl-6">
												<div class="form-group row">
													<label class="col-lg-4 col-form-label">부서 <span class="text-danger">*</span>
													</label>
													<div class="col-lg-6">
														<input type="text" id="division" class="form-control" name="division" value="${admin.division }">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-lg-4 col-form-label">직급 <span class="text-danger">*</span>
													</label>
													<div class="col-lg-6">
														<input type="text" id="position" class="form-control" name="position" value="${admin.position }">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-lg-4 col-form-label">email <span class="text-danger">*</span>
													</label>
													<div class="col-lg-6">
														<input type="text" id="email" class="form-control" name="email" value="${admin.email }">
													</div>
												</div>
												<div class="form-group row">
													<div class="col-lg-8 ml-auto">
														<button class="btn btn-primary" onclick="fn_revise();">Submit</button>
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
	<script type="text/javascript">
	var params = $('#myForm').serializeArray();
	console.log(params);
		function fn_revise() {
			if($('#phone').val() === ''){
				swal("핸드폰 번호를 입력하세요.");
				return;
			}else if($('#email').val() === ''){
				swal("이메일을 입력하세요.")
				return;
			}else if($('#division').val() === ''){
				swal("부서를 입력하세요.");
				return;
			}else if($('#position').val() === ''){
				swal("직급을 입력하세요.");
				return;
			}
    		
			
			var params = $('#myForm').serializeArray();
			console.log(params);
			
			$.ajax({
				url : "/members/update-admin-info",
				type : "POST",
				data : params,
				error : function(request, status, error) {
					alert("error");
				},
				success : function(data) {
					alert("success");
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
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
							<h4>Change Password</h4>
							<p class="mb-1">비밀번호 변경</p>
						</div>
					</div>
					<div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="javascript:void(0)">학적</a></li>
							<li class="breadcrumb-item active"><a href="javascript:void(0)">비밀번호 변경</a></li>
						</ol>
					</div>
				</div>

				<!-- row -->
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title">Password</h4>
							</div>
							<div class="card-body">
								<div class="form-validation"><!--  onsubmit="return fn_submit();"-->
									<form class="form-valide" action="/members/pw-change" method="post" name="pwform" >
										<div class="row">
											<div class="col-xl-6">
												<div class="form-group row">
													<label class="col-lg-4 col-form-label" for="val-password">현재 비밀번호 <span class="text-danger">*</span>
													</label>
													<div class="col-lg-6">
														<input type="password" class="form-control" id="curPassword" name="curPassword">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-lg-4 col-form-label" for="val-password">새 비밀번호 <span class="text-danger">*</span>
													</label>
													<div class="col-lg-6">
														<input type="password" class="form-control" id="val-password" name="val-password" placeholder="">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-lg-4 col-form-label" for="val-confirm-password">새 비밀번호 확인 <span class="text-danger">*</span>
													</label>
													<div class="col-lg-6">
														<input type="password" class="form-control" id="val-confirm-password" name="val-confirm-password" placeholder="">
													</div>
												</div>
												<div class="form-group row">
													<div class="col-lg-8 ml-auto">
														<button type="submit" class="btn btn-primary">Submit</button>
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
	<script src="../resources/vendor/jquery-validation/jquery.validate.min.js"></script>
	<!-- Form validate init -->
	<script src="../resources/js/plugins-init/jquery.validate-init.js"></script>

	<script>
	
	$("button[type='submit']").click(function(e){
		e.preventDefault();
		
			let curPassword=$("input[name='curPassword']").val();
			let valpassword=$("input[name='val-password']").val();
			let valconfirmpassword=$("input[name='val-confirm-password']").val();
		if(curPassword==""){
			swal("현재 비밀번호를 입력하세요.");
			$("input[name='curPassword']").focus();
			return;
			}
		if(valpassword==""){
			swal("새 비밀번호를 입력하세요.");
			$("input[name='val-password']").focus();
			return;
			}
		if(valconfirmpassword==""){
			swal("새 비밀번호를 확인하세요.");
			$("input[name='val-password']").focus();
			return;
			}
			
		var form=$(".form-valide");
			form.submit();
		})
			
		var msg = "${message}";
		if(msg === "wrongPassword"){
			swal("비밀번호 변경 실패", "비밀번호가 틀렸습니다.", "error");
			//alert("비밀번호가 틀렸습니다.");
		}else if(msg === "success"){
			swal("비밀번호 변경 성공", "다시 로그인 해주세요.", "success").then((value) => {
				if(value){
					document.location.href="/logout";
				}
			});
			//alert("비밀번호 변경 성공! 다시 로그인 해주세요.");
			//document.location.href="/logout";
		}
		
	</script>
</body>
</html>
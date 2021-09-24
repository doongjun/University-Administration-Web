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
							<h4>등록금 고지서 등록</h4>
							<span class="ml-1">관리자</span>
						</div>
					</div>
					<div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="javascript:void(0)">학적</a></li>
							<li class="breadcrumb-item active"><a href="javascript:void(0)">등록금 고지서 등록</a></li>
						</ol>
					</div>
				</div>
				<div class="row">
					<div class="col-xl-6 col-xxl-12">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title">file input</h4>
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
											<input id="input-tuition" type="file" name="file" class="custom-file-input"> 
											<label id="label-tuition" class="custom-file-label">Choose File</label>
										</div>
										<label></label>
										<div class="input-group-append">
											<input class="btn btn-primary" type="submit" value="등록">
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
    <script>
    function fn_registTuition(){
		if($("#code").val() == ''){
			alert("학번을 입력하세요.");
     		return false;
		}
		
		if($("#label-tuition").text() == 'Choose File'){
			alert("등록금 고지서 파일을 첨부하세요.");
     		return false;
		}
	}
    
    var msg = "${message}";
	if(msg === "noStudent"){
		alert("해당 학생이 존재하지 않습니다.");
	}
	
	
	$(document).ready(function(){
    		var fileTarget = $('#input-tuition');

    		fileTarget.on('change', function(){
    			if(window.FileReader){
    				var fileName = $(this)[0].files[0].name;
    			}else{
    				var fileName = $(this).val().split('/').pop().split('\\').pop();
    			}
    			
    			$('#label-tuition').text(fileName);
    		})
    	})
    </script>
    
	<!-- Required vendors -->
	<script src="../resources/vendor/global/global.min.js"></script>
	<script src="../resources/js/quixnav-init.js"></script>
	<script src="../resources/js/custom.min.js"></script>

</body>

</html>


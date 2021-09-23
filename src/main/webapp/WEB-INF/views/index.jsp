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
			<!-- row -->
			<div class="container-fluid">
				<div class="row"></div>
				<!-- /# column -->
			</div>
			<div class="row">
				<div class="col-xl-8 col-lg-8 col-md-8">
					<div class="card">
						<div class="card-header">
							<h4 class="card-title">Sales Overview</h4>
						</div>
						<div class="card-body">
							<div class="row">
								<div class="col-xl-12 col-lg-8">
									<div id="morris-bar-chart"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-4 col-lg-4 col-md-4">
					<div class="card">
						<div class="card-body text-center">
							<div class="m-t-10">
								<h4 class="card-title">Customer Feedback</h4>
								<h2 class="mt-3">385749</h2>
							</div>
							<div class="widget-card-circle mt-5 mb-5" id="info-circle-card">
								<i class="ti-control-shuffle pa"></i>
							</div>
							<ul class="widget-line-list m-b-15">
								<li class="border-right">92% <br>
								<span class="text-success"><i class="ti-hand-point-up"></i> Positive</span></li>
								<li>8% <br>
								<span class="text-danger"><i class="ti-hand-point-down"></i>Negative</span></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4"></div>

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


	<!-- Vectormap -->
	<script src="../resources/vendor/raphael/raphael.min.js"></script>
	<script src="../resources/vendor/morris/morris.min.js"></script>


	<script src="../resources/vendor/circle-progress/circle-progress.min.js"></script>
	<script src="../resources/vendor/chart.js/Chart.bundle.min.js"></script>

	<script src="../resources/vendor/gaugeJS/dist/gauge.min.js"></script>

	<!--  flot-chart js -->
	<script src="../resources/vendor/flot/jquery.flot.js"></script>
	<script src="../resources/vendor/flot/jquery.flot.resize.js"></script>

	<!-- Owl Carousel -->
	<script src="../resources/vendor/owl-carousel/js/owl.carousel.min.js"></script>

	<!-- Counter Up -->
	<script src="../resources/vendor/jqvmap/js/jquery.vmap.min.js"></script>
	<script src="../resources/vendor/jqvmap/js/jquery.vmap.usa.js"></script>
	<script src="../resources/vendor/jquery.counterup/jquery.counterup.min.js"></script>


	<script src="../resources/js/dashboard/dashboard-1.js"></script>

</body>

</html>
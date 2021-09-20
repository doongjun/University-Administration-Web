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
        
        <jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
        
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
                            <h4>수강내역조회</h4>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">수강</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0)">수강내역조회</a></li>
                        </ol>
                    </div>
                </div>
                <!-- row -->


                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">신청과목</h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered table-scroll">
										<thead class="table-light" style="color:white; background-color:gray; text-align:center;">
											<tr>
										        <th>강의번호</th>
										        <th>강의년도</th>
										        <th>학년</th>
										        <th>학기</th>
										        <th>구분</th>
										        <th>강의이름</th>
										        <th>강의실</th>
										        <th>강의시간</th>
										        <th>분반</th>
										        <th>학점</th>
										        <th>신청</th>
									        </tr>
										</thead>
										<tbody style="color:black; text-align:center;">
											<!-- 게시판 리스트 반복문 -->
											<c:forEach var="vo" items="${vo}" varStatus="cnt">
												<tr>
													<td style="display:none;">${vo.id}</td>
													<td>${vo.lecture_code}</td>
													<td>${vo.lecture_year}</td>
													<td>${vo.grade}</td>
													<td>${vo.semester}</td>
													<td>${vo.section}</td>
													<td>${vo.lecture_name}</td>
													<td>${vo.classroom}</td>
													<td>${vo.lecture_time}</td>
													<td>${vo.division}</td>
													<td>${vo.credit}</td>
													<td><button name="" id="putInCheckBtn${cnt.count}" type="button" class="btn btn-danger">취소</button></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
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
    <!--removeIf(production)-->
    <!-- Demo scripts -->
    <script src="../resources/js/styleSwitcher.js"></script>



    <script src="../resources/vendor/jqueryui/js/jquery-ui.min.js"></script>
    <script src="../resources/vendor/moment/moment.min.js"></script>

    <script src="../resources/vendor/fullcalendar/js/fullcalendar.min.js"></script>
    <script src="../resources/js/plugins-init/fullcalendar-init.js"></script>

</body>

</html>
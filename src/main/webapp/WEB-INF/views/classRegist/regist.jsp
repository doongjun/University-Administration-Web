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
                            <h4>수강 신청</h4>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">수강</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0)">수강 신청</a></li>
                        </ol>
                    </div>
                </div>
                <!-- row -->
				<div class="row">
					<div class="col-12">
						<div class="card">
					   		<div class="card-body">
					   			<div style="float:left; margin-top: 5px;">구분</div>
								<div class="col-lg-2" style="float:left; margin-bottom: 10px; margin-left: 6px">
				        			<select name="dept" id="dept" class="form-control" >
					                	<option value="empty">전공/전공기초</option>
					                	<option value="empty">교양/기타</option>
					             	</select>
				        		</div>
				        		<div style="float:left; margin-top: 5px;">입력 검색</div>
				        		<div class="col-lg-3" style="float:left; margin-right: 6px">
				        			<input type="textarea" name="rep" class="form-control" placeholder="교과목명 또는 코드 입력" value=""/>
				        		</div>
				        		<button name="rep-btn" type="button" class="btn btn-primary" style="float: left">확인</button>
					   		</div>
					   		<div>
					   			<div style="float:left; padding-left:20px; margin-top: 5px;">학부(과)</div>
								<div class="col-lg-2" style="float:left; margin-bottom: 10px; margin-left: 6px">
				        			<select name="dept" id="dept" class="form-control" >
					                	<option value="empty">선택</option>
					             	</select>
				        		</div>
				        		<div style="float:left; margin-top: 5px;">구분</div>
				        		<div class="col-lg-2" style="float:left; margin-right: 6px">
				        			<select name="dept" id="dept" class="form-control" >
					                	<option value="empty">전공/전공기초</option>
					                	<option value="empty">교양/기타</option>
					             	</select>
				        		</div>
				        		<div style="float:left; margin-top: 5px;">학년</div>
				        		<div class="col-lg-2" style="float:left; margin-right: 6px">
				        			<select name="dept" id="dept" class="form-control" >
				        				<option value="">전체</option>
					                	<option value="">1학년</option>
					                	<option value="">2학년</option>
					                	<option value="">3학년</option>
					                	<option value="">4학년</option>
					             	</select>
				        		</div>	
				        		<button name="rep-btn" type="button" class="btn btn-primary" style="float: left">확인</button>
					   		</div>
						</div>
					</div>
				</div>

                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">개설과목</h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered table-scroll">
										<thead class="table-light" style="color:white; background-color:gray; text-align:center;">
											<tr>
										        <th>강의번호</th>
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
											<c:forEach var="vo" items="${vo}">
												<tr>
													<td>${vo.lecture_code}</td>
													<td>${vo.grade}-${vo.semester}</td>
													<td>${vo.section}</td>
													<td>${vo.lecture_name}</td>
													<td>${vo.classroom}</td>
													<td>${vo.lecture_time}</td>
													<td>${vo.division}</td>
													<td>${vo.credit}</td>
													<td><button name="" type="button" class="btn btn-primary">담기</button></td>
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
    


    <!-- Datatable -->
    <script src="../resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="../resources/js/plugins-init/datatables.init.js"></script>

</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
                            <h4>강의내역조회</h4>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">강의관리</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0)">강의내역조회</a></li>
                        </ol>
                    </div>
                </div>
                <!-- row -->


                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">내강의목록</h4>
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
										        <th>관리</th>
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
													<td><button onclick="fn_update(${vo.id});" type="button" class="btn btn-danger">수정</button>
													<button name="" id="putInCheckBtn${cnt.count}" type="button" class="btn btn-danger">삭제</button>
													<button name="" id="putInCheckBtn${cnt.count}" type="button" class="btn btn-danger">수강생</button></td>
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
        Main wrapper end
    ***********************************-->
	
	<!--**********************************
        Modal start
    ***********************************-->
	<div class="modal" tabindex="-1" role="dialog">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">강의 취소</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body" style="margin-top:10px; color:black; text-align:center;">
	        <p>이 강의를 취소하시겠습니까?</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" id="modalDeleteBtn">확인</button>
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!--**********************************
        Modal end
    ***********************************-->
	
	<input type="hidden" id="s_id" value="${member.id}">
	
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
	
	<script>
    	let modal = $(".modal");
    	
    	var modalDeleteBtn = $("#modalDeleteBtn");
    	
    	//var student_id = $("#s_id").val();
    	var lecture_code= "";

    	var lecture_cnt = "${fn:length(vo)}";
    	console.log(lecture_cnt);
    	
    	for(var i = 1; i <= lecture_cnt; i++) {
    		$("#putInCheckBtn" + i).click(function() {
    			lecture_code = $(this).closest("tr").find("td:eq(0)").text();
    			console.log(lecture_code);
        		modal.modal("show");
        		//document.location.href = "/professorLecture/updateform/"+lecture_code;
        	});
    	}
    	
    	
    	modalDeleteBtn.click(function() {
    		
    		$.ajax({
    			url:'/studentLecture/rest_delete/' + student_id + "/" + lecture_id,
    			type:'delete',
    			async:false,
    			success:function(result) {
    				console.log(result);
    			}
    		})
    		
    		location.href = "/studentLecture/list";
    		
    		alert("취소되었습니다. ");    		
    		modal.modal("hide");
    	});
    	
    	//test
    	
    	function fn_update(var lecture_id) {
    		location.href = "/professorLecture/updateform/"+lecture_id;
		}
    </script>
</body>

</html>
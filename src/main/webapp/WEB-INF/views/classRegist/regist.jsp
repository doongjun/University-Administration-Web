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
				        			<select name="section" id="section" class="form-control" >
					                	<option value="empty">전공/전공기초</option>
					                	<option value="empty">교양/기타</option>
					             	</select>
				        		</div>
				        		<div style="float:left; margin-top: 5px;">학년</div>
				        		<div class="col-lg-2" style="float:left; margin-right: 6px">
				        			<select name="grade" id="grade" class="form-control" >
				        				<option value="">전체</option>
					                	<option value="">1학년</option>
					                	<option value="">2학년</option>
					                	<option value="">3학년</option>
					                	<option value="">4학년</option>
					             	</select>
				        		</div>
				        		<div style="float:left; margin-top: 5px;">학기</div>
				        		<div class="col-lg-2" style="float:left; margin-right: 6px">
				        			<select name="semester" id="semester" class="form-control" >
					                	<option value="">1학기</option>
					                	<option value="">2학기</option>
					                	<option value="">여름학기</option>
					                	<option value="">겨울학기</option>
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
													<td><button name="" id="putInCheckBtn${cnt.count}" type="button" class="btn btn-primary">담기</button></td>
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
            page start
        ***********************************-->
		<!-- 페이지 담당 -->
        <div class="card-footer clearfix">
			<div class="card-tools">
				<ul class="pagination pagination-sm float-right">
					<!-- 이전페이지 -->
                	<c:if test="${pageVo.prev}">
       	            	<li class="page-item"><a href="${pageVo.startPage-1}" class="page-link">&laquo;</a></li>
   	                </c:if>
   	                <!-- 페이지 (1,2,3,...) -->
					<c:forEach var="idx" begin="${pageVo.startPage}" end="${pageVo.endPage}">
                    	<li class="page-item ${pageVo.cri.pageNum==idx?'active':''}">
                        	<a href="${idx}" class="page-link">${idx}</a>
                        </li>
                    </c:forEach>
                    <!-- 다음 페이지 -->
                    <c:if test="${pageVo.next}">
                    	<li class="page-item"><a href="${pageVo.endPage+1}" class="page-link">&raquo;</a></li>
                    </c:if>
				</ul>
			</div>
        </div>
        <!-- 페이지 끝 -->
        <!--**********************************
            page end
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
        Modal start
    ***********************************-->
	<div class="modal" tabindex="-1" role="dialog">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">강의 신청</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body" style="margin-top:10px; color:black; text-align:center;">
	        <p>이 강의를 신청하시겠습니까?</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" id="modalRegisterBtn">신청</button>
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!--**********************************
        Modal end
    ***********************************-->
	
	<input type="hidden" id="s_id" value="${member.id}">
	
	<form action="" method="get" id="actionForm">
		<input type="hidden" name="pageNum" value="${pageVo.cri.pageNum}" />
		<input type="hidden" name="amount" value="${pageVo.cri.amount}" />
	</form>	
	
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
    
    <script>
    	let modal = $(".modal");
    	
    	var modalRegisterBtn = $("#modalRegisterBtn");
    	
    	var student_id = $("#s_id").val();
    	var lecture_id= "";

    	var lecture_cnt = "${fn:length(vo)}";
    	console.log(lecture_cnt);
    	
    	for(var i = 1; i <= lecture_cnt; i++) {
    		$("#putInCheckBtn" + i).click(function() {
    			lecture_id = $(this).closest("tr").find("td:eq(0)").text();
    			
        		modal.modal("show");
        	});
    	}
    	
    	modalRegisterBtn.click(function() {
    		
    		$.ajax({
    			url:'/studentLecture/rest_new/' + student_id + "/" + lecture_id,
    			type:'put',
    			async:false,
    			success:function(result) {
    				console.log(result);
    			}
    		})
    		
    		alert("신청되었습니다. ");    		
    		modal.modal("hide");
    	});
    	
    	// 하단 페이지 나누기 버튼 클릭시 이동
    	var actionForm = $("#actionForm");
    	
    	$(".page-item a").click(function(e){
    		e.preventDefault(); //a 속성 중지
    		
    		//actionForm 안에 pageNum의 값을 사용자가 선택한 번호로 변경
    		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
    		
    		//actionForm 보내기 
    		actionForm.submit();
    	});
    </script>

</body>

</html>
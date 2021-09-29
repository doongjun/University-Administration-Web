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
							<h4 style="font-weight:bold;">강의계획서 조회</h4>
						</div>
					</div>
					<div
						class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="javascript:void(0)">강의관리</a></li>
							<li class="breadcrumb-item active"><a
								href="javascript:void(0)">강의계획서 조회</a></li>
						</ol>
					</div>
				</div>
				
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
					   		<div class="card-body">
					   			<div style="float:left; margin-top: 7px;">검색</div>
								<div class="col-lg-2" style="float:left;">
				        			<select name="kind" id="kind" class="form-control" >
					                	<option value="강의번호">강의번호</option>
					                	<option value="교과명">교과명</option>
					             	</select>
				        		</div>
				        		<div class="col-lg-2" style="float:left; margin-left: -20px">
				        			<input type="text" name="searchKeyword" id="searchKeyword" class="form-control" placeholder="검색어를 입력하세요." value=""/>
				        		</div>
				        		<button name="searchBtn1" id="searchBtn1" type="button" class="btn btn-primary" style="float: left;">검색</button>
					   		</div>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12">
						<div class="card">
							<div class="card-header"> 
								<h4 class="card-title">수강내역</h4>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered table-scroll">
										<thead class="table-light" style="color:white; background-color:gray; text-align:center;">
											<tr>
												<th>강의번호</th>
												<th>학기</th>
												<th>강의이름</th>
												<th>강의실</th>
												<th>강의시간</th>
												<th>학점</th>
												<th>강의계획서</th>
											</tr>
										</thead>
										<tbody style="color:black; text-align:center;">
											<!-- 게시판 리스트 반복문 -->
											<c:forEach var="vo" items="${vo}" varStatus="cnt">
												<tr>
													<td style="display:none;">${vo.id}</td>
													<td>${vo.lecture_code}</td>
													<td>${vo.grade}-${vo.semester}</td>
													<td>${vo.lecture_name}</td>
													<td>${vo.classroom}</td>
													<td>${vo.lecture_time}</td>
													<td>${vo.credit}</td>
													<td><button name="" id="syllabusBtn${cnt.count}" type="button" class="btn btn-secondary" style="color:white;">강의계획서</button></td>
												</tr>
											</c:forEach>
										</tbody>
										
									</table>
									<c:if test="${empty vo}">
												  	<div style="text-align: center; margin-top: 10px;">검색결과가 없습니다</div>
									</c:if>
								</div>
								<div align="center">
									<iframe src="../resources/upload/lecture_000001.pdf" id="syllFrame" style="width:1000px;height:700px;display:none;"></iframe>
								</div>
							</div>
						</div>
					</div>
					
					
				</div>
				<!-- 검색결과 -->

				
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
	
	<form action="/lecture/syllabus" method="get" id="actionForm">
		<input type="hidden" name="pageNum" value="${pageVo.cri.pageNum}" />
		<input type="hidden" name="amount" value="${pageVo.cri.amount}" />
		
		<input type="hidden" name="kind" value="${pageVo.cri.kind}" />
		<input type="hidden" name="keyword" value="${pageVo.cri.keyword}" />
	</form>	
	
	<!--**********************************
        Scripts
    ***********************************-->
	<!-- Required vendors -->
	<script src="../resources/vendor/global/global.min.js"></script>
	<script src="../resources/js/quixnav-init.js"></script>
	<script src="../resources/js/custom.min.js"></script>



	<!-- Datatable -->
	<script
		src="../resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
	<script src="../resources/js/plugins-init/datatables.init.js"></script>
	<script>
		var lecture_cnt = "${fn:length(vo)}";
		var lecture_code = "";
		
		console.log(lecture_cnt);
		
		// 과목 담기 버튼에게 각각 클릭 기능 붙이기
		for(var i = 1; i <= lecture_cnt; i++) {
			$("#syllabusBtn" + i).click(function() {
				lecture_code = $(this).closest("tr").find("td:eq(1)").text();
				
				var src = "../resources/upload/lecture_" + lecture_code + ".pdf";
				
				$("#syllFrame").attr("src",src);
				
				$("#syllFrame").css({
					display: ""
				})
	    	});
		}
		
		// 하단 페이지 나누기 버튼 클릭시 이동
    	var actionForm = $("#actionForm");
    	
    	$(".page-item a").click(function(e){
    		e.preventDefault(); //a 속성 중지
    		
    		//actionForm 안에 pageNum의 값을 사용자가 선택한 번호로 변경
    		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
    		
    		//actionForm 보내기 
    		actionForm.submit();
    	});
    	
    	// 검색
    	$("#searchBtn1").click(function(e){
    		e.preventDefault(); //a 속성 중지
    		
    		if($("#searchKeyword").val() == "") {
    			swal("검색어를 입력해주세요.","", "error");
    		} else {
    			actionForm.attr("action", "/lecture/search");
        		
        		//actionForm 안에 pageNum의 값을 사용자가 선택한 번호로 변경
        		actionForm.find("input[name='pageNum']").val(1);

        		actionForm.find("input[name='kind']").val($("#kind option:selected").val());
        		actionForm.find("input[name='keyword']").val($("#searchKeyword").val());
        		
        		//actionForm 보내기 
        		actionForm.submit();
    		}
    		
    	});
	</script>
</body>

</html>
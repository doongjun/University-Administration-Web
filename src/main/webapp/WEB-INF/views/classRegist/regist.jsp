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
                            <h4 style="font-weight:bold;">수강신청</h4>
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
				        			<select name="section_up" id="section_up" class="form-control" >
					                	<option value="전공">전공</option>
					                	<option value="전공기초">전공기초</option>
					                	<option value="교양">교양</option>
					                	<option value="기타">기타</option>
					             	</select>
				        		</div>
				        		<div style="float:left; margin-top: 5px;">&nbsp;&nbsp;종류</div>
				        		<div style="float:left; margin-top: 5px;"></div>
								<div class="col-lg-2" style="float:left; margin-bottom: 10px; margin-left: 6px">
				        			<select name="kind" id="kind" class="form-control" >
					                	<option value="교과명">교과명</option>
					                	<option value="강의번호">강의번호</option>
					             	</select>
				        		</div>
				        		<div style="float:left; margin-top: 5px;">&nbsp;&nbsp;&nbsp;&nbsp;입력</div>
				        		<div class="col-lg-2" style="float:left; margin-right: 12px; ">
				        			<input type="text" name="searchKeyword" id="searchKeyword" class="form-control" placeholder="검색어를 입력하세요." value=""/>
				        		</div>
				        		<button name="searchBtn1" id="searchBtn1" type="button" class="btn btn-primary" style="float: left;">확인</button>
					   		</div>
					   		<div>
					   			<div style="float:left; padding-left:20px; margin-top: 5px;">학부</div>
								<div class="col-lg-2" style="float:left; margin-bottom: 10px; margin-left: 6px">
				        			<select name="dept" id="dept" class="form-control" >
					                	<option value="선택">선택</option>
					             	</select>
				        		</div>
				        		<div style="float:left; margin-top: 5px;">구분&nbsp;&nbsp;</div>
				        		<div class="col-lg-2" style="float:left; margin-right: 6px">
				        			<select name="section_bottom" id="section_bottom" class="form-control" >
				        				<option value="전체">전체</option>
					                	<option value="전공">전공</option>
					                	<option value="전공기초">전공기초</option>
					                	<option value="교양">교양</option>
					                	<option value="기타">기타</option>
					             	</select>
				        		</div>
				        		<div style="float:left; margin-top: 5px;">학년</div>
				        		<div class="col-lg-2" style="float:left; margin-right: 6px">
				        			<select name="grade" id="grade" class="form-control" >
				        				<option value="전체">전체</option>
					                	<option value="1학년">1학년</option>
					                	<option value="2학년">2학년</option>
					                	<option value="3학년">3학년</option>
					                	<option value="4학년">4학년</option>
					             	</select>
				        		</div>	
				        		<button name="searchBtn2" id="searchBtn2" type="button" class="btn btn-primary" style="float: left">확인</button>
					   		</div>
						</div>
					</div>
				</div>

                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">개설과목</h4>
                                <h4 class="card-title float-right" style="color: #593bdb"> 
                                 	${year} > ${semester}
                            	</h4> 
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered table-scroll">
										<thead class="table-light" style="color:white; background-color:gray; text-align:center;">
											<tr>
										        <th>강의번호</th>
										        <th>학과</th>
										        <th>학년</th>
										        <th>구분</th>
										        <th>강의이름</th>
										        <th>강의실</th>
										        <th>강의시간</th>
										        <th>분반</th>
										        <th>학점</th>
										        <th></th>
									        </tr>
										</thead>
										<tbody style="color:black; text-align:center;">
											<!-- 게시판 리스트 반복문 -->
											<c:forEach var="vo" items="${vo}" varStatus="cnt">
												<tr>
													<td style="display:none;">${vo.id}</td>
													<td>${vo.lecture_code}</td>
													<td>${vo.department_name}</td>
													<td>${vo.grade}</td>
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
									<c:if test="${empty vo}">
												  	<div style="text-align: center; margin-top: 10px;">검색결과가 없습니다</div>
									</c:if>
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
		<input type="hidden" name="flag" value="${pageVo.cri.flag}" />
		
		<!-- 검색 1  -->
		<input type="hidden" name="sectionType1" value="${pageVo.cri.sectionType1}" />
		<input type="hidden" name="kind" value="${pageVo.cri.kind}" />
		<input type="hidden" name="keyword" value="${pageVo.cri.keyword}" />
		
		<!-- 검색 2 -->
		<input type="hidden" name="department" value="${pageVo.cri.department}" />
		<input type="hidden" name="sectionType2" value="${pageVo.cri.sectionType2}" />
		<input type="hidden" name="grade" value="${pageVo.cri.grade}" />
		
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
		var lecture_time = "";
		var lecture_code = "";
		
    	var lecture_cnt = "${fn:length(vo)}";
    	console.log(lecture_cnt);
    	
    	// 과목 담기 버튼에게 각각 클릭 기능 붙이기
    	for(var i = 1; i <= lecture_cnt; i++) {
    		$("#putInCheckBtn" + i).click(function() {
    			lecture_id = $(this).closest("tr").find("td:eq(0)").text();
    			lecture_time = $(this).closest("tr").find("td:eq(7)").text();
    			lecture_code = $(this).closest("tr").find("td:eq(1)").text();
    			
        		modal.modal("show");
        	});
    	}
    	
    	// 학과 select박스에 정보 넣기
    	$.ajax({
    		url:"/classRegist/rest_dept",
    		type:"GET",
    		async:false,
    		success:function(data) {
    			var options = "";
    			
    			$.each(data, function(idx, element) {
    				options += "<option value=" + element + ">" + element + "</option>";
    			})
    			
    			$("select[name='dept']").append(options);
				
			}
    	});
    	
    	modalRegisterBtn.click(function() {
    		console.log(student_id);
    		
    		var isflag = true;
    		var timeFlag = true;
    		
    		$.getJSON({
            	url:"/studentLecture/rest_student_lecture/${member.id}",
            	type:"GET",
            	async:false,
            	success:function(data) {		
            		console.log(data);
    				$.each(data, function(idx, element) {
    					console.log(element.lecture_code + " : " + lecture_code);
    					console.log(element.lecture_time + " : " + lecture_time);
    					console.log(element.lecture_code == lecture_code);
    					
    					if(element.lecture_code == lecture_code) {
    						isflag = false;
    						return false;
    					}
    					
    					var e_time_spl = element.lecture_time.split(" ");
    					var l_time_spl = lecture_time.split(" ");
    					
    					if(e_time_spl[0] == l_time_spl[0]) {
    						var e_time = e_time_spl[1].split(",");
    						var l_time = l_time_spl[1].split(",");
    						
    						for(var i = 0; i < e_time.length; i++) {
    							for(var j = 0; j <  l_time.length; j++) {
    								if(e_time[i] == l_time[j]) {
        								timeFlag = false;
        								return false;
        							}
    							}
    						}
    					}
    				})		
    			}
            	
            });
    		
    		if(!isflag) {
    			swal("강의 중복", "이미 신청한 과목입니다.", "error"); 
    			modal.modal("hide");
    		} else if(!timeFlag){
    			swal("강의 시간 중복", "강의 시간이 중복됩니다.", "error"); 
    			modal.modal("hide");
    		} else {
    			$.ajax({
        			url:'/studentLecture/rest_new/' + student_id + "/" + lecture_id,
        			type:'PUT',
        			async:false,
        			success:function(result) {
        				console.log(result);
        			}
        		})
        		
        		swal("신청 완료", "수강신청 되었습니다.", "success");   		
        		modal.modal("hide");
    		}
    		
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
    	
    	$("#searchBtn1").click(function(e){
    		e.preventDefault(); //a 속성 중지
    		
    		if($("#searchKeyword").val() == "") {
    			swal("검색어를 입력해주세요.","", "error");
    		} else {
    			actionForm.attr("action", "/classRegist/search");
        		
        		//actionForm 안에 pageNum의 값을 사용자가 선택한 번호로 변경
        		actionForm.find("input[name='pageNum']").val(1);
        		actionForm.find("input[name='flag']").val("1");
        		
        		actionForm.find("input[name='sectionType1']").val($("#section_up option:selected").val());
        		actionForm.find("input[name='kind']").val($("#kind option:selected").val());
        		actionForm.find("input[name='keyword']").val($("#searchKeyword").val());
        		
        		//actionForm 보내기 
        		actionForm.submit();
    		}
    		
    	});
    	
    	$("#searchBtn2").click(function(e){
			e.preventDefault(); //a 속성 중지
    		
			if($("#dept option:selected").val() == "선택") {
    			swal("학과를 선택해주세요.","","error");
    		} else {
    			actionForm.attr("action", "/classRegist/search");
        		
        		//actionForm 안에 pageNum의 값을 사용자가 선택한 번호로 변경
        		actionForm.find("input[name='pageNum']").val(1);
        		actionForm.find("input[name='flag']").val("2");
        		
        		actionForm.find("input[name='department']").val($("#dept option:selected").val());
        		actionForm.find("input[name='sectionType2']").val($("#section_bottom option:selected").val());
        		actionForm.find("input[name='grade']").val($("#grade option:selected").val());
        		
        		//actionForm 보내기 
        		actionForm.submit();
    		}
    	});
    	
    	
    </script>

</body>

</html>
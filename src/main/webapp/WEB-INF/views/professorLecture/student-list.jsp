<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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
							<h4 style="font-weight:bold;">성적 입력</h4>
						</div>
					</div>
					<div
						class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="javascript:void(0)">수강생관리</a></li>
							<li class="breadcrumb-item active"><a
								href="javascript:void(0)">성적 입력</a></li>
						</ol>
					</div>
				</div>
				<!-- row -->


				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title" style="font-weight:bold;">수강생 관리</h4>
								<div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
									<button id="showScoreBtn" name="showScoreBtn" type="button" class="btn btn-primary ">성적입력</button>
									<button id="inputScoreBtn" style="margin-left: 5px; display: none; " name="inputScoreBtn" type="button" class="btn btn-primary">성적저장</button>
									<button id="cancelBtn" style="margin-left: 5px; display: none; " name="cancelBtn" type="button" class="btn btn-primary" onclick="location.reload();">취소</button>
								</div>
							</div>
							<div class="card-body">
							<div class="row-sm-8" style="overflow-y:scroll; width:100%; height:650px;">
								<form id="profForm" class="form-valide">
								<input id="lecture_id" name="lecture_id" type="hidden" value="${lecture_id}">
								<div class="table-responsive">
									<table class="table table-bordered table-scroll">
										<thead class="table-light"
											style="color: white; background-color: gray; text-align: center;">
											<tr>
												<th>학번</th>
												<th>학과</th>
												<th>이름</th>
												<th>학년</th>
												<th id="delete">관리</th>
												<th style="display:none;">중간</th>
												<th style="display:none;">기말</th>
												<th style="display:none;">과제</th>
												<th style="display:none;">출석</th>
												<th style="display:none;">총점</th>
												<th style="display:none;">학점</th>
											</tr>
										</thead>
										<tbody style="color: black; text-align: center;">
											<!-- 게시판 리스트 반복문 -->
											<c:forEach var="vo" items="${vo}" varStatus="cnt">
											<input name="student_id${cnt.count}" type="hidden" value="${vo.id}">
												<tr>
													<td style="display: none;">${vo.id}</td>
													<td>${vo.code}</td>
													<td>${vo.departmentName}</td>
													<td>${vo.name}</td>
													<td>${vo.grade}</td>
													<td id="delete">
														<button name="" id="deleteBtn${cnt.count}" type="button"
															class="btn btn-danger">삭제</button>
													</td>
													<td style="display:none;width:10%;">
														<input id="midterm_exam${cnt.count}" style="width:60%" value="${svo[cnt.index].midterm_exam}" name="midterm_exam${cnt.count}" type="number"  onchange="calculate(${cnt.count})">
													 </td>
													<td style="display:none;width:10%;"> 
														<input id="final_exam${cnt.count}" style="width:60%" value="${svo[cnt.index].final_exam}" name="final_exam${cnt.count}" type="number"  onchange="calculate(${cnt.count})">
													</td>
													<td style="display:none;width:10%;">
														<input id="assignment${cnt.count}" style="width:60%" value="${svo[cnt.index].assignment}" name="assignment${cnt.count}" type="number" onchange="calculate(${cnt.count})">
													 </td>
													<td style="display:none;width:10%;">
														<input id="attendance${cnt.count}" style="width:60%" value="${svo[cnt.index].attendance}" name="attendance${cnt.count}" type="number"  onchange="calculate(${cnt.count})">
													 </td>
													<td style="display:none;width:10%;">
														<input id="total${cnt.count}" style="width:60%" value="${svo[cnt.index].total}" name="total${cnt.count}" type="number">
													 </td>
													<td style="display:none;width:7%;">
														<select id="score${cnt.count}" id="score${cnt.count}" class="form-control">
															<option selected=""></option>
															<option value="A+">A+</option>
															<option value="A">A</option>
															<option value="B+">B+</option>
															<option value="B">B</option>
															<option value="C+">C+</option>
															<option value="C">C</option>
															<option value="D+">D+</option>
															<option value="D">D</option>
															<option value="F">F</option>
														</select>
													</td>
													
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
									</form>
									<c:if test="${empty vo}">
												  	<div style="text-align: center; margin-top: 10px;">수강생이 없습니다</div>
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
					<h5 class="modal-title">수강생 삭제</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body"
					style="margin-top: 10px; color: black; text-align: center;">
					<p>해당학생을 강의에서 삭제하시겠습니까? 강의와 관련된 정보가 삭제되며 수강할수 없게됩니다.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="modalDeleteBtn">확인</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	<!--**********************************
        Modal end
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

	<script>
	
	var lecture_cnt = "${fn:length(vo)}";
	console.log(lecture_cnt);
	
	let modal = $(".modal");

	var modalDeleteBtn = $("#modalDeleteBtn");

	var lecture_id = document.getElementById('lecture_id').value;
	console.log(lecture_id);
	

	$(document).ready(function(){
		for (var i = 0; i < lecture_cnt; i++) {
			var score = "${svo[i].score}";
			console.log("실행되나")
			console.log(score+","+i);
			//var score = "${svo[0].score}";
			$("#score"+(i+1)).val(score).prop("selected",true);
		}});

	
		//성적입력버튼처리
		$('#showScoreBtn').click(function(){
			
			$('#cancelBtn').show();
			$('#inputScoreBtn').show();
			
			$('td:nth-child(6),th:nth-child(5)').hide();
			$('td:nth-child(7),th:nth-child(6)').show();
			$('td:nth-child(8),th:nth-child(7)').show();
			$('td:nth-child(9),th:nth-child(8)').show();
			$('td:nth-child(10),th:nth-child(9)').show();
			$('td:nth-child(11),th:nth-child(10)').show();
			$('td:nth-child(12),th:nth-child(11)').show();
			
			
			console.log("${svo[0].total}");
			console.log("${svo[0].midterm_exam}");
			console.log("${svo[1].total}");
			console.log("${svo[1].midterm_exam}");
			
		});
		
		$('#inputScoreBtn').click(function(){
			
				var params = $('#profForm').serializeArray();
				console.log(params);
				$.ajax({
					url : "/api/professorLecture/updateScore",
					type : "POST",
					data : params,
					dataType : 'text',
					error : function(request, status, error) {
						alert("error code:" + request.status + "\n" + "message:"
								+ request.responseText + "\n" + "error:" + error);
					},

					success : function(data) {
						swal("성공적으로 저장되었습니다.","","success").then((value) => {
							if(value){
								location.replace(location.href);
							}
						});
				}
			})
		});
	
		//총점계산기
		function calculate(cnt){
			var v1 = Number(document.getElementById('midterm_exam'+cnt).value);
			var v2 = Number(document.getElementById('final_exam'+cnt).value);
			var v3 = Number(document.getElementById('assignment'+cnt).value);
			var v4 = Number(document.getElementById('attendance'+cnt).value);
			var res = v1+v2+v3+v4;
			console.log(res);
			document.getElementById('total'+cnt).value = res;
		}
		
		

		for (var i = 1; i <= lecture_cnt; i++) {
			$("#deleteBtn" + i).click(function() {
				id = $(this).closest("tr").find("td:eq(0)").text();
				console.log(id);
				modal.modal("show");
			});

		}

		modalDeleteBtn.click(function() {

			$.ajax({
				url : '/api/professorLecture/deleteStudent/' + id +'/'+ lecture_id,
				type : 'delete',
				async : false,
				success : function(result) {
					console.log(result);
				}
			})

			location.href = "/professorLecture/student-list?lecture_id="+lecture_id;

			alert("삭제되었습니다. ");
			modal.modal("hide");
		});
	</script>
</body>
</html>
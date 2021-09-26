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
							<h4>수강생 관리</h4>
						</div>
					</div>
					<div
						class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="javascript:void(0)">강의관리</a></li>
							<li class="breadcrumb-item active"><a
								href="javascript:void(0)">수강생관리</a></li>
						</ol>
					</div>
				</div>
				<!-- row -->


				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title">수강생 관리</h4>
								<div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
									<button id="showScoreBtn" name="showScoreBtn" type="button" class="btn btn-primary ">성적입력</button>
									<button id="inputScoreBtn" style="margin-left: 5px; display: none; " name="inputScoreBtn" type="button" class="btn btn-primary">성적저장</button>
									<button id="cancelBtn" style="margin-left: 5px; display: none; " name="cancelBtn" type="button" class="btn btn-primary" onclick="location.reload();">취소</button>
								</div>
							</div>
							<div class="card-body">
								<form id="profForm" class="form-valide">
								<input name="lecture_id" type="hidden" value="${lecture_id}">
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
												<th id="score" style="display:none;">중간</th>
												<th id="score" style="display:none;">기말</th>
												<th id="score" style="display:none;">과제</th>
												<th id="score" style="display:none;">출석</th>
												<th id="score" style="display:none;">총점</th>
												<th id="score" style="display:none;">학점</th>
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
														<input id="midterm_exam" style="width:60%" name="midterm_exam${cnt.count}" type="number" placeholder="0" onchange="calculate()">
													 </td>
													<td style="display:none;width:10%;"> 
														<input id="final_exam" style="width:60%" name="final_exam${cnt.count}" type="number" placeholder="0" onchange="calculate()">
													</td>
													<td style="display:none;width:10%;">
														<input id="assignment" style="width:60%" name="assignment${cnt.count}" type="number" placeholder="0" onchange="calculate()">
													 </td>
													<td style="display:none;width:10%;">
														<input id="attendance" style="width:60%" name="attendance${cnt.count}" type="number" placeholder="0" onchange="calculate()">
													 </td>
													<td style="display:none;width:10%;">
														<input id="total" style="width:60%" name="total${cnt.count}" type="number">
													 </td>
													<td id="score" style="display:none;width:7%;">
														<select name="score${cnt.count}" id="inputScore" class="form-control">
															<option selected="">A+</option>
															<option>A</option>
															<option>B+</option>
															<option>B</option>
															<option>C+</option>
															<option>C</option>
															<option>D+</option>
															<option>D</option>
															<option>F</option>
														</select>
													</td>
													
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
									</form>
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
					<p>수강생을 삭제하시겠습니까? 강의와 관련된 정보가 삭제됩니다.</p>
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
						alert("성공적으로 저장되었습니다.");
						location.replace(location.href); //post 데이터 포함하지않고 새로고침
				}
			})
		});
	
	
		function calculate(){
			var v1 = Number(document.getElementById('midterm_exam').value);
			var v2 = Number(document.getElementById('final_exam').value);
			var v3 = Number(document.getElementById('assignment').value);
			var v4 = Number(document.getElementById('attendance').value);
			var res = v1+v2+v3+v4;
			console.log(res);
			document.getElementById('total').value = res;
		}
		
		
		let modal = $(".modal");

		var modalDeleteBtn = $("#modalDeleteBtn");

		var lecture_code = "";

		var lecture_cnt = "${fn:length(vo)}";
		console.log(lecture_cnt);

		for (var i = 1; i <= lecture_cnt; i++) {
			$("#updateBtn" + i)
					.click(
							function() {
								id = $(this).closest("tr").find("td:eq(0)")
										.text();
								console.log(id);
								document.location.href = "/professorLecture/updateform?id="
										+ id;
							});

			$("#deleteBtn" + i).click(function() {
				id = $(this).closest("tr").find("td:eq(0)").text();
				console.log(id);
				modal.modal("show");
			});

		}

		modalDeleteBtn.click(function() {

			$.ajax({
				url : '/api/professorLecture/delete/' + id,
				type : 'delete',
				async : false,
				success : function(result) {
					console.log(result);
				}
			})

			location.href = "/professorLecture/lecture-list ";

			alert("삭제되었습니다. ");
			modal.modal("hide");
		});
	</script>
</body>
</html>
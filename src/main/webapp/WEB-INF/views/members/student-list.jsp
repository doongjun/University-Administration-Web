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
							<h4 style="font-weight:bold;">학생 관리</h4>
						</div>

					</div>
					<div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="javascript:void(0)">학적</a></li>
							<li class="breadcrumb-item active"><a href="javascript:void(0)">학생 관리</a></li>
						</ol>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title" style="font-weight:bold;">학생 목록</h4>
								<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#studentAddModal">학생 추가</button>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table id="example2" class="display" style="width: 100%">
										<thead>
											<tr>
												<th>학번</th>
												<th>이름</th>
												<th>학과</th>
												<th>학년</th>
												<th>학적상태</th>
											</tr>
										</thead>
										<tbody>
											<!-- fileList 리스트 반복문 -->
											<c:forEach var="student" items="${studentList}">
												<tr>
													<td>${student.code}</td>
													<td>${student.name}</td>
													<td>${student.departmentName}</td>
													<td>${student.grade}</td>
													<td>${student.academicStatus}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 학생 수정 Modal -->
				<div class="modal fade" id="studentInfoModal">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">학생 상세정보</h5>
								<button type="button" class="close" data-dismiss="modal">
									<span>&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<form id="studentInfoForm" class="form-valide">
									<div class="row">
										<div class="col-xl-6">
											<div class="form-group row">
												<label class="col-lg-5 col-form-label">이름 <span class="text-danger">*</span></label>
												<div class="col-lg-10">
													<input type="text" class="form-control" id="infoName" name="name">
												</div>
											</div>
											<div class="form-group row">
												<label class="col-lg-5 col-form-label">학번 <span class="text-danger">*</span></label>
												<div class="col-lg-10">
													<input type="text" class="form-control" id="infoCode" name="code">
												</div>
											</div>
											<div class="form-group row">
												<label class="col-lg-5 col-form-label">Phone <span class="text-danger">*</span></label>
												<div class="col-lg-10">
													<input type="text" class="form-control" id="infoPhone" name="phone">
												</div>
											</div>
											<div class="form-group row">
												<label class="col-lg-5 col-form-label">Email <span class="text-danger">*</span></label>
												<div class="col-lg-10">
													<input type="text" class="form-control" id="infoEmail" name="email">
												</div>
											</div>
											<div class="form-group row">
												<label class="col-lg-5 col-form-label">생년월일 <span class="text-danger">*</span></label>
												<div class="col-lg-10">
													<input type="date" class="form-control" id="infoBirthday" name="birthday">
												</div>
											</div>
										</div>
										<div class="col-xl-6">
											<div class="form-group row">
												<label class="col-lg-5 col-form-label">학년 <span class="text-danger">*</span></label>
												<div class="col-lg-10">
													<input type="number" min="1" max="4" class="form-control" id="infoGrade" name="grade">
												</div>
											</div>
											<div class="form-group row">
												<label class="col-lg-5 col-form-label">학적상태 <span class="text-danger">*</span></label>
												<div class="col-lg-10">
													<input type="text" class="form-control" id="infoAcademicStatus" name="academicStatus">
												</div>
											</div>
											<div class="form-group row">
												<label class="col-lg-5 col-form-label">입학날짜 <span class="text-danger">*</span></label>
												<div class="col-lg-10">
													<input type="date" class="form-control" id="infoAdmissionDate" name="admissionDate">
												</div>
											</div>
											<div class="form-group row">
												<label class="col-lg-5 col-form-label">학과 <span class="text-danger">*</span></label>
												<div class="col-lg-10">
													<select name="departmentCode" id="departmentCodeList" class="form-control">
														<option value="0" selected="">공통</option>
														<option value="1">컴퓨터공학과</option>
														<option value="2">경영학과</option>
														<option value="3">경제학과</option>
														<option value="4">관광학과</option>
														<option value="5">광고홍보학과</option>
														<option value="6">법학과</option>
														<option value="7">사회학과</option>
														<option value="8">건축학과</option>
														<option value="9">기계공학과</option>
														<option value="10">화학공학과</option>
														<option value="11">전기공학과</option>
														<option value="12">전자공학과</option>
														<option value="13">정보통신학과</option>
														<option value="14">조형학과</option>
														<option value="15">산업디자인학과</option>
														<option value="16">국악과</option>
														<option value="17">연극영화과</option>
														<option value="18">국어국문학과</option>
														<option value="19">영어영문학과</option>
														<option value="20">심리학과</option>
													</select>
												</div>
											</div>
										</div>
									</div>
								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-danger" onclick="fn_delete();">삭제</button>
								<button type="button" class="btn btn-primary" onclick="fn_revise();">수정</button>
								<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>

							</div>
						</div>
					</div>
				</div>

				<!-- 학생 추가 Modal -->
				<div class="modal fade" id="studentAddModal">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">학생 추가</h5>
								<button type="button" class="close" data-dismiss="modal">
									<span>&times;</span>
								</button>
							</div>

							<form id="studentAddForm" class="form-valide">
								<div class="modal-body">
									<div class="row">
										<div class="col-xl-6">
											<div class="form-group row">
												<label class="col-lg-5 col-form-label">이름 <span class="text-danger">*</span></label>
												<div class="col-lg-10">
													<input type="text" class="form-control" id="name" name="name">
												</div>
											</div>
											<div class="form-group row">
												<label class="col-lg-5 col-form-label">학번 <span class="text-danger">*</span></label>
												<div class="col-lg-10">
													<input type="text" class="form-control" id="code" name="code">
												</div>
											</div>
											<div class="form-group row">
												<label class="col-lg-5 col-form-label">비밀번호 <span class="text-danger">*</span></label>
												<div class="col-lg-10">
													<input type="password" class="form-control" id="password" name="password">
												</div>
											</div>
											<div class="form-group row">
												<label class="col-lg-5 col-form-label">Phone <span class="text-danger">*</span></label>
												<div class="col-lg-10">
													<input type="text" class="form-control" id="phone" name="phone">
												</div>
											</div>
											<div class="form-group row">
												<label class="col-lg-5 col-form-label">Email <span class="text-danger">*</span></label>
												<div class="col-lg-10">
													<input type="text" class="form-control" id="email" name="email">
												</div>
											</div>
										</div>
										<div class="col-xl-6">
											<div class="form-group row">
												<label class="col-lg-5 col-form-label">학년 <span class="text-danger">*</span></label>
												<div class="col-lg-10">
													<input type="number" min="0" max="4" class="form-control" id="grade" name="grade">
												</div>
											</div>
											<div class="form-group row">
												<label class="col-lg-5 col-form-label">학적상태 <span class="text-danger">*</span></label>
												<div class="col-lg-10">
													<input type="text" class="form-control" id="academicStatus" name="academicStatus">
												</div>
											</div>
											<div class="form-group row">
												<label class="col-lg-5 col-form-label">입학날짜 <span class="text-danger">*</span></label>
												<div class="col-lg-10">
													<input type="date" class="form-control" id="admissionDate" name="admissionDate">
												</div>
											</div>
											<div class="form-group row">
												<label class="col-lg-5 col-form-label">학과 <span class="text-danger">*</span></label>
												<div class="col-lg-10">
													<select name="departmentCode" id="inputState" class="form-control">
														<option value="0" selected="">공통</option>
														<option value="1">컴퓨터공학과</option>
														<option value="2">경영학과</option>
														<option value="3">경제학과</option>
														<option value="4">관광학과</option>
														<option value="5">광고홍보학과</option>
														<option value="6">법학과</option>
														<option value="7">사회학과</option>
														<option value="8">건축학과</option>
														<option value="9">기계공학과</option>
														<option value="10">화학공학과</option>
														<option value="11">전기공학과</option>
														<option value="12">전자공학과</option>
														<option value="13">정보통신학과</option>
														<option value="14">조형학과</option>
														<option value="15">산업디자인학과</option>
														<option value="16">국악과</option>
														<option value="17">연극영화과</option>
														<option value="18">국어국문학과</option>
														<option value="19">영어영문학과</option>
														<option value="20">심리학과</option>
													</select>
												</div>
											</div>
											<div class="form-group row">
												<label class="col-lg-5 col-form-label">생년월일 <span class="text-danger">*</span></label>
												<div class="col-lg-10">
													<input type="date" class="form-control" id="birthday" name="birthday">
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-primary" onclick="fn_regist();">추가</button>
									<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
								</div>
							</form>
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
		var msg = "${message}";
		if (msg === "alreadyExist") {
			alert("해당 학생이 이미 존재합니다.");
		}
		
		var conditionCode;
		$(document).ready(function() {
			var table = $('#example2').DataTable();
			
			$('#example2 tbody').on('click', 'tr', function() {
				var data = table.row(this).data();
				conditionCode = data[0];
				$.ajax({
					url:"/members/student-info",
					data: {'code' : data[0]},
					type:"GET",
					dataType:'json',
					error:function(request, status, error){
						alert("error");
					},
					success:function(data){
						$('#studentInfoModal').modal('show');

						$('#infoName').val(data.name);
						$('#infoCode').val(data.code);
						$('#infoPhone').val(data.phone);
						$('#infoEmail').val(data.email);
						$('#infoBirthday').val(data.birthday);
						$('#infoGrade').val(data.grade);
						$('#infoAcademicStatus').val(data.academicStatus);
						$('#infoAdmissionDate').val(data.admissionDate);
						//$('#infoDepartmentName').val(data.departmentName);
						
						var departmentList = $("#departmentCodeList").find('option').map(function() {
							return $(this).text();
							}).get();

						for(var i=0; i<21; i++){
							if(departmentList[i] === data.departmentName){
								$("#departmentCodeList").val(i).prop("selected", true);
							}
						}
					}
				})
				
				$('#modal-title').text(data[3]);
				$('#studentCode').text("학번 : " + data[0]);
				$('#downloadCodeVal').val(data[0]);
				$('#deleteCodeVal').val(data[0]);
				$('#studentName').text("이름 : " + data[1]);
			});

		});
		
		function fn_delete(){
			$.ajax({
				url : "/members/delete-student",
				type : "POST",
				data: {'code' : conditionCode},
				error : function(request, status, error) {
					alert("code:"+request.status+"\n"+"error:"+error);
				},
				success : function(data) {
					swal("학생 삭제 완료","메타대학교 학생", "success").then((value) => {
						if(value){
							document.location.href="/members/student-list";
						}
				});
				}
			})
		}
		
		function fn_revise(){
			if($('#infoName').val() === ''){
				swal("이름을 입력하세요.");
				return;
			}else if($('#infoCode').val() === ''){
				swal("학번을 입력하세요.")
				return;
			}else if($('#infoPhone').val() === ''){
				swal("핸드폰번호를 입력하세요.")
				return;
			}else if($('#infoEmail').val() === ''){
				swal("이메일을 입력하세요.")
				return;
			}else if($('#infoBirthday').val() === ''){
				swal("생년월일을 입력하세요")
				return;
			}else if($('#infoGrade').val() === ''){
				swal("학년을 입력하세요.")
				return;
			}else if($('#infoAcademicStatus').val() === ''){
				swal("학적상태를 입력하세요.")
				return;
			}else if($('#infoAdmissionDate').val() === 0){
				swal("입학날짜를 입력하세요.")
				return;
			}else if($('#departmentCodeList').val() === 0){
				swal("학과를 선택하세요.")
				return;
			}
			
			var params = $('#studentInfoForm').serializeArray();
			params.push({name: 'conditionCode', value: conditionCode});
			console.log(params);
			
			$.ajax({
				url : "/members/edit-student",
				type : "POST",
				data : params,
				error : function(request, status, error) {
					alert("code:"+request.status+"\n"+"error:"+error);
				},
				success : function(data) {
					if(data.cnt > 0){
						swal("학생 수정 실패","이미 존재하는 학번입니다.", "error").then((value) => {
							if(value){
								$('#infoCode').focus();
							}
						});
					}else{
						swal("학생 수정 완료","메타대학교 학생", "success").then((value) => {
							if(value){
								document.location.href="/members/student-list";
							}
						});
					}
				}
			})
		}
		
		function fn_regist(){
			if($('#name').val() === ''){
				swal("이름을 입력하세요.");
				return;
			}else if($('#code').val() === ''){
				swal("학번을 입력하세요.")
				return;
			}else if($('#password').val() === ''){
				swal("비밀번호를 입력하세요.")
				return;
			}else if($('#phone').val() === ''){
				swal("핸드폰번호를 입력하세요.")
				return;
			}else if($('#email').val() === ''){
				swal("이메일을 입력하세요.")
				return;
			}else if($('#grade').val() === ''){
				swal("학년을 입력하세요.")
				return;
			}else if($('#academicStatus').val() === ''){
				swal("학적상태를 입력하세요.")
				return;
			}else if($('#admissionDate').val() === ''){
				swal("입학날짜를 입력하세요.")
				return;
			}else if($('#departmentCode').val() === 0){
				swal("학과를 선택하세요.")
				return;
			}else if($('#birthday').val() === ''){
				swal("생년월일을 입력하세요.")
				return;
			}
			
			var params = $('#studentAddForm').serializeArray();
			console.log(params);
			
			$.ajax({
				url : "/members/add-student",
				type : "POST",
				data : params,
				error : function(request, status, error) {
					swal("code:"+request.status+"\n"+"error:"+error);
				},
				success : function(data) {
					if(data.cnt > 0){
						swal("학생 추가 실패","이미 존재하는 학생입니다.", "error").then((value) => {
							if(value){
								$('#code').focus();
							}
						});
					}else{
						swal("학생 추가 완료","메타대학교 학생", "success").then((value) => {
							if(value){
								document.location.href="/members/student-list";
							}
						});
					}				
				}
			})
		}
	</script>

	<!-- Required vendors -->
	<script src="../resources/vendor/global/global.min.js"></script>
	<script src="../resources/js/quixnav-init.js"></script>
	<script src="../resources/js/custom.min.js"></script>

	<!-- Datatable -->
	<script src="../resources/vendor/datatables/js/jquery.dataTables.min.js"></script>

	<script type="text/javascript" src="../resources/js/jquery.serializejson.js"></script>

</body>

</html>


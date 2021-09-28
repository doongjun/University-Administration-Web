<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
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
							<h4>강의 수정</h4>
						</div>
					</div>
					<div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="javascript:void(0)">강의관리</a></li>
							<li class="breadcrumb-item active"><a href="javascript:void(0)">강의 수정</a></li>
						</ol>
					</div>
				</div>

				<!-- 강의등록폼 -->

				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title">강의수정</h4>
							</div>
							<div class="card-body">
								<div class="basic-form">
									<form id="profForm" class="form-valide">
										<input name="id" type="hidden" value="${vo.id}">

										<div class="form-group row">
											<label class="control-label col-sm-2">강의학기</label>
											<div class="col-sm-10">
												<select name="semester" id="semester" class="form-control" style="width: 30%;" required>
													<option selected=""></option>
													<option value="1학기">1학기</option>
													<option value="2학기">2학기</option>
													<option value="여름계절학기">여름계절학기</option>
													<option value="겨울계쩔학기">겨울계절학기</option>
												</select>
											</div>
										</div>
										<div class="form-group row">
											<label class="control-label col-sm-2">강의이름</label>
											<div class="col-sm-10">
												<input name="lecture_name" id="lecture_name" value="${vo.lecture_name}" type="text" class="form-control" style="width: 50%;" required>
											</div>
										</div>
										<div class="form-group row">
											<label class="control-label col-sm-2">학과</label>
											<div class="col-sm-10">
												<select name="dept_code" id="dept_code" class="form-control" style="width: 30%;" required>
													<option value="0">공통</option>
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
										<div class="form-group row ">
											<label class="control-label col-sm-2">대상학년</label>
											<div class="col-sm-10">
												<select name="grade"  id="grade" class="form-control" style="width: 30%;" required>
													<option value="공통" selected="">공통</option>
													<option value="1학년">1학년</option>
													<option value="2학년">2학년</option>
													<option value="3학년">3학년</option>
													<option value="4학년">4학년</option>
												</select>
											</div>
										</div>
										<div class="form-group row">
											<label class="control-label col-sm-2">강의실</label>
											<div class="col-sm-10">
												<input name="classroom" id="classroom" value="${vo.classroom}" type="text" style="width: 50%;" class="form-control" placeholder="예) 000관 000호" required>
											</div>
										</div>
										<div class="form-group row">
											<label class="control-label col-sm-2">강의시간</label>
											<div class="col-sm-10">
												<input name="lecture_time" id="lecture_time" value="${vo.lecture_time}" type="text" style="width: 50%;" class="form-control" placeholder="예) 수 1,2,3" required>
											</div>
										</div>
										<div class="form-group row">
											<label class="control-label col-sm-2">분반</label>
											<div class="col-sm-10">
												<select name="division" id="division" style="width: 30%;" class="form-control" required>
													<option value="-" selected="">-</option>
													<option value="1분반">1분반</option>
													<option value="2학년">2분반</option>
													<option value="3학년">3분반</option>
												</select>
											</div>
										</div>
										<div class="form-group row">
											<label for="password" class="control-label col-sm-2">학점</label>
											<div class="col-sm-10">
												<input name="credit" vid="credit" alue="${vo.credit}" type="number" style="width: 30%;" min="1" max="3" class="form-control" placeholder="3" required>
											</div>
										</div>
										<div class="form-group row">
											<label for="password" class="control-label col-sm-2">구분</label>
											<div class="col-sm-10">
												<select name="section"  id="section" style="width: 30%;" class="form-control" required>
													<option value="기타" selected="">기타</option>
													<option value="전공">전공</option>
													<option value="전공기초">전공기초</option>
													<option value="교양">교양</option>
												</select>
											</div>
										</div>
										<div class="form-group row">
											<label for="password" class="control-label col-sm-2">수강정원</label>
											<div class="col-sm-10">
												<input name="student_full" value="${vo.student_full}" type="number" min="1" max="300" style="width: 30%;" class="form-control" required> <small id="passwordHelpBlock"
													class="form-text text-muted"> * 정원 변경시 과사무실에 문의바랍니다. </small>
											</div>
										</div>
										<div class="form-group row">
											<label for="password" class="control-label col-sm-2">비고</label>
											<div class="col-sm-10">
												<input name="remarks" value="${vo.remarks}" type="text" class="form-control" placeholder="생략불가능. 최대 30자" required>
											</div>
										</div>
									</form>
									<div class="form-group row">
										<div class="offset-sm-2 col-sm-10 pull-right">

											<button class="btn btn-primary" onclick="fn_update();">저장</button>
											<button class="btn btn-primary" onclick="history.back(-1);return false;">취소</button>
										</div>
									</div>


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

		<!-- 관리자만 볼수있는 코드 -->
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<input type="hidden" id="professor_id" value="${professor.id}">
			<input type="hidden" id="professor_id" value="${professor.id}">
			<input type="hidden" id="professor_id" value="${professor.id}">
			<input type="hidden" id="professor_id" value="${professor.id}">
			<input type="hidden" id="professor_id" value="${professor.id}">
			<input type="hidden" id="professor_id" value="${professor.id}">
		</sec:authorize>

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

	<script type="text/javascript">
	
	$(document).ready(function(){
		$("#semester").val("${vo.semester}").prop("selected",true);
		$("#dept_code").val("${vo.dept_code}").prop("selected",true);
		$("#grade").val("${vo.grade}").prop("selected",true);
		$("#division").val("${vo.division}").prop("selected",true);
		$("#section").val("${vo.section}").prop("selected",true);
	});
	function fn_update() {
		//validation

		if ($("select[name='semester']").val() == ""){
			swal("학기를 선택해주세요");
			$("select[name='semester']").focus();
			return false;
		}else if ($("input[name='lecture_name']").val() == ""){
			swal("강의이름을 입력해주세요");
			$("input[name='lecture_name']").focus();
			return false;
		}else if ($("select[name='dept_code']").val() == ""){
			swal("학과를 선택해주세요");
			$("select[name='dept_code']").focus();
			return false;
		}else if ($("select[name='grade']").val() == ""){
			swal("대상학년을 선택해주세요");
			$("select[name='grade']").focus();
			return false;
		}else if ($("input[name='classroom']").val() == ""){
			swal("강의실을 입력해주세요");
			$("input[name='classroom']").focus();
			return false;
		}else if ($("input[name='lecture_time']").val() == ""){
			swal("강의시간을 입력해주세요");
			$("input[name='lecture_time']").focus();
			return false;
		}else if ($("select[name='division']").val() == ""){
			swal("분반을 선택해주세요");
			$("select[name='division']").focus();
			return false;
		}else if ($("input[name='credit']").val() == ""){
			swal("학점을 입력해주세요");
			$("input[name='credit']").focus();
			return false;
		}else if ($("select[name='section']").val() == ""){
			swal("구분을 선택해주세요");
			$("select[name='section']").focus();
			return false;
		}else if ($("input[name='student_full']").val() == ""){
			swal("수강정원을 입력해주세요");
			$("input[name='student_full']").focus();
			return false;
		}else if ($("input[name='remarks']").val() == ""){
			swal("비고를 입력해주세요");
			$("input[name='remarks']").focus();
			return false;
		}else{
		
		
		var params = $('#profForm').serializeArray();
		console.log(params);
		$.ajax({
			url : "/api/professorLecture/update",
			type : "POST",
			data : params,
			dataType : 'text',
			error : function(request, status, error) {
				alert("error code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			},

			success : function(data) {
				swal("성공적으로 저장되었습니다.", "" ,"success").then((value) => {
					if(value){
						document.location.href = "/professorLecture/lecture-list";
					}
				});
				

			}
		})
	}
	}

	</script>
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
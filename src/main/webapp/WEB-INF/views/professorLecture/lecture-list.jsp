<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
							<h4 style="font-weight:bold;">강의내역조회</h4>
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
								<h4 class="card-title" style="font-weight:bold;">내강의목록</h4>
							</div>
							<div class="card-body">
								<div class="row-sm-8" style="overflow-y:scroll; width:100%; height:650px;">
									<div class="table-responsive">
										<table class="table table-bordered table-scroll">
											<thead class="table-light" style="color: white; background-color: gray; text-align: center;">
												<tr>
													<th>강의번호</th>
													<th>강의년도</th>
													<th>학기</th>
													<th>학년</th>
													<th>강의이름</th>
													<th>구분</th>
													<th>관리</th>
												</tr>
											</thead>
											<tbody style="color: black; text-align: center;">
												<!-- 리스트 반복문 -->
												<c:forEach var="vo" items="${vo}" varStatus="cnt">
													<tr>
														<td style="display: none;">${vo.id}</td>
														<td>${vo.lecture_code}</td>
														<td>${vo.lecture_year}</td>
														<td>${vo.semester}</td>
														<td>${vo.grade}</td>
														<td>${vo.lecture_name}</td>
														<td>${vo.section}</td>
														<td>
															<button name="" id="updateBtn${cnt.count}" type="button" class="btn btn-primary">수정</button>
															<button name="" id="deleteBtn${cnt.count}" type="button" class="btn btn-danger">삭제</button>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
									<c:if test="${empty vo}">
												  	<div style="text-align: center; margin-top: 10px;">강의가 없습니다</div>
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

	<!-- 관리자만 볼수있는 코드 -->
	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<input type="hidden" id="professor_id" value="${professor.id}">
	</sec:authorize>

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
				<div class="modal-body" style="margin-top: 10px; color: black; text-align: center;">
					<p>이 강의를 삭제하시겠습니까? 모든 정보와 수강생 정보가 사라집니다.</p>
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
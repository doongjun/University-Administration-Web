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
                            <h4>신청과목 시간표</h4>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">수강</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0)">시간표 조회</a></li>
                        </ol>
                    </div>
                </div>
                <!-- row -->


                <div class="row">
                    <div class="col-lg-15">
                        <div class="card">
                            <div class="card-body">
                                
								
								<div id="dp"></div>
								
								<div id="print"></div>
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
	
    <script src="../resources/js/daypilot-all.min.js?v=2021.2.261"></script>
    
    <script type="text/javascript">
        var dp = new DayPilot.Calendar("dp");
		var list = "${vo}";
		var list_length = "${fn:length(vo)}";
		
        // view
        dp.startDate = "2021-03-22"; //22 : 월요일, 23 : 화, 24 : 수, 25 : 목, 26 : 금, 27 : 토, 28 : 일
        dp.viewType = "Week";
        dp.locale = "en-au";

        dp.headerDateFormat = "dddd";

        // event creating
        /* dp.onTimeRangeSelected = function (args) {
            var name = prompt("New event name:", "Event");
            if (!name) return;
            var e = new DayPilot.Event({
                start: args.start,
                end: args.end,
                id: DayPilot.guid(),
                text: name
            });
            dp.events.add(e);
            dp.clearSelection();
        }; */

        /* dp.onEventClick = function (args) {
            alert("clicked: " + args.e.id());
        }; */

        dp.init();
        
        var e = "";
        var year_month = "2021-03-";
        var leftTime = ":00:00";
        
        $.getJSON({
        	url:"/studentLecture/rest_calendar",
        	type:"GET",
        	async:false,
        	success:function(data) {		
				$.each(data, function(idx, element) {
					var day = "";
					timeSpl = element.lecture_time.split(" ");
					
					if(timeSpl[0] == "월") {
						day = "22";
					}
					if(timeSpl[0] == "화") {
						day = "23";
					}
					if(timeSpl[0] == "수") {
						day = "24";
					}
					if(timeSpl[0] == "목") {
						day = "25";
					}
					if(timeSpl[0] == "금") {
						day = "26";
					}
					if(timeSpl[0] == "토") {
						day = "27";
					}
					
					cnt = timeSpl[1].split(",").length;
					
					var startDay = year_month + day + "T";
					
					var startTime = ((timeSpl[1].split(",")[0] * 1) + 8) > 9? ((timeSpl[1].split(",")[0] * 1) + 8) : "0" + ((timeSpl[1].split(",")[0] * 1) + 8);
					
					startDay = startDay + startTime + leftTime;
					
					console.log(startDay);
					console.log(cnt);
					
					e = new DayPilot.Event({
		                start: new DayPilot.Date(startDay),
		                end: new DayPilot.Date(startDay).addHours(cnt),
		                id: DayPilot.guid(),
		                text: element.lecture_name + "<br>" +  element.lecture_time + "<br>" + element.classroom
		            });
					
					dp.events.add(e);
				})
			}
        	
        });
        

        /* var elements = {
            locale: document.querySelector("#locale")
        };

        elements.locale.addEventListener("change", function() {
            dp.locale = elements.locale.value;
            dp.update();
        }); */

    </script>
	<script src="../resources/helpers/v2/app.js?v=2021.2.261"></script>
</body>

</html>
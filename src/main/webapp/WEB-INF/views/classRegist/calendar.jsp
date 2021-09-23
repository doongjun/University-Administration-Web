<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

        // view
        dp.startDate = "2021-03-25";
        dp.viewType = "Week";
        dp.locale = "en-us";

        dp.headerDateFormat = "dddd";

        // event creating
        dp.onTimeRangeSelected = function (args) {
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
        };

        dp.onEventClick = function (args) {
            alert("clicked: " + args.e.id());
        };

        dp.init();

        var e = new DayPilot.Event({
            start: new DayPilot.Date("2021-03-25T12:00:00"),
            end: new DayPilot.Date("2021-03-25T12:00:00").addHours(3),
            id: DayPilot.guid(),
            text: "Special event"
        });
        dp.events.add(e);

        var elements = {
            locale: document.querySelector("#locale")
        };

        elements.locale.addEventListener("change", function() {
            dp.locale = elements.locale.value;
            dp.update();
        });

    </script>
	<script src="../resources/helpers/v2/app.js?v=2021.2.261"></script>
</body>

</html>
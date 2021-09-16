<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
		<div class="quixnav">
            <div class="quixnav-scroll">
                <ul class="metismenu" id="menu">
                	<li class="nav-label first">학생</li>
                    <li class="nav-label first">공지</li>
                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i
                                class="icon icon-single-04"></i><span class="nav-text">공지사항</span></a>
                        <ul aria-expanded="false">
                            <li><a href="./index.html">공지게시판</a></li>
                        </ul>
                    </li>
                     <li class="nav-label">학적</li> 
                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i
                                class="icon icon-app-store"></i><span class="nav-text">학적</span></a>
                        <ul aria-expanded="false">
                            <li><a href="/members/mypage">내 학적 정보</a></li>
                            <li><a href="/members/pw-change">비밀번호 변경</a></li>
                        </ul>
                    </li>
                    <li class="nav-label">강의관리</li> 
                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i
                                class="icon icon-app-store"></i><span class="nav-text">강의 관리</span></a>
                        <ul aria-expanded="false">
                            <li><a href="./app-calender.html">강의계획서조회</a></li>
                            <li><a href="/lecture/prevLecture">수강내역조회</a>
                            </li>
                            <li><a href="./app-calender.html">성적조회</a></li>
                        </ul>
                    </li>
                    
                    <li class="nav-label">수강</li>
                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i
                                class="icon icon-world-2"></i><span class="nav-text">수강신청</span></a>
						<ul aria-expanded="false">
                            <li><a href="/classRegist/regist">수강신청</a></li>
                            <li><a href="/classRegist/calendar">시간표조회</a></li>
                        </ul>
                    </li>

                </ul>
            </div>


        </div>
</body>
</html>
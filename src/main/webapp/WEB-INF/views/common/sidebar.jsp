<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<body>
		<div class="quixnav">
            <div class="quixnav-scroll">
                <ul class="metismenu" id="menu">
                	<c:if test="${member.roleName eq 'ROLE_USER'}">
	                    <!-- 학생-->
	                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><span class="nav-text">공지사항</span></a>
	                        <ul aria-expanded="false">
	                            <li><a href="/board/boardlist">공지게시판</a></li>
	                        </ul>
	                    </li>
	                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><span class="nav-text">수강신청</span></a>
							<ul aria-expanded="false">
	                            <li><a href="/classRegist/regist">수강신청</a></li>
	                            <li><a href="/studentLecture/list?student_id=${member.id}">수강신청내역</a></li>
	                            <li><a href="/studentLecture/calendar">시간표조회</a></li>
	                        </ul>
	                    </li>
	                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><span class="nav-text">강의 관리</span></a>
	                        <ul aria-expanded="false">
	                            <li><a href="/lecture/syllabus">강의계획서 조회</a></li>
	                            <li><a href="/lecture/prevLecture">과거 수강내역 조회</a>
	                            </li>
	                            <li><a href="/lecture/score-list">성적 조회</a></li>
	                        </ul>
	                    </li>
	                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><span class="nav-text">학적</span></a>
	                        <ul aria-expanded="false">
	                            <li><a href="/members/mypage">내 학적 정보</a></li>
	                            <li><a href="/members/pw-change-form">비밀번호 변경</a></li>
	                            <li><a href="/tuition/tuition-view">등록금 고지서 조회</a></li>
	                        </ul>
	                    </li>
	                    
                    </c:if>
                    
                    
                    <!-- 교수 -->
					<c:if test="${member.roleName eq 'ROLE_PROF'}">
	                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><span class="nav-text">공지사항</span></a>
	                        <ul aria-expanded="false">
	                            <li><a href="/board/boardlist">공지게시판</a></li>
	                        </ul>
	                    </li>
	                    
	                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><span class="nav-text">내 강의 관리</span></a>
	                        <ul aria-expanded="false">
	                            <li><a href="/professorLecture/createform">새 강의 등록</a></li>
	                            <li><a href="/professorLecture/lecture-list">내 강의 관리</a></li>
	                        </ul>
	                    </li>
	                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><span class="nav-text">성적 관리</span></a>
	                    	<ul aria-expanded="false">
	                            <li><a href="/professorLecture/score-lecture-list">성적 입력</a></li>
	                        </ul>
	                    </li>
	                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><span class="nav-text">마이페이지</span></a>
	                        <ul aria-expanded="false">
	                            <li><a href="/members/mypage">내 정보</a></li>
	                            <li><a href="/members/pw-change-form">비밀번호 변경</a></li>
	                        </ul>
	                    </li>
					</c:if>
                    
                    
                    <!-- 관리자 -->
                    <c:if test="${member.roleName eq 'ROLE_ADMIN'}">
	                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><span class="nav-text">공지사항</span></a>
	                        <ul aria-expanded="false">
	                            <li><a href="/board/boardlist">공지게시판</a></li>
	                        </ul>
	                    </li>
	                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><span class="nav-text">학적 관리</span></a>
	                        <ul aria-expanded="false">
	                            <li><a href="/members/student-list">학생 관리</a></li>
	                            <li><a href="/tuition/tuition-form">등록금 고지서 관리</a></li>
	                        </ul>
	                    </li>
	                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><span class="nav-text">마이페이지</span></a>
	                        <ul aria-expanded="false">
	                            <li><a href="/members/mypage">내 정보</a></li>
	                            <li><a href="/members/pw-change-form">비밀번호 변경</a></li>
	                        </ul>
	                    </li>
	                    
                    </c:if>
                </ul>
            </div>


        </div>
</body>
</html>
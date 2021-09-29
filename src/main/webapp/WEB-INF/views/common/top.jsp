<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<body>
		<div class="nav-header">
            <a href="/board/boardlist" class="brand-logo">
                <img class="logo-abbr" src="../resources/images/meta.png" alt="" style="max-width:50px; margin-left:12px; margin-top:6px;">
                <img class="logo-compact" src="../resources/images/metatext.png" alt="">
                <img class="brand-title" src="../resources/images/metatext.png" alt="" style="max-width:500px; margin-left: -12px;">
            </a>
            
        </div>
        <!--**********************************
            Nav header end
        ***********************************-->

        <!--**********************************
            Header start
        ***********************************-->
        <div class="header">
            <div class="header-content">
                <nav class="navbar navbar-expand">
                    <div class="collapse navbar-collapse justify-content-between">
                        <div class="header-left">
                            
                        </div>
						
                        <ul class="navbar-nav header-right">
                            <li class="nav-item dropdown notification_dropdown">
                                <div class="dropdown-menu dropdown-menu-right">
                                </div>
                            </li>
                            <li class="nav-item dropdown header-profile">
                            	
                                <a class="nav-link" href="#" role="button" data-toggle="dropdown">
                                    <i class="mdi mdi-account"></i>
                                    <c:if test="${member.roleName eq 'ROLE_USER'}">
                                    	<span style="font-size:1em; color:#343957;">${member.name} 학생</span>
                                    </c:if>
                                    <c:if test="${member.roleName eq 'ROLE_PROF'}">
                                    	<span style="font-size:1em; color:#343957;">${member.name} 교수</span>
                                    </c:if>
                                    <c:if test="${member.roleName eq 'ROLE_ADMIN'}">
                                    	<span style="font-size:1em; color:#343957;">${member.name} 관리자</span>
                                    </c:if>
                                </a>                          
                                <div class="dropdown-menu dropdown-menu-right">
                                    <a href="/members/mypage" class="dropdown-item">
                                        <i class="icon-user"></i>
                                        <span class="ml-2">Profile </span>
                                    </a>
                                    <a href="/logout" class="dropdown-item">
                                        <i class="icon-key"></i>
                                        <span class="ml-2">Logout </span>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
</body>
</html>
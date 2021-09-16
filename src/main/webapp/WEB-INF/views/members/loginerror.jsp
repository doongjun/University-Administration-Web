<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en" class="h-100">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Login Error</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../resources/images/favicon.png">
    <link href="../resources/css/style.css" rel="stylesheet">
    
</head>

<body class="h-100">
    <div class="authincation h-100">
        <div class="container-fluid h-100">
            <div class="row justify-content-center h-100 align-items-center">
                <div class="col-md-5">
                    <div class="form-input-content text-center">
                        <div class="mb-5">
                            <a class="btn btn-primary" href="/members/loginform">Back to Home</a>
                        </div>
                        <h1 class="error-text  font-weight-bold">403</h1>
                        <h4 class="mt-4"><i class="fa fa-times-circle text-danger"></i> 로그인 오류 </h4>
                        <p>Check your ID or Password</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>
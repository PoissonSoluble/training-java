<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>Computer Database</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
<link href="<c:url value="static/css/bootstrap.min.css" />"
	rel="stylesheet" media="screen">
<link href="<c:url value="static/css/font-awesome.css" />"
	rel="stylesheet" media="screen">
<link href="<c:url value="static/css/main.css" />" rel="stylesheet"
	media="screen">
</head>
<body>
    <header class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <a class="navbar-brand" href="dashboard.html"> Application - Computer Database </a>
        </div>
    </header>

    <section id="main">
        <div class="container">
            <div class="alert alert-danger">
                Error 404: Page not found.
                <br/>
                <!-- stacktrace -->
            </div>
        </div>
    </section>

	<script src="<c:url value="/static/js/jquery.min.js" />"></script>
	<script src="<c:url value="/static/js/bootstrap.min.js" />"></script>
	<script src="<c:url value="/static/js/dashboard.js" />"></script>

</body>
</html>
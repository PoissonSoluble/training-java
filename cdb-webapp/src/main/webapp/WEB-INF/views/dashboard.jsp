<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>Computer Database</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="utf-8">
<!-- Bootstrap -->
<link href="<c:url value="/static/css/bootstrap.min.css" />"
	rel="stylesheet" media="screen">
<link href="<c:url value="/static/css/font-awesome.css" />"
	rel="stylesheet" media="screen">
<link href="<c:url value="/static/css/main.css" />" rel="stylesheet"
	media="screen">
</head>

<body>
	<header class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<a class="navbar-brand" href="<tag:links linkTo="dashboard"/>"> Application - Computer Database </a>
			<c:url var="logoutUrl" value="/logout" />
			<form:form action="${logoutUrl}" modelAttribute="user" method="post" class="form-horizontal">
				<input type="submit" value="Logout" style="float: right; margin-top: 8px;" class="btn btn-primary" />
			</form:form>
        </div>
	</header>

	<section id="main">
		<div class="container">
			<h1 id="homeTitle">
				<c:out value="${ computerAmount }" />
				<spring:message code="dashboard.title"/>
			</h1>
			<div id="actions" class="form-horizontal">
				<div class="pull-left">
					<form id="searchForm" action="#" method="GET" class="form-inline">

						<input type="hidden" name="pageNumber" value="1" /> <input
							type="hidden" name="pageSize" value="${pageSize}" /> <input
							type="search" id="searchbox" name="search" class="form-control"
							placeholder="<spring:message code="dashboard.search"/>" /> <input type="submit"
							id="searchsubmit" value="<spring:message code="dashboard.searchButton"/>" class="btn btn-primary" />
					</form>
				</div>
				<div class="pull-right">
					<a class="btn btn-success" id="addComputer"
						href="<tag:links linkTo="addComputer"/>"> <spring:message code="dashboard.addButton"/> </a> <a
						class="btn btn-default" id="editComputer" href="#"
						onclick="$.fn.toggleEditMode();"><spring:message code="dashboard.editButton"/></a>
				</div>
			</div>
		</div>

		<form id="deleteForm" action="<tag:links linkTo="deleteComputer"/>"
			method="POST">
			<input type="hidden" id="deleteSelection" name="selection" value="">
			<input type="hidden" name="pageNumber" value="${pageNumber}" /> <input
				type="hidden" name="pageSize" value="${pageSize}" />
		</form>

		<div class="container" style="margin-top: 10px;">
			<table class="table table-striped table-bordered">
				<thead>
					<tr>
						<!-- Variable declarations for passing labels as parameters -->
						<!-- Table header for Computer Name -->

						<th class="editMode" style="width: 60px; height: 22px;"><input
							type="checkbox" id="selectall" /> <span
							style="vertical-align: top;"> - <a href="#"
								id="deleteSelected" onclick="$.fn.deleteSelected();"> <i
									class="fa fa-trash-o fa-lg"></i>
							</a>
						</span></th>
						<th>
							<a 
							href="<tag:links linkTo="dashboard" pageNumberAtt="${pageNumber}" 
							pageSizeAtt="${pageSize}" orderAtt="CU_NAME" searchAtt="${search}"/>">
								<spring:message code="dashboard.computerName"/>
							</a>
						</th>
						<th>
							<a 
							href="<tag:links linkTo="dashboard" pageNumberAtt="${pageNumber}" 
							pageSizeAtt="${pageSize}" orderAtt="CU_INTRODUCED" searchAtt="${search}"/>">
								<spring:message code="dashboard.introduced"/>
							</a>
						</th>
						<!-- Table header for Discontinued Date -->
						<th>
							<a 
							href="<tag:links linkTo="dashboard" pageNumberAtt="${pageNumber}" 
							pageSizeAtt="${pageSize}" orderAtt="CU_DISCONTINUED" searchAtt="${search}"/>">
								<spring:message code="dashboard.discontinued"/>
							</a>
						</th>
						<!-- Table header for Company -->
						<th>
							<a 
							href="<tag:links linkTo="dashboard" pageNumberAtt="${pageNumber}" 
							pageSizeAtt="${pageSize}" orderAtt="CA_NAME" searchAtt="${search}"/>">
								<spring:message code="dashboard.company"/>
							</a>
						</th>

					</tr>
				</thead>
				<!-- Browse attribute computers -->
				<tbody id="results">
					<c:forEach items="${computers}" var="computer">
						<tr>
							<td class="editMode"><input type="checkbox" name="cb"
								class="cb" value="${computer.id}"></td>
							<td><a
								href="<tag:links linkTo="editComputer" computerIdAtt="${computer.id}"/>"
								onclick=""><c:out value="${computer.name}" /></a></td>
							<td><c:out value="${computer.introduced}" /></td>
							<td><c:out value="${computer.discontinued}" /></td>
							<td><c:out value="${computer.company.name}" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</section>

	<footer class="navbar-fixed-bottom">
		<div class="container text-center">
			<ul class="pagination">
				<tag:pages />
			</ul>

			<div class="btn-group btn-group-sm pull-right" role="group">
				<a
					href="<tag:links linkTo="dashboard" pageNumberAtt="1" pageSizeAtt="${10 }"/>">
					<button type="button" class="btn btn-default">10</button>
				</a> <a
					href="<tag:links linkTo="dashboard" pageNumberAtt="1" pageSizeAtt="${50 }"/>">
					<button type="button" class="btn btn-default">50</button>
				</a> <a
					href="<tag:links linkTo="dashboard" pageNumberAtt="1" pageSizeAtt="${100 }"/>">
					<button type="button" class="btn btn-default">100</button>
				</a>
			</div>
	</footer>
	<script src="<c:url value="/static/js/jquery.min.js" />"></script>
	<script src="<c:url value="/static/js/bootstrap.min.js" />"></script>
	<script src="<c:url value="/static/js/dashboard.js" />"></script>
</body>

</html>
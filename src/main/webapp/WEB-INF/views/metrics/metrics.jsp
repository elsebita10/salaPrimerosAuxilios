<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
 
<html>
 
<head>
	<title>Métricas</title>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
</head>
 
<body>
	<div id="wrapper">
		<div id="sidebar-wrapper">
			<div class="sidebar">
				<%@ include file="/WEB-INF/views/commons/menu.jsp" %>
			</div>
		</div>
		<div id="main-wrapper" class="col-md-10 pull-right">
		    <div class="container-fluid">
		        <div class="panel panel-default">
		              <!-- Default panel contents -->
		            <div class="panel-heading"><span class="lead">Metricas</span></div>
		        </div>
		        <sec:authorize access="hasRole('ADMIN')">
		            <div class="well">
		                <a href="<c:url value='/generate-metrics' />">Generar archivo de métricas</a>
		            </div>
		        </sec:authorize>
		    </div>
		</div>
    </div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Confirmación de registro</title>
    <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
</head>
<body>
	<div id="wrapper">
		<div id="sidebar-wrapper">
			<div class="sidebar">
				<%@ include file="/WEB-INF/views/commons/menu.jsp" %>
			</div>
		</div>
    <div id="main-wrapper" class="col-md-10 pull-right">        
        <div class="alert alert-success lead">
            ${success}
        </div>
    </div>
</body>
 
</html>
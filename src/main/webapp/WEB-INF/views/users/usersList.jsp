<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Inicio</title>
    <link href="static/css/bootstrap.css" rel="stylesheet">
    <link href="static/css/app.css" rel="stylesheet">
    <link href="static/css/font-awesome.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="wrapper">
		<div class="sidebar-wrapper">
			<%@ include file="/WEB-INF/views/commons/menu.jsp" %>
		</div>
		<div id="page-wrapper">
		    <div class="container-fluid">
		    	<div class="row">
                    <div class="col-lg-12">
                    	<ol class="breadcrumb">
                            <li>
                                <i class="fa fa-home"></i>  <a href="<c:url value="/" />">Inicio</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-user"></i> Usuarios
                            </li>
                        </ol>
                        <h1 class="page-header">
                            Usuarios
                        </h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                    	<div class="form-group input-group">
                        	<input type="text" id="userSearchText" class="form-control">
                        	<span class="input-group-btn"><button class="btn btn-default" type="button"><i class="fa fa-search"></i></button></span>
                        </div>
                    </div>
                </div>
                <div class="row">
                	<div class="col-lg-12">
                    	<h2>Listado de usuarios</h2>
                    	<div class="table-responsive">
                            <table id="usersTable" class="table table-hover table-striped">
                                <thead>
                                    <tr>
                                    	<th>ID de usuario</th>
		                        		<th>Username</th>
		                        		<th>Direcci&oacute;n</th>
		                        		<th>E-mail</th>
		                        		<sec:authorize access="hasRole('ADMIN')">
		                            		<th width="100"></th>
		                        		</sec:authorize>
		                        		<sec:authorize access="hasRole('ADMIN')">
		                            		<th width="100"></th>
		                        		</sec:authorize>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${users}" var="user">
		                    		<tr>
		                    			<td>${user.id}</td>
		                        		<td>${user.username}</td>
		                        		<td>${user.address}</td>
		                        		<td>${user.email}</td>
		                        		<sec:authorize access="hasRole('ADMIN')">
		                            		<td><a href="<c:url value='/edit-user-${user.username}' />" class="btn btn-success">editar</a></td>
		                        		</sec:authorize>
		                        		<sec:authorize access="hasRole('ADMIN')">
		                            		<td><a href="<c:url value='/delete-user-${user.username}' />" class="btn btn-danger">eliminar</a></td>
		                        		</sec:authorize>
		                    		</tr>
		                			</c:forEach>
                                </tbody>
                            </table>
                        </div>
                   </div>
            	</div> <!-- row -->
                <div class="row">
                    <div class="col-lg-6">
	            	<sec:authorize access="hasRole('ADMIN')">
		                <a href="<c:url value='/create-user' />" class="btn btn-primary">Crear usuario nuevo</a>
			        </sec:authorize>
			        </div>
            	</div>
		    </div> <!-- container-fluid -->
		</div> <!-- page-wrapper -->
	</div> <!-- wrapper  -->
	<script src="static/js/jquery.js"></script>
    <script src="static/js/bootstrap.js"></script>
    <script src="static/js/app.js"></script>
<!--     <script>var myContextPath = "${pageContext.request.contextPath}"</script>
    <script>var userList = ${users}</script> -->
    <script src="static/js/usersFunctions.js"></script>
</body>
</html>
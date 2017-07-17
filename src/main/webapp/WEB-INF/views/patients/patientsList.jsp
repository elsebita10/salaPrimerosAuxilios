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
    <link href="static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
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
                    <div id="page-title" class="col-lg-12">
                    	<div class="col-lg-4">
	                    	<ol class="breadcrumb">
	                            <li>
	                                <i class="fa fa-home"></i>  <a href="<c:url value="/" />">Inicio</a>
	                            </li>
	                            <li class="active">
	                                <i class="fa fa-wheelchair custom"></i> Pacientes
	                            </li>
	                        </ol>
	                    </div>
	                    <div class="col-lg-4">
	                        <h1 class="page-header">Pacientes</h1>
	                    </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6" style="padding-top:25px;">
                        <div class="form-group input-group">
                        	<input type="text" id="userSearchText" class="form-control" placeholder="&#xF002;" style="font-family:Arial, FontAwesome">
                        </div>
                    </div>
                </div>
                <div class="row">
                	<div class="col-lg-12">
                    	<h2>Listado de pacientes</h2>
                    	<div class="table-responsive">
                            <table id="patientsTable" class="table table-hover table-striped">
                                <thead>
                                    <tr>
                                    	<th>ID</th>
                                    	<th>Nombre</th>
		                        		<th>Apellido</th>
		                        		<th>Edad</th>
		                        		<th>Sexo</th>
		                        		<th>DNI</th>
		                        		<th style="width: 200px">Email</th>
		                        		<th>Direccion</th>
		                        		<th>Telefono</th>
		                        		<sec:authorize access="hasRole('ADMIN')">
		                            		<th width="100"></th>
		                        		</sec:authorize>
		                        		<sec:authorize access="hasRole('ADMIN')">
		                            		<th width="100"></th>
		                        		</sec:authorize>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${patients}" var="patient">
		                    		<tr>
		                    			<td>${patient.id}</td>
		                        		<td>${patient.firstName}</td>
		                        		<td>${patient.lastName}</td>
		                        		<td>${patient.age}</td>
		                        		<td>${patient.sex}</td>
		                        		<td>${patient.dni}</td>
		                        		<td>${patient.email}</td>
		                        		<td>${patient.address}</td>
		                        		<td>${patient.phone}</td>		                        		
		                        		<sec:authorize access="hasRole('ADMIN')">
		                            		<td><a href="<c:url value='/edit-patient-${patient.id}' />" class="btn btn-success">Editar</a></td>
		                        		</sec:authorize>
		                        		<sec:authorize access="hasRole('ADMIN')">
		                            		<td><a href="<c:url value='/delete-patient-${patient.id}' />" class="btn btn-danger">Eliminar</a></td>
		                        		</sec:authorize>
		                    		</tr>
		                			</c:forEach>
                                </tbody>
                            </table>
                        </div>
                   </div>
            	</div> <!-- row -->
		    </div> <!-- container-fluid -->
		</div> <!-- page-wrapper -->
	</div> <!-- wrapper  -->
	<script src="static/js/jquery.js"></script>
    <script src="static/bootstrap/js/bootstrap.min.js"></script>
    <script src="static/js/app.js"></script>
<!--     <script>var myContextPath = "${pageContext.request.contextPath}"</script>
    <script>var userList = ${users}</script> -->
    <script src="static/js/usersFunctions.js"></script>
</body>
</html>
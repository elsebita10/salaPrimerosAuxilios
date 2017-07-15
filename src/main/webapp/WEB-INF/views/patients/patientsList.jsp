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
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="<c:url value="/" />"><i class="fa fa-heartbeat"></i>&nbsp;&nbsp;&nbsp;Sala de Primeros Auxilios</a>
			</div>
		    <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
		    <div class="collapse navbar-collapse navbar-ex1-collapse">
		        <ul class="nav navbar-nav side-nav">
		            <li>
		                <a href="<c:url value="/" />"><i class="fa fa-fw fa-home"></i> Inicio</a>
		            </li>
		            <li>
		                <a href="<c:url value='/list-users' />"><i class="fa fa-fw fa-user"></i> Usuarios</a>
		            </li>
		            <li>
		                <a href="<c:url value='/get-metrics' />"><i class="fa fa-fw fa-bar-chart-o"></i> M&eacute;tricas</a>
		            </li>
		            <li>
		                <a href="<c:url value='/list-consultations' />"><i class="fa fa-fw fa-bar-chart-o"></i> Consultas</a>
		            </li>
		            <li class="active">
		                <a href="<c:url value='/list-patients' />"><i class="fa fa-fw fa-bar-chart-o"></i> Pacientes</a>
		            </li>
		            <%-- <li>
		                <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-edit"></i> Consultas <i class="fa fa-fw fa-caret-down"></i></a>
		                <ul id="demo" class="collapse">
		                    <li>
		                        <a href="<c:url value="/create-consultation" />"> <i class="fa fa-fw fa-pencil"></i> Crear consulta</a>
		                    </li>
		                </ul>
		            </li> --%>
		            <li>
		                <a href="<c:url value="/logout" />"><i class="fa fa-fw fa-power-off"></i> Cerrar sesi&oacute;n</a>
		            </li>
		        </ul>
		    </div>
		    <!-- /.navbar-collapse -->
		</nav>
		<div id="page-wrapper">
		    <div class="container-fluid">
		    	<div class="row">
                    <div class="col-lg-12">
                    	<ol class="breadcrumb">
                            <li>
                                <i class="fa fa-home"></i>  <a href="<c:url value="/" />">Inicio</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-user"></i> Pacientes
                            </li>
                        </ol>
                        <h1 class="page-header">
                            Pacientes
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
    <script src="static/js/bootstrap.js"></script>
    <script src="static/js/app.js"></script>
<!--     <script>var myContextPath = "${pageContext.request.contextPath}"</script>
    <script>var userList = ${users}</script> -->
    <script src="static/js/usersFunctions.js"></script>
</body>
</html>
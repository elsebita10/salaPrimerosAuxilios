<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>ABM de usuarios</title>
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
		            <li class="active">
		                <a href="<c:url value='/list-users' />"><i class="fa fa-fw fa-user"></i> Usuarios</a>
		            </li>
		            <li>
		                <a href="<c:url value='/get-metrics' />"><i class="fa fa-fw fa-bar-chart-o"></i> M&eacute;tricas</a>
		            </li>
		            <li>
		                <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-edit"></i> Consultas <i class="fa fa-fw fa-caret-down"></i></a>
		                <ul id="demo" class="collapse">
		                    <li>
		                        <a href="<c:url value="/create-consultation" />"> <i class="fa fa-fw fa-pencil"></i> Crear consulta</a>
		                    </li>
		                </ul>
		            </li>
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
                            <li>
                                <i class="fa fa-user"></i>  <a href="<c:url value="/list-users" />">Usuarios</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-user-plus"></i> Crear usuario nuevo
                            </li>
                        </ol>
                        <h1 class="page-header">
                            Usuarios
                        </h1>
                    </div>
                </div>
                <div class="row">
                	<div class="col-lg-12">
                		<h2>Formulario de registro de usuarios</h2>
                		<br>
                		<form:form method="POST" modelAttribute="user" class="form-horizontal">
	            			<form:input type="hidden" path="id" id="id"/>
	            			<div class="row">
	                			<div class="form-group col-md-6">
	                    		<label class="col-md-6 control-label" for="username">Username:</label>
		                    		<div class="col-md-6">
		                        	<c:choose>
		                            	<c:when test="${edit}">
		                                	<form:input type="text" path="username" id="username" class="form-control input-sm" disabled="true"/>
		                            	</c:when>
		                            	<c:otherwise>
		                                	<form:input type="text" path="username" id="username" class="form-control input-sm" />
		                                	<div class="has-error">
		                                    	<form:errors path="username" class="help-inline"/>
		                                	</div>
		                            	</c:otherwise>
		                        	</c:choose>
		                    		</div>
	                			</div>
	           	 			</div>
	           	 			<div class="row">
	                			<div class="form-group col-md-6">
	                    		<label class="col-md-6 control-label" for="password">Contraseña:</label>
	                    			<div class="col-md-6">
	                        			<form:input type="password" path="password" id="password" class="form-control input-sm" />
	                        			<div class="has-error">
	                            			<form:errors path="password" class="help-inline"/>
	                        			</div>
	                    			</div>
	                			</div>
	            			</div>
	            			<div class="row">
	                			<div class="form-group col-md-6">
	                    		<label class="col-md-6 control-label" for="lastName">Direcci&oacute;n:</label>
	                    			<div class="col-md-6">
	                        			<form:input type="text" path="address" id="address" class="form-control input-sm" />
	                        			<div class="has-error">
	                            			<form:errors path="address" class="help-inline"/>
	                        			</div>
	                    			</div>
	                			</div>
	            			</div>
	            			<div class="row">
	                			<div class="form-group col-md-6">
	                    		<label class="col-md-6 control-label" for="email">E-mail:</label>
	                   	 			<div class="col-md-6">
	                        			<form:input type="text" path="email" id="email" class="form-control input-sm" />
	                        			<div class="has-error">
	                            			<form:errors path="email" class="help-inline"/>
	                        			</div>
	                    			</div>
	                			</div>
	            			</div>
	            			<div class="row">
	                			<div class="form-group col-md-6">
	                    		<label class="col-md-6 control-label" for="userProfiles">Rol:</label>
	                    			<div class="col-md-6">
	                        			<form:select path="userProfiles" items="${roles}" multiple="true" itemValue="id" itemLabel="type" class="form-control input-sm" />
	                        			<div class="has-error">
	                            			<form:errors path="userProfiles" class="help-inline"/>
	                        			</div>
	                    			</div>
	                			</div>
	            			</div>
	            			<br>
	            			<div class="row">
		    					<div class="col-md-6">
		                			<div class="form-actions">
		                    		<c:choose>
		                        		<c:when test="${edit}">
		                        			<input type="submit" value="Actualizar" class="btn btn-success"/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="<c:url value='/list-users' />" class="btn btn-danger">Cancelar</a>
		                        		</c:when>
		                        		<c:otherwise>
		                            		<input type="submit" value="Registrar" class="btn btn-success"/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="<c:url value='/list-users' />" class="btn btn-danger">Cancelar</a>
		                        		</c:otherwise>
		                    		</c:choose>
		                			</div>
		            			</div>
		            		</div>
	            		</form:form>
                	</div> <!-- col 12 -->
                </div> <!-- row -->
			</div> <!-- container-fluid -->
		</div> <!-- page-wrapper -->
	</div> <!-- wrapper -->
	<script src="static/js/jquery.js"></script>
    <script src="static/js/bootstrap.js"></script>
    <script src="static/js/app.js"></script>
</body>
</html>
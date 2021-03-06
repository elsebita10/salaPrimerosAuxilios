<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>ABM de Usuarios</title>
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
		    	<div class="row col-lg-12 text-left">
                 	<ol class="breadcrumb">
                         <li>
                             <i class="fa fa-home"></i><a href="<c:url value="/" />"> Inicio</a>
                         </li>
                         <li>
                             <i class="fa fa-users"></i><a href="<c:url value="/list-users" />"> Usuarios</a>
                         </li>
                         <c:choose>
                           	<c:when test="${edit}">
                               	<li class="active">
		                            <i class="fa fa-pencil"></i> Modificar usuario
		                        </li>
                           	</c:when>
                           	<c:otherwise>
                               	<li class="active">
		                            <i class="fa fa-user-plus"></i> Crear usuario
		                        </li>
                           	</c:otherwise>
                       	 </c:choose>
                     </ol>
                </div>
                <div id="page-title" class="row col-lg-12 text-center" style="margin-top:-40px">
                	<h1 class="page-header">Usuarios</h1>
                </div>
                <div class="row">
					<div class="col col-xs-6">
						<c:choose>
                           	<c:when test="${edit}">
                				<h3>Formulario de modificaci&oacute;n de usuarios</h3>
                			</c:when>
                			<c:otherwise>
                				<h3>Formulario de registro de usuarios</h3>	                				
                			</c:otherwise>
                		</c:choose>
                	</div>
                </div>
                <div class="row">
                	<div class="col col-xs-6">                	
	               		<br>
	               		<form:form method="POST" modelAttribute="user" class="form-horizontal">
	            			<form:input type="hidden" path="id" id="id"/>
	            			<div class="row">
	                			<div class="form-group col-md-12">
		                    		<label class="col-md-6 control-label" for="username">Username:</label>
		                    		<div class="col-md-6">
		                        	<c:choose>
		                            	<c:when test="${edit}">
		                                	<form:input type="text" path="username" id="username" class="form-control input-sm" disabled="true"/>
		                            	</c:when>
		                            	<c:otherwise>
		                                	<form:input type="text" path="username" id="username" class="form-control input-sm" text=""/>
		                                	<div class="has-error">
		                                    	<form:errors path="username" class="help-inline"/>
		                                	</div>
		                            	</c:otherwise>
		                        	</c:choose>
		                    		</div>
	                			</div>
	           	 			</div>
	           	 			<div class="row">
	                			<div class="form-group col-md-12">
	                    		<label class="col-md-6 control-label" for="password">Contraseņa:</label>
	                    			<div class="col-md-6">
	                        			<form:input type="password" path="password" id="password" class="form-control input-sm" />
	                        			<div class="has-error">
	                            			<form:errors path="password" class="help-inline"/>
	                        			</div>
	                    			</div>
	                			</div>
	            			</div>
	            			<div class="row">
	                			<div class="form-group col-md-12">
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
	                			<div class="form-group col-md-12">
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
	                			<div class="form-group col-md-12">
	                    		<label class="col-md-6 control-label" for="userProfiles">Rol:</label>
	                    			<div class="col-md-6">
 	                    				<sec:authorize access="hasRole('ADMIN')">
	                        				<form:select path="userProfiles" items="${roles}" itemValue="id" itemLabel="type" class="form-control input-sm" />
	                        			</sec:authorize>
	                        			<sec:authorize access="hasRole('USER')">
	                        				<form:select path="userProfiles" items="${roles}" itemValue="id" itemLabel="type" class="form-control input-sm" disabled="true"/>
	                        			</sec:authorize>
	                        			<div class="has-error">
	                            			<form:errors path="userProfiles" class="help-inline"/>
	                        			</div>
	                    			</div>
	                			</div>
	            			</div>
	            			<br>
	            			<div class="row" style="padding-top:30px">
		    					<div class="form-group col-md-12">
		                			<div class="form-actions text-center">
			                    		<c:choose>
			                        		<c:when test="${edit}">
			                        			<input type="submit" value="Actualizar" class="btn btn-success" style="width:85px;margin: 0px 60px 0px 0px"/>
			                        			<sec:authorize access="hasRole('ADMIN')">
			                        				<a href="<c:url value='/list-users' />" class="btn btn-danger" style="width:85px;">Cancelar</a>
			                        			</sec:authorize>
			                        			<sec:authorize access="hasRole('USER')">
			                        				<a href="<c:url value='/' />" class="btn btn-danger" style="width:85px;">Cancelar</a>
			                        			</sec:authorize>
			                        		</c:when>
			                        		<c:otherwise>
			                            		<input type="submit" value="Crear" class="btn btn-success" style="width:85px;margin: 0px 60px 0px 0px"/>
			                            		<sec:authorize access="hasRole('ADMIN')">
			                        				<a href="<c:url value='/list-users' />" class="btn btn-danger" style="width:85px;">Cancelar</a>
			                        			</sec:authorize>
			                        			<sec:authorize access="hasRole('USER')">
			                        				<a onclickhref="<c:url value='/' />" class="btn btn-danger" style="width:85px;">Cancelar</a>
			                        			</sec:authorize>
			                        		</c:otherwise>
			                    		</c:choose>
		                			</div>
		            			</div>
		            		</div>
	            		</form:form>
	            	</div> 
                </div> <!-- row -->
			</div> <!-- container-fluid -->
		</div> <!-- page-wrapper -->
	</div> <!-- wrapper -->
	<script src="static/js/jquery.js"></script>
    <script src="static/bootstrap/js/bootstrap.min.js"></script>
    <script src="static/js/app.js"></script>
</body>
</html>
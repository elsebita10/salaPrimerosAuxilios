<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Formulario de consultas</title>
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
                    <div class="col-lg-12">
                    	<ol class="breadcrumb">
                            <li>
                                <i class="fa fa-home"></i>  <a href="<c:url value="/" />">Inicio</a>
                            </li>
                            <li>
                                <i class="fa fa-edit"></i>  Pacientes
                            </li>
                        </ol>
                        <h1 class="page-header">
                            Pacientes
                        </h1>
                    </div>
                </div>
                <form:form class="form-horizontal" method="POST" modelAttribute="patient" name="form">
				<form:input type="hidden" path="id" id="id"/>
                	<div class="col-lg-12">
                		<h2>Formulario de pacientes</h2>
                		<h5 style="color:#B40404;">(Los campos con &#42; son obligatorios)</h5> 
                		<br>
			               	<div class="col-lg-6">
			               		<h3>Datos personales del paciente</h3>
			               		<br>
			               		<div class="form-group">
									<label class="control-label col-xs-3">&#42; Apellido:</label>
									<div class="col-xs-8">
										<form:input type="text" path="lastName" id="lastName" class="form-control input-sm" placeholder="Ingrese su apellido" required="required"/>
		 								<div class="has-error">
		                    				<form:errors path="lastName" class="help-inline"/>
		                   	 			</div>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-xs-3">&#42; Nombre:</label>
									<div class="col-xs-8">
										<form:input type="text" path="firstName" id="firstName" class="form-control input-sm" placeholder="Ingrese su nombre" required="required"/>
					 					<div class="has-error">
					                    	<form:errors path="firstName" class="help-inline"/>
					                    </div>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-xs-3">&#42; D.N.I.:</label>
									<div class="col-xs-8">
										<form:input type="text" path="dni" id="dni" class="form-control input-sm" placeholder="Ingrese su D.N.I." required="required"/>
					 					<div class="has-error">
					                    	<form:errors path="dni" class="help-inline"/>
					                    </div>			
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-xs-3">&#42; Sexo:</label>
				 					<div class="col-xs-8">
					 					<label class="radio-inline">
											<form:radiobutton id="sex" path="sex" name="genderRadios" value="Masculino" required="required" /> Masculino
										</label>
										<br/>
					 					<label class="radio-inline">
											<form:radiobutton id="sex" path="sex" name="genderRadios" value="Femenino" required="required"/> Femenino
										</label>
										<br/>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-xs-3">&#42; Domicilio:</label>
									<div class="col-xs-8">
										<form:input type="text" id="address" path="address" class="form-control input-sm" placeholder="Ingrese su domicilio" required="required"/>
					 					<div class="has-error">
					                    	<form:errors path="address" class="help-inline"/>
					                    </div>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-xs-3">&#42; Email:</label>
									<div class="col-xs-8">
										<form:input type="text" id="email" path="email" class="form-control input-sm" placeholder="Ingrese su correo electrónico"/>
								   <%-- <div class="has-error">
					                    	<form:errors path="patient.address" class="help-inline"/>
					                    </div> --%>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-xs-3">&#42; Edad:</label>
									<div class="col-xs-4">
										<form:input type="text" id="age" path="age" class="form-control input-sm" placeholder="Ingrese su edad" required="required"/>
					 					<div class="has-error">
					                    	<form:errors path="age" class="help-inline"/>
					                    </div>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-xs-3" >&#42; Tel&eacute;fono:</label>
									<div class="col-xs-6">
										<form:input type="text" id="phone" path="phone" class="form-control input-sm" placeholder="Ingrese su teléfono" required="required"/>
					 					<div class="has-error">
					                    	<form:errors path="phone" class="help-inline"/>
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
		                        			<input type="submit" value="Actualizar" class="btn btn-success"/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="<c:url value='/list-patients' />" class="btn btn-danger">Cancelar</a>
		                        		</c:when>
		                        		<c:otherwise>
		                            		<input type="submit" value="Guardar" class="btn btn-success"/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="<c:url value='/list-patients' />" class="btn btn-danger">Cancelar</a>
		                        		</c:otherwise>
		                    		</c:choose>
		                			</div>
		            			</div>
		            		</div>
						<br>				
					</form:form>
	    		</div> <!-- row -->
	    	</div> <!-- container-fluid -->
		</div> <!-- page-wrapper -->
	</div> <!-- wrapper -->
	<script src="static/js/jquery.js"></script>
    <script src="static/bootstrap/js/bootstrap.min.js"></script>
    <script src="static/js/app.js"></script>
</body>
</html>
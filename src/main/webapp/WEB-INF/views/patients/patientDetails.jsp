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
    <title>BM de Pacientes</title>
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
                            <i class="fa fa-home"></i>  <a href="<c:url value="/" />">Inicio</a>
                        </li>
                        <li>
                            <i class="fa fa-wheelchair custom"></i>  <a href="<c:url value="/list-patients" />">Pacientes</a>
                        </li>
                        <li class="active">
                            <i class="fa fa-info"></i> Informaci&oacute;n del Paciente
                        </li>
                    </ol>
	            </div>
          		<div id="page-title" class="row col-lg-12 text-center" style="margin-top:-40px">
                    <h1 class="page-header">Pacientes</h1>
                </div>
                <div class="row">
                	<div class="col col-xs-6">
                		<h3 id="page-subtitle">Informaci&oacute;n del paciente</h3>
                	</div>
                </div>
                <div class="row">
               		<br>
               		<form:form method="POST" modelAttribute="patient" class="form-horizontal">
            			<form:input type="hidden" path="id" id="id"/>
            			<div class="row">
                			<div class="form-group col-md-6">
                    		<label class="col-md-6 control-label" for="lastName">Apellido:</label>
	                    		<div class="col-md-6">
                                	<form:input type="text" path="lastName" id="lastName" class="form-control input-sm" disabled="true"/>
                            	   	<div class="has-error">
                                    	<form:errors path="lastName" class="help-inline"/>
                                	</div>
	                    		</div>
                			</div>
           	 			</div>
           	 			<div class="row">
                			<div class="form-group col-md-6">
                    		<label class="col-md-6 control-label" for="firstName">Nombre:</label>
                    			<div class="col-md-6">
                        			<form:input type="text" path="firstName" id="firstName" class="form-control input-sm" disabled="true"/>
                        			<div class="has-error">
                            			<form:errors path="firstName" class="help-inline"/>
                        			</div>
                    			</div>
                			</div>
            			</div>
            			<div class="row">
                			<div class="form-group col-md-6">
                    		<label class="col-md-6 control-label" for="dni">D.N.I.:</label>
                    			<div class="col-md-6">
                        			<form:input type="text" path="dni" id="dni" class="form-control input-sm" disabled="true"/>
                        			<div class="has-error">
                            			<form:errors path="dni" class="help-inline"/>
                        			</div>
                    			</div>
                			</div>
            			</div>
            			<div class="row">
                			<div class="form-group col-md-6">
                    		<label class="col-md-6 control-label" for="sex">Sexo:</label>
                    			<div class="col-md-6">
				 					<label class="radio-inline">
										<form:radiobutton id="sex" path="sex" name="genderRadios" value="Masculino" required="required" disabled="true"/> Masculino
									</label>
									<br/>
				 					<label class="radio-inline">
										<form:radiobutton id="sex" path="sex" name="genderRadios" value="Femenino" required="required" disabled="true"/> Femenino
									</label>
									<br/>
                    			</div>
                			</div>
            			</div>
            			<div class="row">
                			<div class="form-group col-md-6">
                    		<label class="col-md-6 control-label" for="address">Direcci&oacute;n:</label>
                    			<div class="col-md-6">
                        			<form:input type="text" path="address" id="address" class="form-control input-sm" disabled="true"/>
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
                        			<form:input type="text" path="email" id="email" class="form-control input-sm" disabled="true"/>
                        			<div class="has-error">
                            			<form:errors path="email" class="help-inline"/>
                        			</div>
                    			</div>
                			</div>
            			</div>
            			<div class="row">
                			<div class="form-group col-md-6">
                    		<label class="col-md-6 control-label" for="age">Edad:</label>
                    			<div class="col-md-6">
                        			<form:input type="text" path="age" id="age" class="form-control input-sm" disabled="true"/>
                        			<div class="has-error">
                            			<form:errors path="age" class="help-inline"/>
                        			</div>
                    			</div>
                			</div>
            			</div>
            			<div class="row">
                			<div class="form-group col-md-6">
                    		<label class="col-md-6 control-label" for="phone">Tel&eacute;fono:</label>
                    			<div class="col-md-6">
                        			<form:input type="text" path="phone" id="phone" class="form-control input-sm" disabled="true"/>
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
                        			&nbsp;&nbsp;&nbsp;&nbsp;<a href="<c:url value='/list-patients' />" class="btn btn-danger style="width:85px;"">Volver</a>
	                			</div>
	            			</div>
	            		</div>
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
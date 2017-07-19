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
                            <i class="fa fa-home"></i><a href="<c:url value="/" />"> Inicio</a>
                        </li>
                        <li>
                            <i class="fa fa-wheelchair"></i><a href="<c:url value="/list-patients" />"> Pacientes</a>
                        </li>
                        <li class="active">
                            <i class="fa fa-edit"></i> Modificar paciente
                        </li>
                    </ol>
                </div>
                <div id="page-title" class="row col-lg-12 text-center" style="margin-top:-40px">
                	<h1 class="page-header">Pacientes</h1>
                </div>
                <div class="row">
					<div class="col col-xs-6">
                		<h3>Formulario de modificaci&oacute;n de pacientes</h3>
                	</div>
                </div>
                <div class="row">
                	<div class="col col-xs-6">                	
	               		<br>
		                <form:form class="form-horizontal" method="POST" modelAttribute="patient" name="form">
							<form:input type="hidden" path="id" id="id"/>
							<div class="row">
			               		<div class="form-group col-md-12">
									<label class="col-md-6 control-label">Apellido:</label>
									<div class="col-md-6">
										<form:input type="text" path="lastName" id="lastName" class="form-control input-sm" placeholder="Ingrese su apellido" required="required"/>
		 								<div class="has-error">
		                    				<form:errors path="lastName" class="help-inline"/>
		                   	 			</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-md-12">
									<label class="col-md-6 control-label">Nombre:</label>
									<div class="col-md-6">
										<form:input type="text" path="firstName" id="firstName" class="form-control input-sm" placeholder="Ingrese su nombre" required="required"/>
					 					<div class="has-error">
					                    	<form:errors path="firstName" class="help-inline"/>
					                    </div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-md-12">
									<label class="col-md-6 control-label">D.N.I.:</label>
									<div class="col-md-6">
										<form:input type="text" path="dni" id="dni" class="form-control input-sm" placeholder="Ingrese su D.N.I." minlength="7" maxlength="8" onKeyPress="return acceptOnlyNumbers(event);" required="required"/>
					 					<div class="has-error">
					                    	<form:errors path="dni" class="help-inline"/>
					                    </div>			
									</div>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-md-12">
									<label class="col-md-6 control-label">Sexo:</label>
				 					<div class="col-md-6">
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
							</div>
							<div class="row">
								<div class="form-group col-md-12">
									<label class="col-md-6 control-label">Domicilio:</label>
									<div class="col-md-6">
										<form:input type="text" id="address" path="address" class="form-control input-sm" placeholder="Ingrese su domicilio" required="required"/>
					 					<div class="has-error">
					                    	<form:errors path="address" class="help-inline"/>
					                    </div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-md-12">
									<label class="col-md-6 control-label">Email:</label>
									<div class="col-md-6">
										<form:input type="text" id="email" path="email" class="form-control input-sm" placeholder="Ingrese su correo electrónico"/>
								   <%-- <div class="has-error">
					                    	<form:errors path="patient.address" class="help-inline"/>
					                    </div> --%>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-md-12">
									<label class="col-md-6 control-label">Edad:</label>
									<div class="col-md-6">
										<form:input type="text" id="age" path="age" class="form-control input-sm" placeholder="Ingrese su edad" minlength="1" maxlength="3" onKeyPress="return acceptOnlyNumbers(event);" required="required"/>
					 					<div class="has-error">
					                    	<form:errors path="age" class="help-inline"/>
					                    </div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-md-12">
									<label class="col-md-6 control-label" >Tel&eacute;fono:</label>
									<div class="col-md-6">
										<form:input type="text" id="phone" path="phone" class="form-control input-sm" placeholder="Ingrese su teléfono" minlength="7" maxlength="20" onKeyPress="return acceptedCharactersForPhone(event);" required="required"/>
					 					<div class="has-error">
					                    	<form:errors path="phone" class="help-inline"/>
					                    </div>
									</div>
								</div>
							<br>
							<div class="row" style="padding-top:70px">
		    					<div class="form-group col-md-12">
		                			<div class="form-actions text-center">
	                        			<input type="submit" value="Actualizar" class="btn btn-success" style="width:85px;margin: 0px 60px 0px 0px"/><a href="<c:url value='/list-patients' />" class="btn btn-danger" style="width:85px;">Cancelar</a>
		                			</div>
		            			</div>
		            		</div>
							<br>				
						</form:form>
					</div>
	    		</div> <!-- row -->
	    	</div> <!-- container-fluid -->
		</div> <!-- page-wrapper -->
	</div> <!-- wrapper -->
	<script type="text/javascript">
	function acceptOnlyNumbers(e) {
		var key = window.Event ? e.which : e.keyCode;
		return (key >= 48 && key <= 57);
	}
	
	function acceptedCharactersForPhone(e) {
		var key = window.Event ? e.which : e.keyCode;
		return (key >= 48 && key <= 57 || key == 40 || key == 41 || key == 45);
	}
	</script>
	<script src="static/js/jquery.js"></script>
    <script src="static/bootstrap/js/bootstrap.min.js"></script>
    <script src="static/js/app.js"></script>
</body>
</html>
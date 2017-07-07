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
		                <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-edit"></i> Consultas <i class="fa fa-fw fa-caret-down"></i></a>
		                <ul id="demo" class="collapse">
		                    <li class="active">
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
                                <i class="fa fa-edit"></i>  Consultas
                            </li>
                            <li class="active">
                                <i class="fa fa-pencil"></i>   <a href="<c:url value="/create-consultation" />">Crear consulta</a>
                            </li>
                        </ol>
                        <h1 class="page-header">
                            Consultas
                        </h1>
                    </div>
                </div>
                <form:form class="form-horizontal" method="POST" modelAttribute="consultation" name="form">
				<form:input type="hidden" path="id" id="id"/>
                	<div class="col-lg-12">
                		<h2>Formulario de consultas</h2>
                		<h5 style="color:#B40404;">(Los campos con &#42; son obligatorios)</h5> 
                		<br>
			               	<div class="col-lg-6">
			               		<h3>Datos personales del paciente</h3>
			               		<br>
			               		<div class="form-group">
									<label class="control-label col-xs-3">&#42; Apellido:</label>
									<div class="col-xs-8">
										<form:input type="text" path="patient.lastName" id="patient.lastName" class="form-control input-sm" placeholder="Ingrese su apellido" required="required"/>
		 								<div class="has-error">
		                    				<form:errors path="patient.lastName" class="help-inline"/>
		                   	 			</div>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-xs-3">&#42; Nombre:</label>
									<div class="col-xs-8">
										<form:input type="text" path="patient.firstName" id="patient.firstName" class="form-control input-sm" placeholder="Ingrese su nombre" required="required"/>
					 					<div class="has-error">
					                    	<form:errors path="patient.firstName" class="help-inline"/>
					                    </div>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-xs-3">&#42; D.N.I.:</label>
									<div class="col-xs-8">
										<form:input type="text" path="patient.dni" id="patient.dni" class="form-control input-sm" placeholder="Ingrese su D.N.I." required="required"/>
					 					<div class="has-error">
					                    	<form:errors path="patient.dni" class="help-inline"/>
					                    </div>			
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-xs-3">&#42; Sexo:</label>
				 					<div class="col-xs-8">
					 					<label class="radio-inline">
											<form:radiobutton id="patient.sex" path="patient.sex" name="genderRadios" value="Masculino" required="required" /> Masculino
										</label>
										<br/>
					 					<label class="radio-inline">
											<form:radiobutton id="patient.sex" path="patient.sex" name="genderRadios" value="Femenino" required="required"/> Femenino
										</label>
										<br/>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-xs-3">&#42; Domicilio:</label>
									<div class="col-xs-8">
										<form:input type="text" id="patient.address" path="patient.address" class="form-control input-sm" placeholder="Ingrese su domicilio" required="required"/>
					 					<div class="has-error">
					                    	<form:errors path="patient.address" class="help-inline"/>
					                    </div>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-xs-3">&#42; Email:</label>
									<div class="col-xs-8">
										<form:input type="text" id="patient.email" path="patient.email" class="form-control input-sm" placeholder="Ingrese su correo electrónico"/>
								   <%-- <div class="has-error">
					                    	<form:errors path="patient.address" class="help-inline"/>
					                    </div> --%>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-xs-3">&#42; Edad:</label>
									<div class="col-xs-4">
										<form:input type="text" id="patient.age" path="patient.age" class="form-control input-sm" placeholder="Ingrese su edad" required="required"/>
					 					<div class="has-error">
					                    	<form:errors path="patient.age" class="help-inline"/>
					                    </div>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-xs-3" >&#42; Tel&eacute;fono:</label>
									<div class="col-xs-6">
										<form:input type="tel" id="patient.phone" path="patient.phone" class="form-control input-sm" placeholder="Ingrese su teléfono" required="required"/>
					 					<div class="has-error">
					                    	<form:errors path="patient.phone" class="help-inline"/>
					                    </div>
									</div>
								</div>
			               	</div>
			              	<div class="col-lg-6">
			               		<h3>Datos m&eacute;dicos del paciente</h3>
			               		<br>
						        <div class="form-group">
									<label class="control-label col-xs-3" >&#42; T&#47;A:</label>
									<div class="col-xs-8">
										<form:input type="text" class="form-control input-sm" id="t_a" path="t_a" placeholder="Ingrese su T/A" required="required"/>
					 					<div class="has-error">
					                    	<form:errors path="t_a" class="help-inline"/>
					                    </div>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-xs-3" >&#42; T&deg;:</label>
									<div class="col-xs-8">
										<form:input type="text" id="t" path="t" class="form-control input-sm" placeholder="Ingrese su T°" required="required"/>
					 					<div class="has-error">
					                    	<form:errors path="t" class="help-inline"/>
					                    </div>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-xs-3" >&#42; FC:</label>
									<div class="col-xs-8">
										<form:input type="text" id="fc" path="fc" class="form-control input-sm" placeholder="Ingrese su FC" required="required"/>
					 					<div class="has-error">
					                    	<form:errors path="fc" class="help-inline"/>
					                    </div>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-xs-3" >&#42; Spo2%:</label>
									<div class="col-xs-8">
										<form:input type="text" id="spo2" path="spo2" class="form-control input-sm" placeholder="Ingrese su Spo2%" required="required"/>
					 					<div class="has-error">
					                    	<form:errors path="spo2" class="help-inline"/>
					                    </div>
									</div>
								</div>
			               	</div>
			               	<div class="col-lg-6">
			               		<h3>Motivo de la consulta</h3>
				               	<br>
				               	<div class="form-group">
									<label class="control-label col-xs-3" >&#42; Motivo:</label>
									<div class="col-xs-8">
										<form:select class="form-control" path="reason" required="required">
											<form:option value="" label="Seleccione una opción"/>
											<form:option value="1" label="Contención emocional"/>
											<form:option value="2" label="Cefalea, náuseas, mareos, vómitos"/>
 											<form:option value="3" label="HTA-DBT"/>
 											<form:option value="4" label="Ataque epiléptico"/>
 											<form:option value="5" label="Herida abierta, traumatismo"/>
 											<form:option value="6" label="Dolor abdominal, lumbar"/>
 											<form:option value="7" label="Febrícula"/>
 											<form:option value="8" label="Hipoglucemia"/>
 											<form:option value="9" label="Adormecimiento MS"/>
 											<form:option value="10" label="Otro"/>
										</form:select>
										<p class="help-block">Elija el motivo de la consulta</p>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-xs-3" >&#42; Antecedente:</label>
									<div class="col-xs-8">
										<form:select class="form-control" path="medicalHistory" required="required">
											<form:option value="" label="Seleccione una opción"/>
											<form:option value="1" label="Ninguno"/>
											<form:option value="2" label="HTA"/>
											<form:option value="3" label="DBT"/>
											<form:option value="4" label="Alergia"/>
											<form:option value="5" label="Epilepsia"/>
											<form:option value="6" label="Asma"/>
											<form:option value="7" label="Cardíaco"/>
											<form:option value="8" label="Psiquiátrico"/>
											<form:option value="9" label="ACV"/>
											<form:option value="10" label="Neurológico"/>
											<form:option value="11" label="EPOC"/>
											<form:option value="12" label="CA"/>
										</form:select>
										<p class="help-block">Elija el antecedente de la enfermedad actual</p>
									</div>
									<br>
								</div>
			               	</div>
			               	<div class="col-lg-12">
			               		<h3>Fin de la atenci&oacute;n</h3>
			               		<br>
			               		<div class="form-group">
									<label class="control-label col-xs-3">&#42; &iquest;Se llam&oacute; a SAME?</label>
									<div class="col-xs-7">
										<label class="radio-inline">
											<form:radiobutton id="sameNo" path="same" name="sameRadios" value="false" required="required" /> No
										</label>
										<label class="radio-inline">
											<form:radiobutton id="sameSi" path="same" name="sameRadios" value="true" required="required" /> Sí
										</label>
									</div>
								</div>
								<fieldset id="fieldset-same">
								<div class="container-fluid">
									<h4>SAME</h4>      
								</div>
								<div class="form-group">
									<label class="control-label col-xs-5" >&#42; Profesional que atendi&oacute; al paciente: </label>
									<div class="col-xs-7">	
										<form:input type="text" id="doctor" path="doctor" class="form-control input-sm" placeholder="Ingrese el nombre del profesional"/>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-xs-5" >&#42; N&uacute;mero de m&oacute;vil: </label>
									<div class="col-xs-7">
										<form:input type="tel" id="doctorPhone" path="doctorPhone" class="form-control input-sm" placeholder="Ingrese el número de móvil"/>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-xs-5">&#42; &iquest;Se traslad&oacute; al paciente?</label>
									<div class="col-xs-4">
										<label class="radio-inline">
											<form:radiobutton id="trasladoNo" path="patientTransport" name="trasladoRadios" value="false"/> No
										</label>
										<label class="radio-inline">
											<form:radiobutton id="trasladoSi" path="patientTransport" name="trasladoRadios" value="true"/> Sí
										</label>
									</div>
								</div>
								</fieldset>								
								<fieldset id="fieldset-traslado">								
									<div class="container-fluid">
										<h4>&iquest;D&oacute;nde se traslad&oacute; al paciente?<h4>      
									</div>
									<div class="form-group">
										<label class="control-label col-xs-5" >&#42; Lugar: </label>
										<div class="col-xs-7">
											<form:input type="text" id="medicalInstitution" path="medicalInstitution" class="form-control input-sm" placeholder="Ingrese el nombre de la institución"/>
										</div>
									</div>
			               		</fieldset>
			               	</div> <!-- col 12 -->
						</div> <!-- col 12 -->	
						<br>
						<div class="container-fluid">
							<div class="form-group">
								<div class="col-xs-12">
				 					<input type="submit" class="btn btn-success custom-width" value="Guardar">&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="reset" class="btn btn-default" value="Limpiar">
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
    <script src="static/js/bootstrap.js"></script>
    <script src="static/js/app.js"></script>
</body>
</html>
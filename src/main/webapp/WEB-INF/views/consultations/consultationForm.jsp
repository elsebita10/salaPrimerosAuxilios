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
	                            <li>
	                                <i class="fa fa-edit"></i>  Consultas
	                            </li>
	                            <li class="active">
	                                <i class="fa fa-pencil"></i>   <a href="<c:url value="/create-consultation" />">Crear consulta</a>
	                            </li>
	                        </ol>
	                    </div>
	                    <div class="col-lg-4">
	                        <h1 class="page-header">Consultas</h1>
                    	</div>
                    </div>
                </div>
                <form:form class="form-horizontal" method="POST" modelAttribute="consultationDTO" name="form">
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
											<form:option value="Contención emocional" label="Contención emocional"/>
											<form:option value="Cefalea, náuseas, mareos, vómitos" label="Cefalea, náuseas, mareos, vómitos"/>
 											<form:option value="HTA-DBT" label="HTA-DBT"/>
 											<form:option value="Ataque epiléptico" label="Ataque epiléptico"/>
 											<form:option value="Herida abierta, traumatismo" label="Herida abierta, traumatismo"/>
 											<form:option value="Dolor abdominal, lumbar" label="Dolor abdominal, lumbar"/>
 											<form:option value="Febrícula" label="Febrícula"/>
 											<form:option value="Hipoglucemia" label="Hipoglucemia"/>
 											<form:option value="Adormecimiento MS" label="Adormecimiento MS"/>
 											<form:option value="Otro" label="Otro"/>
										</form:select>
										<p class="help-block">Elija el motivo de la consulta</p>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-xs-3" >&#42; Antecedente:</label>
									<div class="col-xs-8">
										<form:select class="form-control" path="medicalHistory" required="required">
											<form:option value="" label="Seleccione una opción"/>
											<form:option value="Ninguno" label="Ninguno"/>
											<form:option value="HTA" label="HTA"/>
											<form:option value="DBT" label="DBT"/>
											<form:option value="Alergia" label="Alergia"/>
											<form:option value="Epilepsia" label="Epilepsia"/>
											<form:option value="Asma" label="Asma"/>
											<form:option value="Cardíaco" label="Cardíaco"/>
											<form:option value="Psiquiátrico" label="Psiquiátrico"/>
											<form:option value="ACV" label="ACV"/>
											<form:option value="Neurológico" label="Neurológico"/>
											<form:option value="EPOC" label="EPOC"/>
											<form:option value="CA" label="CA"/>
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
										<form:input type="text" id="ambulance" path="ambulance" class="form-control input-sm" placeholder="Ingrese el número de móvil"/>
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
<!-- 						<div class="container-fluid">
							<div class="form-group">
								<div class="col-xs-12">
				 					<input type="submit" class="btn btn-success custom-width" value="Guardar">&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="reset" class="btn btn-default" value="Limpiar">
								</div>
							</div>
						</div> -->
						
						<div class="row">
		    					<div class="col-md-6">
		                			<div class="form-actions">
		                    		<c:choose>
		                        		<c:when test="${edit}">
		                        			<input type="submit" value="Actualizar" class="btn btn-success"/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="<c:url value='/list-consultations' />" class="btn btn-danger">Cancelar</a>
		                        		</c:when>
		                        		<c:otherwise>
		                            		<input type="submit" value="Guardar" class="btn btn-success"/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="<c:url value='/list-consultations' />" class="btn btn-danger">Cancelar</a>
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
    <script src="static/js/bootstrap.js"></script>
    <script src="static/js/app.js"></script>
</body>
</html>
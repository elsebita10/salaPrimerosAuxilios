<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Formulario de consultas</title>
	    <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
	    <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
		<script>
			$(document).ready(function(){
				$("#sameSi").click(function() {$("#same-fieldset").prop("disabled", false);});
				$("#sameNo").click(function() {$("#same-fieldset").prop("disabled", true);});
				$("#trasladoSi").click(function() {$("#traslado-fieldset").prop("disabled", false);});
				$("#trasladoNo").click(function() {$("#traslado-fieldset").prop("disabled", true);});
			});
		</script>
	</head>
	<body>
		<div id="sidebar-wrapper">
			<div class="sidebar">
				<%@ include file="/WEB-INF/views/commons/menu.jsp" %>
			</div>
		</div>
		<div id="main-wrapper" class="col-sm-10 pull-right">
			<form:form class="form-horizontal" method="POST" modelAttribute="consultation">
			<form:input type="hidden" path="id" id="id"/>
			<div class="container-fluid">
				<div class = "panel panel-default col-xs-6">
   					<div class = "panel-heading"><h3>Datos personales del paciente</h3></div>
					<div class="container-fluid">
						<h5>Los campos con &#42; son obligatorios</h5>      
					</div>
					<br>
					<div class="form-group">
						<label class="control-label col-xs-3">&#42; Apellido:</label>
						<div class="col-xs-8">
							<form:input type="text" path="patient.lastName" id="patient.lastName" class="form-control input-sm" placeholder="Ingrese su apellido"/>
		 					<div class="has-error">
		                    	<form:errors path="patient.lastName" class="help-inline"/>
		                    </div>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-3">&#42; Nombre:</label>
						<div class="col-xs-8">
							<form:input type="text" path="patient.firstName" id="patient.firstName" class="form-control input-sm" placeholder="Ingrese su nombre"/>
		 					<div class="has-error">
		                    	<form:errors path="patient.firstName" class="help-inline"/>
		                    </div>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-3">&#42; D.N.I.:</label>
						<div class="col-xs-8">
							<form:input type="text" path="patient.dni" id="patient.dni" class="form-control input-sm" placeholder="Ingrese su D.N.I."/>
		 					<div class="has-error">
		                    	<form:errors path="patient.dni" class="help-inline"/>
		                    </div>			
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-3">&#42; Sexo:</label>
	 					<div class="col-xs-8">
		 					<label class="radio-inline">
								<form:radiobutton id="patient.sex" path="patient.sex" name="genderRadios" value="Masculino"/> Masculino
							</label>
							<br/>
		 					<label class="radio-inline">
								<form:radiobutton id="patient.sex" path="patient.sex" name="genderRadios" value="Femenino"/> Femenino
							</label>
							<br/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-3">&#42; Domicilio:</label>
						<div class="col-xs-8">
							<form:input type="text" id="patient.address" path="patient.address" class="form-control input-sm" placeholder="Ingrese su domicilio"/>
		 					<div class="has-error">
		                    	<form:errors path="patient.address" class="help-inline"/>
		                    </div>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-3">&#42; Email:</label>
						<div class="col-xs-8">
							<form:input type="text" id="patient.email" path="patient.email" class="form-control input-sm" placeholder="Ingrese su correo electrónico"/>
	<%-- 	 					<div class="has-error">
		                    	<form:errors path="patient.address" class="help-inline"/>
		                    </div> --%>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-3">&#42; Edad:</label>
						<div class="col-xs-4">
							<form:input type="text" id="patient.age" path="patient.age" class="form-control input-sm" placeholder="Ingrese su edad"/>
		 					<div class="has-error">
		                    	<form:errors path="patient.age" class="help-inline"/>
		                    </div>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-3" >&#42; Tel&eacute;fono:</label>
						<div class="col-xs-6">
							<form:input type="tel" id="patient.phone" path="patient.phone" class="form-control input-sm" placeholder="Ingrese su teléfono"/>
		 					<div class="has-error">
		                    	<form:errors path="patient.phone" class="help-inline"/>
		                    </div>
						</div>
					</div>
				</div>
				<div class = "panel panel-default col-xs-6">
					<div class = "panel-heading"><h3>Datos m&eacute;dicos del paciente</h3></div>
					<br/>
					<br/>
					<div class="form-group">
						<label class="control-label col-xs-2" >&#42; T&#47;A:</label>
						<div class="col-xs-9">
							<form:input type="text" class="form-control input-sm" id="t_a" path="t_a" placeholder="Ingrese su T/A"/>
		 					<div class="has-error">
		                    	<form:errors path="t_a" class="help-inline"/>
		                    </div>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-2" >&#42; T&deg;:</label>
						<div class="col-xs-9">
							<form:input type="text" id="t" path="t" class="form-control input-sm" placeholder="Ingrese su T°"/>
		 					<div class="has-error">
		                    	<form:errors path="t" class="help-inline"/>
		                    </div>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-2" >&#42; FC:</label>
						<div class="col-xs-9">
							<form:input type="text" id="fc" path="fc" class="form-control input-sm" placeholder="Ingrese su FC"/>
		 					<div class="has-error">
		                    	<form:errors path="fc" class="help-inline"/>
		                    </div>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-2" >&#42; Spo2%:</label>
						<div class="col-xs-9">
							<form:input type="text" id="spo2" path="spo2" class="form-control input-sm" placeholder="Ingrese su Spo2%"/>
		 					<div class="has-error">
		                    	<form:errors path="spo2" class="help-inline"/>
		                    </div>
						</div>
					</div>
					<div class="container-fluid">
						<h4>Motivo de la consulta</h4>      
					</div>
					<div class="form-group">
						<label class="control-label col-xs-2" >&#42; Motivo:</label>
						<div class="col-xs-9">
							<select class="form-control" required>
								<option selected>Seleccione una opci&oacute;n</option>
								<option value="1">Contenci&oacute;n emocional</option>
								<option value="2">Cefalea, n&aacute;useas, mareos, v&oacute;mitos</option>
								<option value="3">HTA-DBT</option>
								<option value="4">Ataque epil&eacute;ptico</option>
								<option value="5">Herida abierta, traumatismo</option>
								<option value="6">Dolor abdominal, lumbar</option>
								<option value="7">Febr&iacute;cula</option>
								<option value="8">Hipoglucemia</option>
								<option value="9">Adormecimiento MS</option>
								<option value="10">Otro</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-2" >&#42;</label>
						<div class="col-xs-9">
							<input type="text" class="form-control" placeholder="Tu respuesta">
						</div>
					</div>
					<div class="container-fluid">
						<h4>Antecedentes de enfermedad actual</h4>      
					</div>
					<div class="form-group">
						<label class="control-label col-xs-2" >&#42;</label>
						<div class="col-xs-9">
							<select class="form-control" required>
								<option selected>Seleccione una opci&oacute;n</option>
								<option value="1">Ninguno</option>
								<option value="2">HTA</option>
								<option value="3">DBT</option>
								<option value="4">Alergia</option>
								<option value="5">Epilepsia</option>
								<option value="6">Asma</option>
								<option value="7">Card&iacute;aco</option>
								<option value="8">Psiqui&aacute;trico</option>
								<option value="9">ACV</option>
								<option value="10">Neurol&oacute;gico</option>
								<option value="11">EPOC</option>
								<option value="12">CA</option>
							</select>
						</div>
					</div>
				</div>
				<div class = "panel panel-default col-xs-12">
					<div class = "panel-heading"><h3>Fin de la atenci&oacute;n</h3></div>
					<br/>
					<div class="col-xs-6">
						<div class="form-group">
							<label class="control-label col-xs-4">&#42; &iquest;Se llam&oacute; a SAME?</label>
							<div class="col-xs-4">
								<label class="radio-inline">
									<input type="radio" name="sameRadios" id="sameSi" required> S&iacute;
								</label>
								<br/>
								<label class="radio-inline">
									<input type="radio" name="sameRadios" id="sameNo" required> No
								</label>
							</div>
						</div>
						<div class="container-fluid">
							<h4>SAME</h4>      
						</div>
						<div class="form-group">
							<label class="control-label col-xs-4" >&#42; Profesional que atendi&oacute; al paciente: </label>
							<div class="col-xs-6">
								<input type="text" class="form-control" placeholder="Ingrese el nombre del profesional" required>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-xs-4" >&#42; N&uacute;mero de m&oacute;vil: </label>
							<div class="col-xs-6">
								<input type="text" class="form-control" placeholder="Ingrese el n&uacute;mero de m&oacute;vil" required>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-xs-4">&#42; &iquest;Se traslad&oacute; al paciente?</label>
							<div class="col-xs-4">
								<label class="radio-inline">
									<input type="radio" name="trasladoRadios" id="trasladoSi" required> S&iacute;
								</label>
								<br/>
								<label class="radio-inline">
									<input type="radio" name="trasladoRadios" id="trasladoNo" required> No
								</label>
							</div>
						</div>
					<div class="container-fluid">
						<h4>&iquest;D&oacute;nde se traslad&oacute; al paciente?</h4>      
					</div>
					<div class="form-group">
						<label class="control-label col-xs-4" >&#42; Lugar: </label>
						<div class="col-xs-6">
							<input type="text" class="form-control" placeholder="Ingrese el lugar del traslado" required>
						</div>
					</div>
				</div>
			</div>					
			<br>
			<div class="container-fluid">
				<div class="form-group">
					<div class="col-xs-12">
	 					<input type="submit" class="btn btn-success custom-width" value="Guardar">
						<input type="reset" class="btn btn-default" value="Limpiar">
					</div>
				</div>
			</div>
			<br>
			</form:form>
		</div>
	</body>
</html>
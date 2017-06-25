<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Formulario de consultas</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
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
	<div class="sidebar">
		<%@include file="menu.jsp" %>
	</div>
	<div class="container">
		<div class="jumbotron" align="center">
			<h1>Sala de Primeros Auxilios</h1> 
			<br>
			<h1>Terminal de &Oacute;mnibus de La Plata</h1> 
		</div>
		<div align="center"><img class="img-responsive" src="home_municipalidad.jpg" alt="La Plata"></div>
	</div>
	<div class="container">
		<div class="page-header">
			<h1>Datos del paciente</h1>      
		</div>
	</div>
	<div class="container">
		<div class="container">
			<h4>Los campos con &#42; son obligatorios</h4>      
		</div>
	</div>
	<br>
	<div class="container">
		<form class="form-horizontal" data-toggle="validator" role="form">
			<div class="form-group">
				<label class="control-label col-xs-3">&#42; Apellido:</label>
				<div class="col-xs-9">
					<input type="text" class="form-control" placeholder="Ingrese su apellido" required>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-xs-3">&#42; Nombre:</label>
				<div class="col-xs-9">
					<input type="text" class="form-control" placeholder="Ingrese su nombre" required>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-xs-3">&#42; D.N.I.:</label>
				<div class="col-xs-9">
					<input type="text" class="form-control" placeholder="Ingrese su D.N.I." required>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-xs-3">&#42; Sexo:</label>
				<div class="col-xs-2">
					<label class="radio-inline">
						<input type="radio" name="genderRadios" value="male" required> Maculino
					</label>
				</div>
				<div class="col-xs-2">
					<label class="radio-inline">
						<input type="radio" name="genderRadios" value="female" required> Femenino
					</label>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-xs-3">&#42; Domicilio:</label>
				<div class="col-xs-9">
					<input type="text" class="form-control" placeholder="Ingrese su domicilio" required>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-xs-3">&#42; Edad:</label>
				<div class="col-xs-9">
					<input type="text" class="form-control" placeholder="Ingrese su edad" required>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-xs-3" >&#42; Tel&eacute;fono de contacto:</label>
				<div class="col-xs-9">
					<input type="tel" class="form-control" placeholder="Ingrese su teléfono" required>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-xs-3" >&#42; T&#47;A:</label>
				<div class="col-xs-9">
					<input type="text" class="form-control" placeholder="Ingrese su T&#47;A" required>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-xs-3" >&#42; T&deg;:</label>
				<div class="col-xs-9">
					<input type="text" class="form-control" placeholder="Ingrese su T&deg;" required>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-xs-3" >&#42; FC:</label>
				<div class="col-xs-9">
					<input type="text" class="form-control" placeholder="Ingrese su FC" required>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-xs-3" >&#42; Spo2%:</label>
				<div class="col-xs-9">
					<input type="text" class="form-control" placeholder="Ingrese su Spo2%" required>
				</div>
			</div>
			<div class="container">
				<div class="page-header">
					<h1>Motivo de la consulta</h1>      
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-xs-3" >&#42; Motivo:</label>
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
				<label class="control-label col-xs-3" >&#42;</label>
				<div class="col-xs-9">
					<input type="text" class="form-control" placeholder="Tu respuesta">
				</div>
			</div>
			<div class="container">
				<div class="page-header">
					<h1>Antecedentes de enfermedad actual</h1>      
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-xs-3" >&#42;</label>
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
			<div class="container">
				<div class="page-header">
					<h1>Fin de la atenci&oacute;n</h1>      
				</div>
			</div>
			
			
			<div class="form-group">
				<label class="control-label col-xs-3">&#42; &iquest;Se llam&oacute; a SAME?</label>
				<div class="col-xs-2">
					<label class="radio-inline">
						<input type="radio" name="sameRadios" id="sameSi" required> S&iacute;
					</label>
				</div>
				<div class="col-xs-2">
					<label class="radio-inline">
						<input type="radio" name="sameRadios" id="sameNo" required> No
					</label>
				</div>
			</div>
						
			<fieldset id="same-fieldset">
				<div class="container">
					<div class="page-header">
						<h1>SAME</h1>      
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-xs-3" >&#42; Profesional que atendi&oacute; al paciente: </label>
					<div class="col-xs-9">
						<input type="text" class="form-control" placeholder="Ingrese el nombre del profesional" required>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-xs-3" >&#42; N&uacute;mero de m&oacute;vil: </label>
					<div class="col-xs-9">
						<input type="text" class="form-control" placeholder="Ingrese el n&uacute;mero de m&oacute;vil" required>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-xs-3">&#42; &iquest;Se traslad&oacute; al paciente?</label>
					<div class="col-xs-2">
						<label class="radio-inline">
							<input type="radio" name="trasladoRadios" id="trasladoSi" required> S&iacute;
						</label>
					</div>
					<div class="col-xs-2">
						<label class="radio-inline">
							<input type="radio" name="trasladoRadios" id="trasladoNo" required> No
						</label>
					</div>
				</div>
			</fieldset>
						
			<fieldset id="traslado-fieldset">
				<div class="container">
					<div class="page-header">
						<h1>&iquest;D&oacute;nde se traslad&oacute; al paciente?</h1>      
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-xs-3" >&#42; Lugar: </label>
					<div class="col-xs-9">
						<input type="text" class="form-control" placeholder="Ingrese el lugar del traslado" required>
					</div>
				</div>
			</fieldset>	
				
			<br>
			<div class="form-group">
				<div class="col-xs-offset-3 col-xs-9">
					<input type="submit" class="btn btn-primary" value="Enviar">
					<input type="reset" class="btn btn-default" value="Limpiar">
				</div>
			</div>
		</form>
	</div>
</body>
</html>
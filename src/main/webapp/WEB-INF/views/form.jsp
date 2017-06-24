<!DOCTYPE html>
<html lang="en">
<head>
	<title>Formulario</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<style>
	.jumbotron {
		
	}
	</style>
</head>
<body>
	<div class="container">
		<div class="jumbotron">
			<h1>Sala de Primeros Auxilios 
			<br>de la Terminal de Ómnibus
			<br>de La Plata
			</h1> 
		</div>
		<div align="center"><img class="img-responsive" src="home_municipalidad.jpg" alt="La Plata"></div>
	</div>
	<div class="container">
		<div class="page-header">
			<h1>Datos del paciente</h1>      
		</div>
	</div>
	<div class="container">
		<form class="form-horizontal">
			<div class="form-group">
				<label class="control-label col-xs-3">Apellido y nombre:</label>
				<div class="col-xs-9">
					<input type="text" class="form-control" placeholder="Tu respuesta">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-xs-3">D.N.I.:</label>
				<div class="col-xs-9">
					<input type="text" class="form-control" placeholder="Tu respuesta">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-xs-3">Sexo:</label>
				<div class="col-xs-2">
					<label class="radio-inline">
						<input type="radio" name="genderRadios" value="male"> Maculino
					</label>
				</div>
				<div class="col-xs-2">
					<label class="radio-inline">
						<input type="radio" name="genderRadios" value="female"> Femenino
					</label>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-xs-3">Domicilio:</label>
				<div class="col-xs-9">
					<input type="text" class="form-control" placeholder="Tu respuesta">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-xs-3">Edad:</label>
				<div class="col-xs-9">
					<input type="text" class="form-control" placeholder="Tu respuesta">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-xs-3" >Teléfono de contacto:</label>
				<div class="col-xs-9">
					<input type="tel" class="form-control" placeholder="Tu respuesta">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-xs-3" >T/A:</label>
				<div class="col-xs-9">
					<input type="text" class="form-control" placeholder="Tu respuesta">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-xs-3" >Tº:</label>
				<div class="col-xs-9">
					<input type="text" class="form-control" placeholder="Tu respuesta">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-xs-3" >FC:</label>
				<div class="col-xs-9">
					<input type="text" class="form-control" placeholder="Tu respuesta">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-xs-3" >Spo2%:</label>
				<div class="col-xs-9">
					<input type="text" class="form-control" placeholder="Tu respuesta">
				</div>
			</div>
			<div class="container">
				<div class="page-header">
					<h1>Motivo de la consulta</h1>      
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-xs-3" >Motivo:</label>
				<div class="col-xs-9">
					<select class="form-control">
						<option selected>Elegir:</option>
						<option value="1">Contención emocional</option>
						<option value="2">Cefalea, náuseas, mareos, vómitos</option>
						<option value="3">HTA-DBT</option>
						<option value="4">Ataque epiléptico</option>
						<option value="5">Herida abierta, traumatismo</option>
						<option value="6">Dolor abdominal, lumbar</option>
						<option value="7">Febrícula</option>
						<option value="8">Hipoglucemia</option>
						<option value="9">Adormecimiento MS</option>
						<option value="10">OTRO</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-xs-3" ></label>
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
				<label class="control-label col-xs-3" ></label>
				<div class="col-xs-9">
					<select class="form-control">
						<option selected>Elegir:</option>
						<option value="1">Ninguno</option>
						<option value="2">HTA</option>
						<option value="3">DBT</option>
						<option value="4">Alergia</option>
						<option value="5">Epilepsia</option>
						<option value="6">Asma</option>
						<option value="7">Cardíaco</option>
						<option value="8">Psiquiátrico</option>
						<option value="9">ACV</option>
						<option value="10">Neurológico</option>
						<option value="11">EPOC</option>
						<option value="12">CA</option>
					</select>
				</div>
			</div>
			<br>
			<div class="form-group">
				<div class="col-xs-offset-3 col-xs-9">
					<input type="submit" class="btn btn-primary" value="Enviar">
					<input type="reset" class="btn btn-default" value="Limpiar">
				</div>
			</div>
		</form>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                <form:form class="form-horizontal" method="POST" modelAttribute="consultation">
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
										<form:input type="text" id="patient.email" path="patient.email" class="form-control input-sm" placeholder="Ingrese su correo electr�nico"/>
								   <%-- <div class="has-error">
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
										<form:input type="tel" id="patient.phone" path="patient.phone" class="form-control input-sm" placeholder="Ingrese su tel�fono"/>
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
										<form:input type="text" class="form-control input-sm" id="t_a" path="t_a" placeholder="Ingrese su T/A"/>
					 					<div class="has-error">
					                    	<form:errors path="t_a" class="help-inline"/>
					                    </div>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-xs-3" >&#42; T&deg;:</label>
									<div class="col-xs-8">
										<form:input type="text" id="t" path="t" class="form-control input-sm" placeholder="Ingrese su T�"/>
					 					<div class="has-error">
					                    	<form:errors path="t" class="help-inline"/>
					                    </div>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-xs-3" >&#42; FC:</label>
									<div class="col-xs-8">
										<form:input type="text" id="fc" path="fc" class="form-control input-sm" placeholder="Ingrese su FC"/>
					 					<div class="has-error">
					                    	<form:errors path="fc" class="help-inline"/>
					                    </div>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-xs-3" >&#42; Spo2%:</label>
									<div class="col-xs-8">
										<form:input type="text" id="spo2" path="spo2" class="form-control input-sm" placeholder="Ingrese su Spo2%"/>
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
										<p class="help-block">Elija el motivo de la consulta</p>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-xs-3" >&#42; Antecedente:</label>
									<div class="col-xs-8">
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
											<input type="radio" name="sameRadios" id="sameSi" required> S&iacute;
										</label>
										<br/>
										<label class="radio-inline">
											<input type="radio" name="sameRadios" id="sameNo" required> No
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
										<input type="text" class="form-control" placeholder="Ingrese el nombre del profesional" required>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-xs-5" >&#42; N&uacute;mero de m&oacute;vil: </label>
									<div class="col-xs-7">
										<input type="text" class="form-control" placeholder="Ingrese el n&uacute;mero de m&oacute;vil" required>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-xs-5">&#42; &iquest;Se traslad&oacute; al paciente?</label>
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
								</fieldset>
								
								<fieldset id="fieldset-traslado">								
									<div class="container-fluid">
										<h4>&iquest;D&oacute;nde se traslad&oacute; al paciente?<h4>      
									</div>
									<div class="form-group">
										<label class="control-label col-xs-5" >&#42; Lugar: </label>
										<div class="col-xs-7">
											<input type="text" class="form-control" placeholder="Ingrese el lugar del traslado" required>
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
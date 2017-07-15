<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
 
<html>
 
<head>
	<title>Métricas</title>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="static/css/bootstrap.css" rel="stylesheet">
	<link href="static/css/app.css" rel="stylesheet">
    <link href="static/css/font-awesome.css" rel="stylesheet" type="text/css">
</head>
 
<body>
	<div id="wrapper">
		<!-- menu --><!-- These collapse to the responsive navigation menu on small screens -->
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
		    <div class="collapse navbar-collapse navbar-ex1-collapse">
		        <ul class="nav navbar-nav side-nav">
		            <li>
		                <a href="<c:url value="/" />"><i class="fa fa-fw fa-home"></i> Inicio</a>
		            </li>
		            <li>
		                <a href="<c:url value='/list-users' />"><i class="fa fa-fw fa-user"></i> Usuarios</a>
		            </li>
		            <li class="active">
		                <a href="<c:url value='/get-metrics' />"><i class="fa fa-fw fa-bar-chart-o"></i> M&eacute;tricas</a>
		            </li>
		            <li>
		                <a href="<c:url value='/list-consultations' />"><i class="fa fa-fw fa-bar-chart-o"></i> Consultas</a>
		            </li>
		            <li>
		                <a href="<c:url value='/list-patients' />"><i class="fa fa-fw fa-bar-chart-o"></i> Pacientes</a>
		            </li>
		            <%-- <li>
		                <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-edit"></i> Consultas <i class="fa fa-fw fa-caret-down"></i></a>
		                <ul id="demo" class="collapse">
		                    <li>
		                        <a href="<c:url value="/create-consultation" />"> <i class="fa fa-fw fa-pencil"></i> Crear consulta</a>
		                    </li>
		                </ul>
		            </li> --%>
		            <li>
		                <a href="<c:url value="/logout" />"><i class="fa fa-fw fa-power-off"></i> Cerrar sesi&oacute;n</a>
		            </li>
		        </ul>
		    </div>
		</nav>
		<!-- / menu -->
		
		<div id="page-wrapper">
		    <div class="container-fluid">
		        <div class="row">
                    <div class="col-lg-12">
                    	<ol class="breadcrumb">
                            <li>
                                <i class="fa fa-home"></i>  <a href="<c:url value="/" />">Inicio</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-user"></i> M&eacute;tricas
                            </li>
                        </ol>
                        <h1 class="page-header">
                            M&eacute;tricas
                        </h1>
                    </div>
                </div>
		        <sec:authorize access="hasRole('ADMIN')">
				<!-- usar este bloque para autorizar la operacion  -->
		        </sec:authorize>
		        
		        <div class="clearfix"></div>
		        
		        <div class="row">
		        	<h3>Pacientes <small>Cantidad: <label id="sexCount"/></small></h3>
		        	<h4>Hombres: <small><label id="menCount"/></small></h4>
		        	<h4>Mujeres: <small><label id="womenCount"/></small></h4>
		        	</br>
		        </div>
		        
		        <div class="row">
		        	
		        	<!-- Torta de Pacientes -->
		        	<div class="col-md-4 col-sm-4 col-xs-12">
	                	<div class="x_panelNew">
	                  		<div class="x_titleNew">
		                    	<h3>Pacientes <small>Rangos de edad</small></h3>
		                    	<!-- <ul class="nav navbar-right panel_toolbox"> 
			                      	<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
			                    	<li class="dropdown">
			                        	<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
			                        	<ul class="dropdown-menu" role="menu">
			                          		<li><a href="#">Opcion 1</a></li>
			                          		<li><a href="#">Opcion 2</a></li>
			                        	</ul>
			                      	</li>
			                      	<li><a class="close-link"><i class="fa fa-close"></i></a></li>
		                    	</ul> -->
		                    	<div class="clearfix"></div>
	                  		</div>
	                  		<div class="x_contentNew">
	                  			<canvas id="ageChart" width="400" height="300"></canvas>
	                  		</div>
	                	</div>
	              </div>
	              <!-- / Torta de Pacientes -->
	              
	              <!-- Torta de SAME -->
		        	<div class="col-md-4 col-sm-4 col-xs-12">
	                	<div class="x_panelNew">
	                  		<div class="x_titleNew">
		                    	<h3>SAME <small>Llamados</small></h3>
		                    	<div class="clearfix"></div>
	                  		</div>
	                  		<div class="x_contentNew">
	                  			<canvas id="sameChart" width="400" height="300"></canvas>
	                  		</div>
	                	</div>
	              </div>
	              <!-- / Torta de SAME -->
	              
	              <!-- Torta de Traslados -->
		        	<div class="col-md-4 col-sm-4 col-xs-12">
	                	<div class="x_panelNew">
	                  		<div class="x_titleNew">
		                    	<h3>Traslados <small>Llamados</small></h3>
		                    	<div class="clearfix"></div>
	                  		</div>
	                  		<div class="x_contentNew">
	                  			<canvas id="patientTransportationChart" width="400" height="300"></canvas>
	                  		</div>
	                	</div>
	              </div>
	              <!-- / Torta de Traslados -->
	              
	           </div>
	           
	           <div class="row">
				  <!-- Torta de Antecedentes -->
				  <div class="col-md-6 col-sm-6 col-xs-12">
				      	<div class="x_panelNew">
				        	<div class="x_titleNew">
					           	<h3>Antecedentes <small>M&eacute;dicos</small></h3>
					           	<div class="clearfix"></div>
				        	</div>
			        		<div class="x_contentNew">
			        			<canvas id="medicalHistoryChart" width="400" height="300"></canvas>
			     			</div>
				   		</div>
				  </div>
				  <!-- / Torta de Antecedentes -->	   
	           
	            <!-- Torta de Motivos -->
				<div class="col-md-6 col-sm-6 col-xs-12">
				      	<div class="x_panelNew">
				        	<div class="x_titleNew">
					           	<h3>Motivos<small></small></h3>
				           		<div class="clearfix"></div>
			        		</div>
			        		<div class="x_contentNew">
			        			<canvas id="reasonChart" width="400" height="300"></canvas>
			     			</div>
				   		</div>
				</div>
				<!-- / Torta de Motivos -->
					
	           </div>
		    </div>
		</div>
    </div>
	<script src="static/js/jquery.js"></script>
    <script src="static/js/bootstrap.js"></script>
    <script src="static/js/app.js"></script>
    <script src="static/js/charts/Chart.js"></script>
    <script>var myContextPath = "${pageContext.request.contextPath}"</script>
    <script src="static/js/charts_resources.js"></script>
</body>

</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
 
<html>
 
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
	<title>Métricas</title>
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
                        <li class="active">
                            <i class="fa fa-bar-chart-o"></i> M&eacute;tricas
                        </li>
                    </ol>
                </div>
                <div id="page-title" class="row col-lg-12 text-center" style="margin-top:-40px">
                	<h1 class="page-header">M&eacute;tricas</h1>
                </div>
		        <sec:authorize access="hasRole('ADMIN')">
				<!-- usar este bloque para autorizar la operacion  -->
		        </sec:authorize>
		        
		        <div class="clearfix"></div>
		        <h2 class="col-lg-12 text-center"><i class="fa fa-fw fa-wheelchair custom"></i> Pacientes: <label id="sexCount"/></h2>
		        <div class="row">
			        <div class="col-lg-4 col-lg-offset-2 text-right">	
			        	<h3><i class="fa fa-male custom"></i> Hombres: <label id="menCount"/></h3>
			        </div>
			        <div class="col-lg-offset2 col-lg-4 text-left">
			        	<h3><i class="fa fa-female custom"></i> Mujeres: <label id="womenCount"/></h3>
			        </div>
			    </div>
		        <div class="row">
		        	<!-- Torta de Pacientes -->
		        	<div class="col-xs-4">
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
					<div class="col-xs-4">
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
		        	<div class="col-xs-4">
	                	<div class="x_panelNew">
	                  		<div class="x_titleNew">
		                    	<h3>Traslados <small>Derivaciones</small></h3>
		                    	<div class="clearfix"></div>
	                  		</div>
	                  		<div class="x_contentNew">
	                  			<canvas id="patientTransportationChart" width="400" height="300"></canvas>
	                  		</div>
	                	</div>
	              </div>
	              <!-- / Torta de Traslados -->
	              
	           </div><!-- row -->
	           
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
					           	<h3>Motivos <small>Consulta</small></h3>
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
    <script src="static/bootstrap/js/bootstrap.min.js"></script>
    <script src="static/js/app.js"></script>
    <script src="static/js/charts/Chart.js"></script>
    <script>var myContextPath = "${pageContext.request.contextPath}"</script>
    <script src="static/js/charts_resources.js"></script>
</body>

</html>

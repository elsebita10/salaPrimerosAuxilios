<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
 
<html>
 
<head>
	<title>Métricas</title>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
	<script type="text/javascript" src="./static/jquery-1.12.0.min.js"></script>
	<script type="text/javascript" src="./static/js/bootstrap/bootstrap.min.js"></script>
 	<script type="text/javascript" src="./static/js/charts/Chart.bundle.min.js"></script>
	<script type="text/javascript">
		var consultations;
		var patients;
		var men = 0;
		var women = 0;
		var sexData;
		
		
		$(document).ready(function(){
			
			consultations = getAllConsultations();
			llamadoAController();

			function llamadoAController(){
			     $.getJSON('${pageContext.request.contextPath}/getallpatients', function (data) {
					patients=data;
				}).done(function (data) {
					getCountBothSexs();
					createSexData();
					document.getElementById("sexCount").innerHTML = men + women;
			    });
			}
			
			function createSexData(){
				sexData = {
						type : "pie",
						data : {
							datasets: [{
								data : [
									men,
									women,
								],
								backgroundColor : [
									"#F7464A",
									"#46BFBD",
								],
							}],
							labels : [
								"Hombres",
								"Mujeres",
							]
						},
						options : {
							responsive : true,
						}
				};
				
			
				var sexCanvas = document.getElementById('sexChart').getContext('2d');
				window.pie2 = new Chart(sexCanvas, sexData);
				window.pie2.update();
			}
			
	
			setInterval(function(){
				//pie with sex data
				sexData.data.datasets.splice(0);
				getAllConsultations();
				var newSexData = {
						backgroundColor : [
											"#F7464A",
											"#46BFBD",
						],
						data : [men, women]
				}
				sexData.data.datasets.push(newSexData);
				
				llamadoAController();

				window.pie2.update();
			
			}, 10000);
			
			
			function getRandom(){
				return Math.round(Math.random() * 100);
			}
			
			
			function getAllConsultations(){
				$.ajax({
					type: "GET",
					url: "${pageContext.request.contextPath}/getallconsultations",
					data: "json",
					success: function (result){
						consultations =	result;
					},
					error: function (result){
						alert('hubo un error en algun lado');
					}
				})
			}
			
			function getCountBothSexs(){
				men = 0;
				women = 0;
				for (i in patients) {
					if (patients[i].sex == "Masculino"){
						 men = men + 1;
					 }else if (patients[i].sex == "Femenino"){
						 women = women + 1;
					 }else{
						 alert ('Hubo un error con el sexo del paciente'+patient[i].lastname);
					 }
				 }
			}
		});
		
	</script>
</head>
 
<body>
	<div id="wrapper">
		<div id="sidebar-wrapper">
			<div class="sidebar">
				<%@ include file="/WEB-INF/views/commons/menu.jsp" %>
			</div>
		</div>
		<div id="main-wrapper" class="col-md-10 pull-right">
		    <div class="container-fluid">
		        <div class="panel panel-default">
		              <!-- Default panel contents -->
		            <div class="panel-heading"><span class="lead">Metricas</span></div>
		        </div>
		        <sec:authorize access="hasRole('ADMIN')">
				<!-- usar este bloque para autorizar la operacion  -->
		        </sec:authorize>
		       <%--  <div class = "panel panel-default col-xs-6">
   					<div class = "panel-heading"><h4>Pacientes</h4></div>
					<div class="container-fluid">
						Cantidad de pacientes recibidos:      
					</div>
					<br>
					<div id="sex-canvas-container" style="width:20%;">
		        		<canvas id="sexChart" width="300" height="250"></canvas>
		        	</div>
		        </div> --%>
		        <td>
			        <div id="canvas-container" style="width:40%;">
			        	<div style="display:inline-block;">
							<label><h5>Cantidad de pacientes recibidos: </h5></label>
							<label id="sexCount"/>
						</div>		        
			        	<canvas id="sexChart" width="400" height="300"></canvas>
			        	<canvas id="chart" width="400" height="300"></canvas>
			        </div>
		        </td>
		        <td>
		        
		        </td>
		    </div>
		</div>
    </div>
</body>
</html>

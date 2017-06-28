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
	<script type="text/javascript" src="./static/bootstrap/js/bootstrap.min.js"></script>
 	<script type="text/javascript" src="./static/js/charts/Chart.bundle.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		var datos = {
				type : "pie",
				data : {
					datasets: [{
						data : [
							5,
							10,
							40,
							12,
							23,	
						],
						backgroundColor : [
							"#F7464A",
							"#46BFBD",
							"#FDB45C",
							"#949FB1",
							"#4D5360",
						],
					}],
					labels : [
						"Datos 1",
						"Datos 2",
						"Datos 3",
						"Datos 4",
						"Datos 5",
					]
				},
				options : {
					responsive : true,
				}
		};
		
		var canvas = document.getElementById('chart').getContext('2d');
		window.pie = new Chart(canvas, datos);
		
		setInterval(function(){
			datos.data.datasets.splice(0);
			var newData = {
					backgroundColor : [
						"#F7464A",
						"#46BFBD",
						"#FDB45C",
						"#949FB1",
						"#4D5360",
					],
					data : [getRandom(), getRandom(), getRandom(), getRandom(), getRandom()]
			};
			
			datos.data.datasets.push(newData);
			
			window.pie.update();
		
		}, 5000);
		
		
		function getRandom(){
			return Math.round(Math.random() * 100);
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
		        <div id="canvas-container" style="width:50%;">
		        	<canvas id="chart" width="500" height="350"></canvas>
		        </div>
		    </div>
		</div>
    </div>
</body>
</html>

<!-- <script>
var ctx = document.getElementById("myChart");
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
        datasets: [{
            label: '# of Votes',
            data: [12, 19, 3, 5, 2, 3],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
    }
});
</script> -->
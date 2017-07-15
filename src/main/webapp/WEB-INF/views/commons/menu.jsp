<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
<!-- 		<div class="navbar-header"> -->
<!-- 			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"> -->
<!-- 				<span class="sr-only">Toggle navigation</span> -->
<!-- 				<span class="icon-bar"></span> -->
<!-- 				<span class="icon-bar"></span> -->
<!-- 				<span class="icon-bar"></span> -->
<!-- 			</button> -->
<!-- 			<h2><i class="fa fa-heartbeat"></i></h2> -->
<!-- 			<br> -->
<%-- 			<a class="navbar-brand" href="<c:url value="/" />">Sala de Primeros Auxilios</a> --%>
<!-- 		</div> -->
		<div class="navbar-header">
			<%@ include file="header.jsp" %>
		</div>
	    <div class="collapse navbar-collapse navbar-ex1-collapse">
	        <ul class="nav navbar-nav side-nav">
	            <li>
	                <a href="<c:url value="/" />"><i class="fa fa-fw fa-home"></i> Inicio</a>
	            </li>
	            <li>
	                <a href="<c:url value='/list-users' />"><i class="fa fa-fw fa-users"></i> Usuarios</a>
	            </li>
	            <li>
	                <a href="<c:url value='/get-metrics' />"><i class="fa fa-fw fa-bar-chart-o"></i> M&eacute;tricas</a>
	            </li>
	            <li>
	                <a href="<c:url value='/list-consultations' />"><i class="fa fa-fw fa-stethoscope custom"></i> Consultas</a>
	            </li>
	            <li>
	                <a href="<c:url value='/list-patients' />"><i class="fa fa-fw fa-wheelchair custom"></i> Pacientes</a>
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
</body>
</html>
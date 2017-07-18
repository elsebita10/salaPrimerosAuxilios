<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="navbar-header">
			<%@ include file="header.jsp" %>
		</div>
	    <div class="collapse navbar-collapse navbar-ex1-collapse">
	        <ul class="nav navbar-nav side-nav">
	            <li>
	                <a href="<c:url value="/" />"><i class="fa fa-fw fa-home"></i> Inicio</a>
	            </li>
				<sec:authorize access="hasRole('ADMIN')">
		            <li>
		            	<a href="<c:url value='/list-users' />"><i class="fa fa-fw fa-users"></i> Usuarios</a>
		            </li>
				</sec:authorize>
	            <li>
	                <a href="<c:url value='/get-metrics' />"><i class="fa fa-fw fa-bar-chart-o"></i> M&eacute;tricas</a>
	            </li>
	            <li>
	                <a href="<c:url value='/list-consultations' />"><i class="fa fa-fw fa-stethoscope custom"></i> Consultas</a>
	            </li>
	            <li>
	                <a href="<c:url value='/list-patients' />"><i class="fa fa-fw fa-wheelchair custom"></i> Pacientes</a>
	            </li>
	        </ul>
	        <ul class="nav navbar-right top-nav">
				<li class="dropdown">
		        	<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> ${loggedinuser} <b class="caret"></b></a>
					<ul class="dropdown-menu">
		            	<li>
		                	<a href="<c:url value='/edit-user-${loggedinuser}' />"><i class="fa fa-fw fa-user"></i> Perfil</a>
		                </li>
		                <li>
		                	<a href="<c:url value="/logout" />"><i class="fa fa-fw fa-power-off"></i> Cerrar sesi&oacute;n</a>
		                </li>
		           	</ul>
		        </li>
    		</ul>
	    </div>
	</nav>
</body>
</html>
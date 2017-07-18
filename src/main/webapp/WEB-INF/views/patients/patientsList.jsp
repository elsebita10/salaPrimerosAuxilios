<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Lista de Pacientes</title>
    <link href="static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="static/bootstrap/css/dataTables.bootstrap.css" rel="stylesheet">
    <link href="static/css/app.css" rel="stylesheet">
    <link href="static/css/font-awesome.css" rel="stylesheet" type="text/css">
</head>
<body>
	<c:set var="patientSex" value="${patient.sex}"/>
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
                            <i class="fa fa-wheelchair custom"></i> Pacientes
                        </li>
                    </ol>
                    <div id="page-title" class="row col-lg-12 text-center" style="margin-top:-40px">
                        <h1 class="page-header">Pacientes</h1>
                    </div>
                </div>
                <div class="row">
                 	<div class="col col-xs-6">
                    	<h3 id="page-subtitle">Listado de pacientes</h3>
                    </div>
                </div>
                <div class="row">
                	<div class="col-md-12">
						<div class="panel panel-default panel-table">
						  	<div class="panel-heading">
						  	</div>
						  	<div class="panel-body">
	                            <table id="patientsTable" class="table table-striped table-bordered table-list">
	                                <thead>
	                                    <tr>
	                                    	<!-- <th style="width:3%">ID</th> -->
	                                    	<th style="width:20%;font-size:90%">Nombre Paciente</th>
			                        		<th style="width:3%;font-size:90%">Edad</th>
			                        		<th style="width:3%;font-size:90%">Sexo</th>
			                        		<th style="width:8%;font-size:90%">DNI</th>
			                        		<th style="width:15%;font-size:90%">Email</th>
			                        		<th style="width:15%;font-size:90%">Direccion</th>
			                        		<th style="width:8%;font-size:90%">Telefono</th>
			                        		<sec:authorize access="hasRole('ADMIN')">
			                        			<th style="width:15%;font-size:90%">Acciones</th>
			                        		</sec:authorize>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                    <c:forEach items="${patients}" var="patient">
				                    		<tr>
				                    			<%-- <td>${patient.id}</td> --%>
				                        		<td style="font-size:90%">${patient.firstName} ${patient.lastName}</td>
				                        		<td style="font-size:90%; text-align:center">${patient.age}</td>
				                        		<c:choose>
                           							<c:when test="${patient.sex=='Femenino'}">
                           								<td style="font-size:90%; text-align:center">F</td>
                           							</c:when>
                           							<c:otherwise>
                           								<td style="font-size:90%; text-align:center">M</td>
                           							</c:otherwise>
                           						</c:choose>
				                        		<td style="font-size:90%">${patient.dni}</td>
				                        		<td style="font-size:90%">${patient.email}</td>
				                        		<td style="font-size:90%">${patient.address}</td>
				                        		<td style="font-size:90%">${patient.phone}</td>		                        		
				                        		<sec:authorize access="hasRole('ADMIN')">
					                            	<td align="center">
													  <a class="btn btn-success custombutton"  href="<c:url value='/info-patient-${patient.id}' />"><em class="fa fa-info"></em></a>
													  <a class="btn btn-warning custombutton" href="<c:url value='/edit-patient-${patient.id}' />"><em class="fa fa-pencil"></em></a>
													  <a class="btn btn-danger custombutton" href="<c:url value='/delete-patient-${patient.id}' />"><em class="fa fa-trash"></em></a>
													</td>
				                        		</sec:authorize>
				                    		</tr>
			                			</c:forEach>
	                                </tbody>
	                            </table>
                        	</div>
                      	</div>
                   </div>
            	</div> <!-- row -->
		    </div> <!-- container-fluid -->
		</div> <!-- page-wrapper -->
	</div> <!-- wrapper  -->
	<script src="static/js/jquery.js"></script>
    <script src="static/bootstrap/js/bootstrap.min.js"></script>
    <script src="static/bootstrap/js/jquery.dataTables_SP.js"></script>
    <script src="static/bootstrap/js/dataTables.bootstrap.js"></script>
    <script src="static/js/app.js"></script>
<!--     <script>var myContextPath = "${pageContext.request.contextPath}"</script>
    <script>var userList = ${users}</script> -->
    <script src="static/js/usersFunctions.js"></script>
    <script>
    	$('#patientsTable').dataTable({
    		"aoColumnDefs": [
    		                 { 'bSortable': false, 'aTargets': [ 2, 7 ] }
    		              ]
	   	});
    </script>
</body>
</html>
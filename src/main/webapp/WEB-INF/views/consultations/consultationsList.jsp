<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<html>
<head>
    <meta charset="utf-8">
    <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Lista de Consultas</title>
    <link href="static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="static/bootstrap/css/dataTables.bootstrap.css" rel="stylesheet">
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
                            <i class="fa fa-stethoscope"></i> Consultas
                        </li>
                    </ol>
	           	</div>
                <div id="page-title" class="row col-lg-12 text-center" style="margin-top:-40px">
                    <h1 class="page-header">Consultas</h1>
                </div>
                <div class="row">
					<div class="col col-xs-6">
						<h3 id="page-subtitle">Listado de consultas</h3>
					</div>
					<div class="col col-xs-6 text-right"  style="height: 56px; padding-top: 12px;">
				        <a href="<c:url value='/create-consultation' />" class="btn btn-primary text-right">Crear consulta</a>
					</div>
				</div>
				<div class="row">	
					<div class="col-md-12">
						<div class="panel panel-default panel-table">
						  	<div class="panel-heading">
						  	</div>
						  	<div class="panel-body">
                            	<table id="consultationsTable" class="table table-striped table-bordered table-list">
	                                <thead>
	                                    <tr>
	                                    	<th class="text-center" style="width:5%;font-size:90%">ID</th>
	                                    	<th class="text-center" style="width:10%;font-size:90%">Fecha</th>
			                        		<th class="text-center" style="width:15%;font-size:90%">Paciente</th>
			                        		<th class="text-center" style="width:5%;font-size:90%">DNI</th>
			                        		<th class="text-center" style="width:20%;font-size:90%">Motivo</th>
			                        		<th class="text-center" style="width:10%;font-size:90%">Antecedente</th>
			                        		<th class="text-center" style="width:5%;font-size:90%">
			                        			<i class="fa fa-ambulance fa-2x" aria-hidden="true" title="SAME"></i>
			                        		</th>
			                        		<th class="text-center" style="width:5%;font-size:90%">
			                        			<i title="Traslados" class="fa fa-hospital-o fa-2x" aria-hidden="true"></i>
			                        		</th>
			                        		<th class="text-center" style="width:15%;font-size:90%">Acciones</th>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                    <c:forEach items="${consultations}" var="consultation">
			                    		<tr>
			                    			<td style="font-size:80%">${consultation.id}</td>
			                        		<td style="font-size:80%">${consultation.createdDate}</td>
			                        		<td style="font-size:80%">${consultation.patient.firstName} ${consultation.patient.lastName}</td>
			                        		<td style="font-size:80%">${consultation.patient.dni}</td>
			                        		<td style="font-size:80%">${consultation.reason}</td>
			                        		<td style="font-size:80%">${consultation.medicalHistory}</td>
			                        		<td class="text-center" style="font-size:80%">
			                        			<c:choose>
                           							<c:when test="${consultation.same}">
                           								<i class="fa fa-check fa-2x" aria-hidden="true" title="Si"></i>
                           							</c:when>
                           							<c:otherwise>
                           								<i class="fa fa-times fa-2x" aria-hidden="true" title="No"></i>
                           							</c:otherwise>
                           						</c:choose>
                           					</td>
			                        		<td class="text-center" style="font-size:80%">
												<c:choose>
                           							<c:when test="${consultation.patientTransport}">
                           								<i class="fa fa-check fa-2x" aria-hidden="true" title="Si"></i>
                           							</c:when>
                           							<c:otherwise>
                           								<i class="fa fa-times fa-2x" aria-hidden="true" title="No"></i>
                           							</c:otherwise>
                           						</c:choose>
											</td>
											<td align="center">
											  <a class="btn btn-success custombutton" href="<c:url value='/info-consultation-${consultation.id}' />"><em class="fa fa-info"></em></a>
											  <a class="btn btn-warning custombutton" href="<c:url value='/edit-consultation-${consultation.id}' />"><em class="fa fa-pencil"></em></a>
											  <%-- <a class="btn btn-danger custombutton" onClick="deleteConsultationConfirm(${consultation.id});"><em class="fa fa-trash"></em></a> --%>
											  <a class="btn btn-danger custombutton" href="<c:url value='/delete-consultation-${consultation.id}' />"><em class="fa fa-trash"></em></a>
											</td>
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
    <!-- <script src="static/bootstrap/js/bootbox.min.js"></script> -->
    <script>var myContextPath = "${pageContext.request.contextPath}"</script>
    <script src="static/js/app.js"></script>
    <script src="static/js/usersFunctions.js"></script>
    <script>
    $('#consultationsTable').dataTable({
    	"aoColumnDefs": [
		                 { 'bSortable': false, 'aTargets': [ 3, 6, 7, 8 ] }
		              ]
    });
    
/*     function deleteConsultationConfirm(consultationID){
    	bootbox.confirm({
   	        title: "Eliminar consulta",
	        message: "¿Está seguro que desea eliminar la consulta con ID "+consultationID+"?",
	        buttons: {
	            confirm: {
	                label: 'Sí',
	                className: 'btn-success'
	            },
	            cancel: {
	                label: 'No',
	                className: 'btn-danger'
	            }
	        },
	        callback: function (result) {
	        	$.getJSON(myContextPath+'/delete-consultation-'+consultationID, function (data) {
	        		return myContextPath+'consultations/consultationFormSuccess';
	    		});

	        }
    	});
    }; */
    </script>
</body>
</html>
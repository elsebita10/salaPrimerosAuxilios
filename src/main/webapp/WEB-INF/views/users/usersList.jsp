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
    <title>Lista de Usuarios</title>
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
                            <i class="fa fa-users"></i> Usuarios
                        </li>
                    </ol>
                </div>
                <div id="page-title" class="row col-lg-12 text-center" style="margin-top:-40px">
           	 		<h1 class="page-header">Usuarios</h1>
				</div>              
                <div class="row">
					<div class="col col-xs-6">
						<h3 id="page-subtitle">Listado de usuarios</h3>
					</div>
					<div class="col col-xs-6 text-right"  style="height: 56px; padding-top: 12px;">
						<sec:authorize access="hasRole('ADMIN')">
				        	<a href="<c:url value='/create-user' />" class="btn btn-primary text-right">Crear usuario</a>
					    </sec:authorize>
					</div>
				</div>
				<div class="row">	
					<div class="col-md-12">
						<div class="panel panel-default panel-table">
						  	<div class="panel-heading">
						  	</div>
						  	<div class="panel-body">
								<table id="usersTable" class="table table-striped table-bordered table-list">
								  <thead>
									<tr>
				                        <th class="text-center" style="width:20%">Nombre de usuario</th>
				                        <th class="text-center" style="width:5%">Roles</th>
				                        <th class="text-center" style="width:25%">Direcci&oacute;n</th>
				                        <th class="text-center" style="width:25%">E-mail</th>
										<th class="text-center" style="width:15%">Acciones</th>
									</tr> 
								  </thead>
								  <tbody>
								  	<c:forEach items="${users}" var="user">
									  <tr>
				                        <td>${user.username}</td>
				                        <td>
				                        	<c:forEach items="${user.userProfiles}" var="profile">
				                        		${profile.type}
				                        	</c:forEach>
				                        </td>
				                        <td>${user.address}</td>
				                        <td>${user.email}</td>
										<td align="center">
										  <a class="btn btn-success custombutton"  href="<c:url value='/info-user-${user.username}' />"><em class="fa fa-info"></em></a>
										  <a class="btn btn-warning custombutton" href="<c:url value='/edit-user-${user.username}' />"><em class="fa fa-pencil"></em></a>
										  <a class="btn btn-danger custombutton" href="<c:url value='/delete-user-${user.username}' />"><em class="fa fa-trash"></em></a>
										</td>
									  </tr>
		                			</c:forEach>
								 </tbody>
								</table>
						    </div>
                   		</div> <!-- panel-table -->
            		</div> <!-- col-md-12 -->
            	</div> <!-- row -->
 		    </div> <!-- container-fluid -->
		</div> <!-- page-wrapper -->
	</div> <!-- wrapper  -->
	<script src="static/js/jquery.js"></script>
    <script src="static/bootstrap/js/bootstrap.min.js"></script>
    <script src="static/bootstrap/js/jquery.dataTables_SP.js"></script>
    <script src="static/bootstrap/js/dataTables.bootstrap.js"></script>
    <script src="static/js/app.js"></script>
<!--<script>var myContextPath = "${pageContext.request.contextPath}"</script>
    <script>var userList = ${users}</script> -->
    <script src="static/js/usersFunctions.js"></script>
    <script>
    $('#usersTable').dataTable({
    	"aoColumnDefs": [
		                 { 'bSortable': false, 'aTargets': [ 1, 4 ] }
		              ]
    });
    </script>
</body>
</html>
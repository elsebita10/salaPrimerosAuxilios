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
    <title>Inicio</title>
    <link href="static/css/bootstrap.css" rel="stylesheet">
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
		    	<div class="row">
                    <div class="col-lg-12">
                    	<ol class="breadcrumb">
                            <li>
                                <i class="fa fa-home"></i>  <a href="<c:url value="/" />">Inicio</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-users"></i> Usuarios
                            </li>
                        </ol>
                        <h1 class="page-header">
                            Usuarios
                        </h1>
                    </div>
                </div>
                <div class="row">
					<div class="col-md-12">
						<div class="panel panel-default panel-table">
					  	<div class="panel-heading">
						  	<div class="row">
							  <div class="col col-xs-6">
							  	  <div class="form-group input-group">
                        			  <input type="text" id="userSearchText" class="form-control" placeholder="&#xF002;" style="font-family:Arial, FontAwesome">
                        		  </div>
							  </div>
							  <div class="col col-xs-6 text-right">
				            	<sec:authorize access="hasRole('ADMIN')">
					                <a href="<c:url value='/create-user' />" class="btn btn-primary">Crear usuario nuevo</a>
						        </sec:authorize>
						      </div>
							</div>
					  	</div>
					  	<div class="panel-body">
							<table id="usersTable" class="table table-striped table-bordered table-list">
							  <thead>
								<tr>
									<th>ID de usuario</th>
			                        <th>Username</th>
			                        <th>Direcci&oacute;n</th>
			                        <th>E-mail</th>
									<th><em class="fa fa-cog"></em></th>
								</tr> 
							  </thead>
							  <tbody>
							  	<c:forEach items="${users}" var="user">
								  <tr>
									<td>${user.id}</td>
			                        <td>${user.username}</td>
			                        <td>${user.address}</td>
			                        <td>${user.email}</td>
									<td align="center">
									  <a class="btn btn-default"><em class="fa fa-pencil"></em></a>
									  <a class="btn btn-danger"><em class="fa fa-trash"></em></a>
									</td>
								  </tr>
	                			</c:forEach>
							 </tbody>
							</table>
					    </div>
					    <div class="panel-footer">
							<div class="row">
							  <div class="col col-xs-4">Page 1 of 5
							  </div>
							  <div class="col col-xs-8">
								<ul class="pagination hidden-xs pull-right">
								  <li><a href="#">1</a></li>
								  <li><a href="#">2</a></li>
								  <li><a href="#">3</a></li>
								  <li><a href="#">4</a></li>
								  <li><a href="#">5</a></li>
								</ul>
								<ul class="pagination visible-xs pull-right">
									<li><a href="#">&laquo;</a></li>
									<li><a href="#">&raquo;</a></li>
								</ul>
							  </div>
							</div>
					  	</div>
                   		</div>
            		</div>
            	</div> <!-- row -->
 		    </div> <!-- container-fluid -->
		</div> <!-- page-wrapper -->
	</div> <!-- wrapper  -->
	<script src="static/js/jquery.js"></script>
    <script src="static/js/bootstrap.js"></script>
    <script src="static/js/app.js"></script>
<!--<script>var myContextPath = "${pageContext.request.contextPath}"</script>
    <script>var userList = ${users}</script> -->
    <script src="static/js/usersFunctions.js"></script>
</body>
</html>
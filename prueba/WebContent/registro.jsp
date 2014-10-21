<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.util.*" %>
<%@ page import=" es.uc3m.tiw.logica.*" %>
<%@ page import=" es.uc3m.tiw.contenedores.*" %>

<%	
	ArrayList<UserType> arrayTiposUsuarios = (ArrayList)request.getAttribute("LISTA_TIPOS_USUARIO");
%>

<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Registro | TIW-TALAVERÁMICA</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/price-range.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->

<body onload="inicio()">
	<jsp:include page="headerUser.jsp"></jsp:include>
	
	<div class="container">
		<p>Elija el tipo de registro que desea realizar:</p>
			<form id="signup" action="tiwReg" method="post">
					<%	for(int i=0;i<arrayTiposUsuarios.size();i++)
								{
									UserType objetoTipoUsuario = (UserType)arrayTiposUsuarios.get(i);
									%>				
					<p><input type="radio" name="userType" value="<%=objetoTipoUsuario.getType() %>" ><%=objetoTipoUsuario.getDescription() %></p>
					<%			} %>
				<p>A continuación rellene los campos requeridos:</p>
				<p>Nombre: </p>
				<p><input type="text" name="name"></p>
				<p>Primer apellido: </p>
				<p><input type="text" name="lastName"></p>
				<p>Segundo apellido: </p>
				<p><input type="text" name="secondLastName"></p>
				<p>Tipo de documento: </p>
				<p>
					<input type="radio" name="documentType" value="1">DNI
					<input type="radio" name="documentType" value="2">CIF
					<input type="radio" name="documentType" value="3">Pasaporte
				</p>
				<p>Documento: </p>
				<p><input type="text" name="document"></p>
				<p>Contraseña: </p>
				<p><input type="password" name="password"></p>
				<p>Dirección: </p>
				<p><input type="text" name="address"></p>
				<p>Empresa: </p>
				<p><input type="text" name="enterprise"></p>
				<p>Dirección de empresa: </p>
				<p><input type="text" name="enterpriseAddress"></p>

				<p><input type="submit" value="Crear cuenta"></p>

			</form>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
	

  
    <script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/price-range.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body>
</html>
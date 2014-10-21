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
    <title>Talaveramica</title>
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

<body>
	<header id="header"><!--header-->
		<div class="header_top"><!--header_top-->
			<div class="container">
				<div class="row">
					<div class="col-sm-6">
						<div class="contactinfo">
							<ul class="nav nav-pills">
								<li><a href="#"><i class="fa fa-phone"></i> +34 111 11 11</a></li>
								<li><a href="#"><i class="fa fa-envelope"></i> info@talaveramica.com</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="social-icons pull-right">
							<ul class="nav navbar-nav">
								<li><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
								<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
								<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header_top-->
		
		<div class="header-middle"><!--header-middle-->
			<div class="container">
				<div class="row">
					<div class="col-sm-4">
						<div class="logo pull-left">
							<a href="tiw"><img src="images/home/logo.png" alt="" /></a>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="shop-menu pull-right">
							<ul class="nav navbar-nav">
								<li><a href="#"><i class="fa fa-user"></i> Mi Cuenta</a></li>
								<li><a href="#"><i class="fa fa-star"></i> Lista de deseos</a></li>
								<li><a href="checkout.html"><i class="fa fa-crosshairs"></i> Checkout</a></li>
								<li><a href="cart.html"><i class="fa fa-shopping-cart"></i> Carrito</a></li>
								<li><a href="login.html"><i class="fa fa-lock"></i> Login</a></li>
								<li><a href="tiwReg"><i class="fa fa-lock"></i> Registro</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header-middle-->
	
		<div class="header-bottom"><!--header-bottom-->
			<div class="container">
				<div class="row">
					<div class="col-sm-9">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
								<span class="sr-only">Navegacion</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
						</div>
						<div class="mainmenu pull-left">
							<ul class="nav navbar-nav collapse navbar-collapse">
								<li><a href="tiw" class="active">Inicio</a></li>
								<li class="dropdown"><a href="#">Tienda<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="shop.html">Productos</a></li>
										<li><a href="product-details.html">Detalles del producto</a></li> 
										<li><a href="checkout.html">Checkout</a></li> 
										<li><a href="cart.html">Carrito</a></li> 
										<li><a href="login.html"><i class="fa fa-lock"></i> Login</a></li>
										<li><a href="tiwReg"><i class="fa fa-lock"></i> Registro</a></li>
                                    </ul>
                                </li> 
								
								<li><a href="404.html">404</a></li>
								<li><a href="contact-us.html">Contacto</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="search_box pull-right">
							<input type="text" placeholder="Search"/>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header-bottom-->

	</header><!--/header-->
	
	<div class="container">
		<p>Elija el tipo de registro que desea realizar:</p>
			<form id="signup" action="tiwReg" method="post">
					<%	for(int i=0;i<arrayTiposUsuarios.size();i++)
								{
									UserType objetoTipoUsuario = (UserType)arrayTiposUsuarios.get(i);
									%>				
					<p><input type="radio" name="userType" value="<%=objetoTipoUsuario.getType() %>" ><%=objetoTipoUsuario.getDescription() %></p>
					<%			} %>
				<p>A continuacion rellene los campos requeridos:</p>
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
				<p>Direccion: </p>
				<p><input type="text" name="address"></p>
				<p>Empresa: </p>
				<p><input type="text" name="enterprise"></p>
				<p>Direccion de empresa: </p>
				<p><input type="text" name="enterpriseAddress"></p>

				<p><input type="submit" value="Crear cuenta"></p>

			</form>
	</div>

	<footer id="footer"><!--Footer-->
		<div class="footer-top">
			<div class="container">
				<div class="row">
					<div class="col-sm-2">
						<div class="companyinfo">
							<h2><span>TIW</span>-talaveramica</h2>
							<p>La mejor ceramica a solo un CLICK</p>
						</div>
					</div>
					<div class="col-sm-7">
						<div class="col-sm-3">
						<div class="single-widget">
							<h2>Servicios</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="">Ayuda ONLINE</a></li>
								<li><a href="">Contactenos</a></li>
								<li><a href="">FAQs</a></li>
							</ul>
						</div>
					</div>
						
						<div class="col-sm-3">
						<div class="single-widget">
							<h2>Politicas</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="">Terminos de uso</a></li>
								<li><a href="">Politica de privacidad</a></li>
								<li><a href="">Politica de reembolso</a></li>
							</ul>
						</div>
					</div>
						
						<div class="col-sm-3">
						<div class="single-widget">
							<h2>Tienda</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="">Informacion de la compañia</a></li>
								<li><a href="">Localizacion de la tienda</a></li>
								<li><a href="">Copyright</a></li>
							</ul>
						</div>
					</div>
					</div>
					<div class="col-sm-3">
						<div class="address">
							<img src="images/home/map.png" alt="" />
							<p>Av de Gregorio Peces-Barba Martinez, Colmenarejo (Madrid)</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="footer-bottom">
			<div class="container">
				<div class="row">
					<p class="pull-left">Copyright © 2014 TIW-TALAVERAMICA Inc.Todos los derechos reservados.</p>
					<p class="pull-right">Diseñado por <span><a target="_blank" href="http://www.uc3m.es">Grupo 50</a></span></p>
				</div>
			</div>
		</div>
		
	</footer><!--/Footer-->
	

  
    <script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/price-range.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body>
</html>
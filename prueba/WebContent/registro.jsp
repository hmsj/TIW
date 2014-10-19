<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Talaverámica</title>
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
							<a href="index.html"><img src="images/home/logo.png" alt="" /></a>
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
								<span class="sr-only">Navegación</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
						</div>
						<div class="mainmenu pull-left">
							<ul class="nav navbar-nav collapse navbar-collapse">
								<li><a href="index.html" class="active">Inicio</a></li>
								<li class="dropdown"><a href="#">Tienda<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="shop.html">Productos</a></li>
										<li><a href="product-details.html">Detalles del producto</a></li> 
										<li><a href="checkout.html">Checkout</a></li> 
										<li><a href="cart.html">Carrito</a></li> 
										<li><a href="login.html">Login</a></li> 
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
		<p>Elija el tipo de registro que desea realizar:</p><br>
			<form id="signup">
				<p><input type="radio" name="user" value="client">Cliente
				<input type="radio" name="user" value="enterprise">Proveedor</p><br>
				<p>A continuación rellene los campos requeridos:</p>
				Nombre: <input type="text" name="firstname"><br>
				Primer apellido: <input type="text" name="lastname1"><br>
				Segundo apellido: <input type="text" name="lastname2"><br>
				Tipo de documento: 
				<input type="radio" name="user" value="DNI">DNI
				<input type="radio" name="user" value="CIF">CIF
				<input type="radio" name="user" value="passport">Pasaporte<br>
				Documento: <input type="text" name="document_num"><br>
				Contraseña: <input type="password" name="password"><br>
				Dirección: <input type="text" name="address"><br>
				Empresa: <input type="text" name="enterprise"><br>
				Dirección de empresa: <input type="text" name="enterpriseAddress"><br>

				<input type="submit" value="Crear cuenta"><br>

			</form>
	</div>

	<footer id="footer"><!--Footer-->
		<div class="footer-top">
			<div class="container">
				<div class="row">
					<div class="col-sm-2">
						<div class="companyinfo">
							<h2><span>TIW</span>-talaverámica</h2>
							<p>La mejor cerámica a sólo un CLICK</p>
						</div>
					</div>
					<div class="col-sm-7">
						<div class="col-sm-3">
						<div class="single-widget">
							<h2>Servicios</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="">Ayuda ONLINE</a></li>
								<li><a href="">Contáctenos</a></li>
								<li><a href="">FAQ’s</a></li>
							</ul>
						</div>
					</div>
						
						<div class="col-sm-3">
						<div class="single-widget">
							<h2>Políticas</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="">Terminos de uso</a></li>
								<li><a href="">Política de privacidad</a></li>
								<li><a href="">Política de reembolso</a></li>
							</ul>
						</div>
					</div>
						
						<div class="col-sm-3">
						<div class="single-widget">
							<h2>Tienda</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="">Información de la compañía</a></li>
								<li><a href="">Localización de la tienda</a></li>
								<li><a href="">Copyright</a></li>
							</ul>
						</div>
					</div>
					</div>
					<div class="col-sm-3">
						<div class="address">
							<img src="images/home/map.png" alt="" />
							<p>Av de Gregorio Peces-Barba Martínez, Colmenarejo (Madrid)</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="footer-bottom">
			<div class="container">
				<div class="row">
					<p class="pull-left">Copyright © 2014 TIW-TALAVERÁMICA Inc.Todos los derechos reservados.</p>
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
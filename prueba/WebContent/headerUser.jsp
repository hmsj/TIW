<%@ page import="java.util.*" %>
<%@ page import=" es.uc3m.tiw.logica.*" %>
<%@ page import=" es.uc3m.tiw.contenedores.*" %>
<% User usuarioLogado;
	if (request.getSession().getAttribute("userLogado") != null)
	{
		usuarioLogado = (User)request.getSession().getAttribute("userLogado");
		System.out.println(usuarioLogado.getName());
		System.out.println(usuarioLogado.getDocument());
	}
	else
	{
		usuarioLogado = null;
	} %>
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

<body onload="inicio()">
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
							<a href="tiw"><img src="images/home/logoMena.png" alt="" /></a>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="shop-menu pull-right">
							<ul class="nav navbar-nav">
								<%if (usuarioLogado != null && !"".equals(usuarioLogado))
									{%>
								<li><a href="#"><i class="fa fa-user"></i> Mi Cuenta (<%=usuarioLogado.getName()%> <%=usuarioLogado.getLastName()%>)</a></li>
								<%} 
								  else
									{%>
								<li><a href="#"><i class="fa fa-user"></i> Mi Cuenta</a></li>									
									<% } %>
								<li><a href="checkout.jsp"><i class="fa fa-crosshairs"></i> Checkout</a></li>
								<li><a href="SCart"><i class="fa fa-shopping-cart"></i> Carrito</a></li>
								<li><a href="Slogin" ><i class="fa fa-lock"></i> Login</a></li>
								<!--<li><a href="registro.jsp"><i class="fa fa-lock"></i> Registro</a></li>-->
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
								<span class="sr-only">Navegación</span>
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
                                        <li><a href="tiw">Productos</a></li>
                                        <!-- <li><a href="catalogo.jsp">Productos</a></li> -->
										<!-- <li><a href="product-details.html">Detalles del producto</a></li> --> 
										<li><a href="checkout.jsp">Checkout</a></li> 
										<li><a href="cart.jsp">Carrito</a></li> 
										<li><a href="login.jsp"><i class="fa fa-lock"></i> Login</a></li>
										<!--<li><a href="registro.jsp"><i class="fa fa-lock"></i> Registro</a></li>  -->
										<li><a href="tiwReg"><i class="fa fa-lock"></i> Registro</a></li> 
                                    </ul>
                                </li> 
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
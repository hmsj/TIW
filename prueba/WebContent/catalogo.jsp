<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.util.*" %>
<%@ page import=" es.uc3m.tiw.logica.*" %>
<%@ page import=" es.uc3m.tiw.contenedores.*" %>

<%	
	ArrayList<Product> arrayProductos = (ArrayList)request.getAttribute("LISTA_PRODUCTOS");
	ArrayList<ProductType> arrayTiposProductos = (ArrayList)request.getAttribute("LISTA_TIPOS_PRODUCTO");
%>

<html lang="es">

<script>
function filtrarResultados(tipoProductoSeleccionado)
{
	var tiposProducto = <%=arrayTiposProductos.size()%>;
	
	for (var i = 0; i <= tiposProducto; i++)
	{
		if (tipoProductoSeleccionado != 0)
		{
			if (tipoProductoSeleccionado != i+1)
			{
				var x = document.getElementsByClassName("Tipo_"+(i+1));
				var i;
				for (j = 0; j < x.length; j++) {
					x[j].style.display="none";
				}
			}
			else
			{
				var x = document.getElementsByClassName("Tipo_"+(i+1));
				var i;
				for (j = 0; j < x.length; j++) {
					x[j].style.display="block";
				}			
			}
		}
		//si me llega el tipoProductoSeleccionado = 0 es que queremos mostrar TODO el catalogo nuevamente
		else			
		{			
			var x = document.getElementsByClassName("Tipo_"+(i+1));
			var i;
			for (j = 0; j < x.length; j++) {
				x[j].style.display="block";
			}	
		}
	}
}
</script>

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
								<span class="sr-only">Navegacion</span>
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
	
	<section id="slider"><!--slider-->
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div id="slider-carousel" class="carousel slide" data-ride="carousel">
						<ol class="carousel-indicators">
							<%	for(int i=0;i<arrayProductos.size();i++)
								{
									Product objetoProducto = (Product)arrayProductos.get(i);
									int primero = 0;
									if (objetoProducto.isOferta())
									{
										%> 
										<%if (primero == 1)
											{%>
							<li data-target="#slider-carousel" data-slide-to="<%=i%>" class="active"></li>
											<%
											}
										else
										{%>
							<li data-target="#slider-carousel" data-slide-to="<%=i%>"></li>			
										<%}	%>
							<%		}
								}%>
						</ol>
						
						<div class="carousel-inner">
							<%	int primero = 1;									
								for(int i=0;i<arrayProductos.size();i++)
								{
									Product objetoProducto = (Product)arrayProductos.get(i);
									if (objetoProducto.isOferta())
									{
										%> 
										<%if (primero == 1)
											{%>
							<div class="item active">
											<%
											primero++;
											}
											else
											{%>
							<div class="item">			
										<%	}	%>
								<div class="col-sm-6">
									<h1><span>T</span>-OFERTAS</h1>
									<h2><%=objetoProducto.getName()%></h2>
									<p><%=objetoProducto.getDescription()%></p>
									<button type="button" class="btn btn-default get">Compralo</button>
								</div>
								<div class="col-sm-6">
									<img src="images/home/gallery1.jpg" class="girl img-responsive" alt="" />
									
								</div>
							</div>
							<%		}
								}%>
						</div>
						
						<a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
							<i class="fa fa-angle-left"></i>
						</a>
						<a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
							<i class="fa fa-angle-right"></i>
						</a>
					</div>
					
				</div>
			</div>
		</div>
	</section><!--/slider-->
	
	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<div class="left-sidebar">
						<h2>Categori­as</h2>
						<div class="panel-group category-products" id="accordian"><!--category-productsr-->	
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#" onClick="filtrarResultados(0)">Todo el catálogo</a></h4>
								</div>
							</div>		
							<%	for(int i=0;i<arrayTiposProductos.size();i++)
								{
									ProductType objetoTipoProducto = (ProductType)arrayTiposProductos.get(i);
										%> 							
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#" onClick="filtrarResultados(<%=objetoTipoProducto.getId()%>)"><%=objetoTipoProducto.getDescription()%></a></h4>
								</div>
							</div>			
						<%		} %>							
						</div><!--/category-products-->			
					</div>
				</div>
				
				<div class="col-sm-9 padding-right">
					<div class="features_items"><!--features_items-->
						<h2 class="title text-center">Catálogo</h2>
						<% for(int i=0;i<arrayProductos.size();i++)
								{
									Product objetoProducto = (Product)arrayProductos.get(i);%>									
						<div class="col-sm-4 Tipo_<%=objetoProducto.getType()%>" >
							<div class="product-image-wrapper" >
								<div class="single-products" >
										<div class="productinfo text-center">
											<img src="images/home/product1.jpg" alt="" />
											<h2><%=objetoProducto.getPrice()%>€</h2>
											<p><%=objetoProducto.getName()%></p>
											<a href="SCart?idPro=<%=objetoProducto.getId()%>" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Añadir al carro</a>
										</div>
										<div class="product-overlay">
											<div class="overlay-content">
												<h2><%=objetoProducto.getPrice()%>€</h2>
												<p><%=objetoProducto.getDescription()%></p>
												<a href="SCart?idPro=<%=objetoProducto.getId()%>" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Añadir al carro</a>
											</div>
										</div>
								</div>
								<div class="choose">
									<ul class="nav nav-pills nav-justified">
										<li><a href="#"><i class="fa fa-plus-square"></i>A la lista de deseo</a></li>
										<li><a href="#"><i class="fa fa-plus-square"></i>Add to compare</a></li>
									</ul>
								</div>
							</div>
						</div>						
						<%		} %>						
					</div><!--features_items-->
				</div>
			</div>	
		</div>
	</section>
	
	<footer id="footer"><!--Footer-->
		<div class="footer-top">
			<div class="container">
				<div class="row">
					<div class="col-sm-2">
						<div class="companyinfo">
							<h2><span>TIW</span>-talaveri¡mica</h2>
							<p>La mejor ceri¡mica a solo un CLICK</p>
						</div>
					</div>
					<div class="col-sm-7">
						<div class="col-sm-3">
						<div class="single-widget">
							<h2>Servicios</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="">Ayuda ONLINE</a></li>
								<li><a href="">Conti¡ctenos</a></li>
								<li><a href="">FAQâs</a></li>
							</ul>
						</div>
					</div>
						
						<div class="col-sm-3">
						<div class="single-widget">
							<h2>Poli­ticas</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="">Terminos de uso</a></li>
								<li><a href="">Poli­tica de privacidad</a></li>
								<li><a href="">Poli­tica de reembolso</a></li>
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
							<p>Av de Gregorio Peces-Barba Marti­nez, Colmenarejo (Madrid)</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="footer-bottom">
			<div class="container">
				<div class="row">
					<p class="pull-left">Copyright Â© 2014 TIW-TALAVERAMICA Inc.Todos los derechos reservados.</p>
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
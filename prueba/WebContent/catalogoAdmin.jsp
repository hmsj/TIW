<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.util.*" %>
<%@ page import=" es.uc3m.tiw.logica.*" %>
<%@ page import=" es.uc3m.tiw.contenedores.*" %>

<%	
	ArrayList<Product> arrayProductos;
	if (request.getAttribute("LISTA_PRODUCTOS") != null)
	{
		arrayProductos = (ArrayList)request.getAttribute("LISTA_PRODUCTOS");		
	}
	else
	{
		arrayProductos = new ArrayList<Product>();
	}
	
	ArrayList<ProductType> arrayTiposProductos;
	if (request.getAttribute("LISTA_TIPOS_PRODUCTO") != null)
	{
		arrayTiposProductos = (ArrayList)request.getAttribute("LISTA_TIPOS_PRODUCTO");
	}
	else
	{
		arrayTiposProductos = new ArrayList<ProductType>();
	}
	String mensaje ="";
	if (request.getAttribute("MENSAJE") != null)
	{
		mensaje = request.getAttribute("MENSAJE").toString();
		System.out.println(mensaje);		
	}
	
	User usuarioLogado;
	if (request.getSession().getAttribute("userLogado") != null)
	{
		usuarioLogado = (User)request.getSession().getAttribute("userLogado");
		System.out.println(usuarioLogado.getName());
		System.out.println(usuarioLogado.getDocument());
	}
	else
	{
		usuarioLogado = null;
	}

	
%>

<html lang="es">

<script>

function inicio()
{
	<%if (mensaje != null && !"".equals(mensaje))
	{%>
		alert("<%=mensaje%>");
  <%}%>
	
}
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

function EliminarProducto(id)
{
	var seccionProducto = document.getElementById(id);
	var padreSeccionProducto = seccionProducto.parentNode;
	padreSeccionProducto.removeChild(seccionProducto);	
	
	var strId = ""+id;
	
	if (strId.indexOf("New_") > -1)
	{
		alert("Eliminar nuevo")
		//si el producto es nuevo, debemos eliminar de la cola de productosGenerados y no incluir en la cola de productosEliminados
		var listadoProductosGenerados = document.getElementById('productosGenerados');
		var listadoProductosGenerados2 = "";
		if (listadoProductosGenerados.value != "")
		{			
			var listadoProvisional = listadoProductosGenerados.value.split(";");	
			var existe = 0;
			for (var i = 0; i < listadoProvisional.length; i++)
			{
				if (listadoProvisional[i] != id)
				{
					if (listadoProductosGenerados2 == "")
					{
						listadoProductosGenerados2 += listadoProvisional[i];
					}
					else
					{
						listadoProductosGenerados2 += ";"+listadoProvisional[i];
					}
				}				
			}	
			document.getElementById('productosGenerados').value = listadoProductosGenerados2;
		}
		alert("Tras quitar el nuevo, el listado de productosGenerados queda: "+document.getElementById('productosGenerados').value);
		alert("El listado de productosEliminados queda: "+document.getElementById('productosEliminados').value);		
	}
	else
	{
		alert("Eliminar existente")
		//si el producto ya existe, debemos añadir a la cola de productos a eliminar
		var listadoProductosEliminados = document.getElementById('productosEliminados');
		if (listadoProductosEliminados.value == "")
		{
			listadoProductosEliminados.value = id;
		}
		else
		{
			listadoProductosEliminados.value += ";"+id;
		}
		alert("Tras quitar el existente, el listado de productosEliminados queda: "+document.getElementById('productosEliminados').value);		
	}
}

function ModificarProducto(id)
{		
	var listadoProductosModificados = document.getElementById('productosModificados');
	if (listadoProductosModificados.value == "")
	{
		listadoProductosModificados.value = id;
	}
	else
	{
		var listadoProvisional = listadoProductosModificados.value.split(";");	
		var existe = 0;
		for (var i = 0; i < listadoProvisional.length; i++)
		{
			if (listadoProvisional[i] == id)
			{
				existe = 1;	
			}				
		}	
		if (existe == 0)
		{
			listadoProductosModificados.value += ";"+id;
		}
	}
	alert("El listado de productosModificados queda: "+document.getElementById('productosModificados').value);
}

var productosCreados = 0;

function CrearProducto()
{
	var seccionListadoProductos = document.getElementById('listadoProductos');
	
	productosCreados++;
	
	var codigoHtmlProducto = '';
	
	codigoHtmlProducto += '<div class="col-sm-4 Tipo_99" id="New_'+productosCreados+'"><div class="product-image-wrapper"><div class="single-products"><div class="productinfo text-center">';
	codigoHtmlProducto += '<p><input id="New_'+productosCreados+'_Img" type="file" value=""></p>';
	codigoHtmlProducto += '<p><input id="New_'+productosCreados+'_Type" type="text" value="tipo"></p>';
	codigoHtmlProducto += '<p><input id="New_'+productosCreados+'_Name" type="text" value="nombre"></p>';
	codigoHtmlProducto += '<p><input id="New_'+productosCreados+'_Description" type="text" value="descripcion"></p>';
	codigoHtmlProducto += '<p><input id="New_'+productosCreados+'_MinPrice" type="text" value="precio minimo"></p>';
	codigoHtmlProducto += '<p><input id="New_'+productosCreados+'_MaxPrice" type="text" value="precio maximo"></p>';
	codigoHtmlProducto += '<p><input id="New_'+productosCreados+'_Availability" type="text" value="disponibilidad"></p>';
	codigoHtmlProducto += '</div></div><div class="choose">';
	codigoHtmlProducto += '<ul class="nav nav-pills nav-justified">';
	codigoHtmlProducto += '<li><a href="#" onClick="EliminarProducto(\'New_'+productosCreados+'\')"><i class="fa fa-plus-square"></i>Eliminar Producto</a></li>';
	codigoHtmlProducto += '</ul>';
	codigoHtmlProducto += '</div></div></div>';
	
	seccionListadoProductos.innerHTML += codigoHtmlProducto;
	
	var listadoProductosGenerados = document.getElementById('productosGenerados');
	if (listadoProductosGenerados.value == "")
	{
		listadoProductosGenerados.value = "New_"+ productosCreados;
	}
	else
	{
		listadoProductosGenerados.value += ";"+"New_"+ productosCreados;
	}
	alert("El listado de productosGenerados queda: "+document.getElementById('productosGenerados').value);
}

function GuardarCambios()
{
	//cuando vayamos a guardar los cambios, debemos realizar las siguientes tareas	
	//guardar la informacion de los productos generados nuevos
	
	//guardar la informacion de los productos a eliminar 
		
	//guardar la informacion de los productos modificados
	
	
	document.productos.submit();
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
							<a href="tiw"><img src="images/home/logo.png" alt="" /></a>
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
					<form id="productos" action="tiw" method="post">
						<div class="features_items"><!--features_items-->
						<h2 class="title text-center">Catálogo de Proveedor</h2>
						<div id="listadoProductos">
						<% for(int i=0;i<arrayProductos.size();i++)
								{
									Product objetoProducto = (Product)arrayProductos.get(i);%>									
						<div class="col-sm-4 Tipo_<%=objetoProducto.getType()%>" id="<%=objetoProducto.getId()%>">
							<div class="product-image-wrapper" >
								<div class="single-products" >
										<div class="productinfo text-center">
											<img src="images/home/product1.jpg" alt="" />
											<p><input id="<%=objetoProducto.getId()%>_Img" type="file" value=""></p>
											<p>Tipo: </p>
											<p><input id="<%=objetoProducto.getId()%>_Type" type="text" value="<%=objetoProducto.getType()%>"></p>
											<p>Nombre: </p>
											<p><input id="<%=objetoProducto.getId()%>_Name" type="text" value="<%=objetoProducto.getName()%>"></p>
											<p>Descripcion: </p>
											<p><input id="<%=objetoProducto.getId()%>_Description" type="text" value="<%=objetoProducto.getDescription()%>"></p>
											<p>P.Minimo: </p>
											<p><input id="<%=objetoProducto.getId()%>_MinPrice" type="text" value="<%=objetoProducto.getMinPrice()%>"></p>
											<p>P.Maximo: </p>
											<p><input id="<%=objetoProducto.getId()%>_MaxPrice" type="text" value="<%=objetoProducto.getMaxPrice()%>"></p>
											<p>Disponibilidad: </p>
											<p><input id="<%=objetoProducto.getId()%>_Availability" type="text" value="<%=objetoProducto.getAvailability()%>"></p>
										</div>
								</div>
								<div class="choose">
									<ul class="nav nav-pills nav-justified">
										<li><a href="#" onClick="EliminarProducto(<%=objetoProducto.getId()%>)"><i class="fa fa-plus-square"></i>Eliminar Producto</a></li>
										<li><a href="#" onClick="ModificarProducto(<%=objetoProducto.getId()%>)"><i class="fa fa-plus-square"></i>Modificar Producto</a></li>										
									</ul>
								</div>
							</div>
						</div>												
						<%		} %>
						</div>
					</div><!--features_items-->
					<input type="button" onClick="CrearProducto()" value="Crear Producto">
					<input type="button" value="Guardar Cambios" onClick="GuardarCambios()">
					<input type="hidden" id="productosEliminados" value="">
					<input type="hidden" id="productosModificados" value="">
					<input type="hidden" id="productosGenerados" value="">
				</form>						
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
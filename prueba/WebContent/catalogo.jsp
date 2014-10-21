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
</script>

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
	<jsp:include page="headerUser.jsp"></jsp:include>
	
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
											<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Añadir al carro</a>
										</div>
										<div class="product-overlay">
											<div class="overlay-content">
												<h2><%=objetoProducto.getPrice()%>€</h2>
												<p><%=objetoProducto.getDescription()%></p>
												<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Añadir al carro</a>
											</div>
										</div>
								</div>
							</div>
						</div>						
						<%		} %>						
					</div><!--features_items-->
				</div>
			</div>	
		</div>
	</section>
	
	<jsp:include page="footer.jsp"></jsp:include>
	

  
    <script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/price-range.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body>
</html>
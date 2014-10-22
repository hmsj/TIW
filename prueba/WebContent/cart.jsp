<!DOCTYPE html>
<%@page import="es.uc3m.tiw.contenedores.Product"%>
<%@page import="es.uc3m.tiw.logica.*"%>
<%@page import="java.util.*"%>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Carrito | TIW-TALAVERÁMICA</title>
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
<%
ObtenerProductos logicaObtenerProducto = new ObtenerProductos();
ArrayList<Product> listadoProductos = logicaObtenerProducto.obtenerProductos(0);

List<Product> productsInCart=(List<Product>) request.getSession().getAttribute("producInCart");
double subtotal=Double.parseDouble("0");
%>
<body onload="inicio()" > 
	<jsp:include page="headerUser.jsp"></jsp:include>

	<section id="cart_items">
		<div class="container">
			<div class="breadcrumbs">
				<ol class="breadcrumb">
				  <li><a href="#">Inicio</a></li>
				  <li class="active">Carrito</li>
				</ol>
			</div>
			<div class="table-responsive cart_info">
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="image">Artículo</td>
							<td class="description"></td>
							<td class="price">Precio</td>
							<td class="quantity">Cantidad</td>
							<td class="total">Total</td>
							<td></td>
						</tr>
					</thead>
					<tbody>
					<% if(productsInCart!=null) 
					{
						for(Product producto:productsInCart)
						{
							
							if(producto!=null){
								subtotal=subtotal+producto.getPrice();
						%>
						<tr>
							<td class="cart_product">
								<a href=""><img src="images/home/product1.jpg" alt=""></a>
							</td>
							<td class="cart_description">
								<h4><a href=""><%=producto.getName() %></a></h4>
								<p>Web ID: <%=producto.getId() %></p>
							</td>
							<td class="cart_price">
								<p><%=producto.getPrice() %></p>
							</td>
							<td class="cart_quantity">
								<div class="cart_quantity_button">
									<a class="cart_quantity_up" href=""> + </a>
									<input class="cart_quantity_input" type="text" name="quantity" value="<%=producto.getCantidad() %>" autocomplete="off" size="2">
									<a class="cart_quantity_down" href=""> - </a>
								</div>
							</td>
							<td class="cart_total">
								<p class="cart_total_price"><%=producto.getCantidad()*producto.getPrice() %></p>
							</td>
							<td class="cart_delete">
								<a class="cart_quantity_delete" href=""><i class="fa fa-times"></i></a>
							</td>
						</tr>
						<%
							}
							}
						}
					else
					{
					
					}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</section> <!--/#cart_items-->

	<section id="do_action">
		<div class="container">
			<div class="heading">
				<h3>¿Qué desea hacer a continuación?</h3>
				
			</div>
			<div class="row">
				<div class="col-sm-6">
					<div class="total_area">
						<ul>
						<% %>
							<li>SubTotal <span><%=subtotal %></span></li>
							<li>Impuestos <span><%=subtotal*0.21 %></span></li>
							<li>Gastos de envio <span>Gratuito</span></li>
							<li>Total <span><%=subtotal+(subtotal*0.21) %></span></li>
						</ul>
							<a class="btn btn-default update" href="">Actualizar</a>
							<a class="btn btn-default check_out" href="">Pagar</a>
					</div>
				</div>
			</div>
		</div>
	</section><!--/#do_action-->

	<jsp:include page="footer.jsp"></jsp:include>
	


    <script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body>
</html>
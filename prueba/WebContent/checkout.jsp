<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Checkout | TIW-TALAVERÁMICA</title>
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

	<section id="cart_items">
		<div class="container">
			<div class="breadcrumbs">
				<ol class="breadcrumb">
				  <li><a href="#">Inicio</a></li>
				  <li class="active">Check out</li>
				</ol>
			</div><!--/breadcrums-->

			<div class="step-one">
				<h2 class="heading">Paso1</h2>
			</div>
			<div class="checkout-options">
				<h3>Nuevo Usuario</h3>
				<p>Opciones Checkout </p>
				<ul class="nav">
					<li>
						<label><input type="checkbox"> Cuenta Registrada</label>
					</li>
					<li>
						<label><input type="checkbox"> Checkout Invitado</label>
					</li>
					<li>
						<a href=""><i class="fa fa-times"></i>Cancelar</a>
					</li>
				</ul>
			</div><!--/checkout-options-->

			<div class="register-req">
				<p>Por favor use Registro Y Checkout para acceder facilmente a tu historial de pedidos, o use Checkout como Invitado</p>
			</div><!--/register-req-->

			<div class="shopper-informations">
				<div class="row">
					<div class="col-sm-3">
						<div class="shopper-info">
							<p>Información del Comprador</p>
							<form>
								<input type="text" placeholder="Nombre">
								<input type="text" placeholder="Nombre Usuario">
								<input type="password" placeholder="ContraseÃ±a">
								<input type="password" placeholder="Confirmar ContraseÃ±a">
							</form>
							<a class="btn btn-primary" href="">Obtener Información</a>
							<a class="btn btn-primary" href="">Continuar</a>
						</div>
					</div>
					<div class="col-sm-5 clearfix">
						<div class="bill-to">
							<p>Factura A Nombre De</p>
							<div class="form-one">
								<form>
									<input type="text" placeholder="Nombre de la compañia">
									<input type="text" placeholder="Email*">
									<input type="text" placeholder="Titulo">
									<input type="text" placeholder="Nombre *">
									<input type="text" placeholder="Apellido *">
									<input type="text" placeholder="Dirección 1 *">
									<input type="text" placeholder="Dirección 2">
								</form>
							</div>
							<div class="form-two">
								<form>
									<input type="text" placeholder="ZIP / Código Postal *">
									<select>
										<option>-- Paí­s --</option>
										<option>ESPAÑA</option>
										<option>United States</option>
										<option>Bangladesh</option>
										<option>UK</option>
										<option>India</option>
										<option>Pakistan</option>
										<option>Ucrane</option>
										<option>Canada</option>
										<option>Dubai</option>
									</select>
									<select>
										<option>-- Estado / Provincia / Región --</option>
										
										<option>Madrid</option>
										<option>Barcelona</option>
										<option>Sevilla</option>
										<option>Vigo</option>
										<option>Bilbao</option>
										<option>Cáceres</option>
										<option>Granada</option>
										<option>Ceuta</option>
									</select>
									<input type="password" placeholder="Confirmar contraseÃ±a">
									<input type="text" placeholder="TelÃ©fono *">
									<input type="text" placeholder="TelÃ©fono MÃ³vil">
									<input type="text" placeholder="Fax">
								</form>
							</div>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="order-message">
							<p>Envio del pedido</p>
							<textarea name="message"  placeholder="Notas sobre tu pedido, notas especiales para la entrega" rows="16"></textarea>
							<label><input type="checkbox"> Envio a la dirección de la facturación</label>
						</div>	
					</div>					
				</div>
			</div>
			<div class="review-payment">
				<h2>Revisión y Pago</h2>
			</div>

			<div class="table-responsive cart_info">
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="image">Objeto</td>
							<td class="description"></td>
							<td class="price">Precio</td>
							<td class="quantity">Cantidad</td>
							<td class="total">Total</td>
							<td></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="cart_product">
								<a href=""><img src="images/cart/one.png" alt=""></a>
							</td>
							<td class="cart_description">
								<h4><a href="">Botijo</a></h4>
								<p>Web ID: 1089772</p>
							</td>
							<td class="cart_price">
								<p>30$</p>
							</td>
							<td class="cart_quantity">
								<div class="cart_quantity_button">
									<a class="cart_quantity_up" href=""> + </a>
									<input class="cart_quantity_input" type="text" name="quantity" value="1" autocomplete="off" size="2">
									<a class="cart_quantity_down" href=""> - </a>
								</div>
							</td>
							<td class="cart_total">
								<p class="cart_total_price">30$</p>
							</td>
							<td class="cart_delete">
								<a class="cart_quantity_delete" href=""><i class="fa fa-times"></i></a>
							</td>
						</tr>

						<tr>
							<td class="cart_product">
								<a href=""><img src="images/cart/two.png" alt=""></a>
							</td>
							<td class="cart_description">
								<h4><a href="">Colorblock Scuba</a></h4>
								<p>Web ID: 1089772</p>
							</td>
							<td class="cart_price">
								<p>$59</p>
							</td>
							<td class="cart_quantity">
								<div class="cart_quantity_button">
									<a class="cart_quantity_up" href=""> + </a>
									<input class="cart_quantity_input" type="text" name="quantity" value="1" autocomplete="off" size="2">
									<a class="cart_quantity_down" href=""> - </a>
								</div>
							</td>
							<td class="cart_total">
								<p class="cart_total_price">$59</p>
							</td>
							<td class="cart_delete">
								<a class="cart_quantity_delete" href=""><i class="fa fa-times"></i></a>
							</td>
						</tr>
						<tr>
							<td class="cart_product">
								<a href=""><img src="images/cart/three.png" alt=""></a>
							</td>
							<td class="cart_description">
								<h4><a href="">Colorblock Scuba</a></h4>
								<p>Web ID: 1089772</p>
							</td>
							<td class="cart_price">
								<p>$59</p>
							</td>
							<td class="cart_quantity">
								<div class="cart_quantity_button">
									<a class="cart_quantity_up" href=""> + </a>
									<input class="cart_quantity_input" type="text" name="quantity" value="1" autocomplete="off" size="2">
									<a class="cart_quantity_down" href=""> - </a>
								</div>
							</td>
							<td class="cart_total">
								<p class="cart_total_price">$59</p>
							</td>
							<td class="cart_delete">
								<a class="cart_quantity_delete" href=""><i class="fa fa-times"></i></a>
							</td>
						</tr>
						<tr>
							<td colspan="4">&nbsp;</td>
							<td colspan="2">
								<table class="table table-condensed total-result">
									<tr>
										<td>SubTotal</td>
										<td>$59</td>
									</tr>
									<tr>
										<td>Impuestos</td>
										<td>$2</td>
									</tr>
									<tr class="shipping-cost">
										<td>Gastos de Envio</td>
										<td>Gratuito</td>										
									</tr>
									<tr>
										<td>Total</td>
										<td><span>$61</span></td>
									</tr>
								</table>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="payment-options">
					<span>
						<label><input type="checkbox"> Transferencia Bancaria Directa</label>
					</span>
					<span>
						<label><input type="checkbox"> Comprobar Pago</label>
					</span>
					<span>
						<label><input type="checkbox"> Paypal</label>
					</span>
				</div>
		</div>
	</section> <!--/#cart_items-->

	

	<jsp:include page="footer.jsp"></jsp:include>
	


    <script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body>
</html>
package es.uc3m.tiw.servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import es.uc3m.tiw.contenedores.Product;
import es.uc3m.tiw.contenedores.ProductType;
import es.uc3m.tiw.contenedores.User;
import es.uc3m.tiw.logica.ObtenerProductos;
import es.uc3m.tiw.logica.ObtenerTiposProducto;

/**
 * Servlet implementation class ServletCatalogo
 */
@WebServlet("/tiw")	
public class ServletCatalogo extends HttpServlet {

       
    /**
	 * 
	 */
	//private static final long serialVersionUID = -8106278358312912989L;

	/**
     * @see HttpServlet#HttpServlet()
     */
    public ServletCatalogo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String forwardJSP = "/catalogo.jsp";
		
		ObtenerTiposProducto logicaObtenerTiposProducto = new ObtenerTiposProducto();
		ArrayList<ProductType> listadoTiposProducto = logicaObtenerTiposProducto.obtenerTiposProducto();
		request.setAttribute("LISTA_TIPOS_PRODUCTO", listadoTiposProducto);
				
		ObtenerProductos logicaObtenerProducto = new ObtenerProductos();
		ArrayList<Product> listadoProductos = null;
		
		User usuarioLogado;
		if (request.getSession().getAttribute("userLogado") != null)
		{
			usuarioLogado = (User)request.getSession().getAttribute("userLogado");
			System.out.println(usuarioLogado.getName());
			System.out.println(usuarioLogado.getDocument());
			//si el tipo de usuario logado es proveedor, deberemos solo recuperar los productos de cierta empresa
			//ademas de redirigir a la pagina de administracion de solo la empresa asociada con el proveedor
			if (usuarioLogado.getType() == 2)				
			{
				listadoProductos = logicaObtenerProducto.obtenerProductos(Long.parseLong(usuarioLogado.getEnterprise()));
				forwardJSP = "/catalogoAdmin.jsp";
			}
			//si el usuario logado es administrador, deberemos mostrar todos los productos pero redirigir a la pagina de administracion
			//de productos y no al catalogo normal del cliente
			else if (usuarioLogado.getType() == 3)
			{
				listadoProductos = logicaObtenerProducto.obtenerProductos(0);
				forwardJSP = "/catalogoAdmin.jsp";
			}
			else
			{
				listadoProductos = logicaObtenerProducto.obtenerProductos(0);
			}
		}
		else
		{
			usuarioLogado = null;
			listadoProductos = logicaObtenerProducto.obtenerProductos(0);
		}			

		request.setAttribute("LISTA_PRODUCTOS", listadoProductos);	
		forward(request,response, forwardJSP);		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
	}
	
	protected void forward(HttpServletRequest request, HttpServletResponse response, String uri) {
		
		try {
			
			javax.servlet.RequestDispatcher dispatcher =request.getRequestDispatcher(response.encodeURL(uri));
			dispatcher.forward(request, response);
			return;

		} catch (ServletException se) {
			se.printStackTrace();

		} catch (java.io.IOException ioe) {
			ioe.printStackTrace();
		}
	}

}

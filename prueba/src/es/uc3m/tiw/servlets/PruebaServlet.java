package es.uc3m.tiw.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import es.uc3m.tiw.contenedores.Product;
import es.uc3m.tiw.contenedores.ProductType;
import es.uc3m.tiw.logica.ObtenerProductos;
import es.uc3m.tiw.logica.ObtenerTiposProducto;

/**
 * Servlet implementation class PruebaServlet
 */
@WebServlet("/tiw")
public class PruebaServlet extends HttpServlet {
	
	//private static final long serialVersionUID = 1L; no lo necesitamos ahora
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PruebaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		ObtenerProductos logicaObtenerProducto = new ObtenerProductos();
		ArrayList<Product> listadoProductos = logicaObtenerProducto.obtenerProductos(0);
		
		ObtenerTiposProducto logicaObtenerTiposProducto = new ObtenerTiposProducto();
		ArrayList<ProductType> listadoTiposProducto = logicaObtenerTiposProducto.obtenerTiposProducto();		

		request.setAttribute("LISTA_PRODUCTOS", listadoProductos);
		request.setAttribute("LISTA_TIPOS_PRODUCTO", listadoTiposProducto);
		

		String indexJSP = "/catalogo.jsp";
		forward(request,response, indexJSP);
		
		
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

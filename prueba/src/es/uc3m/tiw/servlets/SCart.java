package es.uc3m.tiw.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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
 * Servlet implementation class SCart
 */
@WebServlet("/SCart")
public class SCart extends HttpServlet {

       
    /**
	 * 
	 */
	private static final long serialVersionUID = -7497848752935415768L;

	/**
     * @see HttpServlet#HttpServlet()
     */
    public SCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int idProduct=0;
		ObtenerProductos logicaObtenerProducto = new ObtenerProductos();
		ArrayList<Product> listadoProductos = logicaObtenerProducto.obtenerProductos(0);
		Product productoNew=null;
		if(request.getParameter("idPro").toString()!=null)
		{
			
		 idProduct= Integer.valueOf(request.getParameter("idPro").toString());
		 for(Product product:listadoProductos)
		 {
			 if(product.getId()==idProduct)
			 {
				 productoNew=product;
				 break;				 
			 }
		 }
		}
		
		List<Product> productos=(List<Product>) request.getSession().getAttribute("producInCart");
		if(productos!=null)
		{
			boolean isSet=false;
			for(Product productoProv:productos)
			{			
				if(productoProv.getId()==productoNew.getId())
				{
					
					productoNew.setCantidad(productoNew.getCantidad()+1);
					productos.add(productoNew);
					isSet=true;
					productos.remove(productoProv);
					break;
				}
			}
			
			if(isSet==false)
			{
				productoNew.setCantidad(productoNew.getCantidad()+1);
				productos.add(productoNew);
			}
		}
		else
		{
			productos=new ArrayList<Product>();
			productoNew.setCantidad(productoNew.getCantidad()+1);
			productos.add(productoNew);
		}
		request.getSession().setAttribute("producInCart", productos);
		

		
		ObtenerTiposProducto logicaObtenerTiposProducto = new ObtenerTiposProducto();
		ArrayList<ProductType> listadoTiposProducto = logicaObtenerTiposProducto.obtenerTiposProducto();		

		request.setAttribute("LISTA_PRODUCTOS", listadoProductos);
		request.setAttribute("LISTA_TIPOS_PRODUCTO", listadoTiposProducto);
		

		String forwardJSP = "/catalogo.jsp";
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

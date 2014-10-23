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
 * Servlet implementation class Slogin
 */
@WebServlet("/Slogin")
public class Slogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Slogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String logout = request.getParameter("logout");
		String forwardJSP = "/login.jsp";
		
		//si quiero hacer logout
		if (logout != null && !"".equalsIgnoreCase(logout) && "yes".equalsIgnoreCase(logout))
		{			
			//anulamos sesion
			request.getSession().invalidate();
			
			ObtenerProductos logicaObtenerProducto = new ObtenerProductos();
			ArrayList<Product> listadoProductos = null;
			
			ObtenerTiposProducto logicaObtenerTiposProducto = new ObtenerTiposProducto();
			ArrayList<ProductType> listadoTiposProducto = logicaObtenerTiposProducto.obtenerTiposProducto();	
			
			request.setAttribute("LISTA_TIPOS_PRODUCTO", listadoTiposProducto);		
			
			listadoProductos = logicaObtenerProducto.obtenerProductos(0);
			request.setAttribute("LISTA_PRODUCTOS", listadoProductos);	
			
			forwardJSP ="/catalogo.jsp";					
		}
		
		//si quiero hacer login, debo redirigir a la pagina del login solamente		
		forward(request,response, forwardJSP);	

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String usuario=request.getParameter("user");
		String password=request.getParameter("password");
		String forwardJSP ="/catalogo.jsp";
		
		ObtenerProductos logicaObtenerProducto = new ObtenerProductos();
		ArrayList<Product> listadoProductos = null;
		
		ObtenerTiposProducto logicaObtenerTiposProducto = new ObtenerTiposProducto();
		ArrayList<ProductType> listadoTiposProducto = logicaObtenerTiposProducto.obtenerTiposProducto();	
		
		request.setAttribute("LISTA_TIPOS_PRODUCTO", listadoTiposProducto);		
		
		// Buscar el user en a BBDD			
		if(usuario!=null&&password!=null&&usuario.equalsIgnoreCase("admin")&&password.equals("admin"))
		{
			
			User user= new User();
			user.setName("Administrator");
			user.setLastName("Tipo 3");
			user.setType(3);
			user.setAddress("calle agapito 3");
			user.setDocumentType(1);
			user.setDocument("300300c");
			user.setPassword("admin");
			//ya que no llamamos a la BBDD vamos a dar por userId el numero 3 para que coincida con el tipo de usuario, pero no tiene nada que ver
			user.setId(3);			
			
			request.getSession(true).setAttribute("userLogado", user);
			
			listadoProductos = logicaObtenerProducto.obtenerProductos(user.getId());
			request.setAttribute("LISTA_PRODUCTOS", listadoProductos);				
			forwardJSP="/catalogoAdmin.jsp";
			
			//response.sendRedirect("index.jsp");
		}
		else if(usuario!=null&&password!=null&&usuario.equalsIgnoreCase("user")&&password.equals("user")){
			User user= new User();
			user.setName("Usuario");
			user.setLastName("Tipo 1");
			user.setType(1);
			user.setAddress("calle agapito 1");
			user.setDocumentType(1);
			user.setDocument("100100a");
			user.setPassword("user");
			//ya que no llamamos a la BBDD vamos a dar por userId el numero 3 para que coincida con el tipo de usuario, pero no tiene nada que ver
			user.setId(1);
			
			request.getSession(true).setAttribute("userLogado", user);
			
			listadoProductos = logicaObtenerProducto.obtenerProductos(0);
			request.setAttribute("LISTA_PRODUCTOS", listadoProductos);		
		}
		else if(usuario!=null&&password!=null&&usuario.equalsIgnoreCase("prov")&&password.equals("prov")){
			User user= new User();
			user.setName("Proveedor");
			user.setLastName("Tipo 2");
			user.setType(2);
			user.setAddress("calle agapito 2");
			user.setDocumentType(1);
			user.setDocument("200200b");
			user.setPassword("prov");
			//ya que no llamamos a la BBDD vamos a dar por userId el numero 3 para que coincida con el tipo de usuario, pero no tiene nada que ver
			user.setId(2);
			
			request.getSession(true).setAttribute("userLogado", user);
			
			listadoProductos = logicaObtenerProducto.obtenerProductos(user.getId());
			request.setAttribute("LISTA_PRODUCTOS", listadoProductos);							
			forwardJSP="/catalogoAdmin.jsp";	
		}
		else
		{
			request.getSession(true).setAttribute("error", "Los datos son incorrectos");
			forwardJSP="/login.jsp";
		}
		
		forward(request,response, forwardJSP);		
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

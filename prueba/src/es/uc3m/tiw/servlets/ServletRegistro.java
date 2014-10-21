package es.uc3m.tiw.servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import es.uc3m.tiw.contenedores.Product;
import es.uc3m.tiw.contenedores.ProductType;
import es.uc3m.tiw.contenedores.User;
import es.uc3m.tiw.contenedores.UserType;
import es.uc3m.tiw.logica.ObtenerProductos;
import es.uc3m.tiw.logica.ObtenerTiposProducto;
import es.uc3m.tiw.logica.ObtenerTiposUsuario;
import es.uc3m.tiw.logica.ObtenerUsuarios;
import es.uc3m.tiw.logica.RegistrarUsuarios;

/**
 * Servlet implementation class ServletRegistro
 */
@WebServlet("/tiwReg")
public class ServletRegistro extends HttpServlet {
	

       
    /**
	 * 
	 */
	private static final long serialVersionUID = 9097797372096228151L;

	/**
     * @see HttpServlet#HttpServlet()
     */
    public ServletRegistro() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		ObtenerTiposUsuario logicaObtenerTiposUsuario = new ObtenerTiposUsuario();
		ArrayList<UserType> listadoTiposUsuario = logicaObtenerTiposUsuario.obtenerTiposUsuario();		

		request.setAttribute("LISTA_TIPOS_USUARIO", listadoTiposUsuario);
		
		String forwardJSP = "/registro.jsp";
		forward(request,response, forwardJSP);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		User usuarioNuevo = new User();
		if (request.getParameter("userType") != null)
			usuarioNuevo.setType(Integer.parseInt(request.getParameter("userType").toString()));
		if (request.getParameter("name") != null)
			usuarioNuevo.setName(request.getParameter("name").toString());
		if (request.getParameter("lastName") != null)
			usuarioNuevo.setLastName(request.getParameter("lastName").toString());
		if (request.getParameter("secondLastName") != null)
			usuarioNuevo.setSecondLastName(request.getParameter("secondLastName").toString());
		if (request.getParameter("documentType") != null)
			usuarioNuevo.setDocumentType(Integer.parseInt(request.getParameter("documentType")));
		if (request.getParameter("document") != null)
			usuarioNuevo.setDocument(request.getParameter("document").toString());
		if (request.getParameter("password") != null)
			usuarioNuevo.setPassword(request.getParameter("password").toString());
		if (request.getParameter("address") != null)
			usuarioNuevo.setAddress(request.getParameter("address").toString());
		if (request.getParameter("enterprise") != null)
			usuarioNuevo.setEnterprise(request.getParameter("enterprise").toString());
		//if (request.getParameter("enterpriseAddress") != null)
		//	usuarioNuevo.setEnterpriseAddress(request.getParameter("enterpriseAddress").toString());
		
		ObtenerUsuarios logicaObtenerUsuario = new ObtenerUsuarios();
		ArrayList<User> listadoUsuariosCoincidentes = new ArrayList<User>();
		listadoUsuariosCoincidentes = logicaObtenerUsuario.obtenerUsuarios(usuarioNuevo);
		
		if (listadoUsuariosCoincidentes.size() > 0)
		{
			request.setAttribute("MENSAJE", "El usuario ya existe en la BBDD");
			String forwardJSP = "/login.jsp";
			forward(request,response, forwardJSP);
		}
		else
		{
			RegistrarUsuarios logicaRegistrarUsuario = new RegistrarUsuarios();
			int respuestaRegistro;
			try
			{
				respuestaRegistro = logicaRegistrarUsuario.registrarUsuarios(usuarioNuevo);			
			}
			catch(Exception e)
			{
				respuestaRegistro = 1;
			}
			if (respuestaRegistro == 0)
			{
				String forwardJSP = "/catalogo.jsp";
				ObtenerProductos logicaObtenerProducto = new ObtenerProductos();
				ArrayList<Product> listadoProductos = null;
				
				ObtenerTiposProducto logicaObtenerTiposProducto = new ObtenerTiposProducto();
				ArrayList<ProductType> listadoTiposProducto = logicaObtenerTiposProducto.obtenerTiposProducto();		

				
				request.setAttribute("LISTA_TIPOS_PRODUCTO", listadoTiposProducto);
				
				HttpSession session = request.getSession();
				//inicialmente pasamos como userId el documento del cliente, pero cuando llamemos a la BBDD, el servicio de registro de usuario
				//nos debera devolver el userId asociado a dicho usuario, que se tratara de un sequencial incluido en la tabla
				session.setAttribute("userLogado", usuarioNuevo);	
				
				//si el tipo de usuario logado es proveedor, deberemos solo recuperar los productos de cierta empresa
				//ademas de redirigir a la pagina de administracion de solo la empresa asociada con el proveedor
				if (usuarioNuevo.getType() == 2)				
				{
					listadoProductos = logicaObtenerProducto.obtenerProductos(Long.parseLong(usuarioNuevo.getEnterprise()));
					forwardJSP = "/catalogoAdmin.jsp";
				}
				//si el usuario logado es administrador, deberemos mostrar todos los productos pero redirigir a la pagina de administracion
				//de productos y no al catalogo normal del cliente
				else if (usuarioNuevo.getType() == 3)
				{
					listadoProductos = logicaObtenerProducto.obtenerProductos(0);
					forwardJSP = "/catalogoAdmin.jsp";
				}
				else
				{
					listadoProductos = logicaObtenerProducto.obtenerProductos(0);
				}
								
				request.setAttribute("LISTA_PRODUCTOS", listadoProductos);	
				request.setAttribute("MENSAJE", "El usuario se ha registrado correctamente.");				
				forward(request,response, forwardJSP);
			}
			else
			{
				request.setAttribute("MENSAJE", "Ha ocurrido un error durante el registro del usuario. Intentelo nuevamente.");
				String forwardJSP = "/registro.jsp";
				forward(request,response, forwardJSP);
			}
		}
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

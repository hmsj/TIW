package es.uc3m.tiw.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import es.uc3m.tiw.contenedores.User;

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
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String usuario=request.getParameter("user");
		String password=request.getParameter("password");
		String forwardJSP ="";
		
		// Buscar el user en a BBDD
		
		if(usuario!=null&&password!=null&&usuario.equalsIgnoreCase("admin")&&password.equals("admin"))
		{
			
			User user= new User();
			user.setName("Administrator");
			user.setType(3);
			
			
			request.getSession(true).setAttribute("usuarioActual", user);
			forwardJSP="/catalogoAdmin.jsp";
			forward(request,response, forwardJSP);
			//response.sendRedirect("index.jsp");
		}
		else if(usuario!=null&&password!=null&&usuario.equalsIgnoreCase("user")&&password.equals("user")){
			User user= new User();
			user.setName("Usuario");
			user.setType(1);
			
			request.getSession(true).setAttribute("usuarioActual", user);
			forwardJSP="/catalogo.jsp";
			forward(request,response, forwardJSP);
			//response.sendRedirect("index.jsp");
		}
		else if(usuario!=null&&password!=null&&usuario.equalsIgnoreCase("prov")&&password.equals("prov")){
			User user= new User();
			user.setName("Proveedor");
			user.setType(2);
			
			request.getSession(true).setAttribute("usuarioActual", user);
			
			forwardJSP="/catalogoAdmin.jsp";
			forward(request,response, forwardJSP);
			//response.sendRedirect("index.jsp");
		}
		else
		{
			request.getSession(true).setAttribute("error", "Los datos son incorrectos");
			response.sendRedirect("login.jsp");
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

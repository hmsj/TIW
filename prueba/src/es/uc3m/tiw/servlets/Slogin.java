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
		
		// Buscar el user en a BBDD
		
		if(usuario!=null&&password!=null&&usuario.equalsIgnoreCase("admin")&&password.equals("admin"))
		{
			User user= new User();
			user.setName("Administrator");
			user.setType(0);
			
			request.getSession(true).setAttribute("usuarioActual", user);
			//response.sendRedirect("/tiw");
			String forwardJSP = "/catalogo.jsp";
			forward(request,response, forwardJSP);
		}
		else
		{
			request.getSession(true).setAttribute("error", "Los datos son incorrectos");
			//response.sendRedirect("login.jsp");
			String forwardJSP = "/login.jsp";
			forward(request,response, forwardJSP);
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

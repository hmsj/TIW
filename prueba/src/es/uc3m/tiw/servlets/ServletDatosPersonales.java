package es.uc3m.tiw.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import es.uc3m.tiw.contenedores.User;

/**
 * Servlet implementation class ServletDatosPersonales
 */
@WebServlet("/tiwPersonalData")
public class ServletDatosPersonales extends HttpServlet {
	

	/**
	 * 
	 */
	private static final long serialVersionUID = 3510869984492009322L;

	/**
     * @see HttpServlet#HttpServlet()
     */
    public ServletDatosPersonales() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String forwardJSP = "/personalData.jsp";
		
		if (request.getSession().getAttribute("userLogado") == null)
		{	
			forwardJSP = "/login.jsp";
		}	
		forward(request,response, forwardJSP);		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		User usuarioModificado = new User();
		if (request.getParameter("userType") != null)
			usuarioModificado.setType(Integer.parseInt(request.getParameter("userType").toString()));
		if (request.getParameter("name") != null)
			usuarioModificado.setName(request.getParameter("name").toString());
		if (request.getParameter("lastName") != null)
			usuarioModificado.setLastName(request.getParameter("lastName").toString());
		if (request.getParameter("secondLastName") != null)
			usuarioModificado.setSecondLastName(request.getParameter("secondLastName").toString());
		if (request.getParameter("documentType") != null)
			usuarioModificado.setDocumentType(Integer.parseInt(request.getParameter("documentType")));
		if (request.getParameter("document") != null)
			usuarioModificado.setDocument(request.getParameter("document").toString());
		if (request.getParameter("password") != null)
			usuarioModificado.setPassword(request.getParameter("password").toString());
		if (request.getParameter("address") != null)
			usuarioModificado.setAddress(request.getParameter("address").toString());
		if (request.getParameter("enterprise") != null)
			usuarioModificado.setEnterprise(request.getParameter("enterprise").toString());
		
		
		//deberiamos llamar a una clase logica que actualice los datos del usuario
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

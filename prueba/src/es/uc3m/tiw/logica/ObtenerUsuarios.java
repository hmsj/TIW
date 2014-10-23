package es.uc3m.tiw.logica;

import java.util.ArrayList;

import es.uc3m.tiw.contenedores.User;

public class ObtenerUsuarios {
	
	public ArrayList<User> obtenerUsuarios(User usuarioBusqueda)
	{
		
		ArrayList<User> listadoUsuarios = new ArrayList<User>();
		ArrayList<User> listadoUsuariosFiltrados = new ArrayList<User>();
		

			//llamada a BBDD
			/*esta parte se encontraria comentada hasta que implementemos la conexión con la BBDD*/		
			int Usuarios = 2;
			for (int y = 0; y < Usuarios; y++)
			{
				User usuarioFicticio = new User();
				usuarioFicticio.setId(y+1);
				usuarioFicticio.setName("Usuario"+(y+1));
				usuarioFicticio.setDocument("1234A");
				listadoUsuarios.add(usuarioFicticio);
				
				if (usuarioBusqueda.getDocument().equalsIgnoreCase(listadoUsuarios.get(y).getDocument()))
				{
					listadoUsuariosFiltrados.add(listadoUsuarios.get(y));
				}
			}			
		
		return listadoUsuariosFiltrados;
		
	}

}

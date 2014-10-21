package es.uc3m.tiw.logica;

import java.util.ArrayList;

import es.uc3m.tiw.contenedores.UserType;

public class ObtenerTiposUsuario {
	
	public ArrayList<UserType> obtenerTiposUsuario()
	{
		
		ArrayList<UserType> listadoTiposUsuario = new ArrayList<UserType>();
		

			//llamada a BBDD
			/*esta parte se encontraria comentada hasta que implementemos la conexión con la BBDD*/
			int TiposUsuario = 2;
			for (int y = 0; y < TiposUsuario; y++)
			{
				int TipoUsuario = y+1;
				UserType objetoTipoUsuario = new UserType();
				objetoTipoUsuario.setType(TipoUsuario);					
				objetoTipoUsuario.setDescription("descripcionTipoUsuario"+TipoUsuario);
				listadoTiposUsuario.add(objetoTipoUsuario);		
			}			
		
		return listadoTiposUsuario;
		
	}

}

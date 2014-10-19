package es.uc3m.tiw.logica;

import java.util.ArrayList;

import es.uc3m.tiw.contenedores.ProductType;

public class ObtenerTiposProducto {
	
	public ArrayList<ProductType> obtenerTiposProducto()
	{
		
		ArrayList<ProductType> listadoTiposProducto = new ArrayList<ProductType>();
		

			//llamada a BBDD
			/*esta parte se encontraria comentada hasta que implementemos la conexión con la BBDD*/
			int tiposProducto = 6;
			for (int y = 0; y < tiposProducto; y++)
			{
				int tipoProducto = y+1;
				ProductType objetoTipoProducto = new ProductType();
				objetoTipoProducto.setId(tipoProducto);					
				objetoTipoProducto.setDescription("descripcionTipoProducto"+tipoProducto);
				listadoTiposProducto.add(objetoTipoProducto);		
			}			
		
		return listadoTiposProducto;
		
	}

}

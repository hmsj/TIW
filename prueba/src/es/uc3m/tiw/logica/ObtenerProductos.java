package es.uc3m.tiw.logica;

import java.util.ArrayList;
import java.util.Random;

import es.uc3m.tiw.contenedores.Product;

public class ObtenerProductos {
	
	public ArrayList<Product> obtenerProductos(long enterpriseId)
	{
		
		ArrayList<Product> listadoProductos = new ArrayList<Product>();
		
		if (enterpriseId !=  0)
		{
			//llamada a BBDD
			/*esta parte se encontraria comentada hasta que implementemos la conexión con la BBDD*/
			int numeroProductos = 5;
			int tiposProducto = 6;
			for (int y = 0; y < tiposProducto; y++)
			{
				int tipoProducto = y+1;
				for (int i = 0; i < numeroProductos; i ++)
				{
					Product objetoProducto = new Product();
					objetoProducto.setId(i+1);
					objetoProducto.setType(tipoProducto);
					objetoProducto.setName("objeto"+(i+1));
					objetoProducto.setDescription("descripcion"+(i+1));
					objetoProducto.setEnterpriseId(enterpriseId);
					objetoProducto.setAvailability(numeroProductos);
					objetoProducto.setMinPrice(10);
					objetoProducto.setMaxPrice(50);
					//inicialmente ñapeamos el precio para que nos devuelva diferentes
					int randomPrice = 1 + (int)(Math.random()*3000); 	
					objetoProducto.setPrice(randomPrice);	
					//inicialmente para recuperar X productos ofertados vamos a hacer una
					//ñapa que nos calcule las ofertas de forma aleatoria
					int randomNum = 1 + (int)(Math.random()*60); 				
					if (randomNum == i)
						objetoProducto.setOferta(true);
					listadoProductos.add(objetoProducto);
				}	
			}	
		}
		else
		{
			//llamada a BBDD
			/*esta parte se encontraria comentada hasta que implementemos la conexión con la BBDD*/
			int numeroProductos = 10;
			int tiposProducto = 6;
			for (int y = 0; y < tiposProducto; y++)
			{
				int tipoProducto = y+1;
				int empresa = y + 1;
				for (int i = 0; i < numeroProductos; i ++)
				{
					Product objetoProducto = new Product();
					objetoProducto.setId(i+1);
					objetoProducto.setType(tipoProducto);
					objetoProducto.setName("objeto"+(i+1));
					objetoProducto.setDescription("descripcion"+(i+1));
					objetoProducto.setEnterpriseId(empresa);
					objetoProducto.setAvailability(numeroProductos);
					objetoProducto.setMinPrice(10);
					objetoProducto.setMaxPrice(50);
					//inicialmente ñapeamos el precio para que nos devuelva diferentes
					int randomPrice = 1 + (int)(Math.random()*3000); 	
					objetoProducto.setPrice(randomPrice);	
					//inicialmente para recuperar X productos ofertados vamos a hacer una
					//ñapa que nos calcule las ofertas de forma aleatoria
					int randomNum = 1 + (int)(Math.random()*60); 				
					if (randomNum == i)
						objetoProducto.setOferta(true);
					listadoProductos.add(objetoProducto);		
				}	
			}					
		}
		
		
		return listadoProductos;
		
	}

}

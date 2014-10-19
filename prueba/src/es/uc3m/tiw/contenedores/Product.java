package es.uc3m.tiw.contenedores;

import java.awt.Image;

public class Product {
	
	private long id;
	private long enterpriseId;
	private int type;
	private String name;
	private String description;
	private long availability;
	private byte[] imagen=null;
	private double minPrice;
	private double maxPrice;
	private double price;
	private boolean oferta;
	private int cantidad=0;
	
	
	public final long getId() {
		return id;
	}
	public final void setId(long id) {
		this.id = id;
	}
	public final long getEnterpriseId() {
		return enterpriseId;
	}
	public final void setEnterpriseId(long enterpriseId) {
		this.enterpriseId = enterpriseId;
	}
	public final int getType() {
		return type;
	}
	public final void setType(int type) {
		this.type = type;
	}
	public final String getName() {
		return name;
	}
	public final void setName(String name) {
		this.name = name;
	}
	public final String getDescription() {
		return description;
	}
	public final void setDescription(String description) {
		this.description = description;
	}
	public final long getAvailability() {
		return availability;
	}
	public final void setAvailability(long availability) {
		this.availability = availability;
	}
	public Image getImage()
	{
		return (java.awt.Toolkit.getDefaultToolkit().createImage(imagen));
	}
	public byte[] getImagen()
	{
		return this.imagen;
	}
	public void setImagen(byte[] imagen)
	{
		this.imagen=imagen;
	}
	public final double getMinPrice() {
		return minPrice;
	}
	public final void setMinPrice(double minPrice) {
		this.minPrice = minPrice;
	}
	public final double getMaxPrice() {
		return maxPrice;
	}
	public final void setMaxPrice(double maxPrice) {
		this.maxPrice = maxPrice;
	}
	public final double getPrice() {
		return price;
	}
	public final void setPrice(double price) {
		this.price = price;
	}
	public final boolean isOferta() {
		return oferta;
	}
	public final void setOferta(boolean oferta) {
		this.oferta = oferta;
	}
	public int getCantidad() {
		return cantidad;
	}
	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}
	
	
	

}

package es.uc3m.tiw.contenedores;

import java.util.Date;

public class Order {
	
	private long id;
	private long userId;
	private Date date;
	private String address;
	private double price;
	private int status;
	public final long getId() {
		return id;
	}
	public final void setId(long id) {
		this.id = id;
	}
	public final long getUserId() {
		return userId;
	}
	public final void setUserId(long userId) {
		this.userId = userId;
	}
	public final Date getDate() {
		return date;
	}
	public final void setDate(Date date) {
		this.date = date;
	}
	public final String getAddress() {
		return address;
	}
	public final void setAddress(String address) {
		this.address = address;
	}
	public final double getPrice() {
		return price;
	}
	public final void setPrice(double price) {
		this.price = price;
	}
	public final int getStatus() {
		return status;
	}
	public final void setStatus(int status) {
		this.status = status;
	}	

}

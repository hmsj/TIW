package es.uc3m.tiw.contenedores;

public class OrderDetail {
	
	private long orderId;
	private long productId;
	private long orderProductUnits;
	
	public final long getOrderId() {
		return orderId;
	}
	public final void setOrderId(long orderId) {
		this.orderId = orderId;
	}
	public final long getProductId() {
		return productId;
	}
	public final void setProductId(long productId) {
		this.productId = productId;
	}
	public final long getOrderProductUnits() {
		return orderProductUnits;
	}
	public final void setOrderProductUnits(long orderProductUnits) {
		this.orderProductUnits = orderProductUnits;
	}

}

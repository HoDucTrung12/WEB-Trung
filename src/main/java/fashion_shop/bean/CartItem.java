package fashion_shop.bean;

import java.util.List;

import fashion_shop.entity.Product;

public class CartItem {
	private Product product;
	private String size;
	private String color;
	private Integer checkOutQuantity;

	public CartItem() {
		super();
	}

	public CartItem(Product product, String size, String color, Integer checkOutQuantity) {
		super();
		this.product = product;
		this.size = size;
		this.color = color;
		this.checkOutQuantity = checkOutQuantity;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public Integer getCheckOutQuantity() {
		return checkOutQuantity;
	}

	public void setCheckOutQuantity(Integer checkOutQuantity) {
		this.checkOutQuantity = checkOutQuantity;
	}		
	
}
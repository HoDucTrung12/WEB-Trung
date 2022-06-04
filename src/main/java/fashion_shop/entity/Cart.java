package fashion_shop.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="Cart")
public class Cart {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id", nullable = false)
	private Integer id;

	@ManyToOne
	@JoinColumn(name = "Username", nullable = false)
	private Account account;

	@ManyToOne
	@JoinColumn(name="ProductID", nullable = false)
	private Product product;
	
	@Column(name = "Size")
	private String size;
	
	@Column(name = "Color")
	private String color;

	@Column(name = "quantity", nullable = false)
	private Integer quantity;

	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Cart(Integer id, Account account, Product product, String size, String color, Integer quantity) {
		super();
		this.id = id;
		this.account = account;
		this.product = product;
		this.size = size;
		this.color = color;
		this.quantity = quantity;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}	

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
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

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}


}
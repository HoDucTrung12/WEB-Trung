package fashion_shop.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fashion_shop.bean.CartItem;
import fashion_shop.entity.Cart;
import fashion_shop.entity.Order;
import fashion_shop.entity.OrderDetail;
import fashion_shop.entity.Product;

@Transactional
@Repository
public class DBService {
	@Autowired
	SessionFactory factory;

	public DBService() {
		super();
	}

	public DBService(SessionFactory factory) {
		super();
		this.factory = factory;
	}

	public Product getProductById(String id) {
		String fnt = "getProductById: ";

		Session session = factory.getCurrentSession();
		String hql = "FROM Product where id = :id";
		Product pd;

		try {
			Query query = session.createQuery(hql);
			query.setParameter("id", id);
			pd = (Product) query.list().get(0);
		} catch (Exception e) {
			System.err.print(fnt + e);
			return null;
		}		

		return pd;
	}

	public List<Cart> getCartItemsByUsername(String username) {		
		Session session = factory.getCurrentSession();
		String hql = "FROM Cart WHERE username = :username";
		Query query = session.createQuery(hql);
		query.setParameter("username", username);
		List<Cart> list = query.list();

		return list;
	}

	public Cart getExistedCartItem(String username, String productId, String color, String size) {		
		String fnt = "getExistedCartItem: ";

		Session session = factory.getCurrentSession();
		String hql = "FROM Cart WHERE Username = :username AND ProductID = :productId AND Color = :color AND Size = :size";		
		Cart cart;

		try {
			Query query = session.createQuery(hql);
			query.setParameter("username", username);
			query.setParameter("productId", productId);
			query.setParameter("color", color);
			query.setParameter("size", size);			
			cart = (Cart) query.list().get(0);
		} catch (Exception e) {
			System.err.print(fnt + e);
			return null;
		}

		return cart;
	}
	
	public List<CartItem> getCartListForUser(String username) {
		List<Cart> cartList = getCartItemsByUsername(username);		
		List<CartItem> cartItems = new ArrayList<CartItem>();

		for (Cart item : cartList) {
			Product product = getProductById(item.getProduct().getIdProduct());			
			if (product != null) {
				CartItem tmp = new CartItem();					
				tmp.setProduct(product);
				tmp.setColor(item.getColor());
				tmp.setSize(item.getSize());
				tmp.setCheckOutQuantity(item.getQuantity());
				cartItems.add(tmp);
			}				
		}
		return cartItems;
	}

	public Integer insertCart(Cart cart) {
		String fnt = "insertCart: ";

		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.save(cart);
			t.commit();
		} catch (Exception e) {
			System.err.print(fnt + e);
			t.rollback();
			return 0;
		} finally {
			session.close();
		}

		return 1;
	}

	public Integer updateCart(Cart cart) {
		String fnt = "updateCart: ";

		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.update(cart);
			t.commit();
		} catch (Exception e) {
			System.err.print(fnt + e);
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}	
	
	public Integer deleteCart(Integer id) {
		String fnt = "deleteCart: ";

		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			Cart cart = (Cart) session.get(Cart.class, id);
			session.delete(cart);
			t.commit();
		} catch (Exception e) {
			System.err.print(fnt + e);
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}
	
	public Order getOrderById(String id) {
		String fnt = "getOrderById: ";

		Session session = factory.getCurrentSession();
		String hql = "FROM Order where id = :id";
		Order order;

		try {
			Query query = session.createQuery(hql);
			query.setParameter("id", id);
			order = (Order) query.list().get(0);
		} catch (Exception e) {
			System.err.print(fnt + e);
			return null;
		}		

		return order;
	}
	
	public List<Order> getOrdersByUsername(String username) {		
		Session session = factory.getCurrentSession();
		String hql = "FROM Order WHERE username = :username";
		Query query = session.createQuery(hql);
		query.setParameter("username", username);
		List<Order> list = query.list();

		return list;
	}
	
	public Order getExistedOrder(String email, Date createdAt) {		
		String fnt = "getExistedOrder: ";

		Session session = factory.getCurrentSession();
		String hql = "FROM Order WHERE email = :email AND order_date = :createdAt";		
		Order order;

		try {
			Query query = session.createQuery(hql);
			query.setParameter("email", email);
			query.setParameter("createdAt", createdAt);			
			order = (Order) query.list().get(0);
		} catch (Exception e) {
			System.err.print(fnt + e);
			return null;
		}

		return order;
	}
	
	public Integer insertOrder(Order order) {
		String fnt = "insertOrder: ";

		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.save(order);
			t.commit();
		} catch (Exception e) {
			System.err.print(fnt + e);
			t.rollback();
			return 0;
		} finally {
			session.close();
		}

		return 1;
	}
	
	public OrderDetail getOrderDetailById(String id) {
		String fnt = "getOrderDetailById: ";

		Session session = factory.getCurrentSession();
		String hql = "FROM OrderDetail where id = :id";
		OrderDetail orderDetail;

		try {
			Query query = session.createQuery(hql);
			query.setParameter("id", id);
			orderDetail = (OrderDetail) query.list().get(0);
		} catch (Exception e) {
			System.err.print(fnt + e);
			return null;
		}		

		return orderDetail;
	}
	
	public List<OrderDetail> getOrderDetailsByOrder(String orderID) {		
		Session session = factory.getCurrentSession();
		String hql = "FROM OrderDetail WHERE orderID = :orderID";
		Query query = session.createQuery(hql);
		query.setParameter("orderID", orderID);
		List<OrderDetail> list = query.list();

		return list;
	}
	
	public Integer insertOrderDetail(OrderDetail orderDetail) {
		String fnt = "insertOrderDetail: ";

		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.save(orderDetail);
			t.commit();
		} catch (Exception e) {
			System.err.print(fnt + e);
			t.rollback();
			return 0;
		} finally {
			session.close();
		}

		return 1;
	}

}
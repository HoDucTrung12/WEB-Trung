package fashion_shop.DAO;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fashion_shop.entity.Product;
import fashion_shop.entity.ProductCategory;

@Transactional
@Repository
public class productDAO {
	@Autowired
	SessionFactory factory;
	
	//Get List Product includes Size, Color and Quantity 
	//( mix between 2 Entity: Product & SizeAndColor)
	public List<Object[]> getLMixProd() {
		Session session = factory.getCurrentSession();
		String hql = "select P.idProduct, P.ProdCategory, P.name, P.price, P.image, S.pk.color, S.pk.size, S.pk.quantity  " +
				" from Product P, SizeAndColor S "
				+ "where P.idProduct = S.pk.productID";
		Query query = session.createQuery(hql);
		List<Object[]> listProd = query.list();
		return listProd;
	}
	
	// Get List Product DOES NOT includes Size, Color and Quantity 
	//( just Entity: Product)
	public List<Product> getLProd() {
		Session session = factory.getCurrentSession();
		String hql = "from Product";
		Query query = session.createQuery(hql);
		List<Product> listProd = query.list();
		return listProd;
	}
	
	
	
	public List<ProductCategory> getLCat() {
		Session session = factory.getCurrentSession();
		String hql = "from ProductCategory";
		Query query = session.createQuery(hql);
		List<ProductCategory> listCat = query.list();
		return listCat;
	}
	
	
	
	public Product getProduct(String idProduct) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Product where idProduct = " + idProduct;
		Query query = session.createQuery(hql);
		Product pd = (Product) query.list().get(0);
		return pd;
	}
}

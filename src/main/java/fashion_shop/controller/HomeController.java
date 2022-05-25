package fashion_shop.controller;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import fashion_shop.entity.Product;
import fashion_shop.entity.ProductCategory;

@Transactional
@Controller
@RequestMapping(value = { "/home/", "/" })
public class HomeController {
	@Autowired
	SessionFactory factory;
	
	@ModelAttribute("listProd")
	public List<Product> getLProd() {
		Session session = factory.getCurrentSession();
		String hql = "from Product";
		Query query = session.createQuery(hql);
		List<Product> listProd = query.list();
		return listProd;
	}
	
	@RequestMapping("index")	
	public String index(ModelMap model) {
		model.addAttribute("prods", getLProd());
		return "home/index";
	}
	
	// view products
	@RequestMapping(value = { "products" })
	public String view_product(ModelMap model) {
		model.addAttribute("prods", getLProd());
		model.addAttribute("prodsSize", getLProd().size());
		model.addAttribute("catON", "false");
		return "home/products";
	}
	
	@ModelAttribute("listCat")
	public List<ProductCategory> getLCat() {
		Session session = factory.getCurrentSession();
		String hql = "from ProductCategory";
		Query query = session.createQuery(hql);
		List<ProductCategory> listCat = query.list();
		return listCat;
	}
	
	// view products by cat
	@RequestMapping(value = { "products/{idCategory}" })
	public String view_product(ModelMap model, @PathVariable("idCategory") String idCategory) {
		model.addAttribute("prods", getLProd());
		model.addAttribute("prodsSize", getLProd().size());
		model.addAttribute("listCat", getLCat());
		
		model.addAttribute("catON", "true");
		model.addAttribute("catID", idCategory);
		return "home/products";
	}	
	
	// view product_detail
	@RequestMapping(value = { "detail/{idProduct}" })
	public String view_product_detail(ModelMap model, @PathVariable("idProduct") String idProduct) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Product where idProduct = " + idProduct;
		List<Product> list = session.createQuery(hql).list();
		model.addAttribute("product", list);
		model.addAttribute("prods", getLProd());
		return "home/detail";
	}
	
	@RequestMapping(value = "detail_product/{id_product}")
	public String detail_product(ModelMap model, @PathVariable("id_product") int id_product) {
		Session session = factory.openSession();
		Product prod = (Product) session.get(Product.class, id_product);
		model.addAttribute("detailProd", prod);
		return "home/detail";
	}
	
	public Product Product(String idProduct) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Product where id = 'idProduct'";
		Query query = session.createQuery(hql);
		query.setParameter("id", idProduct);
		Product pd = (Product) query.list().get(0);
		return pd;
	}
}
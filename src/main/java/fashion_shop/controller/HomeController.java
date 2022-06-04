package fashion_shop.controller;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;
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
import org.springframework.web.bind.annotation.RequestMethod;

import fashion_shop.entity.Account;
import fashion_shop.entity.Product;
import fashion_shop.entity.ProductCategory;
import fashion_shop.entity.SizeAndColor;
import fashion_shop.service.DBService;
import fashion_shop.DAO.productDAO;
import fashion_shop.bean.CartItem;

@Transactional
@Controller
@RequestMapping(value = { "/home/", "/" })
public class HomeController {
	
	@Autowired
	SessionFactory factory;
	
	@Autowired
	productDAO productDAL;
	
	@RequestMapping("index")	
	public String index(ModelMap model) {
		model.addAttribute("prods", productDAL.getLProd());
		return "home/index";
	}
	
	// Show all products
	@RequestMapping(value = { "products" })
	public String view_product(ModelMap model) {
		
		List<Product> list = productDAL.getLProd();
		int size = productDAL.getLProd().size();
		List<ProductCategory> listCate = productDAL.getLCat();
		
		model.addAttribute("listCat", listCate);
		model.addAttribute("prods", list);
		model.addAttribute("prodsSize", size);
		
		model.addAttribute("catON", "false");
		
		return "home/products";
	}
	
	// Show products by cat
	@RequestMapping(value = { "products/{idCategory}" })
	public String view_product(ModelMap model, @PathVariable("idCategory") String idCategory) {
		
		List<Product> list = productDAL.getLProd();
		int size = productDAL.getLProd().size();
		List<ProductCategory> listCate = productDAL.getLCat();
		
		model.addAttribute("prods", list);
		model.addAttribute("prodsSize", size);
		model.addAttribute("listCat", listCate);
		
		model.addAttribute("catON", "true");
		model.addAttribute("catID", idCategory);
		return "home/products";
	}
	
	// view product_detail
	@RequestMapping(value = { "detail/{idProduct}" },method = RequestMethod.GET)
	public String view_product_detail(ModelMap model, HttpSession session, 
			@PathVariable("idProduct") String id) {
		DBService db = new DBService(factory);
		Product product = db.getProductById(id);
//		Account account = (Account) session.getAttribute("acc");

//		CartItem cartItem = new CartItem();
//		cartItem.setUsername(account == null ? null : account.getUser_name());
//		cartItem.setProductID(product.getIdProduct());
				
		List<Object[]> productDetail = productDAL.getProductDetailByID(product.getIdProduct());		
		List<String> colors = new ArrayList<String>();
		List<String> sizesByColor = new ArrayList<String>();
		
		Map<Object, Set<Object>> productColors = productDetail.stream().collect(Collectors.groupingBy(o -> o[5], Collectors.mapping(o -> o[6], Collectors.toSet())));		
		
		productColors.forEach((key, val) -> { colors.add((String) key); });
		
		String selectedColor = null;
		if (colors.size() > 0) {
			selectedColor = colors.get(0);			
			String tmpVal = selectedColor;	//Without this row, Java throws error: Local variable selectedColor defined in an enclosing scope must be final or effectively final
			productColors.forEach((key, val) -> {
				String color_i = (String) key;		
				if (color_i.equals(tmpVal)) {
					for (Object o : val) {	// val is a HashMap
						String size = String.valueOf(o);
						sizesByColor.add(size);
					}
				}
			});
		}
		
		List<Product> products = productDAL.getLProd();				
				
		model.addAttribute("product", product);
		model.addAttribute("colors", colors);
		model.addAttribute("sizesByColor", sizesByColor);
//		model.addAttribute("cartItem", cartItem);
		model.addAttribute("products", products);
		model.addAttribute("selectedColor", selectedColor);
		
		if (selectedColor != null)
			return "redirect:/home/detail/" + product.getIdProduct() + "/" + selectedColor + ".htm";		
		
		return "home/detail";
	}
	
	@RequestMapping(value = { "detail/{idProduct}/{color}" },method = RequestMethod.GET)
	public String view_product_detail_set_size_by_color(ModelMap model, HttpSession session,
			@PathVariable("idProduct") String id,
			@PathVariable("color") String selectedColor) {
		DBService db = new DBService(factory);
		Product product = db.getProductById(id);
//		Account account = (Account) session.getAttribute("acc");

//		CartItem cartItem = new CartItem();
//		cartItem.setUsername(account == null ? null : account.getUser_name());
//		cartItem.setProductID(product.getIdProduct());
				
		List<Object[]> productDetail = productDAL.getProductDetailByID(product.getIdProduct());		
		List<String> colors = new ArrayList<String>();
		List<String> sizesByColor = new ArrayList<String>();
		
		Map<Object, Set<Object>> productColors = productDetail.stream().collect(Collectors.groupingBy(o -> o[5], Collectors.mapping(o -> o[6], Collectors.toSet())));				
		
		
		productColors.forEach((key, val) -> {
			String color_i = (String) key;
			colors.add(color_i);			
			if (color_i.equals(selectedColor)) {
				for (Object o : val) {	// val is a HashMap
					String size = String.valueOf(o);
					sizesByColor.add(size);
				}
			}
		});
		
		List<Product> products = productDAL.getLProd();
				
		model.addAttribute("product", product);
		model.addAttribute("colors", colors);
		model.addAttribute("sizesByColor", sizesByColor);
//		model.addAttribute("cartItem", cartItem);
		model.addAttribute("products", products);
		model.addAttribute("selectedColor", selectedColor);
		
		return "home/detail";
	}
	
}
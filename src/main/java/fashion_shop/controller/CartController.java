package fashion_shop.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import fashion_shop.DAO.productDAO;
import fashion_shop.bean.CartItem;
import fashion_shop.entity.Cart;
import fashion_shop.entity.Account;
import fashion_shop.entity.Order;
import fashion_shop.entity.OrderDetail;
import fashion_shop.entity.Product;
import fashion_shop.service.DBService;

@Transactional
@Controller
@RequestMapping("/cart/")
public class CartController {
	@Autowired
	SessionFactory factory;
	productDAO productDAO;

	List<Cart> cartItems = new ArrayList<Cart>();

	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String addCart(ModelMap model, HttpSession session, HttpServletRequest req,  
			@RequestParam("productID") String productID,
			@RequestParam("selectedColor") String selectedColor,
			@RequestParam("selectedSize") String selectedSize,
			@RequestParam("addedQuantity") Integer addedQuantity) {
		
		Account account = (Account) session.getAttribute("acc");		
		if (account == null) {
			session.setAttribute("fromPage", "home/detail" + productID);			
			return "redirect:/user/login.htm";
		}
		
		DBService db = new DBService(factory);
		Product product = db.getProductById(productID);
		
		Cart cart = new Cart();
		cart.setAccount(account);
		cart.setProduct(product);
		cart.setColor(selectedColor);
		cart.setSize(selectedSize);
		
		Cart existedCartItem = db.getExistedCartItem(account.getUser_name(), productID, selectedColor, selectedSize);
		
		if (existedCartItem != null) {
			cart.setId(existedCartItem.getId());
			cart.setQuantity(existedCartItem.getQuantity() + addedQuantity);
			db.updateCart(cart);
		} else {				
			cart.setQuantity(addedQuantity);				
			db.insertCart(cart);
		}		
		
		List<CartItem> cartItems = db.getCartListForUser(account.getUser_name());				
		req.getSession().setAttribute("cartItems", cartItems);

		return "redirect:/home/detail/" + productID + ".htm";
	}

	@RequestMapping("checkout")
	public String checkout(ModelMap model, HttpSession session) {
		Account account = (Account) session.getAttribute("acc");

		if (account == null) {
			session.setAttribute("fromPage", "cart/checkout");			
			return "redirect:/user/login.htm";
		}

		@SuppressWarnings("unchecked")
		List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cartItems");

		model.addAttribute("cartItems", cartItems);			
		return "cart/checkOut";
	}
	
	@RequestMapping(value = "delete/{id}", params = "linkDeleteItem")
	public String deleteCart(ModelMap model, HttpSession session, @PathVariable("id") Integer id) {
		Account account = (Account) session.getAttribute("acc");
		
		if (account == null) {
			session.setAttribute("fromPage", "cart/checkout");			
			return "redirect:/user/login.htm";
		}
		
		DBService db = new DBService(factory);
		db.deleteCart(id);			

		List<CartItem> cartItems = db.getCartListForUser(account.getUser_name());				
		session.setAttribute("cartItems", cartItems);		
		
		return "redirect:/cart/checkOut.htm";
	}
	
	@RequestMapping(value = "orderComplete")
	public String completeOrder(ModelMap model, HttpSession session) {
		Account account = (Account) session.getAttribute("acc");
		
		if (account == null) {
			session.setAttribute("fromPage", "cart/checkout");			
			return "redirect:/user/login.htm";
		}
		
		DBService db = new DBService(factory);
		List<Cart> cartList = db.getCartItemsByUsername(account.getUser_name());	

		if (cartList.size() > 0) {
			SimpleDateFormat fmt = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
			Date date = new Date();
			Order order = new Order();			
			order.setEmails(account);		
//			order.setOrder_date(new java.sql.Date(date.getTime()));
			
			Float totalPrice = (float) 0;
			for (Cart item : cartList) {
				totalPrice += item.getProduct().getPrice();
			}
			order.setTotalPrice(totalPrice);
//			order.setUsername(account.getUser_name());
//			order.setPhone(account.getPhone());
//			order.setAddress(account.getAddress());
			
//			System.out.println
			
			Integer orderSaveStatus = db.insertOrder(order); 
			
			if (orderSaveStatus == 1) {
				Order existedOrder = db.getExistedOrder(account.getEmail(), new java.sql.Date(date.getTime()));
				if (existedOrder != null) {
					for (Cart item : cartList) {
						OrderDetail orderDetail = new OrderDetail();
						orderDetail.setOrder(existedOrder);
						orderDetail.setProd(item.getProduct());
						orderDetail.setQuantity(item.getQuantity());
						orderDetail.setPrice(item.getProduct().getPrice());
						db.insertOrderDetail(orderDetail);
					}
					return "cart/orderComplete";
				}
			}
		}
		
		return "cart/checkOut";
	}
}

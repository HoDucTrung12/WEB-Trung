package fashion_shop.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import fashion_shop.bean.Cart;
import fashion_shop.entity.Account;
import fashion_shop.entity.Order;
import fashion_shop.entity.OrderDetail;
import fashion_shop.entity.Product;
import fashion_shop.entity.ProductCategory;
import fashion_shop.entity.Role;
import fashion_shop.entity.SizeAndColor;
import fashion_shop.entity.SizeAndColor.PK;
import fashion_shop.DAO.accountDAO;
import fashion_shop.DAO.adminDAO;
import fashion_shop.DAO.productDAO;

@Transactional
@Controller
//@SessionAttributes(value = { "cus", "newAdmin", "p" })
@RequestMapping("/admin/")
public class AdminController {
	@Autowired
	SessionFactory factory;
	
	@Autowired
	accountDAO accountDAL;
	
	@Autowired
	productDAO productDAL;
	
	
	
	// HOME
	@RequestMapping(value = { "adminHome" }, method = RequestMethod.GET)
	public String adminHome() {
		return "admin/adminHome";
	}
	
	
	
	///////////////////////////////////  Accounts /////////////////////////////////// 
	@RequestMapping(value = { "adminAccount" }, method = RequestMethod.GET)
	public String showAccount(ModelMap model) {
		List<Account> listAcc = accountDAL.getLUser();
			
		model.addAttribute("listAccounts", listAcc);
		model.addAttribute("size", listAcc.size());
		return "admin/adminAccount";
	}	
	
	
	
	///////////////////////////////////  Bill - Order  /////////////////////////////////// 
	
	
	
	///////////////////////////////////  PRODUCT  /////////////////////////////////// 
	
	// Show List Products
	@RequestMapping(value = { "adminProducts" }, method = RequestMethod.GET)
	public String adminListProducts(ModelMap model) {
		
		model.addAttribute("listProducts", productDAL.getLProd());
		model.addAttribute("size", productDAL.getLProd().size());
		
		return "admin/adminProduct";
	}
	

	// Show  Product's Details
//	@RequestMapping(value = { "adminProd/{prodID}" }, method = RequestMethod.GET)
//	public String showProductDetail(ModelMap model, @PathVariable("prodID") String prodID) {
//		Product prod = productDAL.getProduct(prodID);
//		model.addAttribute("p", prod); 
//		
//		return "admin/adminViewProd";
//	}
	
	// ADD product
	@RequestMapping(value="adminAddProd", method=RequestMethod.GET)
	public String viewAdminAddProd( ModelMap model) {
		model.addAttribute("listCats", productDAL.getLCat());
		return "admin/adminAddProd";
	}
	// ADD product
	@RequestMapping(value="adminAddProd", method=RequestMethod.POST)
	public String viewAdminAddProd( ModelMap model,
			@RequestParam("ID") String id,
			@RequestParam("cat") String cat,
			@RequestParam("name") String name,
			@RequestParam("price") Float price, 
			@RequestParam("image") String image) {
		
		Product prod = new Product();
		prod.setIdProduct(id);
		prod.setProductCategory(productDAL.getCat(cat));
		prod.setName(name);
		prod.setPrice(price);
		prod.setImage(image);
		
		if(!productDAL.saveProduct(prod)) {
			return "admin/adminAddProd";
		}
		
		return "redirect:/admin/adminProducts.htm";
	}
	
	
	//DELETE PRoduct
	@RequestMapping(value="deleteProduct/{id}", method=RequestMethod.GET)
	public String DeleteProd( ModelMap model, @PathVariable("id") String id) {
		System.out.println(id);
		System.out.println(productDAL.deleteProduct(id));
		return "redirect:/admin/adminProducts.htm";
	}
	
	
	
	/////////////Manage MIX PRODUCT
	@RequestMapping(value="adminProd/{idProduct}", method=RequestMethod.GET)
	public String showColorSize( ModelMap model, @PathVariable("idProduct") String id) {
		model.addAttribute("p", productDAL.getProduct(id));
		model.addAttribute("listC", productDAL.getLCS(id));
		model.addAttribute("size", productDAL.getLCS(id).size());
		
		return "admin/viewColorSize";
	}
	
	@RequestMapping(value="addCS/{idProduct}", method=RequestMethod.GET)
	public String addColorSize( ModelMap model, @PathVariable("idProduct") String id) {
		model.addAttribute("p", productDAL.getProduct(id));
		
		
		return "admin/addCS";
	}
	
	@RequestMapping(value="addCS/{idProduct}", method=RequestMethod.POST)
	public String addColorSize( ModelMap model, @PathVariable("idProduct") String id,
			@RequestParam("color") String color,
			@RequestParam("size") String size,
			@RequestParam("quantity") Integer quantity) {
		
		model.addAttribute("p", productDAL.getProduct(id));
	
		SizeAndColor.PK pk = new SizeAndColor.PK();
		pk.setColor(color);
		pk.setProductID(id);
		pk.setSize(size);
		
		
		SizeAndColor cs = new SizeAndColor();
		cs.setPk(pk);
		cs.setQuantity(quantity);
		
		if(!productDAL.saveCS(cs)) {
			model.addAttribute("color", color);
			model.addAttribute("size", size);
			model.addAttribute("quantity", quantity);
			
			return "redirect:/admin/addCS/" + id + ".htm";
		}
		
		return "redirect:/admin/adminProd/" + id + ".htm";
	}
	
	
	@RequestMapping(value="deleteCS/{idProduct}_{color}_{size}", method=RequestMethod.GET)
	public String deleteColorSize( ModelMap model, 
			@PathVariable("idProduct") String id,
			@PathVariable("color") String color,
			@PathVariable("size") String size) {
		
		System.out.println(id);
		System.out.println(color);
		System.out.println(size);
		
		productDAL.deleteCS(id, color, size);
		return "redirect:/admin/adminProd/" + id + ".htm";
	}
	
	@RequestMapping(value="editCS/{idProduct}_{color}_{size}", method=RequestMethod.GET)
	public String editColorSize( ModelMap model, 
			@PathVariable("idProduct") String id,
			@PathVariable("color") String color,
			@PathVariable("size") String size) {
		
		model.addAttribute("p", productDAL.getProduct(id));
		model.addAttribute("c", productDAL.getCS(id, color, size));
		 
		return "admin/editCS";
	}
	
	@RequestMapping(value="editCS/{idProduct}_{color}_{size}", method=RequestMethod.POST)
	public String editColorSize( ModelMap model, 
			@PathVariable("idProduct") String id,
			@PathVariable("color") String color,
			@PathVariable("size") String size,
			@RequestParam("quantity") Integer quantity) {
		
		productDAL.updateCS(id, color, size, quantity);
		 
		model.addAttribute("p", productDAL.getProduct(id));
		model.addAttribute("listC", productDAL.getLCS(id));
		model.addAttribute("size", productDAL.getLCS(id).size());
		
		return "admin/viewColorSize";
	} 
	
	
	// Edit Product
	@RequestMapping(value = { "editProd/{prodID}" }, method = RequestMethod.POST)
	public String adminProduct(ModelMap model, @PathVariable("prodID") String prodID,
			@RequestParam("cat") String cat,
			@RequestParam("name") String name,
			@RequestParam("price") Float price, 
			@RequestParam("image") String image) {

		
		if(productDAL.updateProduct(prodID, cat, name, price, image)) {
			return "redirect:/admin/adminProd/" + prodID +  ".htm";
		}
		
		model.addAttribute("message", "Update failed!");
		model.addAttribute("p", productDAL.getProduct(prodID));
		model.addAttribute("listCats", productDAL.getLCat());
		return "admin/adminEditProd";
	}
	
	// Save edit product 
	@RequestMapping(value = { "editProd/{prodID}" }, method = RequestMethod.GET)
	public String adminProduct(ModelMap model, @PathVariable("prodID") String prodID) {
		Product prod = productDAL.getProduct(prodID);
		model.addAttribute("p", prod); 
		model.addAttribute("listCats", productDAL.getLCat());
		
		return "admin/adminEditProd";
	}
	
	
//	// Save  Product's Details
//		@RequestMapping(value = { "adminProducts" }, method = RequestMethod.POST)
//		public String adminSaveProduct(ModelMap model, 
//				@RequestParam("name") String name,
//				@RequestParam("price") Float price,
//				@RequestParam("color") String color,
//				@RequestParam("size") String size,
//				@RequestParam("quantity") Integer quantity,
//				@RequestParam("id") String id
//				) {
//			
//			Session session = factory.openSession();
//			Transaction t = session.beginTransaction();
//			
//			Product prod = (Product) session.get( Product.class, id);
//			
//			prod.setName(name);
//			prod.setPrice(price);
//			
//			
//			try {
//				session.update(prod);
//				t.commit();
//				
//			} catch( Exception e ) {
//				t.rollback();
//			} finally {
//				session.close();
//			}
//			
//			return "redirect:/admin/adminProducts.htm";
//		}
//	
//		
	
	
//		
//		
//		
//		
//		
//	// Show Accounts' information
//	@RequestMapping(value = { "adminAccount" }, method = RequestMethod.GET)
//	public String Customers(ModelMap model) {
//		List<Account> listAcc = getListAccount();
//		
//		model.addAttribute("listAccounts", listAcc);
//		model.addAttribute("size", listAcc.size());
//		return "admin/adminAccount";
//	}
//	
//	
//	
//	
//	
//	
//	// Show Orders' Details
//	@RequestMapping(value = { "adminBill" }, method = RequestMethod.GET)
//	public String adminBill(ModelMap model) {
////		List<Order> listOrders = getLOrder();
////		model.addAttribute("orders", listOrders);
//		return "admin/adminBill";
//	}
//	
//	@RequestMapping(value = { "adminBillInfo" }, method = RequestMethod.GET)
//	public String adminBillInfo(ModelMap model) {
//		return "admin/adminBillInfo";
//	}
	

	
	
	
	
	
	
	
	
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
//	@RequestMapping(value = { "adminHome" }, method = RequestMethod.GET)
//	public String adminHome(HttpServletRequest request, ModelMap model) {
//		List<Order> listOrder = getLOrder();
//		model.addAttribute("listOrder", listOrder);
//		HttpSession httpSession = request.getSession();
//		Account admin = (Account) httpSession.getAttribute("admin");
//		httpSession.setAttribute("admin", admin);
//		httpSession.setAttribute("totalCus", getLcus().size());
//		httpSession.setAttribute("totalAd", getLAdmin().size());
//		httpSession.setAttribute("totalOrder", getLOrder().size());
//		return "admin/adminHome";
//	}
	

//	// insert product
//	@Autowired
//	ServletContext context;
//
//	public boolean FindFileByExtension(String fileName) {
//
//		String path = fileName.substring(fileName.lastIndexOf(".") + 1);
//		if (path.equalsIgnoreCase("jpg") || path.equalsIgnoreCase("png") || path.equalsIgnoreCase("jpeg"))
//			return true;
//		return false;
//	}
//
//	@RequestMapping(value = { "insert_product" }, method = RequestMethod.GET)
//	public String insert_product(ModelMap model, HttpSession httpSession) {
////		model.addAttribute("sizes", getSize());
//		httpSession.removeAttribute("p");
//		model.addAttribute("p", new Product());
//		return "admin/insert_product";
//	}
//
//	@RequestMapping(value = "insert_product", method = RequestMethod.POST)
//	public String insert_product(ModelMap model, @ModelAttribute("p") Product prod, BindingResult errors,
//			@RequestParam("image") MultipartFile image) {
//		Session session = factory.openSession();
//		Transaction t = session.beginTransaction();
//		boolean errorss = false;
//		if (prod.getName().trim().length() == 0) {
//			errors.rejectValue("name", "p", "T??n kh??ng ???????c ????? tr???ng!");
//			errorss = true;
//		}
//
//		if (prod.getPrice() <= 0) {
//			errors.rejectValue("price", "p", "Gi?? ph???i l???n h??n 0!");
//			errorss = true;
//		}
//
//		if (prod.getQuantity() <= 0) {
//			errors.rejectValue("quantity", "p", "S??? l?????ng ph???i l???n h??n 0!");
//			errorss = true;
//		}
//
//		if (image.isEmpty()) {
//			errors.rejectValue("image", "p", "H??nh ???nh kh??ng ???????c ????? tr???ng!");
//			errorss = true;
//		} else if (!FindFileByExtension(image.getOriginalFilename())) {
//			errors.rejectValue("image", "p", "Vui l??ng ch???n file theo ????ng ?????nh d???ng!");
//			errorss = true;
//		} else {
//			try {
//				Date date = new Date();
//				SimpleDateFormat simpleDateFormat = new SimpleDateFormat("ddMMyyyyHHmmss_");
//				String dateFormat = simpleDateFormat.format(date);
//				String imagePath = context
//						.getRealPath("resources/page/images/" + dateFormat + image.getOriginalFilename());
//				image.transferTo(new File(imagePath));
//				prod.setImage(dateFormat + image.getOriginalFilename());
//			} catch (Exception e) {
//				errors.rejectValue("image", "p", "Vui l??ng ch???n file theo ????ng ?????nh d???ng!");
//				errorss = true;
//			}
//		}
//
//		if (!errorss)
//			model.addAttribute("message", "Nh???p ch??nh x??c");
//		else {
//			model.addAttribute("message", "Y??u c???u nh???p ?????y ????? th??ng tin !");
//			return "admin/insert_product";
//		}
//
//		try {
////			prod.setStatus(true);
//			session.save(prod);
//			t.commit();
//			model.addAttribute("message", "Th??m  th??nh c??ng");
//			return "redirect:/admin/view_product.htm";
//
//		} catch (Exception e) {
//			model.addAttribute("message", "Th??m th???t b???i !");
//			t.rollback();
//		} finally {
//			session.close();
//		}
//		return "admin/insert_product";
//	}
//
//	// edit product
//
//	@RequestMapping(value = { "edit_product/{id_product}" }, method = RequestMethod.GET)
//	public String edit_product(ModelMap model, @PathVariable("id_product") int id_product, HttpSession httpSession) {
//		Session session = factory.getCurrentSession();
//		Product p = (Product) session.get(Product.class, id_product);
//		model.addAttribute("p", p);
//		httpSession.setAttribute("p", p);
//		return "admin/edit_product";
//	}
//
//	@RequestMapping(value = "edit_product/{id_product}", method = RequestMethod.POST)
//	public String edit_product(ModelMap model, @ModelAttribute("p") Product prod, BindingResult errors,
//			@RequestParam("image") MultipartFile image) {
//		Session session = factory.openSession();
//		Transaction t = session.beginTransaction();
//		boolean errorss = false;
//		if (prod.getName().trim().length() == 0) {
//			errors.rejectValue("name", "p", "T??n kh??ng ???????c ????? tr???ng!");
//			errorss = true;
//		}
//
//		if (prod.getPrice() == 0) {
//			errors.rejectValue("price", "p", "Gi?? kh??ng ???????c ????? tr???ng!");
//			errorss = true;
//		}
//
//		if (prod.getQuantity() < 0) {
//			errors.rejectValue("quality", "p", "S??? l?????ng ph???i l???n h??n kh??ng!");
//			errorss = true;
//		}
//		if (prod.getImage() != null && !image.isEmpty()) {
//			if (!FindFileByExtension(image.getOriginalFilename())) {
//				errors.rejectValue("image", "p", "Vui l??ng ch???n file theo ????ng ?????nh d???ng!");
//				errorss = true;
//			} else {
//				try {
//					Date date = new Date();
//					SimpleDateFormat simpleDateFormat = new SimpleDateFormat("ddMMyyyyHHmmss_");
//					String dateFormat = simpleDateFormat.format(date);
//
//					String imagePath = context
//							.getRealPath("resources/page/images/" + dateFormat + image.getOriginalFilename());
//					image.transferTo(new File(imagePath));
//
//					prod.setImage(dateFormat + image.getOriginalFilename());
//				} catch (Exception e) {
//					errors.rejectValue("image", "p", "Vui l??ng ch???n file theo ????ng ?????nh d???ng!");
//					errorss = true;
//				}
//			}
//		}
//
//		if (!errorss)
//			model.addAttribute("message", "Nh???p ch??nh x??c");
//		else {
//			model.addAttribute("message", "Y??u c???u nh???p ?????y ????? th??ng tin !");
//			return "admin/edit_product";
//		}
//
//		try {
//			session.update(prod);
//			t.commit();
//			model.addAttribute("message", "S???a  th??nh c??ng");
//			return "redirect:/admin/view_product.htm";
//
//		} catch (Exception e) {
//			model.addAttribute("message", "S???a th???t b???i !");
//			t.rollback();
//		} finally {
//			session.close();
//		}
//		return "admin/edit_product";
//	}
//
//	// delete product
//	@RequestMapping(value = { "delete_product/{id_product}" })
//	public String delete_product(ModelMap model, @PathVariable("id_product") int id_product) {
//		Session session = factory.openSession();
//		Transaction t = session.beginTransaction();
//		try {
//			Product p = (Product) session.get(Product.class, id_product);
//			session.delete(p);
//			t.commit();
//			model.addAttribute("message", "X??a th??nh c??ng");
//
//		} catch (Exception ex) {
//			model.addAttribute("message", "Kh??ng th??? x??a s???n ph???m n??y v?? ???? t???n t???i trong h??a ????n kh??ch h??ng");
//			t.rollback();
//		} finally {
//			session.close();
//		}
//
//		Session session1 = factory.getCurrentSession();
//		String hql1 = "FROM Product";
//		Query query = session1.createQuery(hql1);
//		List<Product> list = query.list();
//		List<Product> newList = new ArrayList<>();
//		int countProduct = (list.size() < 28) ? list.size() : 28;
//		for (int i = 0; i < countProduct; i++) {
//			newList.add(list.get(i));
//		}
//		model.addAttribute("pros", newList);
//
//		return "admin/view_product";
//	}
//
//	// delete product
//	@RequestMapping(value = { "stop_product/{id_product}" })
//	public String stop_product(ModelMap model, @PathVariable("id_product") int id_product) {
//		Session session = factory.openSession();
//		Transaction t = session.beginTransaction();
////		try {
////			Product p = (Product) session.get(Product.class, id_product);
////			if (p.isStatus()) {
////				p.setStatus(false);
////				model.addAttribute("message", "S???n ph???m ???? chuy???n sang tr???ng th??i ng???ng b??n");
////			} else {
////				p.setStatus(true);
////				model.addAttribute("message", "S???n ph???m ???? chuy???n sang tr???ng th??i b??n");
////			}
////			session.update(p);
////			t.commit();
////		} catch (Exception ex) {
////			t.rollback();
////		} finally {
////			session.close();
////		}
//		Session session1 = factory.getCurrentSession();
//		String hql1 = "FROM Product";
//		Query query = session1.createQuery(hql1);
//		List<Product> list = query.list();
//		List<Product> newList = new ArrayList<>();
//		int countProduct = (list.size() < 28) ? list.size() : 28;
//		for (int i = 0; i < countProduct; i++) {
//			newList.add(list.get(i));
//		}
//		model.addAttribute("pros", newList);
//		return "admin/view_product";
//	}
//
//	// edit cus
//
//	@RequestMapping(value = { "edit_cus/{email}" }, method = RequestMethod.GET)
//	public String edit_cus(ModelMap model, @PathVariable("email") String email, HttpSession httpSession) {
//		Session session = factory.getCurrentSession();
//		Account cus = (Account) session.get(Account.class, email);
//		model.addAttribute("cus", cus);
////		model.addAttribute("genders", genders());
//		httpSession.setAttribute("cus", cus);
//		return "admin/edit_cus";
//	}
//
//	@RequestMapping(value = { "edit_cus/{email}" }, method = RequestMethod.POST)
//	public String edit_cus(ModelMap model, @ModelAttribute("cus") Account cus, BindingResult errors,
//			@RequestParam("image") MultipartFile image) {
//		Session session = factory.openSession();
//		Transaction t = session.beginTransaction();
//		boolean errorss = false;
//		List<Account> l = getLUser();
//		if (cus.getFullname().trim().length() == 0) {
//			errors.rejectValue("fullname", "cus", "T??n kh??ng ???????c ????? tr???ng!");
//			errorss = true;
//		}
//
//		if (cus.getAddress().trim().length() == 0) {
//			errors.rejectValue("Address", "cus", "?????a ch??? kh??ng ???????c ????? tr???ng!");
//			errorss = true;
//		}
//
//		String regexNumber = "0\\d{9}";
//		Pattern patternNumber = Pattern.compile(regexNumber);
//
//		if (cus.getPhone().trim().length() == 0) {
//			errors.rejectValue("phone", "cus", "S??? ??i???n tho???i kh??ng ???????c b??? tr???ng.");
//			errorss = true;
//		} else {
//			Matcher matcher1 = patternNumber.matcher(cus.getPhone().trim());
//			if (!matcher1.matches()) {
//				errors.rejectValue("phone", "cus", "Y??u c???u nh???p ????ng S??? ??i???n tho???i");
//				errorss = true;
//			}
//			for (Account a : l) {
//				if (a.getPhone().equalsIgnoreCase(cus.getPhone()) && !a.getUser_name().equals(cus.getUser_name())) {
//					errors.rejectValue("phone", "user", "S??? ??i???n tho???i n??y ???? ???????c s??? d???ng");
//					errorss = true;
//				}
//			}
//		}
//		if (!image.isEmpty() && cus.getImage() != null) {
//			if (!FindFileByExtension(image.getOriginalFilename())) {
//				errors.rejectValue("image", "cus", "Vui l??ng ch???n file theo ????ng ?????nh d???ng!");
//				errorss = true;
//			} else {
//				try {
//					Date date = new Date();
//					SimpleDateFormat simpleDateFormat = new SimpleDateFormat("ddMMyyyyHHmmss_");
//					String dateFormat = simpleDateFormat.format(date);
//
//					String imagePath = context
//							.getRealPath("resources/page/images/" + dateFormat + image.getOriginalFilename());
//					image.transferTo(new File(imagePath));
//
//					cus.setImage(dateFormat + image.getOriginalFilename());
//				} catch (Exception e) {
//					errors.rejectValue("image", "cus", "Vui l??ng ch???n file theo ????ng ?????nh d???ng!");
//					errorss = true;
//				}
//			}
//		}
//
//		if (!errorss)
//			model.addAttribute("message", "Nh???p ch??nh x??c");
//		else {
//			model.addAttribute("message", "Y??u c???u nh???p ?????y ????? th??ng tin !");
//			return "admin/edit_cus";
//		}
//
//		try {
//			session.update(cus);
//			t.commit();
//			model.addAttribute("message", "S???a  th??nh c??ng");
//			return "redirect:/admin/view_customers.htm";
//
//		} catch (Exception e) {
//			model.addAttribute("message", "S???a th???t b???i !");
//			t.rollback();
//		} finally {
//			session.close();
//		}
//		return "admin/edit_cus";
//	}
//
//	// delete cus
//	@RequestMapping(value = { "delete_cus/{email}" })
//	public String delete_cus(ModelMap model, @PathVariable("email") String email) {
//
//		Session session = factory.openSession();
//		Transaction t = session.beginTransaction();
//		try {
//			Account cus = (Account) session.get(Account.class, email);
//			session.delete(cus);
//			t.commit();
//			model.addAttribute("message", "X??a th??nh c??ng");
//		} catch (Exception ex) {
//			model.addAttribute("message", "Kh??ch h??ng n??y ???? mua h??ng Kh??ng th??? x??a!");
//			t.rollback();
//		} finally {
//			session.close();
//		}
//
//		Session session1 = factory.getCurrentSession();
//		String hql = "from Account where Role = 2";
//		Query query = session1.createQuery(hql);
//		List<Account> listcus = query.list();
//		model.addAttribute("listcus", listcus);
//		return "admin/view_customers";
//	}
//
//	public void restoreQuantityProduct(int id_order) {
//		Session session = factory.openSession();
//		Transaction t = session.beginTransaction();
//		String hql = "FROM OrderDetail d Where d.order.ID_order = " + id_order;
//		Query query = session.createQuery(hql);
//		List<OrderDetail> list = query.list();
//		Product prod;
//		for (OrderDetail o : list) {
//			Session session1 = factory.openSession();
//			Transaction t1 = session1.beginTransaction();
//			prod = (Product) session1.get(Product.class, o.getProd().getIdProduct());
//			try {
//				prod.setQuantity(prod.getQuantity() + o.getQuantity());
//				session1.update(prod);
//				t1.commit();
//			} catch (Exception e) {
//				t.rollback();
//			}
//		}
//		session.close();
//	}
}
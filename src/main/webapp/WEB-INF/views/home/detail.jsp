<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- <!DOCTYPE html> -->
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Riode - Show products</title>
    <base href="${pageContext.servletContext.contextPath}/">

	<link rel="icon" type="image/png"
	href="https://d-themes.com/html/riode/images/icons/favicon.png">
    <link href="<c:url value='/resources/home/dist/css/reset.css' />"
	rel="stylesheet">
	<link href="<c:url value='/resources/home/dist/css/detail.css' />" rel="stylesheet">
	<link href="<c:url value='/resources/home/dist/css/owl.carousel.css' />" rel="stylesheet">
	<link href="<c:url value='/resources/home/dist/css/owl.theme.default.css' />" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
     
     
     <%@include file="/WEB-INF/views/header.jsp"%>
     

    <main class="main">
        <div class="container">
            <div class="product">
                
                <form:form action="cart/add.htm" method="post" modelAttribute="cartItem" class="flex-col">
                	<div class="row">
	                    <div class="col-5 product-image">
	                        <img src="${cartItem.getImage() }" alt="">
	                    </div>
	                    <div class="col-7 product-detail">
	                        <div class="product-navigation">
	                            <a href="home/index.htm"><i class="fa-solid fa-house"></i></a>
	                            <i class="fa-solid fa-angle-right"></i>
	                            <a href="home/products.htm">Products</a>
	                            <i class="fa-solid fa-angle-right"></i>
	                            Detail
	                        </div>

	                        <h2 class="product-name">${cartItem.name }</h2>
	                        <div class="product-meta">
	                            <div class="product-sku">
	                                SKU: ${cartItem.idProduct }
	                            </div>

	                            <div class="product-brand">
	                                BRAND: The NorthFace
	                            </div>
	                        </div>

	                        <div class="product-price">$${cartItem.price }</div>

	                        <div class="product-rating">
	                            <ul class="list-stars">
	                                <li class="active"><i class="fa-solid fa-star"></i></li>
	                                <li class="active"><i class="fa-solid fa-star"></i></li>
	                                <li class="active"><i class="fa-solid fa-star"></i></li>
	                                <li><i class="fa-solid fa-star"></i></li>
	                                <li><i class="fa-solid fa-star"></i></li>
	                            </ul>

	                            ( 6 Reviews )
	                        </div>

	                        <div class="product-short-desc">Sed egestas, ante et vulputate volutpat, eros pede semper est, vitae luctus metus libero eu augue. Morbi purus liberpuro ate vol faucibus adipiscing.</div>
	                        <div class="product-short-desc">Lorem ipsum dolor sit amet consectetur adipisicing elit. Illo architecto quo sed assumenda similique sequi iusto accusantium optio quisquam officia ipsam, nobis sint commodi saepe, deleniti modi ullam ab cum.</div>

	                        <div class="product-form">
	                            <label for="">Color:</label>
	                            <select name="colors" id="color">
	                                <option value="black">Black</option>
	                                <option value="blue">Blue</option>
	                                <option value="green">Green</option>
	                                <option value="yellow">Yellow</option>

	                            </select>
	                        </div>

	                        <div class="product-form">
	                            <label for="">Size:</label>
	                            <select name="sizes" id="size">
	                                <option value="s">Small</option>
	                                <option value="m">Medium</option>
	                                <option value="l">Large</option>
	                                <option value="xl">Extra Large</option>
	                            </select>
	                        </div>

	                        <div class="product-devider"></div>

	                        <div class="product-form">
	                            <div class="form-control">
	                                <button class="quantity-minus"><i class="fa-solid fa-minus"></i></button>
	                                <form:input path="quantity" type="number" name="quantity" value="1" min="1" max="100"/>
	                                <button class="quantity-plus"><i class="fa-solid fa-plus"></i></button>
	                            </div>

	                            <button class="add-cart" type="submit"><i class="fa-solid fa-basket-shopping"></i>Add to Cart</button>
	                        </div>

	                        <div class="product-devider"></div>

	                        <div class="brands">
	                            <i class="fa-brands fa-facebook-f"></i>
	                            <i class="fa-brands fa-twitter"></i>
	                            <i class="fa-brands fa-instagram"></i>
	                        </div>
	                    </div>
	                </div>

	                <form:input path="userPhone" type="hidden" class="form-control" />
	                <form:input path="idProduct" type="hidden" class="form-control" />
	                <form:input path="name" type="hidden" class="form-control" />
	                <form:input path="color" type="hidden" class="form-control" />
	                <form:input path="size" type="hidden" class="form-control" />
	                <form:input path="price" type="hidden" class="form-control" />
	                <form:input path="image" type="hidden" class="form-control" />

                </form:form>
                
            </div>

            <div class="desc">
                <h2 class="title">Description</h2>

                <div class="row desc-main">
                    <div class="col-6 features">
                        <h5 class="desc-title">Features</h5>
                        <p>Praesent id enim sit amet.Tdio vulputate eleifend in in tortor. ellus massa. siti iMassa ristique sit amet condim vel, facilisis quimequistiqutiqu amet condim Dilisis Facilisis quis sapien. Praesent id enim sit amet.</p>
                        <ul>
                            <li><i class="fa-solid fa-check"></i>Praesent id enim sit amet.Tdio vulputate</li>
                            <li><i class="fa-solid fa-check"></i>Eleifend in in tortor. ellus massa.Dristique sitii</li>
                            <li><i class="fa-solid fa-check"></i>Massa ristique sit amet condim vel</li>
                            <li><i class="fa-solid fa-check"></i>Dilisis Facilisis quis sapien. Praesent id enim sit amet</li>
                        </ul>

                        <h5 class="desc-title">Specifications</h5>
                        <table>
                            <tr>
                                <th>Material</th>
                                <td>Praesent id enim sit amet.Tdio</td>
                            </tr>
                            <tr>
                                <th>Claimed Size</th>
                                <td>Praesent id enim sit</td>

                            </tr>
                            <tr>
                                <th>Recommended Use</th>
                                <td>Praesent id enim sit amet.Tdio vulputate eleifend in in tortor. ellus massa. siti</td>

                            </tr>
                            <tr>
                                <th>Manufacturer</th>
                                <td>Praesent id enim</td>

                            </tr>
                        </table>
                    </div>

                    <div class="col-6 video-desc">
                        <h5 class="desc-title">Video Description</h5>

                        <div class="video">
                            <img src="https://d-themes.com/html/riode/images/product/product.jpg" alt="">
                            <a href=""><i class="fa-solid fa-play"></i></a>
                        </div>

                        <div class="row benefits">
                            <div class="col-6 icon-box">
                                <div class="icon-box-icon">
                                    <i class="fa-solid fa-lock"></i>
                                </div>

                                <div class="icon-box-content">
                                    <h4>2 year warranty</h4>
                                    <p>Guarantee with no doubt</p>
                                </div>
                            </div>

                            <div class="col-6 icon-box">
                                <div class="icon-box-icon">
                                    <i class="fa-solid fa-truck-fast"></i>
                                </div>

                                <div class="icon-box-content">
                                    <h4>free shipping</h4>
                                    <p>On orders over $50.00</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <section class="show-products" style="padding-bottom: 50px;">
                <div class="container">
    
                    Title 
                    <h4 class="title">
                        Related Products
                        <a href="home/products.htm" class="more hover-p-color">VIEW MORE <i class="fa-solid fa-arrow-right"></i></a>
                    </h4>
    
                    List Product Show
                    <div class="owl-carousel owl-theme">
    
                         A product 
					<c:forEach var="p" items="${prods}" begin="0" end="15" step="3">
						<div class="col-4 product">
							<div class="product-image">
								<img
									src="${p.image }"
									alt="">

								<div class="new">NEW</div>

								<a href="home/detail/${p.idProduct}.htm" class="btn-view">VIEW DETAILS</a> <a
									href="" class="btn-add"> <i
									class="fa-solid fa-bag-shopping"></i>
								</a>
							</div>

							<div class="product-content">
								<a href="" class="product-category hover-p-color">${p.getProductCategory().nameCategory }</a>

								<h2>
									<a href="home/detail/${p.idProduct}.htm" class="product-name hover-p-color">${p.name }</a>
								</h2>

								<p class="product-price">${p.price }</p>

								<div class="review">
									<ul class="list-stars">
										<li class="active"><i class="fa-solid fa-star"></i></li>
										<li class="active"><i class="fa-solid fa-star"></i></li>
										<li class="active"><i class="fa-solid fa-star"></i></li>
										<li><i class="fa-solid fa-star"></i></li>
										<li><i class="fa-solid fa-star"></i></li>
									</ul>

									( 6 Reviews )
								</div>
							</div>
						</div>
					</c:forEach>
     
    
                        
                       
                    </div>
                </div>
            </section>
        </div>
    </main>

    

    Footer 
     <%@include file="/WEB-INF/views/footer.jsp"%>

</body>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
    <script src="<c:url value='/resources/home/dist/js/owl.carousel.js' />"></script>
    <script src="<c:url value='/resources/home/dist/js/home.js' />"></script>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Riode - Bill Report</title>
    <base href="${pageContext.servletContext.contextPath}/">
    <link rel="icon" type="image/png" href="https://d-themes.com/html/riode/images/icons/favicon.png">

    <link href="<c:url value='/resources/home/dist/css/reset.css' />" rel="stylesheet">
    <link href="<c:url value='/resources/home/dist/css/adminEditProd.css' />" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<body>
    
    <aside class="aside">
        <a href="admin/adminHome.htm" class="admin">
            <div class="logo">
                <i class="fa-solid fa-a"></i>
            </div>
            Admin
        </a>

        <ul class="functions">
            <li class="function">
                <a href="admin/adminAccount.htm">
                    <div class="icon">
                        <i class="fa-solid fa-users"></i>
                    </div>
                    Account 
                </a>
            </li>

            <li class="function">
                <a href="admin/adminBill.htm" >
                    <div class="icon">
                        <i class="fa-solid fa-receipt"></i>

                    </div>
                    Bill 
                </a>
            </li>

            <li class="function">
                <a href="admin/adminProducts.htm"  class="active">
                    <div class="icon">
                        <i class="fa-solid fa-shirt"></i>
                    </div>
                    Products 
                </a>
            </li>

            
        </ul>

        <button class="btn-log-out"><a href="user/logout.htm">Log out</a></button>
    </aside>

    <!-- Main -->
    <main class="main">

        <!-- Map  -->
        <div class="main-header">
            <div class="header-left">
                <h2>Manage Products</h2>

                <div class="map">
                    <a href="home/index.htm">Home</a>
                    /
                    <a href="admin/adminHome.htm">Admin</a>
                    /
                    <a href="admin/adminProducts.htm">Edit Product</a>
                </div>
            </div>

            <div class="header-right">
                 
            </div>
        </div>

       

        <!-- Main talbe data  -->
        <div class="main-content">
            <div class="row">
                <div class="col-4 image">
                    <div class="cloth-temp">
                        <i class="fa-solid fa-cloud-arrow-down"></i>
                    </div>
                </div>
            
                <div class="col-8">
                    <div class="row info">
                        <div class="col-6 field id">
                            <label for="">ID:</label>
                            <input type="text" value="" placeholder="Type product ID here..." > 
                        </div>
    
                        <div class="col-6 field name">
                            <label for="">Category:</label>
                            <div class="product-form">
                                <select name="" id="">
                                    
                                    <c:forEach var="c" items="${listCats }" begin="0" end="6">
                                    	<option value="c.idCategory">${c.nameCategory }</option>
                                    </c:forEach>
                                    
                                </select>
                            </div>
                        </div>


                        <div class="col-6 field name">
                            <label for="">Name:</label>
                            <input type="text" value="" placeholder="Type product name here...">
                        </div>
    
                        <div class="col-6 field price">
                            <label for="">Price:</label>
                            <input type="number" name="" id="" value="59.99">
                        </div>
    
                        <div class="col-6 field color">
                            <label for="">Color:</label>
                            <div class="product-form">
                                <select name="" id="">
                                    <option value="black">Black</option>
                                    <option value="blue">Blue</option>
                                    <option value="green">Green</option>
                                    <option value="yellow">Yellow</option>
                                </select>
                            </div>
                        </div>
    
                        <div class="col-6 field size">
                            <label for="">Size:</label>
                            <div class="product-form">
                                <select name="" id="">
                                    <option value="black">Black</option>
                                    <option value="blue">Blue</option>
                                    <option value="green">Green</option>
                                    <option value="yellow">Yellow</option>
                                </select>
                            </div>
                        </div>
    
                        <div class="col-6 field quantity">
                            <label for="">Quantity:</label>
                            <div class="form-control">
                                <button class="quantity-minus"><i class="fa-solid fa-minus"></i></button>
                                <input type="number" value="1" min="1" max="100">
                                <button class="quantity-plus"><i class="fa-solid fa-plus"></i></button>
                            </div>
    
                        </div>

                        <div class="col-6 field">
                            <label for="">Image file:</label>
                            <input type="file">
                        </div>

                    </div>
                </div>
            </div>

            
            <button class="col-6 btn-save">Add product</button>

        </div>
    </main>

  

</body>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
    <script src="<c:url value='/resources/home/dist/js/owl.carousel.js' />"></script>
	<script src="<c:url value='/resources/home/dist/js/home.js' />"></script>
</html> 
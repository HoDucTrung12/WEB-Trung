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
    <title>Riode - Manage Account</title>
    <base href="${pageContext.servletContext.contextPath}/">
    <link rel="icon" type="image/png" href="https://d-themes.com/html/riode/images/icons/favicon.png">

    <link href="<c:url value='/resources/home/dist/css/reset.css' />" rel="stylesheet">
	<link href="<c:url value='/resources/home/dist/css/adminAccount.css' />" rel="stylesheet">
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
                <a href="admin/adminAccount.htm" class="active">
                    <div class="icon">
                        <i class="fa-solid fa-users"></i>
                    </div>
                    Account 
                </a>
            </li>

            <li class="function">
                <a href="admin/adminBill.htm">
                    <div class="icon">
                        <i class="fa-solid fa-receipt"></i>

                    </div>
                    Bill 
                </a>
            </li>

            <li class="function">
                <a href="admin/adminProducts.htm">
                    <div class="icon">
                        <i class="fa-solid fa-shirt"></i>
                    </div>
                    Products 
                </a>
            </li>

            
        </ul>

        <button class="btn-log-out">Log out</button>
    </aside>

    <!-- Main -->
    <main class="main">
        <div class="main-header">
            <div class="header-left">
                <h2>Manage Account</h2>

                <div class="map">
                    <a href="home/index.htm">Home</a>
                    /
                    <a href="admin/adminHome.htm">Admin</a>
                    /
                    <a href="admin/adminAccount.htm">Account</a>
                </div>
            </div>

            <div class="header-right">

            </div>
        </div>


        <div class="main-content">
            <div class="table-container">
                <table>
                    <tr>
                        <th>Username</th>
                        <th>Password</th>
                        <th>Full name</th>
                        <th>Email</th>
                        <th>Gender</th>
                        <th>Birthday</th>
                        <th>Phone number</th>
                        <th>Address</th>
                        <th>Edit</th>
                    </tr>
    
                    <div class="scroll">
                        <tr>
                            <td>Username</td>
                            <td>Password</td>
                            <td>Full name</td>
                            <td>Email</td>
                            <td>Gender</td>
                            <td>Birthday</td>
                            <td>Phone number</td>
                            <td>Address</td>
                            <td><a href="admin/adminBillInfo.htm" class="icon"><i class="fa-solid fa-pen"></i></a></td>
                        </tr>
    
                        <tr>
                            <td>Username</td>
                            <td>Password</td>
                            <td>Full name</td>
                            <td>Email</td>
                            <td>Gender</td>
                            <td>Birthday</td>
                            <td>Phone number</td>
                            <td>Address</td>
        
                        </tr>
    
                        <tr>
                            <td>Username</td>
                            <td>Password</td>
                            <td>Full name</td>
                            <td>Email</td>
                            <td>Gender</td>
                            <td>Birthday</td>
                            <td>Phone number</td>
                            <td>Address</td>
        
                        </tr>
    
                        <tr>
                            <td>Username</td>
                            <td>Password</td>
                            <td>Full name</td>
                            <td>Email</td>
                            <td>Gender</td>
                            <td>Birthday</td>
                            <td>Phone number</td>
                            <td>Address</td>
        
                        </tr>
    
                        <tr>
                            <td>Username</td>
                            <td>Password</td>
                            <td>Full name</td>
                            <td>Email</td>
                            <td>Gender</td>
                            <td>Birthday</td>
                            <td>Phone number</td>
                            <td>Address</td>
        
                        </tr>
    
                        <tr>
                            <td>Username</td>
                            <td>Password</td>
                            <td>Full name</td>
                            <td>Email</td>
                            <td>Gender</td>
                            <td>Birthday</td>
                            <td>Phone number</td>
                            <td>Address</td>
        
                        </tr>

                        <tr>
                            <td>Username</td>
                            <td>Password</td>
                            <td>Full name</td>
                            <td>Email</td>
                            <td>Gender</td>
                            <td>Birthday</td>
                            <td>Phone number</td>
                            <td>Address</td>
        
                        </tr>

                        <tr>
                            <td>Username</td>
                            <td>Password</td>
                            <td>Full name</td>
                            <td>Email</td>
                            <td>Gender</td>
                            <td>Birthday</td>
                            <td>Phone number</td>
                            <td>Address</td>
        
                        </tr>

                        <tr>
                            <td>Username</td>
                            <td>Password</td>
                            <td>Full name</td>
                            <td>Email</td>
                            <td>Gender</td>
                            <td>Birthday</td>
                            <td>Phone number</td>
                            <td>Address</td>
        
                        </tr>

                        <tr>
                            <td>Username</td>
                            <td>Password</td>
                            <td>Full name</td>
                            <td>Email</td>
                            <td>Gender</td>
                            <td>Birthday</td>
                            <td>Phone number</td>
                            <td>Address</td>
        
                        </tr>

                        <tr>
                            <td>Username</td>
                            <td>Password</td>
                            <td>Full name</td>
                            <td>Email</td>
                            <td>Gender</td>
                            <td>Birthday</td>
                            <td>Phone number</td>
                            <td>Address</td>
        
                        </tr>

                        <tr>
                            <td>Username</td>
                            <td>Password</td>
                            <td>Full name</td>
                            <td>Email</td>
                            <td>Gender</td>
                            <td>Birthday</td>
                            <td>Phone number</td>
                            <td>Address</td>
        
                        </tr>

                        <tr>
                            <td>Username</td>
                            <td>Password</td>
                            <td>Full name</td>
                            <td>Email</td>
                            <td>Gender</td>
                            <td>Birthday</td>
                            <td>Phone number</td>
                            <td>Address</td>
        
                        </tr>
                    </div>
                  
                   
                </table>
            </div>

            <!-- <ul class="report title">
                <li>Username</li>
                <li>Password</li>
                <li>Full name</li>
                <li>Email</li>
                <li>Gender</li>
                <li>Birthday</li>
                <li>Phone number</li>
                <li>Address</li>
            </ul>
            <ul class="list-report">
                <li>
                    <ul class="report">
                        <li>hoducrtungkdsfj</li>
                        <li>124324734</li>
                        <li>Ho Duc Trung</li>
                        <li>hoductrung@gmail,com</li>
                        <li>Gender</li>
                        <li>Birthday</li>
                        <li>Phone number</li>
                        <li>Address</li>
                    </ul>
                </li>
                <li>
                    <ul class="report">
                        <li>hoducrtungkdsfj</li>
                        <li>124324734</li>
                        <li>Ho Duc Trung</li>
                        <li>hoductrung@gmail,com</li>
                        <li>Gender</li>
                        <li>Birthday</li>
                        <li>Phone number</li>
                        <li>Address</li>
                    </ul>
                </li>
                <li>
                    <ul class="report">
                        <li>hoducrtungkdsfj</li>
                        <li>124324734</li>
                        <li>Ho Duc Trung</li>
                        <li>hoductrung@gmail,com</li>
                        <li>Gender</li>
                        <li>Birthday</li>
                        <li>Phone number</li>
                        <li>Address</li>
                    </ul>
                </li>
                <li>
                    <ul class="report">
                        <li>hoducrtungkdsfj</li>
                        <li>124324734</li>
                        <li>Ho Duc Trung</li>
                        <li>hoductrung@gmail,com</li>
                        <li>Gender</li>
                        <li>Birthday</li>
                        <li>Phone number</li>
                        <li>Address</li>
                    </ul>
                </li>
                <li>
                    <ul class="report">
                        <li>hoducrtungkdsfj</li>
                        <li>124324734</li>
                        <li>Ho Duc Trung</li>
                        <li>hoductrung@gmail,com</li>
                        <li>Gender</li>
                        <li>Birthday</li>
                        <li>Phone number</li>
                        <li>Address</li>
                    </ul>
                </li>
                <li>
                    <ul class="report">
                        <li>hoducrtungkdsfj</li>
                        <li>124324734</li>
                        <li>Ho Duc Trung</li>
                        <li>hoductrung@gmail,com</li>
                        <li>Gender</li>
                        <li>Birthday</li>
                        <li>Phone number</li>
                        <li>Address</li>
                    </ul>
                </li>
                <li>
                    <ul class="report">
                        <li>hoducrtungkdsfj</li>
                        <li>124324734</li>
                        <li>Ho Duc Trung</li>
                        <li>hoductrung@gmail,com</li>
                        <li>Gender</li>
                        <li>Birthday</li>
                        <li>Phone number</li>
                        <li>Address</li>
                    </ul>
                </li>
                <li>
                    <ul class="report">
                        <li>hoducrtungkdsfj</li>
                        <li>124324734</li>
                        <li>Ho Duc Trung</li>
                        <li>hoductrung@gmail,com</li>
                        <li>Gender</li>
                        <li>Birthday</li>
                        <li>Phone number</li>
                        <li>Address</li>
                    </ul>
                </li>
                <li>
                    <ul class="report">
                        <li>hoducrtungkdsfj</li>
                        <li>124324734</li>
                        <li>Ho Duc Trung</li>
                        <li>hoductrung@gmail,com</li>
                        <li>Gender</li>
                        <li>Birthday</li>
                        <li>Phone number</li>
                        <li>Address</li>
                    </ul>
                </li>
                <li>
                    <ul class="report">
                        <li>hoducrtungkdsfj</li>
                        <li>124324734</li>
                        <li>Ho Duc Trung</li>
                        <li>hoductrung@gmail,com</li>
                        <li>Gender</li>
                        <li>Birthday</li>
                        <li>Phone number</li>
                        <li>Address</li>
                    </ul>
                </li>
                <li>
                    <ul class="report">
                        <li>hoducrtungkdsfj</li>
                        <li>124324734</li>
                        <li>Ho Duc Trung</li>
                        <li>hoductrung@gmail,com</li>
                        <li>Gender</li>
                        <li>Birthday</li>
                        <li>Phone number</li>
                        <li>Address</li>
                    </ul>
                </li>
                <li>
                    <ul class="report">
                        <li>hoducrtungkdsfj</li>
                        <li>124324734</li>
                        <li>Ho Duc Trung</li>
                        <li>hoductrung@gmail,com</li>
                        <li>Gender</li>
                        <li>Birthday</li>
                        <li>Phone number</li>
                        <li>Address</li>
                    </ul>
                </li>
                <li>
                    <ul class="report">
                        <li>hoducrtungkdsfj</li>
                        <li>124324734</li>
                        <li>Ho Duc Trung</li>
                        <li>hoductrung@gmail,com</li>
                        <li>Gender</li>
                        <li>Birthday</li>
                        <li>Phone number</li>
                        <li>Address</li>
                    </ul>
                </li>
            </ul> -->
        </div>
    </main>

  

</body>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
    <script src="<c:url value='/resources/home/dist/js/owl.carousel.js' />"></script>
	<script src="<c:url value='/resources/home/dist/js/home.js' />"></script>
</html>
<%@page import="java.text.DecimalFormat"%>
<%@page import="dao.DAO"%>
<%@page import="java.util.*"%>
<%@page import="enity.Cart"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
DecimalFormat df = new DecimalFormat(",###");
    
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;
if (cart_list != null) {
	DAO dao = new DAO();
	cartProduct = dao.getCartProducts(cart_list);
	double total = dao.getTotalCartPrice(cart_list);
	request.setAttribute("total", total);
	request.setAttribute("cart_list", cart_list);
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:useBean id="a" class="dao.DAO" scope="request"></jsp:useBean>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PizzaCompany</title>
    <link rel="stylesheet" href="./assets/css/style.css">
    <link rel="stylesheet" href="./assets/css/gird.css">
    <link rel="stylesheet" href="./assets/css/responsive.css">
    <link rel="stylesheet" href="./assets/css/account.css">
    <link rel="stylesheet" href="./assets/css/reset.css">
    <link rel="stylesheet" href="./assets/fonts/fontawesome-free-5.15.4-web/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800;900&display=swap" rel="stylesheet">
</head>
<body>
    
    <div class="app">
        <header class="header">
            <div class="grid header-container">
                <!-- Start header with logo -->
                <div class="header-with-logo">
                    <a href="./" class="header-logo-link">
                        <div class="header-logo"></div>
                    </a>

                    <ul class="manager__page">
                        <c:if test="${sessionScope.acc.isSell == 1 }">
                            <li class="manager__page--item">
                                <a href="" class="manager__page--item-link">Qu???n l?? s???n ph???m & h??a ????n</a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.acc.isAdmin == 1 }">
                            <li class="manager__page--item">
                                <a href="" class="manager__page--item-link">Qu???n l?? Account</a>
                            </li>
                            <li class="manager__page--item">
                                <a href="" class="manager__page--item-link">Doanh s???</a>
                            </li>
                        </c:if>
                    </ul>
                    
                    <c:if test="${sessionScope.acc ==null || (sessionScope.acc.isAdmin == 0 && sessionScope.acc.isSell == 0)}">
                        <div class="header-delivery-with-serach">
                            <div class="header-delivery">
                                <div class="header-delivery_item active">
                                    <i class="fas fa-shipping-fast header-delivery_item-logo"></i>
                                    <span class="header-delivery_item-text">?????t giao h??ng</span>
                                </div>
                                <div class="header-delivery_item">
                                    <i class="fas fa-store-alt header-delivery_item-logo"></i>
                                    <span class="header-delivery_item-text">?????t ?????n l???y</span>
                                </div>
                            </div>

                            <div class="header-search block">
                                <i class="fas fa-map-marker-alt header-search-map"></i>
                                <input class="header-search_title" placeholder="Nh???p ?????a ch??? c???a b???n"></input>
                            </div>

                            <div class="header-search">
                                <i class="fas fa-store header-search-map"></i>
                                <input class="header-search_title" placeholder="Nh???p c???a h??ng"></input>


                                <div class="header-search_store">
                                    <ul class="header-search_store-item">
                                        <li class="header-search_store-list">The Pizza Company C???u Gi???y</li>
                                        <li class="header-search_store-list">The Pizza Company Times City</li>
                                        <li class="header-search_store-list">The Pizza Company ??o??n Tr???n Nghi???p</li>
                                        <li class="header-search_store-list">The Pizza Company Xu??n Di???u</li>
                                        <li class="header-search_store-list">The Pizza Company Vincom B???c T??? Li??m</li>
                                        <li class="header-search_store-list">The Pizza Company Vincom Royal City</li>
                                        <li class="header-search_store-list">The Pizza Company Aeon Mall Long Bi??n</li>
                                        <li class="header-search_store-list">The Pizza Company Aeon Mall H?? ????ng</li>
                                        <li class="header-search_store-list">The Pizza Company Linh ????m</li>
                                        <li class="header-search_store-list">The Pizza Company Tr???n Duy H??ng</li>
                                        <li class="header-search_store-list">The Pizza Company Song H??nh</li>
                                        <li class="header-search_store-list">The Pizza Company Nguy???n Th??? Minh Khai</li>
                                        <li class="header-search_store-list">The Pizza Company 333 L?? V??n S???</li>
                                        <li class="header-search_store-list">The Pizza Company B?? Hom</li>
                                        <li class="header-search_store-list">The Pizza Company Crescent Mall</li>
                                        <li class="header-search_store-list">The Pizza Company Ph???m H??ng</li>
                                        <li class="header-search_store-list">The Pizza Company Ho??ng Hoa Th??m</li>
                                        <li class="header-search_store-list">The Pizza Company Th???ng Nh???t</li>
                                        <li class="header-search_store-list">The Pizza Company AEON Mall T??n Ph??</li>
                                        <li class="header-search_store-list">The Pizza Company Vincom Bi??n H??a</li>
                                        <li class="header-search_store-list">The Pizza Company Pegasus</li>
                                        <li class="header-search_store-list">The Pizza Company Sense City B???n Tre</li>
                                        <li class="header-search_store-list">The Pizza Company Vincom Bu??n Ma Thu???t</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </c:if>

                    <div class="header-account">
                        <c:if test="${sessionScope.acc ==null}">
                            <div class="header-account_login">
                                <i class="far fa-user header-account_login-icon"></i>
                                <a href="signin.jsp" class="header-account-text">????ng nh???p</a>
                            </div>
                            <span>/</span>
                            <div class="header-account_register">
                                <a href="signup.jsp" class="header-account-text">T???o t??i kho???n</a>
                            </div>
                        </c:if>
                        
                        <c:if test="${sessionScope.acc !=null}">
                            <div class="header-account_login">
                                <i class="far fa-user header-account_login-icon"></i>
                                <a href="#" class="header-account-text">${sessionScope.acc.fullname}</a>
                            </div>
                            <span>/</span>
                            <div class="header-account_register">
                                <a href="logout" class="header-account-text">????ng xu???t</a>
                            </div>
                        </c:if>
                    </div>
                </div>
                <!-- End header with logo -->

                <!-- Start navbar -->
                <nav class="navbar">
                    <div class="navbar-select">
                        <ul class="navbar-list">
                            <li class="navbar-list_item">
                                <a href="" class="navbar-list_item-link">
                                    <span class="navbar-list_item-text">Khuy???n m??i</span>
                                </a>
                            </li>
                            <c:forEach items="${a.allCategory}" var="i">
                                <li class="navbar-list_item">
                                    <a href="category?id=${i.id}" class="navbar-list_item-link">
                                        <span class="navbar-list_item-text">${i.name}</span>
                                    </a>
                                </li>
                            </c:forEach>
                            
                        </ul>
                    </div>

                    <div class="navbar-with-search">
                        <div class="navbar_search" onclick="document.querySelector('.search_box').classList.toggle('active')">
                            <i class="fas fa-search navbar_search-icon" ></i>
                        </div>

                        <div class="search_box">
                            <form action="search" method="post">
                                <input type="text" name="txtSearch" value="${txtSearch}" id="" class="search_box_input" placeholder="T??m s???n ph???m">
                                <button type="submit" class="search_box_btn">
                                    <i class="fas fa-search navbar_search-icon"></i>
                                </button>
                            </form>
                        </div>

                        <div class="navbar_cart">
                            <a href="cart.jsp" class="navbar_cart-icon-link">
                                <i class="fas fa-shopping-cart navbar_cart-icon"></i>
                            </a>
                            <a href="cart.jsp" class="navbar_cart-link">
                                <span class="navbar_cart-text">Gi??? h??ng</span>
                            </a>
                            <div class="navbar_cart-amount">
                                <%
                                if (cart_list == null || cart_list.size()<=0) {%>
                                    <span class="navbar_cart-count">0</span>
                                <%}%>
                                
                                <%
                                if (cart_list != null && cart_list.size()>0) {%>
                                    <span class="navbar_cart-count"><%=cart_list.size()%></span>
                                <%}%>
                            </div>
                            
                            <%
                                if (cart_list == null || cart_list.size()<=0) {%>
                            <div class="navbar_cart-list">
                                <p class="navbar_cart-list-title">R???t ti???c!!! B???n kh??ng c?? s???n ph???m ??? ????y.</p>
                                <p class="navbar_cart-list-decrip">Ch??ng t??i s??? giao h??ng v???i ho?? ????n tr??n <span>100,000 ??</span></p>
                            </div>
                            <%}%>
                            
                            <%
                                if (cart_list != null && cart_list.size()>0) {
                            %>
                            <div class="navbar_cart-list" style="min-height: 125px">
                                <%
                                for (Cart c : cartProduct) {%>
                                <div class="navbar_cart-item">
                                    <img src="<%=c.getThumbnail()%>" alt="" class="navbar_cart-item__img">
                                    <div class="navbar_cart-item__title"><%=c.getTitle()%></div>
                                    <div class="navbar_cart-item__price"><%=df.format(c.getPrice())%>??</div>
                                </div>
                                <%}%>
                                <a href="cart.jsp" class="navbar_cart__btn">Xem chi ti???t gi??? h??ng</a>
                            </div>
                            <%}%>
                        </div>
                    </div>
                </nav>
                <!-- Start navbar -->
            </div>
        </header>
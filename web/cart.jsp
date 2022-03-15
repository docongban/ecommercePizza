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


 <!-- Start header -->
<jsp:include page="./include/header.jsp"></jsp:include>
<!-- End header -->

<!-- Start container -->
        <div class="container">
            <%
                if (cart_list == null || cart_list.size()<=0) { %>
                <div class="grid fix-wide">
                    <div class="nocart">
                        <h2 class="nocart__title">Rất tiếc !!! Bạn không có sản phẩm ở đây.</h2>
                        <p class="nocart__content">Chúng tôi sẽ giao hàng với hoá đơn trên <span>100,000 đ</span></p>
                    </div>
                </div>
             <%}%>
            
            <%
                if (cart_list != null && cart_list.size()>0) { %>
            <div class="grid fix-wide">
                <div id="hai_san_pesto" class="product-decrip">
                    <span class="product-name">Sản phẩm</span>
                </div>
                <div class="row">
                    <%
                            for (Cart c : cartProduct) {
                    %>
                        <div class="col l-12">
                            <div class="product-cart">
                                <div class="product-cart__img" style="background-image: url('<%=c.getThumbnail()%>');"></div>
                                <div class="product-cart__content">
                                    <div class="product-cart__content-title"><%=c.getTitle()%></div>
                                    <div class="product-cart__content-decrip" ><%=c.getContent()%></div>
                                </div>
                                <div class="product-cart__price-old"><%=df.format(c.getPrice())%>đ</div>
                                
                                <!--<div class="product-cart__count"><%=c.getQuantity()%></div>-->
                                <a href="quantity-dec-inc?action=dec&id=<%= c.getId()%>" class="product-cart__btn_left"><i class="fas fa-angle-left"></i></a> 
                                <input type="text" name="quantity" value="<%= c.getQuantity()%>" class="product-cart__quantity" readonly>
                                <a href="quantity-dec-inc?action=inc&id=<%=c.getId()%>" class="product-cart__btn_right"><i class="fas fa-angle-right"></i></a> 
                                
                                <div class="product-cart__price"><%=df.format(c.getPrices())%>đ</div>
                                <a href="remove-form-cart?id=<%= c.getId()%>" class="product-cart__delete">
                                    <i class="fas fa-trash-alt"></i>
                                </a>
                            </div>
                        </div>
                     <%
                        }%>           
                </div>
                <div class="product-pay">
                    <span class="product-pay__title">Tổng tiền:</span>
                    <span class="product-pay__price">${String.format("%.0f", total)}đ</span>
                </div>
                <div class="product-btn">
                    <a href="./" class="product-btn__return">
                        <i class="fas fa-arrow-left"></i>
                        <span class="product-btn__return-title">Tiếp tục mua hàng</span>
                    </a>
                    <a href="check-out" class="product-btn__pay">
                        <span class="product-btn__pay-title">Thanh toán</span>
                        <i class="fas fa-arrow-right"></i>
                    </a>
                </div>
            </div>
                <%
                        }%>
        </div>
        <!-- End container -->

<!-- Start footer -->
<jsp:include page="./include/footer.jsp"></jsp:include>
<!-- End footer -->
        
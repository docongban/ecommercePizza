<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <!-- Start header -->
        <jsp:include page="./include/header.jsp"></jsp:include>
        <!-- End header -->
        
        <!-- Start slider -->
        <jsp:include page="./include/slider.jsp"></jsp:include>
        <!-- End slider -->

        <!-- Start container -->
        <div class="container">
            <div class="grid fix-wide">
                <div class="container_header">
                    <span class="container_header-text">${cate.name}</span>
                </div>
            </div>

            <div class="grid fix-wide">
                
                    <div class="row">
                        <c:forEach items="${listP}" var="o">
                            <div class="col l-3">
                                <a href="add-to-cart?id=${o.id}" class="product-item">
                                    <div class="product-item-show">
                                        <div class="product-item__img" style="background-image: url('${o.thumbnail}');"></div>
                                        <div class="product-item__name">${o.title}</div>
                                        <div class="product-item__decrip">${o.content}</div>
                                    </div>
                                    <div class="product-item__wrapper">
                                        <div class="product-item__wrapper-price">
                                            <span class="product-item__wrapper-price-text">Giá chỉ từ</span>
                                            <span class="product-item__wrapper-price-number">${String.format("%.0f",o.price)}đ</span>
                                        </div>
                                        <div class="product-item__wrapper-button">
                                            <span class="product-item__wrapper-button-text">Mua ngay</span>
                                            <i class="fas fa-arrow-right product-item__wrapper-button-btn"></i>

                                        </div>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                        
                    </div>
                
                <!-- End Hải Sản Pesto -->

                
            </div>
        </div>
        <!-- End container -->

        <!-- Start footer -->
        <jsp:include page="./include/footer.jsp"></jsp:include>
        <!-- End footer -->
        
   

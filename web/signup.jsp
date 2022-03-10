<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="a" class="dao.DAO" scope="request"></jsp:useBean>

        <!-- Start header -->
        <jsp:include page="./include/header.jsp"></jsp:include>
        <!-- End header -->
        
        <div class="main">
            <form action="signup" method="post" class="form" id="register-form">
                <h3 class="heading">Tạo tài khoản</h3>

                <div class="spacer"></div>

                <div class="form-group">
                    <label for="fullname" class="form-label">Họ và tên</label>
                    <input id="fullname" name="fullname" value="${fullname}" rules="required" type="text" placeholder="VD: Đỗ Công Ban" class="form-control">
                    <span class="form-message"></span>
                </div>

                <div class="form-group">
                    <label for="email" class="form-label">Email</label>
                    <input id="email" name="email" value="${email}" rules="required|email" type="text" placeholder="VD: emailname@gmail.com" class="form-control">
                    <span class="form-message"></span>
                </div>

                <div class="form-group">
                    <label for="address" class="form-label">Địa Chỉ</label>
                    <input id="address" name="address" value="${address}" rules="required" type="text" placeholder="Số nhà, ngách/ngõ, Đường, Phố, Quận" class="form-control">
                    <span class="form-message"></span>
                </div>

                <div class="form-group">
                    <label for="phone" class="form-label">Số điện thoại</label>
                    <div class="warning">${phoneMatch}</div>
                    <input id="phone" name="phone" value="${phone}" rules="required" type="text" placeholder="" class="form-control">
                    <span class="form-message"></span>
                </div>

                <div class="form-group">
                    <label for="password" class="form-label">Mật khẩu</label>
                    <input id="password" name="password" rules="required|min:6" type="password" placeholder="" class="form-control">
                    <span class="form-message"></span>
                </div>

                <div class="form-group">
                    <label for="password_confirm" class="form-label">Nhập lại mật khẩu</label>
                    <div class="warning">${passConfirm}</div>
                    <input id="password_confirm" name="password_confirm" type="password" placeholder="" class="form-control">
                    <span class="form-message"></span>
                </div>


                <button class="form-submit">Đăng ký
                    <span><i class="fas fa-arrow-right"></i></span>
                </button>
            </form>
        </div> 

        <script src="./assets/js/validator.js"></script>

        <script>
            Validator('#register-form')
        </script>
        
        <!-- Start footer -->
        <jsp:include page="./include/footer.jsp"></jsp:include>
        <!-- End footer -->
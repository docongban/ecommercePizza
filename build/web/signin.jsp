<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="a" class="dao.DAO" scope="request"></jsp:useBean>

        <!-- Start header -->
        <jsp:include page="./include/header.jsp"></jsp:include>
        <!-- End header -->
        
        <div class="main">
            <form action="login" method="post" class="form" id="register-form">
                <h3 class="heading">Đăng nhập</h3>

                <div class="spacer">
                    <div>${warning}</div>
                </div>

                <div class="form-group">
                    <label for="phone" class="form-label">Số điện thoại</label>
                    <input id="phone" name="phone" value="${phoneuser}" rules="required" type="text" placeholder="" class="form-control">
                    <span class="form-message"></span>
                </div>

                <div class="form-group">
                    <label for="password" class="form-label">Mật khẩu</label>
                    <input id="password" name="password" rules="required|min:6" type="password" placeholder="" class="form-control">
                    <span class="form-message"></span>
                </div>

                <div class="question">
                    Bạn đã có tài khoản chưa? 
                    <a href="signup.jsp" class="question-link">Tạo tài khoản</a>
                </div>
                
                <button class="form-submit">Đăng nhập
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
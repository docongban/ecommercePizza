/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.DAO;
import enity.Account;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author docon
 */
public class SignUpControl extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        request.setCharacterEncoding("UTF-8");
        
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String pass = request.getParameter("password");
        String passConfirm = request.getParameter("password_confirm");
        
        //check password is the same password confirm
        if(!pass.equals(passConfirm)){
            request.setAttribute("fullname", fullname);
            request.setAttribute("email", email);
            request.setAttribute("address", address);
            request.setAttribute("phone", phone);
            request.setAttribute("passConfirm", "Nhập lại mật khẩu không khớp");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }else{
            DAO dao=new DAO();
            Account acc=dao.checkAccountExist(phone);
            if(acc == null){
                dao.signup(fullname, email, address, phone, pass);
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }else{
                //if account exist return signup page
                request.setAttribute("fullname", fullname);
                request.setAttribute("email", email);
                request.setAttribute("address", address);
                request.setAttribute("phone", phone);
                request.setAttribute("phoneMatch", "Số điện thoại này đã được đăng ký vui lòng xử dụng số khác");
                request.getRequestDispatcher("signup.jsp").forward(request, response);
            }
        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

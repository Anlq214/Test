/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import user.userDAO;
import user.validation;

/**
 *
 * @author theta
 */
@WebServlet(name = "signUpController", urlPatterns = {"/signUp"})
public class signUpController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.security.NoSuchAlgorithmException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, NoSuchAlgorithmException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String fullName = request.getParameter("fullName");
        String userEmail = request.getParameter("user");
        String pass = request.getParameter("pass");
        String repass = request.getParameter("repass");
        String phoneNumber = request.getParameter("phoneNumber");
        String gender = request.getParameter("userGender");
        String address = request.getParameter("address");
        validation val = new validation();
        userDAO dao = new userDAO();

        if (!pass.equals(repass)) {
            String mess = "Incorrect repeat password! Please re enter it.";
            request.setAttribute("mess", mess);
            request.getRequestDispatcher("signUp.jsp").forward(request, response);
        } else if (!validation.isValidEmail(userEmail)) {
            String mess = "Invalid Email Address! Please re enter it.";
            request.setAttribute("mess", mess);
            request.getRequestDispatcher("signUp.jsp").forward(request, response);
        } else if (!validation.isValidPhoneNumber(phoneNumber)) {
            String mess = "Invalid Phone Number! Please re enter it. ";
            request.setAttribute("mess", mess);
            request.getRequestDispatcher("signUp.jsp").forward(request, response);
        } else if (dao.getUserExistency(userEmail)) {
            String mess = "Existed Email Address! Please choose another email address. ";
            request.setAttribute("mess", mess);
            request.getRequestDispatcher("signUp.jsp").forward(request, response);
        } else {
            dao.signUp(userEmail, pass, address, fullName, phoneNumber);
            // String email, String password, String address, String fullName, String phoneNumber
            String mess = "Sign up succesfully! Please Log in to continue.";
            request.setAttribute("mess", mess);
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
    }
//        }else if (!validation.isValidFullName(fullName)){
//            String mess = "Invalid Full Name! Please re enter it. ";
//            request.setAttribute("mess", mess);
//            request.getRequestDispatcher("signUp.jsp").forward(request, response);
//        }else if (!validation.isValidAddress(address)){
//            String mess = "Invalid Address! Please re enter it. ";
//            request.setAttribute("mess", mess);
//            request.getRequestDispatcher("signUp.jsp").forward(request, response);
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
        try {
            processRequest(request, response);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(signUpController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(signUpController.class.getName()).log(Level.SEVERE, null, ex);
        }
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

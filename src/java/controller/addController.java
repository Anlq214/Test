/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import category.categoryDAO;
import category.categoryDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import product.productDAO;
import user.userDTO;

/**
 *
 * @author theta
 */
@WebServlet(name = "addController", urlPatterns = {"/add"})
public class addController extends HttpServlet {

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
        HttpSession session = request.getSession();
        userDTO u = (userDTO) session.getAttribute("user");
        
        categoryDAO cateDao = new categoryDAO();

        List<categoryDTO> listC = cateDao.getAllCategory();

        request.setAttribute("listC", listC);

        String name = request.getParameter("name");
        String thumbnailLink = request.getParameter("thumbnail");
        String originSalePrice_String = request.getParameter("originSalePrice");
        int originalSalePrice = Integer.parseInt(originSalePrice_String);
        String salePrice_String = request.getParameter("salePrice");
        int salePrice = Integer.parseInt(salePrice_String);
        String stock_String = request.getParameter("stock");
        int stock = Integer.parseInt(stock_String);
        String detail = request.getParameter("description");
        String cateID = request.getParameter("cateID");
        String emailUploader = u.getEmail();
        String statusString = request.getParameter("status");
        boolean status = Boolean.parseBoolean(statusString);
        String saleStatusString = request.getParameter("saleStatus");
        boolean saleStatus = Boolean.parseBoolean(saleStatusString);

        productDAO proDAO = new productDAO();
        proDAO.addProduct(name, cateID, thumbnailLink, emailUploader, originalSalePrice, salePrice, detail, status, saleStatus, stock);
        request.getRequestDispatcher("manageProduct").forward(request, response);
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

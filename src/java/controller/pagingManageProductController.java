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
import product.productDTO;
import user.userDTO;

/**
 *
 * @author theta
 */
@WebServlet(name = "pagingManageProductController", urlPatterns = {"/pagingManageProduct"})
public class pagingManageProductController extends HttpServlet {

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
        productDAO proDao = new productDAO();
        categoryDAO cateDao = new categoryDAO();
        String indexString = request.getParameter("index");
        if (indexString == null) {
            indexString = "1";
        }
        int maxPages = proDao.getMaxPagesBy6();
        int index = Integer.parseInt(indexString);
        HttpSession session = request.getSession();
        userDTO u = (userDTO) session.getAttribute("user");

        List<categoryDTO> listC = cateDao.getAllCategory();
        List<productDTO> listP = proDao.getProductBy6(index);
        request.setAttribute("listC", listC);
        request.setAttribute("listP", listP);
        request.setAttribute("maxPages", maxPages);
        request.setAttribute("index", index);
        session.setAttribute("user", u);
        request.getRequestDispatcher("manageProduct.jsp").forward(request, response);
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

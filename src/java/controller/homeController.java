/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;


import category.categoryDAO;
import category.categoryDTO;
import product.productDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import product.productDAO;

/**
 *
 * @author theta
 */
@WebServlet(name = "homeController", urlPatterns = {"/home"})
public class homeController extends HttpServlet {

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
        //step 1: get data from dao
        productDAO proDao= new productDAO();
        categoryDAO cateDao = new categoryDAO();
        String indexString = request.getParameter("index");
        if (indexString == null){
            indexString = "1";
        }
        int index = Integer.parseInt(indexString);
                
        List<productDTO> list = proDao.getProductBy6(index);
        List<categoryDTO> listCate = cateDao.getAllCategory();
        productDTO latestProduct = proDao.getLastestProduct();
        int productQuantity = proDao.getProductQuatity();
        int maxPages = proDao.getMaxPagesBy6();
        // step 2: set data to jsp 
        request.setAttribute("index", index);
        request.setAttribute("listP", list);
        request.setAttribute("listCate", listCate);
        request.setAttribute("latestProduct", latestProduct);
        request.setAttribute("productQuantity", productQuantity);
        request.setAttribute("maxPages", maxPages);
        //request.setAttribute("tag", 0);
        request.getRequestDispatcher("Home.jsp").forward(request, response);
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

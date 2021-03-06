/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package assignment3;

import controller.ServiceLogObj;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jgoodman
 */
@WebServlet(name = "addToTableServletServiceLog", urlPatterns = {"/addToTableServletServiceLog"})
public class addToTableServletServiceLog extends HttpServlet {

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
            throws ServletException, IOException, SQLException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet addToTableServletServiceLog</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addToTableServletServiceLog at " + request.getContextPath() + "</h1>");
             out.println("<p>"+request.getParameter("date_serviced")+"</p>");
            out.println("<p>"+request.getParameter("elec_test_done")+"</p>");
            out.println("<p>"+request.getParameter("cali_done")+"</p>");
            out.println("<p>"+request.getParameter("condition")+"</p>");
            out.println("<p>"+request.getParameter("comments")+"</p>");
            out.println("<p>"+request.getParameter("assetSerialNum")+"</p>");
            out.println("<p>"+request.getParameter("wkrWhoServiced")+"</p>");
            out.println("<p>"+request.getParameter("wkrWhoUpdated")+"</p>");
            out.println("</body>");
            out.println("</html>");
            
            //add service log entry

            String ds = request.getParameter("date_serviced");
            String etd = request.getParameter("elec_test_done");
            String cd = request.getParameter("cali_done");
            int c = Integer.valueOf(request.getParameter("condition"));
            String com = request.getParameter("comments");
            int asn = Integer.valueOf(request.getParameter("assetSerialNum"));
            int wid1 = Integer.valueOf(request.getParameter("wkrWhoServiced"));
            int wid2 = Integer.valueOf(request.getParameter("wkrWhoUpdated"));


               ServiceLogObj slo = new ServiceLogObj(ds, etd, cd, c, com, asn, wid2, wid2);
               slo.insertServiceLogObj(slo);
            
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(addToTableServletServiceLog.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(addToTableServletServiceLog.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (SQLException ex) {
            Logger.getLogger(addToTableServletServiceLog.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(addToTableServletServiceLog.class.getName()).log(Level.SEVERE, null, ex);
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

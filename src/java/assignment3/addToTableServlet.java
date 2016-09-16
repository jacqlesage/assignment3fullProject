package assignment3;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import controller.BusinessObj;
import controller.WorkerObj;
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
@WebServlet(urlPatterns = {"/addToTableServlet"})
public class addToTableServlet extends HttpServlet {

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
            out.println("<title>Servlet addToTableServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addToTableServlet at " + request.getContextPath() + "</h1>");
            out.println("<p>"+request.getParameter("fname")+"</p>");
            out.println("<p>"+request.getParameter("mname")+"</p>");
            out.println("<p>"+request.getParameter("lname")+"</p>");
            out.println("<p>"+request.getParameter("gender")+"</p>");
            out.println("<p>"+request.getParameter("dob")+"</p>");
            out.println("<p>"+request.getParameter("isActive")+"</p>");
            out.println("<p>"+request.getParameter("startDate")+"</p>");
            out.println("<p>"+request.getParameter("busConNum")+"</p>");
            out.println("</body>");
            out.println("</html>");
            
            String busName = request.getParameter("busName");
            String busConNum = request.getParameter("busConNum");
            int totalWorkers = Integer.valueOf(request.getParameter("totalWorkers"));
            
            BusinessObj bo = new BusinessObj(busName, busConNum, totalWorkers);
            bo.insertBusinessObj(bo);
            
            String fName = request.getParameter("fname");
            String mName = request.getParameter("mname");
            String lName = request.getParameter("lname");
            String gender = request.getParameter("gender");
            String dob = request.getParameter("dob");
            String isActive = request.getParameter("isActive");
            String startDate = request.getParameter("startDate");
            
            
            WorkerObj wo = new WorkerObj(fName, mName, lName, gender, dob, startDate, isActive);
            
            wo.insertWorker(wo);
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
            Logger.getLogger(addToTableServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(addToTableServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(addToTableServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(addToTableServlet.class.getName()).log(Level.SEVERE, null, ex);
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

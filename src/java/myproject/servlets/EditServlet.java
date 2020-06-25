
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package myproject.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import myproject.dao.Userdao;
import myproject.entities.Messageoverlogin;
import myproject.entities.User;
import myproject.helper.ConnectionProvider;
import myproject.helper.Helper;

/**
 *
 * @author User
 */
@MultipartConfig
public class EditServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditServlet</title>");
            out.println("</head>");
            out.println("<body>");

            // fatch all data
            String useremail = request.getParameter("user_email");
            String username = request.getParameter("user_name");
            String userpassword = request.getParameter("user_password");
            String userabout = request.getParameter("user_about");

            Part part = request.getPart("image");
            String imgname = part.getSubmittedFileName();

            // get the user from the session
            HttpSession s = request.getSession();
            User user = (User) s.getAttribute("currentUser");
            user.setEmail(useremail);
            user.setName(username);
            user.setPassword(userpassword);
            user.setAbout(userabout);
            String oldfile=user.getProfile();
            user.setProfile(imgname);

            // update this data int0 database
            Userdao userdao = new Userdao(ConnectionProvider.getConnection());

            boolean ans = userdao.updateUser(user);
            if (ans) {
                out.println("update to db");
                
                
                String path=request.getRealPath("/")+"pics"+File.separator+user.getProfile();
            
                
                
                
                                String patholdfile=request.getRealPath("/")+"pics"+File.separator+oldfile;

               Helper.deletFile(patholdfile);
                   if(Helper.saveFile(part.getInputStream(), path))
                   {
                       out.println("Profile updated..");
                        Messageoverlogin msg = new Messageoverlogin("Profile Details updated", "success", "alert-success");
             
                s.setAttribute("msg", msg);
                   }else{
                       Messageoverlogin msg = new Messageoverlogin("Profile Details updated", "success", "alert-success");
             
                s.setAttribute("msg", msg);
                   }
                   
               }
             else {
                Messageoverlogin msg = new Messageoverlogin("Invalid Details ! try with another", "error", "alert-danger");
               
                s.setAttribute("msg", msg);
            }
            response.sendRedirect("profile1.jsp");

            out.println("</body>");
            out.println("</html>");
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

package desk.classes;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class todoservlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        
        Connection c = Connect_TO_Server.getConnection();
        
        PreparedStatement pd = c.prepareStatement("select * from todotable where uname=?");
        
        String name = (String) (request.getSession()).getAttribute("u_name");
        HttpSession session = request.getSession(false);
        pd.setString(1,(String) session.getAttribute("u_name"));
        ResultSet rs = pd.executeQuery();
        ArrayList<todoclass> ar = new ArrayList<todoclass>();
        while(rs.next()){
            ar.add(new todoclass(rs.getString("title"),rs.getString("text"),rs.getInt("status")));
        }
        request.setAttribute("todo", ar);
        
        RequestDispatcher rd = request.getRequestDispatcher("newjsp17.jsp");
        rd.forward(request, response);  
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(todoservlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(todoservlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(todoservlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(todoservlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

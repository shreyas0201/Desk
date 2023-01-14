package desk.classes;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "addtodoservlet", urlPatterns = {"/addtodo"})
public class addtodoservlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        
        Connection c = Connect_TO_Server.getConnection();
        
        String name = (String) (request.getSession()).getAttribute("u_name");
        String title = (String) request.getParameter("title12");
        String text = (String) request.getParameter("text12");
        
        System.out.println("\n title="+title);
        System.out.println("\n text="+text);

        LocalDate date = LocalDate.now();
        java.sql.Date d = Date.valueOf(date);
        int status = 0;
        
        PreparedStatement pd = c.prepareStatement("insert into todotable values(?,?,?,?,?)");
        pd.setString(1, name);
        pd.setDate(2,d);
        pd.setString(3,title);
        pd.setString(4,text);
        pd.setInt(5,status);
        
        pd.execute();
                
        response.sendRedirect("todo");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(addtodoservlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(addtodoservlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(addtodoservlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(addtodoservlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}

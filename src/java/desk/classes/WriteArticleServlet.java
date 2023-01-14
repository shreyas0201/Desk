package desk.classes;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "WriteArticleServlet", urlPatterns = {"/WriteArticleServlet"})

public class WriteArticleServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        
        Connection c = Connect_TO_Server.getConnection();
        
        LocalDate date = LocalDate.now();
        java.sql.Date d = Date.valueOf(date);
        
        String title = request.getParameter("title");
        String text = request.getParameter("text");
        
        System.out.println("\n title = "+title);
        System.out.println("\n text = "+text);
        
        HttpSession session = request.getSession(false);
        
        PreparedStatement pd = c.prepareStatement("insert into ForumData values(?,?,?,utl_raw.cast_to_raw(?),?)");
        pd.setString(1, (String) session.getAttribute("u_name"));
        pd.setDate(2,d);
        pd.setString(3,title);
        pd.setString(4,text);
        pd.setInt(5,1);
        
        boolean execute = pd.execute();
        
        RequestDispatcher rd = request.getRequestDispatcher("WriteArticle.jsp");
        rd.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(WriteArticleServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(WriteArticleServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}

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

public class RecentArticlesServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {

        Connection c = Connect_TO_Server.getConnection();
        
        PreparedStatement pd = c.prepareStatement("select utl_raw.cast_to_varchar2(dbms_lob.substr(ftext)) from ForumData");
        PreparedStatement pd1 = c.prepareStatement("select uname,fdate,title,status from ForumData");
        
        ResultSet rs = pd.executeQuery();
        ResultSet rs1 = pd1.executeQuery();

        ArrayList<RecentArticlesClass> ar = new ArrayList<RecentArticlesClass>();
        
        while(rs.next()){
            rs1.next();
            ar.add(new RecentArticlesClass(rs1.getString("uname"),(rs1.getDate("fdate")).toString(),rs1.getString("title"),rs.getString("UTL_RAW.CAST_TO_VARCHAR2(DBMS_LOB.SUBSTR(FTEXT))")));
          //  System.out.println("\n "+rs.getString("UTL_RAW.CAST_TO_VARCHAR2(DBMS_LOB.SUBSTR(FTEXT))"));
        }
        request.setAttribute("Articles",ar);
        
        RequestDispatcher rd = request.getRequestDispatcher("RecentArticles.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(RecentArticlesServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RecentArticlesServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(RecentArticlesServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RecentArticlesServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}

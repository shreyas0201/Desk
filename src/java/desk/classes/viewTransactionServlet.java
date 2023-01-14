
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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "viewTransactionServlet", urlPatterns = {"/Transactions"})
public class viewTransactionServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        
        Connection c = Connect_TO_Server.getConnection();
     
        String date = request.getParameter("from12");
        String date1 = request.getParameter("to12");
        
        String startdate = "2021-4-21";
        String enddate = "2021-4-21";
        float income = 0,expense = 0;
        
        PreparedStatement pd = c.prepareStatement("select * from transactiontable where transactiondate >= TO_DATE(?,'YYYY-MM-DD') and  transactiondate <= TO_DATE(?,'YYYY-MM-DD')"); 
        
        pd.setString(1, date);
        pd.setString(2, date1);
        
        ResultSet rs = pd.executeQuery();
        ArrayList<Student_Data> ar = new ArrayList<Student_Data>();
        while(rs.next()){
            
            if(rs.getInt("iore") == 1)
                income += rs.getFloat("amount");
            else
                expense += rs.getFloat("amount");
            
            ar.add(new Student_Data(rs.getString("transactiondate"),rs.getInt("iore"),rs.getString("category"),rs.getFloat("amount")));
            System.out.println("\n "+rs.getString("uname")+" : "+rs.getString("transactiondate")+" : "+rs.getInt("iore")+" : "+rs.getString("category")+" : "+rs.getFloat("amount"));
        
        }

        request.setAttribute("Transactions", ar);
        request.setAttribute("income", income);
        request.setAttribute("expense",expense);
    
        RequestDispatcher rd = request.getRequestDispatcher("Transaction.jsp");
        rd.forward(request, response);
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(viewTransactionServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(viewTransactionServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(viewTransactionServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(viewTransactionServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

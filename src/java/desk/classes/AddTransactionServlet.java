
package desk.classes;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddTransactionServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int a;
        //fetching data from request
        String type = null,date = null,category = null;
        long amt = 0;
        
        type = request.getParameter("type");
        date = request.getParameter("Date");
        category = request.getParameter("Category");
        String temp = request.getParameter("Amount");
        amt = Long.parseLong(temp);

        java.sql.Date d = Date.valueOf(date);
        if(type.equals("Income"))
            a = 1;
        else
            a = 0;
        
        try 
        {

            Connection c = Connect_TO_Server.getConnection();

            // add to Transactiontable table
        
            String name = (String) request.getSession().getAttribute("u_name");
            addtoTransactionTable(c,name,type,d,category,amt,a);
            
            
            //Adding to incomeexpensedata store            
            
            add_to_incomeexpensedatastore(c,name,d,amt,a);
            
            
        } catch (SQLException ex) {
            Logger.getLogger(AddTransactionServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AddTransactionServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
            
        response.sendRedirect("ExpenseManager");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    private void addtoTransactionTable(Connection c, String name,String type,java.sql.Date date,String category, Long amt , int a) throws SQLException {  

        PreparedStatement pd = c.prepareStatement("insert into Transactiontable values(?,?,?,?,?)");
            
        pd.setString(1,name);
        pd.setDate(2, date);
        
        if(a == 1) 
            pd.setInt(3,1);
        else
            pd.setInt(3, 0);

        pd.setString(4,category);
        pd.setLong(5, amt);
            
        int result = pd.executeUpdate();
    }

    private void add_to_incomeexpensedatastore(Connection c, String name, java.sql.Date date, long amt, int a) throws SQLException {        

            int month = date.getMonth()+1;
            int year= date.getYear()+1900;
            
            System.out.println("\n month = "+month);
            System.out.println("\n year = "+year);
            
            PreparedStatement pd = c.prepareStatement("select * from incomeexpensedatastore where username=? and month=? and year=?");
            pd.setString(1, name);
            pd.setInt(2, month);
            pd.setInt(3, year);
            int r = pd.executeUpdate();
            System.out.println("\n r = "+r);
            if(r == 0) //no such record
            {
                if(a == 1) // add record for this month with the given income
                { 
                    pd = c.prepareStatement("insert into incomeexpensedatastore values(?,?,?,?,?)");
                    pd.setString(1,name);
                    pd.setLong(2,amt);
                    pd.setLong(3,0);
                    pd.setInt(4,month);
                    pd.setInt(5,year);
                    pd.execute();
                    System.out.println("\n no row with income inserted ");
                }
                else   // add record for this month with the given expense
                {
                    pd = c.prepareStatement("insert into incomeexpensedatastore values(?,?,?,?,?)");
                    pd.setString(1,name);
                    pd.setLong(2,0);
                    pd.setLong(3,amt);
                    pd.setInt(4,month);
                    pd.setInt(5,year);
                    pd.execute();
                    System.out.println("\n no row with expense inserted ");
                }
        }
        else // row found
        { 
            if(a == 1) // update income
            { 
                pd = c.prepareStatement("select income from incomeexpensedatastore where username=? and month=? and year=?");
                pd.setString(1, name);
                pd.setInt(2, month);
                pd.setInt(3, year);
                ResultSet rs = pd.executeQuery();
                rs.next();
                int income = rs.getInt(1);
                pd = c.prepareStatement("update incomeexpensedatastore set income=? where username =?");
                pd.setLong(1,amt+income);
                pd.setString(2,name);
                pd.execute();
                System.out.println("\n row with income updated ");
            }
            else  // update expense 
            {
                pd = c.prepareStatement("select expense from incomeexpensedatastore where username=? and month=? and year=?");
                pd.setString(1, name);
                pd.setInt(2, month);
                pd.setInt(3, year);
                ResultSet rs = pd.executeQuery();
                rs.next();
                int expense = rs.getInt(1);
                pd = c.prepareStatement("update incomeexpensedatastore set expense=? where username =? and month = ? and year = ?");
                System.out.println("\n updated amount = "+(amt+expense));
                pd.setLong(1,(amt+expense));
                pd.setString(2,name);
                pd.setInt(3, month);
                pd.setInt(4, year);
                boolean execute = pd.execute();
                System.out.println("\n execute = "+execute);
                System.out.println("\n row with expense updated ");
            }
        }
        
    }

}

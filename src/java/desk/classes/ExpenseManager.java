
package desk.classes;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ExpenseManager extends HttpServlet {

     protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {

         ArrayList<Student_Data> list = new ArrayList<Student_Data>();
         
        // storing session
        HttpSession session = request.getSession(false);
        if(session == null){
            System.out.println("\n 1234");
            return;
        }
        //connecting to server
        Connection c = Connect_TO_Server.getConnection();
        
        //fetching all expense Transactions
        fetch_Data(list,c,(String) session.getAttribute("u_name"));
        request.setAttribute("Transactions", list);
        
        // fetching income and expense of this month
        float income = 10,expense = 10;
        LocalDate d = LocalDate.now();  
        PreparedStatement pd = c.prepareStatement("select * from incomeexpensedatastore where UserName=? AND month=? AND year=?");
        pd.setString(1,(String) session.getAttribute("u_name"));
        pd.setInt(2,d.getMonthValue());
        pd.setInt(3,d.getYear());

        ResultSet rs = pd.executeQuery();
        
        if(rs.next()){
            // that means an entry exists for this month;
            income = rs.getInt(2);
            expense = rs.getInt(3);
        }
        else
        {
            // no entry exists creating a entry
            pd = c.prepareStatement("insert into incomeexpensedatastore values(?,?,?,?,?)");
            pd.setString(1, (String) session.getAttribute("u_name"));
            pd.setInt(2, 0);
            pd.setInt(3,0);
            pd.setInt(4,d.getMonthValue());
            pd.setInt(5,d.getYear());
            int r = pd.executeUpdate();
            income = 0;
            expense = 0;
        }

        request.setAttribute("Income", income);
        request.setAttribute("Expense", expense);

        
        // fetching data category wise
    
        LocalDate todaydate = LocalDate.now();
        LocalDate withDayOfMonth = todaydate.withDayOfMonth(1);
        String firstmonthdate = withDayOfMonth.toString();
        
        pd = c.prepareStatement("select * from transactiontable where uname=? and transactiondate >= TO_DATE(?,'YYYY-MM-DD') and iore=0 "); 
        pd.setString(1, (String) session.getAttribute("u_name"));
        pd.setString(2, firstmonthdate);
        
        
         rs = pd.executeQuery();
        
        HashMap<String,Long> hs = new HashMap<String,Long>();
        
        while(rs.next()){
             Long get = hs.get(rs.getString(4));
             if(get == null)  // if no such entry for this category
                 hs.put(rs.getString(4), rs.getLong(5));
             else
                 hs.put(rs.getString(4), hs.get(rs.getString(4)) + rs.getInt(5));
        }

        ArrayList<Categorywise> l = new ArrayList<Categorywise>();
        for (Map.Entry mapElement : hs.entrySet()) {
            l.add(new Categorywise((String) mapElement.getKey(),(Long)mapElement.getValue()));
        }

        request.setAttribute("categorywisedata", l);
        
        // fetching expense amount of this month
        
        LocalDate end = LocalDate.now();
        LocalDate start = end.with(DayOfWeek.MONDAY);
        
        pd = c.prepareStatement("select * from transactiontable where uname=? and transactiondate >= TO_DATE(?,'YYYY-MM-DD') and  transactiondate <= TO_DATE(?,'YYYY-MM-DD') and iore=0 "); 
        pd.setString(1, (String) session.getAttribute("u_name"));
        pd.setString(2,start.toString());//with.toString());
        pd.setString(3, end.toString());//now.toString());

        TreeMap<String,Long> hm = new TreeMap<String,Long>();
               
        rs = pd.executeQuery();
        while(rs.next()){
                if(hm.containsKey(rs.getString(2))){
                    hm.put(rs.getString(2), hm.get(rs.getString(2)) + rs.getLong(5));
                }
                else{
                    hm.put(rs.getString(2), rs.getLong(5));
                }
       }

        String temp;
        while(!start.equals(end)){
            temp = start.toString();
            temp += " 00:00:00.0";
           
            if(!hm.containsKey(temp))
                hm.put(temp,Long.min(0,0));
            start = start.plusDays(1);
        }
        
        ArrayList<weekdata> weekdata = new ArrayList<weekdata>();
        for (Map.Entry mapElement : hm.entrySet()) {
            weekdata.add(new weekdata((String)mapElement.getKey(),(Long)mapElement.getValue()));
        }
        
        int size = weekdata.size();
        while(size < 8){
            weekdata.add(new weekdata("",0));
            size++;
        }
        
        request.setAttribute("weekdata", weekdata);
        
        
        //  Data
        /**
         * Transaction - list - todays all expense transactions
         * Income - income - current months income;
         * Expense - expense - current months expense;
         * categorywisedata - l - contains data according to the category;
         * Weekdata - weekdata - weeks all transaction
         */
        
        //------
        
        RequestDispatcher rd = request.getRequestDispatcher("ExpenseManager.jsp");
        rd.forward(request, response);
     }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         try {
             processRequest(request, response);
         } catch (ClassNotFoundException ex) {
             Logger.getLogger(ExpenseManager.class.getName()).log(Level.SEVERE, null, ex);
         } catch (SQLException ex) {
             Logger.getLogger(ExpenseManager.class.getName()).log(Level.SEVERE, null, ex);
         }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         try {
             processRequest(request, response);
         } catch (ClassNotFoundException ex) {
             Logger.getLogger(ExpenseManager.class.getName()).log(Level.SEVERE, null, ex);
         } catch (SQLException ex) {
             Logger.getLogger(ExpenseManager.class.getName()).log(Level.SEVERE, null, ex);
         }
    }
    
    //Fetching the current days all expense transactions
    private void fetch_Data(ArrayList<Student_Data> list, Connection c, String name) throws SQLException {
        PreparedStatement pd = c.prepareStatement("select * from transactiontable where uname=? and transactiondate=? and iore=?"); 
        pd.setString(1,name);
        pd.setDate(2,new java.sql.Date(System.currentTimeMillis()));
        pd.setInt(3, 0);
        ResultSet rs = pd.executeQuery();
        while(rs.next()){
            list.add(new Student_Data(rs.getString(2),rs.getInt(3),rs.getString(4),rs.getFloat(5)));
        }   
    }
}

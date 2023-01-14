
package desk.classes;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class QuizQuestionServlet extends HttpServlet {

/*    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
    }
  */  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        Connection c = null;
        try {
            c = Connect_TO_Server.getConnection();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(QuizQuestionServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(QuizQuestionServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        Random random = new Random();   
        
        HashSet<Integer> hs = new HashSet<Integer>();
        hs.add(0);

        ArrayList<QuizClass> ar = new ArrayList<QuizClass>();
        
        int size = 5;
        int i = 0;
        
        while(i < 5){
            int ele = random.nextInt(size+1);
            if( !(hs.contains(ele) ) ){
                i++;
                
                PreparedStatement pd;
                try {
                    pd = c.prepareStatement("select * from QuizTable where no=?");
                    pd.setInt(1, i);
                    ResultSet rs = pd.executeQuery();
                    rs.next();
                   // ar.add(new QuizClass(rs.getString("question"),rs.getString("a"),rs.getString("b"),rs.getString("c"),rs.getString("d"),rs.getInt("no"),rs.getInt("correctanswer")));
                    hs.add(ele);
                    
                } 
                catch (SQLException ex) {
                    Logger.getLogger(QuizQuestionServlet.class.getName()).log(Level.SEVERE, null, ex);
                } // catch
            }// if
        }// while  
        
        request.setAttribute("quizquestions", ar);
        request.getSession().setAttribute("que", ar);
        request.getSession().setAttribute("curqueno",0);
        
        request.getRequestDispatcher("quizquestions.jsp").forward(request, response);
        
    }// post method
}// class

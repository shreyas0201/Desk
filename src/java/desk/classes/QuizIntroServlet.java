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

public class QuizIntroServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
                
        Connection c = null;
        try {
            c = Connect_TO_Server.getConnection();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(QuizQuestionServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(QuizQuestionServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        int no = Integer.parseInt(request.getParameter("val"));
        
        PreparedStatement pd = c.prepareStatement("select * from QuizTable where subject=?");
        pd.setInt(1, no);
        ResultSet rs = pd.executeQuery();
        
        ArrayList<QuizClass> allquestions = new ArrayList<QuizClass>();           
        
        while(rs.next()){
            allquestions.add(new QuizClass(rs.getInt("no"),rs.getString("question"),rs.getString("a"),rs.getString("b"),rs.getString("c"),rs.getString("d"),rs.getInt("correctanswer"),rs.getInt("subject")));
        }

        Random random = new Random();   
        HashSet<Integer> hs = new HashSet<Integer>();  // to store which indexes are done
        hs.add(0); 
        ArrayList<QuizClass> pickedquestion = new ArrayList<QuizClass>();
        
        int size = 15;
        int i = 0;
        
        while(i < 15){
            int ele = random.nextInt(size+1); //pick a random index
            if( !(hs.contains(ele) ) ){  // if the indexx is not included
                i++;
                pickedquestion.add(allquestions.get(ele));
                hs.add(ele);
            }// if
        }// while  
        
        String title = null;
        
        switch(no){
            case 1: title="Java"; break;
            case 2: title="Python"; break;
            case 3: title="Java Script"; break;
            case 4: title="Data Structures"; break;
            case 5: title="SQL"; break;
        }
        
        request.setAttribute("title", title);
        request.getSession().setAttribute("que", pickedquestion);
        request.getSession().setAttribute("curqueno",0);
        
        request.getRequestDispatcher("quizquestions.jsp").forward(request, response);
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(QuizIntroServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(QuizIntroServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}

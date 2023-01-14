
package desk.classes;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class basicServlet extends HttpServlet {

    
    public void showAlertMessage(String message, PrintWriter out, String redirect){
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Serv</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<script type=\"text/javascript\">");
            out.println("alert(\""+message+"\")");
            out.println("window.location=\""+redirect+"\"");
            out.println("</script>");
            out.println("</body></html>");
            out.close();

    }
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String name = request.getParameter("cname");
        String email = request.getParameter("cemail");
        String pass = request.getParameter("cpassword");
        
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        
        if((name.equals("")) || (name == null) || (name.matches("^[a-zA-Z]*$") == false)){
            showAlertMessage("Not a valid User Name ",out,"login.jsp");
            return;
        }
         
        if((email.equals("")) || (email == null) || (!email.contains("@gmail.com"))){
            showAlertMessage("Not a valid email ",out,"login.jsp");
            return;
        }
         
        if( (pass.equals("")) || (pass == null) || (pass.length() < 8) ){
             showAlertMessage("Password is not according to the required constraints ", out, "login.jsp");
             return;
        }
       
        try {
            Connection c = (new Connect_TO_Server()).getConnection();
            PreparedStatement st = c.prepareStatement("select * from LoginData where email=?");
        
            st.setString(1, email);

            int rs = st.executeUpdate();
         
            if(rs == 1){
                showAlertMessage("Email is already registered",out,"login.jsp");
            }
            else
            {
                st = c.prepareStatement("insert into LoginData values(?,?,?)");
                st.setString(1, name);
                st.setString(2, email);
                st.setString(3, pass);
                st.executeUpdate(); 
                
                showAlertMessage("Account created Successfully",out,"login.jsp");
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(basicServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(basicServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
       
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}

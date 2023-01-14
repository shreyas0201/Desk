package desk.classes;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CheckLogin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String email = request.getParameter("lemail");
        String pass = request.getParameter("lpassword");
        
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        
        if((email.equals("")) || (email == null) || (!email.contains("@gmail.com"))){
            showAlertMessage("Email or Password is wrong1",out,"login.jsp");
            return;
        }
        
        if( (pass.equals("")) || (pass == null)){
             showAlertMessage("Email or Password is wrong2 ", out, "login.jsp");
             return;
        }
       
        try {
            Connection c = Connect_TO_Server.getConnection();
            PreparedStatement st = c.prepareStatement("select * from LoginData where email=? and password=?");
            st.setString(1, email);
            st.setString(2, pass);
            int rs = st.executeUpdate();            
            
            if(rs == 1){
                Cookie cookie = new Cookie("u_name",request.getParameter("lemail"));
                cookie.setMaxAge(60*60*24*365*10);
                response.addCookie(cookie);
                System.out.println("\n cookie added ");
                response.sendRedirect("silder.html");
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CheckLogin.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(CheckLogin.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

    private void showAlertMessage(String message, PrintWriter out, String redirect) {
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

}





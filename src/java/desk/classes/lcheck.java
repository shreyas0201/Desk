
package desk.classes;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class lcheck extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Cookie[] ck = request.getCookies(); //fetching the cookies from client machine
    
        if(ck != null) {
            int i = 0;
            System.out.println("\n "+i);
            for(i = 0 ; i < ck.length ; i++){
                System.out.println("\n "+ck[i].getName());
                if(ck[i].getName().equals("u_name123")) {
                    HttpSession session = request.getSession();
                    session.setAttribute("u_name123", ck[i].getValue());
                    request.getRequestDispatcher("temp.jsp").forward(request, response);
                    break;
                }
            }
            if(i == ck.length){
                 Cookie cookie = new Cookie("u_name123",request.getParameter("username"));
                 cookie.setMaxAge(60*60*24*365*10);
                 response.addCookie(cookie);
            } 
        }
        
    }
    
}

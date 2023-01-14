package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("    <title> Design Login </title>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("  \n");
      out.write("  <link href=\"https://fonts.googleapis.com/css?family=Nunito:400,600,700,800&display=swap\" rel=\"stylesheet\"integrity=\"sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog==\" crossorigin=\"anonymous\" />\n");
      out.write("  <link rel=\"stylesheet\" type=\"text/css\" href=\"style.css\">\n");
      out.write(" \n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("  <div class=\"cont\">\n");
      out.write("    <div class=\"form sign-in\">\n");
      out.write("\t<img src=\"IMG/logo.png\" style=\"margin-right:-100px; margin-top:-57px; width:200px\">\n");
      out.write("      <h2 style=\"font-size:40px; color: #7579ff; margin-top:20px\">Login to DESK</h2>\n");
      out.write("     <h6 style=\"color:grey; margin-top:50px\"><center>provide your Email and Password to continue with DESK</center></h6>\n");
      out.write("     <form action=\"login\" method=\"POST\">\n");
      out.write("      <label>\n");
      out.write("       <input type=\"email\" id=text1 name=\"lemail\" placeholder=\"Email\" required style=\"background-color:#f4f1fa; margin-top: \t22px;\" >\n");
      out.write("      </label>\n");
      out.write("      <label>\n");
      out.write("    <input type=\"password\" id=text2 name=\"lpassword\" placeholder = \"Password\" required style=\"background-color: #f4f1fa; margin-top: -12px\" >\n");
      out.write("      </label>\n");
      out.write("\n");
      out.write("      <button class=\"submit\" type=\"submit\" value=\"required\">Login</button>\n");
      out.write("\t<a class=\"forgot-pass\" href=\"ki.html\"><u>Forgot Password ?</u></a>\n");
      out.write("     </form>\n");
      out.write("   </div>\n");
      out.write("    <div class=\"sub-cont\">\n");
      out.write("      <div class=\"img\">\n");
      out.write("        <div class=\"img-text m-up\">\n");
      out.write("          <h2>New here?</h2>\n");
      out.write("          <p>Sign up and We at Desk Solve Every Students Problems!</p>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"img-text m-in\">\n");
      out.write("\t <h2>Welcome</h2>\n");
      out.write("          <p>If you already has an account, just Login. We've missed you!</p>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"img-btn\">\n");
      out.write("          <span class=\"m-up\">Sign Up</span>\n");
      out.write("          <span class=\"m-in\">Login</span>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("      <div class=\"form sign-up\">\n");
      out.write("          \n");
      out.write("      <form action=\"checkConnection\" method=\"post\">\n");
      out.write("\t<img src=\"IMG/logo.png\" style=\"margin-right:1px; margin-top:-57px; width : 200px\">\n");
      out.write("\t\n");
      out.write("\t<h2 style=\"font-size:40px; color: #7579ff; margin-top:30px; margin-left : -10px\"> Create Account </h2>\n");
      out.write("\t<div class=\"social-media\">\n");
      out.write("        <ul>\n");
      out.write("          <li><img src=\"IMG/facebook.png\"></li>\n");
      out.write("          <li><img src=\"IMG/twitter.png\"></li>\n");
      out.write("          \n");
      out.write("          <li><img src=\"IMG/google.png\"></li>\n");
      out.write("          <li><img src=\"IMG/instagram.png\"></li>\n");
      out.write("        </ul>\n");
      out.write("\t</div>\n");
      out.write("\n");
      out.write("        <label>\n");
      out.write("\t\t<h6 style=\"color:grey\"><center> or use your email for registration</center></h6>\n");
      out.write("        \t<input name = \"cname\" class=\"myInput\" type=\"text\"  id=\"text3\" placeholder = \" Name \" required style=\"background-color:#f4f1fa; margin-top:20px\"> \n");
      out.write("        </label>\n");
      out.write("        <label>\n");
      out.write("          <input name = \"cemail\" class=\"myInput\"  type=\"email\" id=\"text4\" placeholder = \" Email \" required style=\"background-color:#f4f1fa; margin-top:-20px\">\n");
      out.write("        </label>\n");
      out.write("        <label>\n");
      out.write("          <input name = \"cpassword\" class=\"myInput\" type=\"password\" id=\"text5\"  placeholder = \" Password \" required style=\"background-color:#f4f1fa; margin-top:-20px\">\n");
      out.write("        </label>\n");
      out.write("        <button type=\"submit\" class=\"submit\" value=\"required\" style=\"margin-top:30px\">Sign Up</button>\n");
      out.write("      </form>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("<script type=\"text/javascript\" src=\"script.js\"></script>\n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}

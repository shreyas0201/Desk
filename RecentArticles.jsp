<%@page import="desk.classes.RecentArticlesClass"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <style>
        
            
            .html{
                background: white;
            }
            
            .topPanel{
                margin-top: -9px;
                margin-left: -8px;
                width: 101.2%;
                height: 60px;
                box-shadow: 1px 1px 7px 2.7px lightgray;
            }

            .header_text{
                font-size: 50px;
                font-family: sans-serif;
                margin-left: 60px;
                margin-top: 60px;
                color: #212121;
            }
            
            .footer_text{
                font-size: 19px;
                color: #666668;//#5f6368;//black;//#636568;
                font-family: Palatino;//Franklin Gothic Medium;//Palatino;//Bookman;//Trebuchet MS;//comic sans MS;//Arial;//verdana;
                margin-top: 40px;
                margin-left: 65px;
                word-spacing: 5px;
                font-weight: 500;
                line-height: 30px;
            }
            
            
        </style>
    </head>
    
    <body>
        
        <div class="topPanel">
            <img src="logo.png" style="margin-top: -2px; margin-left: 15px; height: 55px; width: 170px;">
            <img src="forumlogo.png" style="margin-top: -5px; margin-left: -20px; height: 65px; width: 170px;">
            <a href="/DESK/silder.html" ><button type="submit" class=""style=" position: absolute;  width: 100px; height: 40px; font-size: 17.5px; margin-left: 420px; margin-top: 10px; background-color: white; color: #1a73e8; border-color: white; border: 1px transparent; ">Home</button> </a>
            <button type="submit" style=" position: absolute; width: 100px; height: 40px; font-size: 17.5px; margin-left: 500px; margin-top: 10px;  background-color: white; color: #1a73e8; border-color: white; border: 1px transparent; ">Features</button>
            <a href="/DESK/Forum.jsp" ><button type="submit" style=" border-radius: 25px; position: absolute;  width: 120px; height: 40px; font-size: 17.5px; margin-left: 610px; margin-top: 10px; background-color: #1a73e8; color: white; border-color: white; border: 1px transparent; ">DashBoard</button></a>
            <a href="/DESK/RecentArticles" ><button type="submit" style=" position: absolute;  width: 100px; height: 40px; font-size: 17.5px; margin-left: 730px; margin-top: 10px; background-color: white; color: #1a73e8; border-color: white; border: 1px transparent; ">Recent</button></a>
         </div>

        <div id = 'division'>
            style = 'min-width: 90px; min-height: 80px;'>
        </div>
        
<script>
    
    function insert_from_database(a, b, c){

        var div = document.createElement('div');
        div.innerHTML = "<div style=\" font-family: sans-serif; text-align: left; font-size: 16px; margin-left: 30px; color: #454545;\">"+"<br>"+"<div style=\" font-size: 23px; font-weight: bold; color: #1a73e8;\">"+a+"</div>"+"<div style=\" margin-top: 4px; \"  ><textarea style = 'width: 700px; height: 100px;' >"+b+"</textarea></div>"+"<br><br>"+ "<hr style= \" margin-left: -5px; position: absolute; width: 700px; background-color: black; height: 0.1px;  \"  >"+ "<div style = \" height: 27px; margin-top:20px;  width: 170px; background-color: #1a73e8; border-radius: 30px;  \"  >"+"<div style= \" margin-left: 14px; position: absolute;  margin-top: 3px; position: absolute; color: white; overflow: hidden; text-align: center; \" >User Name</div>"+"<div style= \" margin-left: 300px;  width: 100px; height: 25px; color: #535353; border: 1px solid; border-color: #535353; border-radius: 5px; \" > <div style= \" margin-top: 3px; margin-left: 4px; \"  > "+c+"</div> </div>"+"</div>";
  
        div.style = " padding-bottom: 10px; min-width: 900px; height: 150px; margin-left: 50px; margin-top: 30px; display: inline-block; border-radius: 15px; text-align: center;background:  white; animation-name: addnode; animation-duration: 2s;animation-direction: all; /*box-shadow: 0 1px 2px 0 rgba(60, 64, 67, 0.302), 0 2px 2px 2px rgba(60, 64, 67, 0.149);*/ transition-property: transform;    transform: translateX(200px); ";
        document.getElementById('division').prepend(div);
      
        div.addEventListener('animationend', function() {
  
        });
    }
    
        onload();

        function onload(){
        <%
             
            ArrayList<RecentArticlesClass> ar = (ArrayList<RecentArticlesClass>) request.getAttribute("Articles");
            
            for(int i = 0 ; i < ar.size(); i++){ %>
                var a = '<%=ar.get(i).getTitle() %>'
                var b = `<%= ar.get(i).getText() %>`
                var c = '<%= ar.get(i).getDate() %>'
                
                insert_from_database(a,b,c);
           <% } %>

        }

</script>

        
    </body>
    
</html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <style>
            
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
            <a href="/DESK/WriteArticle.jsp" ><button type="submit" style=" border-radius: 25px; position: absolute;  width: 120px; height: 40px; font-size: 17.5px; margin-left: 610px; margin-top: 10px; background-color: #1a73e8; color: white; border-color: white; border: 1px transparent; ">Write</button></a>
            <a href="/DESK/RecentArticles" ><button type="submit" style=" position: absolute;  width: 100px; height: 40px; font-size: 17.5px; margin-left: 730px; margin-top: 10px; background-color: white; color: #1a73e8; border-color: white; border: 1px transparent; ">Recent</button></a>
         </div>

        <div class="header_text">
            Let's Contribute together <br>
            <hr style=" border-radius: 30px; margin-top: 8px; height: 2px; color: #1a73e8; width: 400px; margin-left: 0px; background-color: #1a73e8; ">
        </div>

        <div class="footer_text">
            Lorem ipsum dolor sit amet, consectetuer adipiscing <br>
            elit. Aenean commodo ligula eget dolor. Aenean massa. <br>
            Cum sociis natoque penatibus et magnis dis <br>
            parturient montes, nascetur ridiculus mus. Donec quam felis,  <br>
            ultricies nec, pellentesque eu, pretium quis, sem.
        </div>
        
        <a href="/DESK/silder.html"> <button type="submit" style=" border-radius: 5px; position: absolute;  width: 120px; height: 40px; font-size: 17.5px; margin-left: 65px; margin-top: 75px; background-color: white; color: #535353; border-color: white; border: 1px solid; ">Know More</button> </a>
        <a href="/DESK/WriteArticle.jsp"><button type="submit" style=" border-radius: 5px; position: absolute;  width: 180px; height: 40px; font-size: 17.5px; margin-left: 230px; margin-top: 75px; background-color: #1a73e8; color: white; border-color: white; border: 1px solid; ">Write an Article</button></a>

        <img src="f7.png" style="margin-left: 630px; margin-top: -290px; height: 400px; width: 550px;">
        <h4 style="margin-left: 700px; color: lightgray; font-family: sans-serif; "> Join the Desk Community and share your Experiences with us </h4>
        
    </body>
</html>

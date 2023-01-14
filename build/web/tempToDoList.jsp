<%-- 
    Document   : todolist_jsp
    Created on : 28 Apr, 2021, 4:51:59 PM
    Author     : Vinay Chopda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>To-Do List </title>
        
        <style>
            
            body{
                background-color: #ffffff;    
                font-family: sans-serif;
            }
            
            .logo{
                background-color: #FFFFFF;
                width:170px;
                height: 92px;
                margin-top: 10px;
                margin-left: 30px;
                border: 1px;
                border-radius: 15px;
                position: relative;
            }
            
            .left_panel{
                top: 0;
                background: white;
                position: relative;
                border: 1px;
                left: 0;
                width: 1250px;
                height: 560px;
                transition: 0.5s;
                overflow-y: auto;
                margin-bottom: 10px;
                margin-top: 5px;
                margin-left: 0px;
                border-radius: 1px;
                //border: 3px solid black;//#fabb18;//#f3b517;//#000000;
            }
            
            .right_panel{
                top: 0;
                //background: #fcfbfd;
                position: relative;
                border: 1px;
                left: 0;
                width: 980px;
                height: 535px;
                transition: 0.5s;
                overflow-y: auto;
                margin-bottom: 10px;
                margin-top: -210px;
                margin-left: 250px;
                border-radius: 15px;
                //border: 3px solid black;//#fabb18;//#f3b517;//#000000;
                box-shadow: 0px 0px 15px 3px lightgray;
            }

            .searchbar{
                 margin-left: 20px;
                 margin-top: 20px;
                 height:40px;
                 width: 700px;
                 border-radius: 30px;
                 box-shadow: 0px 0px 5px 3px lightgray;
            }
            
            .TODO{
                 margin-left: 50px;
                 margin-top: 50px;
                 height:400px;
                 width: 300px;
                 border-radius: 15px;
                 box-shadow: 0px 0px 5px 3px lightgray;
            }
            
            .Completed{
                 margin-left: 400px;
                 margin-top: -400px;
                 height:400px;
                 width: 300px;
                 border-radius: 15px;
                 box-shadow: 0px 0px 5px 3px lightgray;
            }
            
        </style>
        
    </head>
    
    <body>
        
        <div class="left_panel">
            
            <div class="logo">
                <img src="logo.png" style="width:100%; height: 60%">
            </div>
        
            <div class="insideleftpanel">
                <h3 style="margin-top: 40px; margin-left: 60px; "> Notes </h3>
                <h3 style="margin-top: 10px; margin-left: 50px; " > Overview </h3>
             </div>

            <div class="logo1">
            
            </div>
        
            <div class="text">
            
            </div>
        
                
            <div class="right_panel">

                        <div class="searchbar">
                        </div>
        
                        <div class="TODO">
                        </div>

                        <div class="Completed">
                        </div>

                        <div class="home">
                        </div>

                        <div class="features">
                        </div>
                               
            </div>
        
        </div>
        
        
        
    </body>
</html>

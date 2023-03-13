

<%@page import="java.util.ArrayList"%>
<%@page import="desk.classes.QuizClass"%>
<%@page import="desk.classes.QuizIntroClass"%>
<html>
    
    <head>
        <title> sample quiz </title>
        
        <style>
            .previous{
                margin-top: 100px;
                margin-left: 50px;
                background-color: red;
                width: 100px;
                height: 40px;
            }

            .next{
                margin-top: 100px;
                margin-left: 30px;
                background-color: red;
                width: 100px;
                height: 40px;
            }    
            
        </style>
    </head>
    
    
    <body>
        
        <div id="sampletext">temp text </div>
        
        <form action="previousquestion" method="POST">
            <button class="previous" onclick="Previous()">Previous</button>
        </form>
        
        
        <form action="nextquestion" method="POST">
            <button class="next" onclick="Next()" >Next</button>
        </form>
        <script>
            
            <%
                ArrayList<QuizClass> ar = (ArrayList<QuizClass>) session.getAttribute("que");  //(ArrayList<QuizClass>) request.session.getAttribute("quizquestions");
            %>
               Next();
            function Previous(){
                document.getElementById("sampletext").innerHTML = '<%= ar.get( (Integer) session.getAttribute("curqueno")).getQuestion() %>';
            }
            
            function Next(){
                document.getElementById("sampletext").innerHTML = '<%= ar.get( (Integer) session.getAttribute("curqueno")).getQuestion() %>';
            }
            
             
            
            
        </script>
        
    </body>
</html>

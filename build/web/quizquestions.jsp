<%-- 
    Document   : quizquestions
    Created on : 26 May, 2021, 10:00:19 AM
    Author     : Vinay Chopda
--%>

<%@page import="desk.classes.QuizClass"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <html>
<head>
	<title>quiz</title>
	<style>

body {
  margin: 0;
  padding: 0;
  font-family: "Roboto", sans-serif;
  font-weight: 100;
  height: 80%;
  
  background: no-repeat linear-gradient(250deg, skyblue, #db222a);
}
.quiz-container {
  box-shadow: 1px 1px 1px 1px rgba(0, 0, 0, 0.2);
  text-shadow: 1px 1px white;
  padding: 3rem;
  text-shadow: 0 1px #00000010;
  width: 60%;
  margin: 5rem auto;
  display: flex;
  flex-direction: column;
  background: #f7f8fa;
 height:80%;
 border-radius: 12px;
 border: 2px solid skyblue;
}
.title {
  margin-top: 0;
  margin-bottom: 2.1rem;
  color: #00000050;
  font-weight: 400;
  font-size: 2.5rem;
  text-align: center;
  text-transform: uppercase;
}
.question {
  margin: 2rem 0;
  font-size: 1.5rem;
}
.option {
  padding: 1rem;
  color: #00000095;
  background: rgba(255, 255, 255, 0.1);
  width: 80%;
  border-radius: 5px;
  transition: all 0.3s;
}
.option:hover {
  background: rgba(255, 255, 255, 0.4);
}
.option input:checked .option {
  background: #08038c;
  color: #000;
}
.controls > * {
  margin: 1rem;
}
button {
  padding: 0.5rem 1.5rem;
  border: none;
  box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.1);
  border-radius: 5px;
  font-weight: 300;
  color: white;
  outline: none;
  transform: scale(0.98);
  transition: all 0.2s;
}
button.previous {
  background: #c84630;
}
button.next {
  background: #3c91e6;
}

button.restart {
  background: #0cf574;
  color: #00000050;
  font-size: 2rem;
  margin-bottom: 1rem;
  transition: all 0.4s;
}
button.restart:hover {
  color: #00000098;
}
button:hover,
button:focus {
  transform: scale(1);
  font-weight: 500;
  box-shadow: 1px 1px 1px rgba(255, 255, 255, 0.5);
}
.result {
  display: flex;
  flex-direction: column;
  padding: 2rem;
  justify-content: center;
  align-items: center;
  text-align: center;
  font-size: 2.5rem;
  min-height: 100vh;
}
.final-score {
  color: #00000099;
}
.summary {
  font-size: 1rem;
  text-shadow: 1px 1px #ffffff50;
  color: #00000099;
  background: rgba(255, 255, 255, 0.4);
  border-radius: 5px;
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  padding: 0 2rem;
  margin-bottom: 2rem;
}
.summary h1 {
  align-self: center;
}

	</style>
</head>

<body>
<head>
    <title>Title Quiz</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
</head>

<body>

    <div class="quiz-container">
        
        <div id="question" class="question">
        	<p></p>
        </div>
        <label class="option">
            <input type="radio" name="option" value="1"/>
            <span class="option1" id="1"></span>
        </label>
        <label class="option">
            <input type="radio" name="option" value="2" />
            <span class="option2" id="2"></span>
        </label>
        <label class="option">
            <input type="radio" name="option" value="3" />
            <span class="option3" id="3"></span>
        </label>
        <label class="option">
            <input type="radio" name="option" value="4" />
            <span class="option3" id="4"></span>
        </label>
        <!-- Buttons -->
        
        <div class="controls">
            <form action="previousquestion" method="POST">
                <button class="previous" onclick="Previous()">Previous</button>
            </form>
        
            <form action="nextquestion" method="POST">
                <button class="next" id="next" >Next</button>
            </form>
        </div>
    </div>
    
    <div class="result">
    </div>

    <script>
            <%
                ArrayList<QuizClass> ar = (ArrayList<QuizClass>) session.getAttribute("que");  //(ArrayList<QuizClass>) request.session.getAttribute("quizquestions");
            %>
            Next();
            function Previous(){
                document.getElementById("question").innerHTML = <%= (Integer) session.getAttribute("curqueno") %> +") " +  '<%= ar.get( (Integer) session.getAttribute("curqueno")).getQuestion() %>';
            }
            
            function Next(){
                if(<%= (Integer) session.getAttribute("curqueno") %> == 15){
                    
                }    
                document.getElementById("question").innerHTML = <%= (Integer) session.getAttribute("curqueno")+1 %> +") " +  '<%= ar.get( (Integer) session.getAttribute("curqueno")).getQuestion() %>';
                document.getElementById("1").innerHTML = '<%= ar.get( (Integer) session.getAttribute("curqueno")).getA() %>';
                document.getElementById("2").innerHTML = '<%= ar.get( (Integer) session.getAttribute("curqueno")).getB() %>';
                document.getElementById("3").innerHTML = '<%= ar.get( (Integer) session.getAttribute("curqueno")).getC() %>';
                document.getElementById("4").innerHTML = '<%= ar.get( (Integer) session.getAttribute("curqueno")).getD() %>';
            }
    </script>
</body>
</html>

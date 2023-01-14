
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title> don</title>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" charset="utf-8"></script>
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

      
      
    html {
  height: 100%;
  background: white;
}

* {
  font-family: sans-serif;
  color: #333;
}


h1 {
  font-size: 15px;
  font-weight: 30;
  color: black;
}
.title{
  width: 100%;
  min-height: 2rem;
  padding: 1rem 1.5rem;
  font-size: 1rem;
  
  font-weight: 300;
  background:#FFFFFF;
  border: 1px solid grey;
  border-radius: 1rem;
  outline: none;
  
  box-shadow: 
    10px 10px 10px #D1D9E9, 
    -10px -10px 10px #FFFFFF;
}

.author{
 width: 90%;
  background:transparent;
   font-size: 1rem;
   min-height: 2rem;
  padding: 0.2rem 0.7rem;
  outline: none;
  border: none;
  border-bottom-width: 90px;
  border-bottom-color: blue;
}

textarea {
  width: 100%;
  min-height: 21rem;
  padding: 1rem 1.5rem;
  font-size: 1rem;
  line-height: 2rem;
  margin-top: 5%;
  font-weight: 300;
  background:#FFFFFF;
  border: 1px solid #333;
  border-radius: 1rem;
  outline: none;
  box-shadow: 
    10px 10px 10px #D1D9E9, 
    -10px -10px 10px #FFFFFF;
}

.leftbox{
    width: 350px;
    margin-left: 900px;
    height: 450px;
    background-color: white;
    margin-top: -460px;
    box-shadow: 1px 1px 7px 2.7px lightgray;
}


textarea::placeholder {
  color: #9fa8da;
}

textarea:placeholder-shown {
  background: none;
}
[type="date"] {
  background:#fff url(https://cdn1.iconfinder.com/data/icons/cc_mono_icon_set/blacks/16x16/calendar_2.png)  97% 50% no-repeat ;
}
[type="date"]::-webkit-inner-spin-button {
  display: none;
}
[type="date"]::-webkit-calendar-picker-indicator {
  opacity: 0;
}
ul { margin:0; padding:0; }
ul > li {
  list-style:none;
  margin-bottom:10px;
  color:#f8f8f8;
}
table, th, td {
  border: 1px solid black;
}
.hi{
  
  
  
margin-top: 5%;

}
#submit-button{
margin: 0.2em 0;
  box-sizing: border-box;
  color: rgba(0, 0, 0, 0.87);
  overflow: hidden;
  text-overflow: ellipsis;
  text-align: center;
  white-space: nowrap;
  letter-spacing: 0.01785714em;
  font-size: 0.875rem;
  font-weight: 500;
  line-height: 1.25rem;
  height: 36px;
  padding: 8px 24px;
  border-radius: 4px;
  border-color: transparent !important;
  background-color: rgb(251, 251, 251);
}
#submit-button {
  color: #fff;
  background-color: #007bff;
}

#submit-button:hover {
  filter: brightness(80%);
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

        <form action="WriteArticleServlet" method="POST">
            <input style=" width: 65%;  margin-top: 2%;" class="title" type="text" name="title" placeholder="title" required>
            <textarea style=" width: 65%; margin-top: 2%; "  name="text" placeholder="Type something...  *** to have a new line use \n ***" required></textarea>
            <button onclick="forReview()" type="submit" style=" display: inline-block; position: absolute;  margin-top: 22%;  margin-left: 120px;"  id="submit-button" onclick="nishant.html">Sumbit for Review</button>
        </form>
    
        <div class="leftbox">
            <h2 style="margin-left: 110px; color: #1a73e8; margin-top: 20px; position: absolute;  "> --- POST ---</h2> </center>
            <hr style="background-color: #1a73e8; width: 340px; margin-left: 5px; margin-top: 60px; position: absolute; ">
            
            <img src="userlogo.png" style="margin-left: 70px; margin-top: 110px;height: 45px; width: 45px;">
            <h3 style="font-family: sans-serif; margin-left: 144px; margin-top: -35px; font-size: 20px;">User Name </h3>
            <img src="date.png" style="margin-left: 70px; margin-top: 10px;height: 50px; width: 50px;">
            <h3 style="font-family: sans-serif; margin-left: 144px; margin-top: -35px; font-size: 20px;">Date </h3>
            
        </div>

    <script>
        function forReview(){
            window.alert(" POST is Submited for Review.... you can view its Status in Profile ");
        }
    </script>
  
</body>
</html>


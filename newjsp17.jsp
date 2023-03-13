<%@page import="desk.classes.todoclass"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>todo</title>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" charset="utf-8"></script>
    <style>
  body{
    background-color: #fff;
  color: #202124;
  font-size: 15px;
  margin: 0;
  min-width: 30px;
  font-family:cursive;
  padding: 0;
  }
  
@keyframes addnode {
  
    from 
        {
        transform: translateX(-100px);
        }
  
    to {
        transform: translateX(170px);
       }
  
}
header {
  display: flex;
  align-items: center;
  justify-content: center;
  margin-left: 33%;

 
}

.header-logo {
  height: 4em;
}

.header-title {
  color: #5f6368;
  font-size: 2rem;
  padding-top: 4px;
  padding-left: 4px;
}

.submit{
  margin: 0.2em 0;
  box-sizing: border-box;
  color: rgba(0, 0, 0, 0.87);
  overflow: hidden;
  text-overflow: ellipsis;
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
  #form-container {
  border-radius: 8px;
  border: 0.5px solid #d3d3d3;
  box-shadow: 0 1px 2px 0 rgba(60, 64, 67, 0.302),
    0 2px 6px 2px rgba(60, 64, 67, 0.149);
  margin: 32px auto 24px auto;
  max-width: 406px;
  transition-duration: 0.218s;
  transition-property: background, border, opacity, box-shadow, transform;
  transition-timing-function: ease-in;
  margin-top: -30px;
}

#form {
  position: relative;
  border: none;
  margin: 1px;
  
  border-radius: 8px;
  transition-duration: 0.218s;
  transition-property: background, border, opacity, box-shadow, transform;
  transition-timing-function: ease-in;
}

.form-open {
  box-shadow: 0 3px 5px rgba(0, 0, 0, 0.2);
}
#note-text {
  width: calc(100% - 30px);
  min-height: 30px;
  margin: 0 5px;
  padding: 10px 10px;
  font-size: 1rem;
  font-weight: 500;
 outline: none;
 border: none;
  /* box-shadow: 0 3px 5px rgba(0, 0, 0, 0.2); */
  letter-spacing: 0.00625em;
  border: 0;
  overflow: hidden;
  position: relative;
}
#note-title {
  
  width: calc(100% - 30px);
  min-height: 30px;
  margin: 0 5px;
  padding: 10px 10px;
  font-size: 1rem;
  font-weight: 500;
 
  outline: none;
  border: none;
  
}
#form:focus,
input:focus {
  outline: none;
}
#form-buttons {
  
  text-align: right;
}
#submit-button{
margin: 0.2em 0;
  box-sizing: border-box;
  color: rgba(0, 0, 0, 0.87);
  overflow: hidden;
  text-overflow: ellipsis;
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
  margin-right: 10px;
  margin-bottom: 10px;      
}
#submit-button {
  color: #fff;
  background-color: #007bff;
}

#submit-button:hover {
  filter: brightness(95%);
}
.sidebar{
  z-index: 1;
  top: 0;
  background: transparent;
  margin-top: 110px;
  padding-top: 30px;
  position: fixed;
  left: 0;
  width: 190px;
  height: 80%;
  transition: 0.5s;
  transition-property: left;
  overflow-y: auto;
}

.sidebar a{
  color: black;
  display: block;
  margin-top: 10px;
  width: 100%;
  line-height: 60px;
  text-decoration: none;
  padding-left: 40px;
  box-sizing: border-box;
  transition: 0.5s;
  transition-property: background;
}
span:hover{
  color: blue;
}
.search-container{
  width: 660px;
  display: block;
  margin-top: 10px;
  margin-left: 30%;
 
 

}

input#search-bar{
  margin: 0 auto;
  width: 100%;
  height: 45px;
  padding: 0 20px;
  font-size: 1rem;
  border: 1px solid #D0CFCE;
  border-radius: 30px;
  outline: none;
  &:focus{
    border: 1px solid #008ABF;
    transition: 0.35s ease;
    color: #008ABF;
    &::-webkit-input-placeholder{
      transition: opacity 0.45s ease; 
      opacity: 0;
     }
    &::-moz-placeholder {
      transition: opacity 0.45s ease; 
      opacity: 0;
     }
    &:-ms-placeholder {
     transition: opacity 0.45s ease; 
     opacity: 0;
     }    
   }
 }

.search-icon{
  position: relative;
  float: right;
  width: 75px;
  height: 75px;
  top: -62px;
  right: -15px;
}


.sidebar i{
  padding-right: 10px;
}

label #sidebar_btn{
  z-index: 1;
  color: black;
  position: fixed;
  cursor: pointer;
  left: 300px;
  font-size: 20px;
  margin: 5px 0;
  transition: 0.5s;
  transition-property: color;
}

label #sidebar_btn:hover{
  color: #19B3D3;
}

.insidetext{
    color: red;
}

</style>

<script>

function insert_from_database(a, b){

    var div = document.createElement('div');
    div.innerHTML = "<div style=\"text-align: left; font-size: 16px; margin-left: 30px; color: #454545; \">"+"<br>"+a+"<br><br>"+b;
  
    div.style = "min-width: 300px; height: 140px; margin-left: 20px; margin-top: 30px; display: inline-grid; border-radius: 15px; text-align: center;background:  white; animation-name: addnode; animation-duration: 2s;animation-direction: all; box-shadow: 0 1px 2px 0 rgba(60, 64, 67, 0.302), 0 2px 6px 2px rgba(60, 64, 67, 0.149); transition-property: transform;             transform: translateX(200px); ";
    document.getElementById('division').prepend(div);
    div.addEventListener('animationend', function() {
  
    });
}
  
</script>   
</head>


  <body>
    <div class="sidebar">
      <i style="margin-left: 40px; color: grey" class="fas fa-home  fa-3x"></i>
     <a href="/DESK/silder.html"><span>Home</span></a>
     <i style="margin-left: 40px; margin-top: 50px; color: grey" class="fas fa-cogs fa-3x"></i> 
        <a href="#introudtion"></i><span>features</span></a>
        <i style="margin-left: 40px; margin-top: 50px; color: grey" class="fas fa-th fa-3x"></i>
        <a href="#Editors"></i><span>Dashboard</span></a>
        
      </div>
      <form style="margin-top: 20px;" class="search-container">
    <input type="search" id="search-bar" placeholder="search .....">
    <a href="#placeholder"><img class="search-icon" src="http://www.endlessicons.com/wp-content/uploads/2012/12/search-icon.png"></a>
  </form>
  <div style="background: #333; height: 110px; width: 100%;  margin-top: -70px;">
    <img src="logo.png">
  
</div>
   <center>
   <header>
              <img class="header-logo" src="https://www.gstatic.com/images/branding/product/1x/keep_48dp.png">
              <h2 class="header-title">Todo</h2>
          </header>
  
   </center>
  
<br><br>

<div id="form-container">
              <form id="form" autocomplete="off" method="POST" action="addtodo">
                 <input name= "title12" id="note-title" placeholder="Title" type="text" required>
                 <input name="text12" id="note-text" placeholder="Create a TODO..." type="text" required>
                 <div id="form-buttons">
                  <button  type = 'submit' id="submit-button">sumbit</button>
                 </div>
              </form>
          </div>
  
<div class="sumbit">
  
</div> 
<br>  
<div id = 'division' 
   style = 'min-width: 90px; min-height: 80px;'>
</div>


<script>
    onload();

function onload(){
        <%
            ArrayList<todoclass> ar1 = (ArrayList<todoclass>) request.getAttribute("todo");
        
            for(int i = 0 ; i < ar1.size() ; i++){ %>
            
                var c = '<%= ar1.size() %>';
                var a = '<%= ar1.get(i).getTitle() %>';
                var b = '<%= ar1.get(i).getText() %>';

                insert_from_database(a,b);
            <% } %>

}
    
</script>
  
</body>
</html>
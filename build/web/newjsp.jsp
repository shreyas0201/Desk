<%-- 
    Document   : newjsp
    Created on : 4 May, 2021, 3:19:25 PM
    Author     : Vinay Chopda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">

<style>
	.sample{
		background-color: red;
		height: 100px;
		width: 100px;
	}
	
  .form-container {
  border-radius: 8px;
  border: 0.5px solid #d3d3d3;
  box-shadow: 0 1px 2px 0 rgba(60, 64, 67, 0.302),
    0 2px 6px 2px rgba(60, 64, 67, 0.149);
  margin: 32px auto 16px auto;
  max-width: 496px;
  transition-duration: 0.218s;
  transition-property: background, border, opacity, box-shadow, transform;
  transition-timing-function: ease-in;
}
	
</style>


</head>
  <body>
   <center>
   <h1 style="color:green">
          Inserting node  horizontally
   </h1>
   </center>
  
<br><br>
  
<h1>click to insert</h1>
  
<div>
  
<input type = 'button' 
    onclick = 'javascript: insert()' value = 'insert'>
<br> 
  
</div> 
    <br><br><br><br>
  
<div id = 'division' 
   style = 'min-width: 300px; min-height: 80px;'>
</div>
   
  
<style>
  
@keyframes addnode {
  
    from 
        {
        transform: translateX(-100px);
        }
  
    to {
        transform: translateX(200px);
       }
  
}
  
</style>
  
<script>
  
var array = [];
var number =1 ;
  
function insert()
{
  
var div = document.createElement('div');
  
div.innerHTML = "title <br> text";
  
document.getElementById('division').prepend(div);
  
  div.className="form-container";
  
//div.style =  "min-width: 100px; height: 100px; border: 4px solid green; display: inline-grid; text-align: center;background:   green;animation-name: addnode; animation-duration: 1s;animation-direction: all;transition-property: transform;             transform: translateX(200px);    padding-left: 10px;";
  
   array.push(number);
  
   number++;
  
  div.addEventListener('animationend', function() {
  
});
}
  
</script>
</body>
</html>
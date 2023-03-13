
<%@page import="java.util.ArrayList"%>
<%@page import="desk.classes.Student_Data"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>html</title>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" charset="utf-8"></script>
    
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" charset="utf-8"></script>
    
	<style>

            .body{
                background-color: red;
            }
            
            .sidebar{
              z-index: 1;
              top: 0;
              background: red;
              margin-top: 10px;
              margin-left: 12px;
              padding-top: 30px;
              position: fixed;
              border-radius: 15px;
              left: 0;
              width: 230px;
              height: 90%;
              transition: 0.5s;
              transition-property: left;
              overflow-y: auto;
            }

            .sidebar a{
              color: #fff;
              display: block;
              margin-top: 10px;
              width: 100%;
              line-height: 40px;
              text-decoration: none;
              padding-left: 40px;
              box-sizing: border-box;
              transition: 0.5s;
              transition-property: background;
            }

            .sidebar a:hover{
              background: orange;
            }

            .sidebar i{
              padding-right: 10px;
            }

            label #sidebar_btn{
              z-index: 1;
              color: #fff;
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

            #check:checked ~ .sidebar{
              left: -185px;
            }

            #check:checked ~ .sidebar a span{
              display: none;
            }

            #check:checked ~ .sidebar a{
              font-size: 20px;
              margin-left: 165px;
              width: 100%;
            }
		
.hi{
  background-color: white;
  width: 900px;
  height: 43px;
  border: 1px solid black;
  border-radius: 15px;
  
  padding: 30px;
margin-top: 2%;
margin-left: 20%;
}
.box1 {
  background-color: #fff;
  width: 30px;
  border: 1px solid green;
  text-align:left;

   padding: 10px 30px;
  float: right;
  margin-top: -55px;
  overflow-x: hidden;
}
.box2 {
  background-color: #fff;
  width: 30px;
  border: 1px solid #333;
  padding: 10px 30px;
  margin: 20px;
  float: right;
  margin-top: -55px;
  margin-right: 120px;
  overflow-x: hidden;
}
.nishant {
  background-color: white;
  width: 870px;
  height: 290px;
  border: 1px solid black;
  border-radius: 15px;
  padding: 50px;
margin-top: 3%;
margin-left: 20%;
overflow: hidden;
overflow-y: scroll;

}
.hi button{
  display: inline;

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


table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 95%;
  margin-left: -5px;
  overflow-y: auto;
  color: #17252a;
  margin-left: 30px;
  border-collapse: separate;
  border-spacing: 0 15px;
}

td, th {

  text-align: center;
  padding-left: 12px;
  padding-bottom: 6px;
  color:#17252a;
  line-height: 37px;
  padding-left:  40px;
}

button {
   padding: 5px 10px;
  border: 1px solid black;
  margin: 5px;
  border-radius: 5px;
  transition: background-color .5s ease;
  -webkit-transition: background-color .5s ease;
  -moz-transition: background-color .5s ease;
  -o-transition: background-color .5s ease; 
   background-color: #2eb050;
  color: white;
  border-color: #1e7d37; 

}
button:hover{

  background-color: #47de6f;
}

	</style>
  </head>
<body>
    
        	<div class="sidebar">
     
     <a href="#"><i class="fas fa-home"></i><span> Home</span></a>
        <a href="#"><i class="fas fa-cogs"></i><span> Features</span></a>
        <a href="/DESK/ExpenseManager"><i class="fas fa-table"></i><span>Dashboard</span></a>
       
                </div>
    
      <div class="hi">
        
            <form method ="POST" action="Transactions">
                <div>
       <span style="font-size: 18px; margin-left: -2%; " for="dateofbirth">From : </span>
            <input type="date" name="from12" >

       <span style="font-size: 18px; margin-left: 1%; margin-top: -4%" for="dateofbirth">To :</span>
            <input type="date" name="to12" style="margin-left: 2px; padding-left: -10px;" >
                </div>

          
        <button type="sumbit" style="margin-left: 17%; margin-top: 2%; ">sumbit</button>
          </form>
        
        <span style="float: right; margin-top: -90px; margin-right: 18px; font-size: 21px; ">Expense</span>
        <div class="box1"> <%= request.getAttribute("expense") %> </div>
        <span style="float: right; margin-top: -90px; margin-right: 139px; font-size: 21px; ">Income</span>
        <div class="box2"> <%= request.getAttribute("income") %>  </div>
        <h1 style="margin-left: 44%; margin-top: -70px;">Transaction</h1>
      </div>

<div class="nishant">
  
 <div>
     <h3 style="margin-left: 150px; margin-top: -20px; border-radius: 15px; background-color: #ff4433; color: white; width: 50%;"> Date Expense Category Amount</h3>
 </div>

<%
    
    ArrayList<Student_Data> stu = (ArrayList<Student_Data>)request.getAttribute("Transactions");
    int i = 0 ;
%>


<% if(stu.size() != 0) { %>

  <table>
      
      <%  for(i = 0 ; i < stu.size() ; i++) {  
          String color;
          if(stu.get(i).getStat() == 1)
              color = "#d1ffd1";
          else
              color = "#ffc6c4";
      %>
      
      <tr style="background-color: <%= color %>">
          
        <td style="overflow-y:auto;"><%= stu.get(i).getDate()%></td>
        
        <% if(stu.get(i).getStat() == 1) { %>
            <td><%="Income"%></td>
        <%}
        else {%>
        <td></td>
        <% }%>
        
        <%if(stu.get(i).getStat() != 1) {%>
            <td><%="Expense"%></td>
        <%}
        else {%>
        <td> </td>
        <% }%>
        
        <td><%= stu.get(i).getCategory()%></td>
        
        <td><%= stu.get(i).getAmount()%></td>

      </tr>
      
      <% } %>
  <% } %>
  
</table>

</div>

  <script >
  $(function () {
  $("#datepicker").datepicker({ 
        autoclose: true, 
        todayHighlight: true
  }).datepicker('update', new Date());
});


</script>

</body>
</html>
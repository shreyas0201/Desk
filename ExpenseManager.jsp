<%-- 
    Document   : ExpenseManager
    Created on : 12 Apr, 2021, 8:46:01 AM
    Author     : Vinay Chopda
--%>

<%@page import="desk.classes.weekdata"%>
<%@page import="desk.classes.Categorywise"%>
<%@page import="java.lang.Integer"%>
<%@page import="java.sql.Time"%>
<%@page import="java.sql.Date"%>
<%@page import="java.time.LocalDate"%>
<%@page import="org.eclipse.persistence.jpa.jpql.parser.DateTime"%>
<%@page import="java.time.DayOfWeek"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.ArrayList"%>
<%@page import="desk.classes.Student_Data"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
 
        <title>Expense Manager</title>
             
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);



      function drawChart() {
        <%
            ArrayList<Categorywise> ar1 = (ArrayList<Categorywise>) request.getAttribute("categorywisedata");
        %>

    var data = new google.visualization.DataTable();
    data.addColumn('string', 'Category');
    data.addColumn('number', 'Amount');

        <%   
        for(int i = 0 ; i < ar1.size() ; i++){ %>
                
                var a = '<%= ar1.get(i).getCategory() %>';
                var b = '<%= ar1.get(i).getAmt() %>';
                
                data.addRow( [String(a),parseInt(b)] );

    <% } %>
        
        var options = {
            title: "Expense Categorywise",
            pieSliceText: 'percentage',
            is3D: true,
            chartArea:{left:20,top:15,width:'90%',height:'85%'}
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));
        chart.draw(data, options);

    }
    </script>
    
    
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript">
    google.charts.load("current", {packages:['corechart']});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
        
                <%
                    ArrayList<weekdata> ar = (ArrayList<weekdata>) request.getAttribute("weekdata");
                %>

        var data = google.visualization.arrayToDataTable([
        ["Element", "Expense", { role: "style" } ],
        ["Mon", parseInt('<%= ar.get(0).getAmount() %>'), "#f0735d"],
        ["Tue", parseInt('<%= ar.get(1).getAmount() %>'), "#f0735d"],
        ["Wed", parseInt('<%= ar.get(2).getAmount() %>'), "#f0735d"],
        ["Thu", parseInt('<%= ar.get(3).getAmount() %>'), "#f0735d"],
        ["Fri", parseInt('<%= ar.get(4).getAmount() %>'),"#f0735d"],
        ["Sat", parseInt('<%= ar.get(5).getAmount() %>'),"#f0735d"],
        ["Sun", parseInt('<%= ar.get(6).getAmount() %>'),"#f0735d"]
      ]);

      var view = new google.visualization.DataView(data);
      view.setColumns([0, 1,
                       { calc: "stringify",
                         sourceColumn: 1,
                         type: "string",
                         role: "annotation" },
                       2]);

      var options = {
        title: "Weekly Expense",
        bar: {groupWidth: "95%"},
        animation:{
            duration: 1000,
            easing: 'out',
        },
        chartArea:{left:40,top:15,width:'85%',height:'80%'}
      };
      var chart = new google.visualization.ColumnChart(document.getElementById('columnchart_values'));
      chart.draw(view, options);
  }
  </script>
        
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" charset="utf-8"></script>
        <style>

            body{
                background-color: #f2f2f2;    
                font-family: sans-serif;
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

           .box_1{
            background: white;//#faa0a0;
                width:150px;
                height: 85px;
                margin-top: 10px;
                margin-left: 250px;
                border: 1px;
                border-radius: 15px;
                box-shadow: 1px 1px 5px 2.7px lightgray;
                position: fixed;
            }
            
                                .box_1 > div {
                                    height: 50px;
                                    background-color: white;
                                    width: 100px;
                                    margin-top: -10px;
                                    margin-left: 25px;
                                    text-align: center;
                                    line-height: 24px;
                                    font-size: 15px;
                                    box-shadow: 2px 2px 7px 1px lightgray;
                                    border-radius: 15px;
                                }
            
            
            
            .box_2{
                background: white;//#ff2400;//#f8b46b;
                width:150px;
                height: 85px;
                margin-top: 10px;
                margin-left: 430px; 
                border: 1px;
                border-radius: 15px;
                box-shadow: 1px 1px 5px 2.7px lightgray;
                position: fixed;
                //background-image: linear-gradient(to right top, #ffffff, #f8f4fb, #f5e9f5, #f4ddec, #f5d1e0, #f9c2d2, #fdb2c1, #ffa3ad, #ff8c93, #ff7576, #ff5d57, #ff4433);
            }
                        
                                .box_2 > div {
                                    height: 50px;
                                    background-color: white;
                                    width: 100px;
                                    margin-top: -10px;
                                    margin-left: 25px;
                                    text-align: center;
                                    line-height: 24px;
                                    font-size: 15px;
                                    box-shadow: 2px 2px 7px 1px lightgray;
                                    border-radius: 15px;
                                }
            
            .box_3{
                background: white;//#faa0a0;//#f8b46b;
                width:150px;
                height: 85px;
                margin-top: 10px;
                margin-left: 610px;
                border: 1px;
                border-radius: 15px;
                box-shadow: 1px 1px 5px 2.7px lightgray;
                position: fixed;
                //background-image: linear-gradient(to right top, #ffffff, #f8f4fb, #f5e9f5, #f4ddec, #f5d1e0, #f9c2d2, #fdb2c1, #ffa3ad, #ff8c93, #ff7576, #ff5d57, #ff4433);
            }
            
                                .box_3 > div {
                                    height: 50px;
                                    background-color: white;
                                    width: 100px;
                                    margin-top: -10px;
                                    margin-left: 25px;
                                    text-align: center;
                                    line-height: 24px;
                                    font-size: 15px;
                                    box-shadow: 2px 2px 7px 1px lightgray;
                                    border-radius: 15px;
                                }
                        .flex-container {
                              display: flex;
                                flex-wrap: nowrap;
                                background-color: white;
                                width: 400px;
                                height: 75px;
                                margin-top: 10px;
                                margin-left: 810px;
                                border: 1px;
                                border-radius: 15px;
                                box-shadow: 3px 3px 3px 3px lightgray;
                                position: fixed;
                                
                              }
                                .flex-container > div {
                                    background-color: #fce4d9;
                                    width: 100px;
                                    margin: 12px;
                                    text-align: center;
                                    line-height: 24px;
                                    font-size: 15px;
                                    box-shadow: 2px 2px 7px 1px lightgray;
                                    border-radius: 10px;
                                }
            .box_5{
                background: white;
                width: 530px;
                height: 230px;
                margin-top: 130px;
                margin-left: 250px;
                border: 1px;
                border-radius: 15px;
                box-shadow: 3px 3px 3px 3px lightgray;
                position: fixed;
            }
            .box_6{
                background: white;
                width: 440px;
                height: 430px;
                margin-top: 120px;
                margin-left: 800px;
                border: 1px;
                border-radius: 15px;
                box-shadow: 3px 3px 3px 3px lightgray;
                position: fixed;
            }
                                    .box_6 > div {
                                    background: white;
                                    width: 425px;
                                    height: 250px;
                                    margin-top: -10px;
                                    margin-left: 10px;
                                    text-align: center;
                                    line-height: 24px;
                                    font-size: 15px;
                                    border-radius: 10px;
                                    overflow: hidden;
                                    overflow-y: scroll;
                                }
            .box_7{
                background: white;
                width: 150px;
                height: 170px;
                margin-top: 380px;
                margin-left: 250px;
                border: 1px;
                border-radius: 15px;
                box-shadow: 3px 3px 3px 3px lightgray;
                position: fixed;
                
            }
            
            .box_8{
                background: white;
                width: 325px;
                height: 170px;
                margin-top: 380px;
                margin-left: 435px;
                border: 1px;
                border-radius: 15px;
                box-shadow: 3px 3px 3px 3px lightgray;
                position: fixed;
                border-radius: 15px;
            }
         
            
             .modal {
  display: none; 
  position: fixed; 
  z-index: 1; 
  padding-top: 100px; 
  left: 0;
  top: 0;
  width: 100%; 
  height: 100%; 
  overflow: auto; 
  background-color: rgb(0,0,0); 
  background-color: rgba(0,0,0,0.77);
}


.modal-content {
  background-color: #fefefe;
  margin: auto;
  padding: 20px;
  border: 1px solid #888;
  margin-top: -50px;
  width: 27%;
  height: 70%;
  border-radius:15px;
}


.close {
  color: #aaaaaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}

table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
  margin-left: -5px;
  overflow-y: auto;
  color: #17252a;
}

td, th {

  text-align: center;
  padding-left: 12px;
  padding-bottom: 6px;
  color:#17252a;
}

.line{
    width:380px;
    color: black;
    margin-top: 15px;
}

.transactionDetails{
    width:80%; 
    height: 28px; 
    margin-top: 16.5px; 
    margin-left: 30px; 
    border-radius: 5px;
    box-shadow: 1px 1px 1px 1px lightgrey;
    background-color: white;
    border: 1px solid #ffffff;
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



        </style>
        
    </head>
    
    <body>
        
        	<div class="sidebar">
     
     <a href="/DESK/silder.html"><i class="fas fa-home"></i><span> Home</span></a>
        <a href="#"><i class="fas fa-cogs"></i><span> Features</span></a>
        <a href="/DESK/Transactions"><i class="fas fa-money-bill-alt"></i><span>Transactions</span></a>
       
                </div>
        

        <div class="box_1">
                      <img src="cashout4.jpg" style="width:50%; height: 80%; margin-top: 0px;">
            <h3 style="color: #ff4433;  margin-top: -45px; margin-left: 77px; ">Income</h3>
            <div>
                <%  Float t1 = (Float) request.getAttribute("Income"); %>
                <%= request.getAttribute("Income") %>
            </div>
                         
        </div>
        
        <div class="box_2">
            <img src="cashout4.jpg" style="width:50%; height: 80%; margin-top: 0px;">
            <h3 style="color: #ff4433;  margin-top: -45px; margin-left: 70px; ">Expense</h3>
            <div style="text-align: center;">
                    <%   Float t = (Float) request.getAttribute("Expense"); %>
                    <h3>  <%= request.getAttribute("Expense") %> </h3>
            </div>
        </div>
        
        
        <div class="box_3">
            <h3 style="color:#ff4433;"><center>Net Balance</center></h3>
            <div>
                <% Float t2 = t1 - t; %>
                <%= t2 %>
            </div>
           
        </div>
        

         <div class="flex-container">
  <div>
      <%LocalDate  date = LocalDate.now(); 
        
        date = date.minusDays(3);
        DayOfWeek dayOfWeek = date.getDayOfWeek();
        String temp = dayOfWeek.toString().substring(0,3);
    
    %>
    <%= temp %>
    <br>
    <%=date.getDayOfMonth()%>
    
    
  </div>
  
  
  <div>
      
       <%date = LocalDate.now(); 
        date = date.minusDays(2);
        dayOfWeek = date.getDayOfWeek();
        temp = dayOfWeek.toString().substring(0,3);
    
    %>
    <%= temp %>
    <br>
    <%=date.getDayOfMonth()%>
      
  </div>
    
    
    <div>
       <%date = LocalDate.now(); 
        date = date.minusDays(1);
        dayOfWeek = date.getDayOfWeek();
        temp = dayOfWeek.toString().substring(0,3);
    
    %>
    <%= temp %>
    <br>
    <%=date.getDayOfMonth()%>
        
    </div>  
    
    <div style="background:#f0735d; color:#f2f1ff">
       <%date = LocalDate.now(); 
        dayOfWeek = date.getDayOfWeek();
        temp = dayOfWeek.toString().substring(0,3);
    
    %>
    <%= temp %>
    <br>
    <%=date.getDayOfMonth()%>
    <% int day = date.getDayOfMonth(); %>
    </div>
    
    
    <div>
        
       <%date = LocalDate.now(); 
        date = date.plusDays(1);
        dayOfWeek = date.getDayOfWeek();
        temp = dayOfWeek.toString().substring(0,3);
    
    %>
    <%= temp %>
    <br>
    <%=date.getDayOfMonth()%>
      
        
        
    </div>
  </div>
  
  
        <div class="box_5" id="piechart">
        </div>

        
        <div class="box_8" id="columnchart_values"  >
        </div>

        
<div class="box_6"> 
  
    <h3 style="margin-top:10px; margin-left: 10px" >       Today's Transaction</h3>
    <div>        
                <% int k = 0; 
                    int i = 0;
                    ArrayList<Student_Data> stu;
                    long total = 0;
                %>
 <%
     stu = (ArrayList<Student_Data>)request.getAttribute("Transactions");
     k = stu.size();
     i = 0;
 %>
 
 <div>
     <h3 style="border-radius: 15px; background-color: #ff4433; color: white"> Date Expense Category Amount</h3>
 </div>
 <table>
 <!-- <tr style="background-color: #ff4433; border-radius: 15px;">
      <th style="padding-right:20px">Date</th>
    <th>Income / Expense</th>
    <th>Category</th>
    <th>Amount</th>
  </tr>
-->
  <!-- 1 -->
  
  <%
        if(i < k){%>
           <tr>
        <td style="overflow-y:auto;"><%= stu.get(0).getDate()%></td>
        <% if(stu.get(i).getStat() == 1) {%>
        <td><%="Income"%></td>
        <%}%>
        <%if(stu.get(i).getStat() != 1) {%>
        <td><%="Expense"%></td>
        <%}%>
        <td><%= stu.get(i).getCategory()%></td>
        <td><%= stu.get(i).getAmount()%></td>
    </tr> 
        <%  total += stu.get(i).getAmount(); i++;  }%>
        <% if( i > k ){ %>
            <tr>
            <td>null</td>
            <td>null</td>
            <td>null</td>
            <td>null</td>
            </tr>
        <% } %>
        
        
        
  <!-- 2 -->
  
        
        <% if(i < k){%>
           <tr>
        <td><%= stu.get(0).getDate()%></td>
        <% if(stu.get(i).getStat() == 1) {%>
        <td><%="Income"%></td>
        <%}%>
        <%if(stu.get(i).getStat() != 1) {%>
        <td><%="Expense"%></td>
        <%}%>
        <td><%= stu.get(i).getCategory()%></td>
        <td><%= stu.get(i).getAmount()%></td>
    </tr> 
        <%  total += stu.get(i).getAmount(); i++; }%>
        <% if(i > k ) { %>
            <tr>
            <td>null</td>
            <td>null</td>
            <td>null</td>
            <td>null</td>
            </tr>
        <% } %>
        
  
        
  <!-- 3 -->
  
         <% if(i < k){%>
           <tr>
        <td><%= stu.get(0).getDate()%></td>
        <% if(stu.get(i).getStat() == 1) {%>
        <td><%="Income"%></td>
        <%}%>
        <%if(stu.get(i).getStat() != 1) {%>
        <td><%="Expense"%></td>
        <%}%>
        <td><%= stu.get(i).getCategory()%></td>
        <td><%= stu.get(i).getAmount()%></td>
    </tr> 
        <% total += stu.get(i).getAmount();   i++; }%>
        <% if(i > k) { %>
            <tr>
            <td>null</td>
            <td>null</td>
            <td>null</td>
            <td>null</td>
            </tr>
        <% } %>
        
        
  <!-- 4 -->
  
        
   <% if(i < k){%>
           <tr>
        <td><%= stu.get(0).getDate()%></td>
        <% if(stu.get(i).getStat() == 1) {%>
        <td><%="Income"%></td>
        <%}%>
        <%if(stu.get(i).getStat() != 1) {%>
        <td><%="Expense"%></td>
        <%}%>
        <td><%= stu.get(i).getCategory()%></td>
        <td><%= stu.get(i).getAmount()%></td>
    </tr> 
        <%  total += stu.get(i).getAmount();   i++; }%>
        <% if(i > k) { %>
            <tr>
            <td>null</td>
            <td>null</td>
            <td>null</td>
            <td>null</td>
            </tr>
        <% } %>
        
        
  <!-- 5 -->
  
        
        
   <% if(i < k){%>
           <tr>
        <td><%= stu.get(0).getDate()%></td>
        <% if(stu.get(i).getStat() == 1) {%>
        <td><%="Income"%></td>
        <%}%>
        <%if(stu.get(i).getStat() != 1) {%>
        <td><%="Expense"%></td>
        <%}%>
        <td><%= stu.get(i).getCategory()%></td>
        <td><%= stu.get(i).getAmount()%></td>
    </tr> 
        <% total += stu.get(i).getAmount(); i++; }%>
        <% if(i > k) { %>
            <tr>
            <td>null</td>
            <td>null</td>
            <td>null</td>
            <td>null</td>
            </tr>
        <% } %>
        
 </table>

    </div>
        
               <hr class="line">
               <h5 style="color:skyblue; margin-left:50px; margin-top: 0px"><a href="/DESK/Transactions" > view all </a> </h5>
               <h3 style="margin-left:265px; margin-top: -32px; font-size: 15px"> Total = <%= total %></h3>
            <button id="myBtn" type="button" style="height:30px; margin-top:20px; margin-left: 170px; border:1px solid black; padding: 5px; border-radius: 15px; background-color: #ff4433; color: white; border-color: #ff4433;">Add Transaction</button>
</div>

<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>
    <h2 style="color:#ff4433"> Transaction Details.. </h2>
    
    <form action="AddTransaction" method="POST">
        
        
        <select id="type" class="transactionDetails" name="type">
            <option>Income</option>
            <option>Expense</option>
        </select>
        
        <input type="date" placeholder="Date" class="transactionDetails" required name="Date">
        <br>
        <input list="Categories" name="Category" id="Category" class="transactionDetails" placeholder="pick a Category">
        <datalist id="Categories">
            <option value="House">
            <option value="School">
            <option value="Trip">
            <option value="Laptop">
            <option value="Other">
        </datalist>
        <br>
        <input name = "Amount" type="Number" class="transactionDetails" placeholder = " Amount.. " required> <br>
        <button type="submit" value="required" style="margin-top: 70px; margin-left: 120px; border-radius: 15px; color: white; width: 100px; background-color: #ff4433; border-color: #ff4433; height: 30px; ">Done</button>
    </form>
    
  </div>

</div>
            <div class="box_7">
            <img src="expenseaverage.jpg" style="width:100%; height: 60%">
            <h3 style="font-size: 13px">Average Daily Expense</h3>
            <center> <%= t/day %> </center> 
        </div>

        <script>
// Get the modal
var modal = document.getElementById("myModal");

var btn = document.getElementById("myBtn");


var span = document.getElementsByClassName("close")[0];

btn.onclick = function() {
  modal.style.display = "block";
}


span.onclick = function() {
  modal.style.display = "none";
}


window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>

    </body>
    
</html>

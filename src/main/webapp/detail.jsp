<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.* , java.sql.*, java.text.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="./css/bootstrap.css">
<link rel="stylesheet" href="./css/bootstrap.min.css">
</head>
<body>

<a class="nav-link btn btn-secondary" style="color: #fff; width: 200px; margin-top: 5px; position: absolute; right: 20px;" href="index.jsp"> Back to List</a>

<%

HttpSession hs = request.getSession();
String item = (String) hs.getAttribute("items");

String i = request.getParameter("id");
Connection connection =  DriverManager.getConnection("jdbc:mysql://localhost/itemdb","root","3465");
String sql = "SELECT * FROM itemdb.itemtb WHERE Id = '"+i+"'";
PreparedStatement preparedStatement = connection.prepareStatement(sql);
ResultSet resultset = preparedStatement.executeQuery();

%>
    
<%
 while(resultset.next()) {
            	String id = resultset.getString("Id");
				String items = resultset.getString(2);
				String brand = resultset.getString(3);
				String condition = resultset.getString(4);
				String price = resultset.getString(5);
				String quantity = resultset.getString(6);
				String date = resultset.getString(7);
				String desc = resultset.getString(8);
				String image = resultset.getString(9); 
				
			%>
			
			<div class="container overflow-hidden detdiv" style="height: 350px; width: 700; margin-top: 0px;">
			<h1>Item's Detail Information</h1>
			  <div class="row gy-5 ldiv">
			    <div class="col-6">
			      <div class="p-3 border bg-primary">
			      				<div class="container overflow-hidden">
						  <div class="row gx-5">
						    <div class="col">
						     <div class="p-3 border bg-light">
			                      <img style="width: 180px; height: 180px;" alt="" src="<%= image %>" />
			                </div>
						    </div>
						    <div class="col" style="margin-left: 10px;">
			      <div class="p-3 border bg-light" style="margin-top: 10px;">
					  <span>Posted Date : <%= date %></span><br>
					  <span>Model : <%= items %></span><br>
					  <span>Brand : <%= brand %></span><br>
					  <span>Condition : <%= condition %></span><br>
					  <span>Price : <%= price %></span><br>
					  <span>Quantity : <%= quantity %></span><br>
					  <span>Description : <%= desc %></span>
				  </div>
			    </div>
			  </div>
			</div>
      </div>
    </div>
  </div>
</div>
<%     
	  }
	%>
	

</body>
</html>
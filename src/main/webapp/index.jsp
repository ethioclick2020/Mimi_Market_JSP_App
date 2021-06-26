<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.* , java.sql.*, java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="./css/bootstrap.css">
<link rel="stylesheet" href="./css/bootstrap.min.css">
<title>ItemShoping</title>
</head>
<body>
<%

Connection connection =  DriverManager.getConnection("jdbc:mysql://localhost/itemdb","root","3465");
String sql = "SELECT * FROM itemdb.itemtb ORDER BY Id DESC";
PreparedStatement preparedStatement = connection.prepareStatement(sql);
ResultSet resultset = preparedStatement.executeQuery();

HttpSession hs = request.getSession();
String name = (String) hs.getAttribute("user");
String upString = name.toUpperCase();

%>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container-fluid">
    <a class="navbar-brand" style="margin-left: 20px" href="index.jsp">Mobile Shopping</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown" style="margin-right: 20px">
      <ul class="navbar-nav ">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Features</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Pricing</a>
        </li>
        <li class="nav-item" style="margin-left: 60px;">
          <h3 align="center" class="nav-link profile"><b class="proa"><%= upString.charAt(0) %></b></h3>
        </li>
        <li class="nav-item">
          <a class="nav-link btn btn-success" href="logout.jsp">Sign Out</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
<a class="nav-link btn btn-secondary" style="color: #fff; width: 200px; margin-top: 5px; position: absolute; right: 20px;" href="additem.jsp">+ Add Items</a>
<div class="container overflow-hidden" style="margin-top: 50px;">
  <div class="row gy-5">
<%
 while(resultset.next()) {
            	String id = resultset.getString("Id");
				String item = resultset.getString(2);
				String brand = resultset.getString(3);
				String condition = resultset.getString(4);
				String price = resultset.getString(5);
				String quantity = resultset.getString(6);
				String date = resultset.getString(7);
				String image = resultset.getString(9); 
				
			%>
	 		
		  

    <div class="col-6">
      <div class="p-3 border bg-dark" style="margin: 10px;">
			<div class="container overflow-hidden">
			  <div class="row gx-5">
			    <div class="col">
			     <div class="p-3 border bg-light">
                      <img style="width: 200px; height: 200px;" alt="" src="<%= image %>" />
                </div>
			    </div>
			    <div class="col" style="margin-left: 10px;">
			      <div class="p-3 border bg-light" style="margin-top: 10px;">
					  <span>Posted Date : <%= date %></span><br>
					  <span>Model : <%= item %></span><br>
					  <span>Price :<%= price %></span>
				  </div>
				  <div class="row gy-5" style="margin-top: 5px;">
					 <a class="nav-link btn btn-primary" style="margin-top: 10px; color: #fff;" href="detail.jsp?id=<%= id %>" id="btn1" >Details</a>
					 <a class="nav-link btn btn-secondary" style="margin-top: 10px; color: #fff;" href="view.jsp?id=<%= id %>" id="btn1" >Edit</a>
				  </div>
			    </div>
			  </div>
			</div>
      </div>
    </div>

  
   <%     
	  }
	%>
	</div>
</div>
</body>
</html>
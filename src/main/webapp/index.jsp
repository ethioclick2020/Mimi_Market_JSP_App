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

				<div style="display: flex;">
				<form action="" method="post">
				<div class="input-group" style="margin-top: 15px; margin-left: 600px;">
				  <div class="form-outline">
				    <input type="search" id="form1" placeholder="Search" name="sea" class="form-control" />
				  </div>
				    <Button class="btn btn-outline-success" name="search" type="submit" >Search</Button>
				</div>
				</form>
			<a class="nav-link btn btn-secondary" style="color: #fff; width: 200px; margin-top: 5px; 
					position: absolute; right: 20px;" href="additem.jsp">+ Add Items</a>
				
				</div>

<div class="container overflow-hidden" style="margin-top: 50px;">
  <div class="row gy-5">
<%
if (request.getParameter("search") != null) { 
	String sea = request.getParameter("sea");
	String query = "SELECT * FROM itemdb.itemtb WHERE Model like '%"+sea+"%' ORDER BY Id DESC ";
	PreparedStatement preparedStatements = connection.prepareStatement(query);
	ResultSet resultsets = preparedStatements.executeQuery();
	
				if(resultsets.next() == false){
					%>
					<div class="col-6">
					   <h2>No Match Found!</h2>
					</div>
				<%	
				  resultsets.close();
				 }
				
		else{
				String q = "SELECT * FROM itemdb.itemtb WHERE Model like '%"+sea+"%' ORDER BY Id DESC ";
				PreparedStatement ps = connection.prepareStatement(q);
				ResultSet rs = ps.executeQuery();
	 			while(rs.next()) {
            	String idd = rs.getString("Id");
            	String itemd = rs.getString(2);
				String brandd = rs.getString(3);
				String conditiond = rs.getString(4);
				String priced = rs.getString(5);
				String quantityd = rs.getString(6);
				String dated = rs.getString(7);
				String imaged = rs.getString(9); 
 %>

					<div class="col-6">
				        <div class="p-3 border bg-dark" style="margin: 10px;">
							<div class="container overflow-hidden">
							  <div class="row gx-5">
							    <div class="col">
							     <div class="p-3 border bg-light">
				                      <img style="width: 200px; height: 200px;" alt="" src="<%= imaged %>" />
				                </div>
							    </div>
							    <div class="col" style="margin-left: 10px;">
							      <div class="p-3 border bg-light" style="margin-top: 10px;">
									  <span>Posted Date : <%= dated %></span><br>
									  <span>Model : <%= itemd %></span><br>
									  <span>Price :<%= priced %></span>
								  </div>
								  <div class="row gy-5" style="margin-top: 5px;">
									 <a class="nav-link btn btn-primary" style="margin-top: 10px; color: #fff;" href="detail.jsp?id=<%= idd %>" id="btn1" >Details</a>
									 <a class="nav-link btn btn-secondary" style="margin-top: 10px; color: #fff;" href="view.jsp?id=<%= idd%>" id="btn1" >Edit</a>
								  </div>
							    </div>
							  </div>
							</div>
				      </div>
				    </div>

    <%   
        }
          }
			} 
				else {
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
	  }
			
	%>
	</div>
</div>
</body>
</html>
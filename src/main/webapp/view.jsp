<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.* , java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="./css/bootstrap.css">
<link rel="stylesheet" href="./css/bootstrap.min.css">
</head>
<body>
<%

HttpSession hs = request.getSession();
String item = (String) hs.getAttribute("items");

String i = request.getParameter("id");
String name = request.getParameter("item");
String brand = request.getParameter("brand");
String condition = request.getParameter("condition");
String prices = request.getParameter("price");
String quan = request.getParameter("quan");
String date = request.getParameter("date");
String descr = request.getParameter("desc");
String img = null;

Connection connection =  DriverManager.getConnection("jdbc:mysql://localhost/itemdb","root","3465");
String sql = "SELECT * FROM itemdb.itemtb WHERE Id = '"+i+"'";
PreparedStatement preparedStatement = connection.prepareStatement(sql);
ResultSet resultset = preparedStatement.executeQuery();

%>
<%
if (request.getParameter("update") != null) {
	   
	   HttpSession iii = request.getSession();
	   iii.setAttribute("items", item);
	   response.sendRedirect("index.jsp");
	   
	   while(resultset.next()) {
		String imgg = resultset.getString(9);
		if(request.getParameter("img").equals("")){
		   img = imgg;
	       //response.getWriter().append(img);
	   }
	   else{
		   img = request.getParameter("img");
		   //response.getWriter().append(img);
	   }
	   } 
	   
	    String query = "UPDATE itemtb SET Model = ?, Brand = ?, Conditions = ?, Price = ?, Quantity = ?, Date = ?,Description = ?, Image = ? WHERE Id = '"+i+"'";
	    PreparedStatement preparedStatements = connection.prepareStatement(query);
		preparedStatements.setString(1, name);
		preparedStatements.setString(2, brand);
		preparedStatements.setString(3, condition);
		preparedStatements.setString(4, prices);
		preparedStatements.setString(5, quan);
		preparedStatements.setString(6, date);
		preparedStatements.setString(7, descr);
		preparedStatements.setString(8, img);
		
		preparedStatements.executeUpdate(); 
		
	   
   }
if (request.getParameter("delete") != null) {
	   
	   HttpSession iii = request.getSession();
	   iii.setAttribute("items", item);
	   response.sendRedirect("index.jsp");
	   
	   
	    String query = "DELETE FROM itemtb WHERE Id = '"+i+"'";
	    PreparedStatement preparedStatements = connection.prepareStatement(query);
		
		preparedStatements.executeUpdate();
		
	   
}

%>           
           <a class="nav-link btn btn-secondary" style="color: #fff; width: 200px; margin-top: 5px; position: absolute; right: 20px;" href="index.jsp"> Back to List</a>

            <% 
              while(resultset.next()) {
				String items = resultset.getString(2);
				String brands = resultset.getString(3);
				String conditions = resultset.getString(4);
				String price = resultset.getString(5);
				String quantity = resultset.getString(6);
				String dates = resultset.getString(7);
				String desc = resultset.getString(8);
				String imgg = resultset.getString(9);
				
			%>
			
                  <h3 class="a" align="center">Edit Item's Detail Information</h3 >
                  <div align="center" class="view">
                  	<div class="container overflow-hidden ">
					  <div class="row gy-5 ldiv">
					    <div class="col-6">
					       <form method="post">
					      <div class="p-3 border bg-primary" style="width: 1000px">
								 
					      				<div class="container overflow-hidden">
								  <div class="row gx-5">
								    <div class="col">
								     <div class="p-3 border bg-light" style="margin-top: 10px">
					                      <img style="width: 360px; height: 380px;" alt="" src="<%= imgg %>" /><br>
					                      Change Image : <input type="file" class="form-control" id="inputEmail3" name="img" placeholder="F:\PROGRAMS\Eclipse JAVA\JspItemShoping\src\main\webapp\images" >
					                </div>
								    </div>
								    <div class="col" style="margin-left: 10px;">
								      <div class="p-3 border bg-light" style="margin-top: 10px;">
								      
										  <label class="label1">Model</label><input type="text" name="item" class="label2" value="<%= items %>"><br><br>
						                  <label class="label1">Brand</label>
						                  <select class="label2" name="brand" style="padding: 4px; width: 200px;">
								                <option value="<%= brands %>"><%= brands %></option>
								                <option value="Apple">Apple</option>
								                <option value="Huawei">Huawei</option>
								                <option value="Samsung">Samsung</option>
								                </select><br><br>
						                  <label class="label1">Condition</label><select class="label2" name="condition" style="padding: 4px; width: 200px;">
								                <option value="<%= conditions %>"><%= conditions %></option>
								                <option value="New">New</option>
								                <option value="Used">Used</option>
								                </select><br><br>
						                  <label class="label1">Item Price</label><input type="text" name="price" class="label2" value="<%= price %>" ><br><br>
						                  <label class="label1">Item Quantity</label><input type="number" name="quan" class="label2" value="<%= quantity %>"><br><br>
						                  <label class="label1">Posted On</label><input type="date" name="date" class="label2" value="<%= dates %>"><br><br>
						                  <label class="label1">Description</label><textarea name="desc" class="form-control label2" id="inputEmail3" name="description"
						                                                                     style="width:400px; height: 100px"><%= desc %></textarea><br>
						                  <div style="display: flex;">
						                   <input class="nav-link btn btn-primary" style="margin-left: 160px; color: #fff;" type="submit" name="update" value="Update">
						                   <input class="nav-link btn btn-primary" style="margin-left: 20px; color: #fff;" type="submit" name="delete" value="Delete">
						                   </div>
						                   </form>
						                  </div>
									  </div>
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
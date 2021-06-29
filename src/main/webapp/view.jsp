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
	String id = request.getParameter("id");
	String modelName = request.getParameter("model");
	String brand = request.getParameter("brand");
	String condition = request.getParameter("condition");
	String price = request.getParameter("price");
	String quantity = request.getParameter("quantity");
	String postDate = request.getParameter("postdate");
	String description = request.getParameter("description");
	String image = null;

	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/itemdb", "root", "3465");
	String sql = "SELECT * FROM itemdb.itemtb WHERE Id = '" + id + "'";
	PreparedStatement preparedStatement = connection.prepareStatement(sql);
	ResultSet resultset = preparedStatement.executeQuery();

	if (request.getParameter("update") != null) {

		response.sendRedirect("index.jsp");

		while (resultset.next()) {
			String image1 = resultset.getString(9);
			if (request.getParameter("image").equals("")) {
		image = image1;
		//response.getWriter().append(img);
			} else {
		image = request.getParameter("image");
			}
		}

		String query = "UPDATE itemtb SET Model = ?, Brand = ?, Conditions = ?, Price = ?, Quantity = ?, "
		+ "Date = ?, Description = ?, Image = ? WHERE Id = '" + id + "'";
		PreparedStatement preparedStatements = connection.prepareStatement(query);
		preparedStatements.setString(1, modelName);
		preparedStatements.setString(2, brand);
		preparedStatements.setString(3, condition);
		preparedStatements.setString(4, price);
		preparedStatements.setString(5, quantity);
		preparedStatements.setString(6, postDate);
		preparedStatements.setString(7, description);
		preparedStatements.setString(8, image);

		preparedStatements.executeUpdate();

	}
	if (request.getParameter("delete") != null) {

		response.sendRedirect("index.jsp");

		String query = "DELETE FROM itemtb WHERE Id = '" + id + "'";
		PreparedStatement preparedStatements = connection.prepareStatement(query);

		preparedStatements.executeUpdate();

	}
	%>
	<a class="nav-link btn btn-secondary"
		style="color: #fff; width: 200px; margin-top: 5px; position: absolute; right: 20px;"
		href="index.jsp"> Back to List</a>

	<%
	while (resultset.next()) {
		String items = resultset.getString(2);
		String brands = resultset.getString(3);
		String conditions = resultset.getString(4);
		String prices = resultset.getString(5);
		String quantitys = resultset.getString(6);
		String postDates = resultset.getString(7);
		String descriptions = resultset.getString(8);
		String image1 = resultset.getString(9);
	%>

	<h3 class="a" align="center">Edit Item's Detail Information</h3>
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
											<img style="width: 360px; height: 380px;" alt=""
												src="<%=image1%>" /><br> Change Image : <input
												type="file" class="form-control" id="inputEmail3"
												name="image">
										</div>
									</div>
									<div class="col" style="margin-left: 10px;">
										<div class="p-3 border bg-light" style="margin-top: 10px;">

											<label class="label1">Model</label><input type="text"
												name="model" class="label2" value="<%=items%>"><br>
											<br> <label class="label1">Brand</label> <select
												class="label2" name="brand"
												style="padding: 4px; width: 200px;">
												<option value="<%=brands%>"><%=brands%></option>
												<option value="Apple">Apple</option>
												<option value="Huawei">Huawei</option>
												<option value="Samsung">Samsung</option>
											</select><br> <br> <label class="label1">Condition</label><select
												class="label2" name="condition"
												style="padding: 4px; width: 200px;">
												<option value="<%=conditions%>"><%=conditions%></option>
												<option value="New">New</option>
												<option value="Used">Used</option>
											</select><br> <br> <label class="label1">Item Price</label><input
												type="text" name="price" class="label2" value="<%=prices%>"><br>
											<br> <label class="label1">Item Quantity</label><input
												type="number" name="quantity" class="label2"
												value="<%=quantitys%>"><br> <br> <label
												class="label1">Posted On</label><input type="date"
												name="postdate" class="label2" value="<%=postDates%>"><br>
											<br> <label class="label1">Description</label>
											<textarea class="form-control label2" id="inputEmail3"
												name="description" style="width: 400px; height: 100px"><%=descriptions%></textarea>
											<br>
											<div style="display: flex;">
												<input class="nav-link btn btn-primary"
													style="margin-left: 160px; color: #fff;" type="submit"
													name="update" value="Update"> <input
													class="nav-link btn btn-primary"
													style="margin-left: 20px; color: #fff;" type="submit"
													name="delete" value="Delete">
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
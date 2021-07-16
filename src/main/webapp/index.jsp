<<<<<<< HEAD
<%@page import="com.hibernate.DAO"%>
<%@page import="com.hibernate.ItemInfo"%>
=======
<%@page import="com.shop.DAO"%>
<%@page import="com.shop.ItemInfo"%>
>>>>>>> f27f8e6e6390405e79173531577a1dbed0a462c5
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.util.* , java.sql.*, java.text.*"%>
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
<<<<<<< HEAD
=======
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/itemdb", "root", "3465");

>>>>>>> f27f8e6e6390405e79173531577a1dbed0a462c5
	DAO dao = new DAO();

	HttpSession hs = request.getSession();
	String name = (String) hs.getAttribute("user");
<<<<<<< HEAD
	//String name = "Jote";
=======
>>>>>>> f27f8e6e6390405e79173531577a1dbed0a462c5
	String upString = name.toUpperCase();
	%>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<div class="container-fluid">
			<a class="navbar-brand" style="margin-left: 20px" href="index.jsp">Mobile
				Shopping</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
				aria-controls="navbarNavDropdown" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse justify-content-end"
				id="navbarNavDropdown" style="margin-right: 20px">
				<ul class="navbar-nav ">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="index.jsp">Home</a></li>
<<<<<<< HEAD
					<li class="nav-item typeula"><a class="nav-link" href="#">Electronics</a>
						<ul class="typeul">
							<li class="typeli"><a class="typea"
								href="electronics.jsp?id=1">Phone</a></li>
							<li class="typeli"><a class="typea"
								href="electronics.jsp?id=2">Computer</a></li>
							<li class="typeli"><a class="typea"
								href="electronics.jsp?id=3">Camera</a></li>
							<li class="typeli"><a class="typea"
								href="electronics.jsp?id=4">TV & Others</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link" href="mylisting.jsp">My
							Listing</a></li>
=======
					<li class="nav-item"><a class="nav-link" href="#">Features</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">Pricing</a>
					</li>
>>>>>>> f27f8e6e6390405e79173531577a1dbed0a462c5
					<li class="nav-item" style="margin-left: 60px;">
						<h3 align="center" class="nav-link profile">
							<b class="proa"><%=upString.charAt(0)%></b>
						</h3>
					</li>
					<li class="nav-item"><a class="nav-link btn btn-success"
						href="logout.jsp">Sign Out</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div style="display: flex;">
		<form action="" method="post">
			<div class="input-group"
				style="margin-top: 15px; margin-left: 600px;">
				<div class="form-outline">
					<input type="search" id="form1" placeholder="Search" name="search"
						class="form-control" />
				</div>
				<Button class="btn btn-outline-success" name="search" type="submit">Search</Button>
			</div>
		</form>
		<a class="nav-link btn btn-secondary"
			style="color: #fff; width: 200px; margin-top: 5px; position: absolute; right: 20px;"
			href="additem.jsp">+ Add Items</a>

	</div>

	<div class="container overflow-hidden" style="margin-top: 50px;">
		<div class="row gy-5">
			<%
			if (request.getParameter("search") != null) {
<<<<<<< HEAD
				Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/itemdb", "root", "3465");
=======
>>>>>>> f27f8e6e6390405e79173531577a1dbed0a462c5
				String search = request.getParameter("search");
				String query = "SELECT * FROM itemdb.itemtb WHERE Model like '%" + search + "%' ORDER BY Id DESC ";
				PreparedStatement preparedStatements = connection.prepareStatement(query);
				ResultSet resultsets = preparedStatements.executeQuery();

				if (resultsets.next() == false) {
			%>
			<div class="col-6">
				<h2>No Match Found!</h2>
			</div>
			<%
			resultsets.close();
			}

			else {
			String q = "SELECT * FROM itemdb.itemtb WHERE Model like '%" + search + "%' ORDER BY Id DESC ";
			PreparedStatement ps = connection.prepareStatement(q);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String id = rs.getString("Id");
				String model = rs.getString(2);
				String brand = rs.getString(3);
				String condition = rs.getString(4);
				String price = rs.getString(5);
				String quantity = rs.getString(6);
				String date = rs.getString(7);
				String image = rs.getString(9);
			%>

			<div class="col-6">
				<div class="p-3 border bg-dark" style="margin: 10px;">
					<div class="container overflow-hidden">
						<div class="row gx-5">
							<div class="col">
								<div class="p-3 border bg-light">
									<img style="width: 200px; height: 200px;" alt=""
										src="./images/<%=image%>" />
								</div>
							</div>
							<div class="col" style="margin-left: 10px;">
								<div class="p-3 border bg-light" style="margin-top: 10px;">
									<span>Posted Date : <%=date%></span><br> <span>Model
										: <%=model%></span><br> <span>Price :<%=price%></span>
								</div>
								<div class="row gy-5" style="margin-top: 5px;">
									<a class="nav-link btn btn-primary"
										style="margin-top: 10px; color: #fff;"
										href="detail.jsp?id=<%=id%>" id="btn1">Details</a> <a
										class="nav-link btn btn-secondary"
										style="margin-top: 10px; color: #fff;"
										href="view.jsp?id=<%=id%>" id="btn1">Edit</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<%
			}
			}
			} else {

			List<ItemInfo> itemsInfo = dao.displayItems();
			for (ItemInfo itemInfo : itemsInfo) {
			%>
			<div class="col-6">
				<div class="p-3 border bg-dark" style="margin: 10px;">
					<div class="container overflow-hidden">
						<div class="row gx-5">
							<div class="col">
								<div class="p-3 border bg-light">
									<img style="width: 200px; height: 200px;" alt=""
										src="./images/<%=itemInfo.getImage()%>" />
								</div>
							</div>
							<div class="col" style="margin-left: 10px;">
								<div class="p-3 border bg-light" style="margin-top: 10px;">
									<span>Posted Date : <%=itemInfo.getPostDate()%></span><br>
									<span>Model : <%=itemInfo.getModelName()%></span><br> <span>Price
										:<%=itemInfo.getPrice()%></span>
								</div>
								<div class="row gy-5" style="margin-top: 5px;">
									<a class="nav-link btn btn-primary"
										style="margin-top: 10px; color: #fff;"
										href="detail.jsp?id=<%=itemInfo.getId()%>" id="btn1">Details</a>
									<a class="nav-link btn btn-secondary"
										style="margin-top: 10px; color: #fff;"
										href="view.jsp?id=<%=itemInfo.getId()%>" id="btn1">Edit</a>
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
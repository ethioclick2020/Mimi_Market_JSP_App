<%@page import="com.hibernate.DAO"%>
<%@page import="com.hibernate.ItemInfo"%>
<%@page import="com.hibernate.User"%>
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
	DAO dao = new DAO();

	HttpSession hs = request.getSession();
	String name = (String) hs.getAttribute("user");
	String upString = name.toUpperCase();
	%>
	User user = new User(); user.setFirstname(name); User userAddress =
	dao.onetooneFetch(user); User itemInfos = dao.manytomanyFetch(user);
	for (ItemInfo itemInfo : itemInfos.getItemInfos()) { %>
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
							<span>Address : <%=userAddress.getAddress().getAddress()%></span><br>
							<span>Posted Date : <%=itemInfo.getPostDate()%></span><br> <span>Model
								: <%=itemInfo.getModelName()%></span><br> <span>Price :<%=itemInfo.getPrice()%></span>
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
			%>
	</div>
	</div>
</body>
</html>
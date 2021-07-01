<%@page import="com.shop.DAO"%>
<%@page import="com.shop.ItemInfo"%>
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
</head>
<body>

	<a class="nav-link btn btn-secondary"
		style="color: #fff; width: 200px; margin-top: 5px; position: absolute; right: 20px;"
		href="index.jsp"> Back to List</a>

	<%
	HttpSession hs = request.getSession();
	String name = (String) hs.getAttribute("user");
	String id = request.getParameter("id");
	DAO dao = new DAO();
	dao.itemDetail(id);
	List<ItemInfo> itemsInfo = dao.itemDetail(id);
	for (ItemInfo itemInfo : itemsInfo) {
	%>

	<div class="container overflow-hidden detdiv"
		style="height: 350px; width: 700; margin-top: 0px;">
		<h1>Item's Detail Information</h1>
		<div class="row gy-5 ldiv">
			<div class="col-6">
				<div class="p-3 border bg-primary">
					<div class="container overflow-hidden">
						<div class="row gx-5">
							<div class="col">
								<div class="p-3 border bg-light">
									<img style="width: 180px; height: 180px;" alt=""
										src="<%=itemInfo.getImage()%>" />
								</div>
							</div>
							<div class="col" style="margin-left: 10px;">
								<div class="p-3 border bg-light" style="margin-top: 10px;">
									<span>Posted Date : <%=itemInfo.getPostDate()%></span><br> <span>Model
										: <%=itemInfo.getModelName()%></span><br> <span>Brand : <%=itemInfo.getBrand()%></span><br>
									<span>Condition : <%= itemInfo.getCondition()%></span><br> <span>Price
										: <%=itemInfo.getPrice()%></span><br> <span>Quantity : <%=itemInfo.getQuantity()%></span><br>
									<span>Description : <%=itemInfo.getDescription()%></span>
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
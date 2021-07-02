<%@page import="com.shop.DAO"%>
<%@page import="com.shop.ItemInfo"%>
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
	<h3 class="a" align="center">Edit Item's Detail Information</h3>
	<div align="center" class="view">
		<div class="container overflow-hidden ">
			<div class="row gy-5 ldiv">
				<div class="col-6">
					<form action="edititem" method="post">
						<input type="hidden" name="id" value="<%=id%>">
						<div class="p-3 border bg-primary" style="width: 1000px">
							<div class="container overflow-hidden">
								<div class="row gx-5">
									<div class="col">
										<div class="p-3 border bg-light" style="margin-top: 25px">
											<img style="width: 360px; height: 440px;" alt=""
												src="<%=itemInfo.getImage()%>" /><br>
										</div>
									</div>
									<div class="col" style="margin-left: 10px;">
										<div class="p-3 border bg-light" style="margin-top: 10px;">

											<label class="label1">Model</label><input type="text"
												name="model" class="label2"
												value="<%=itemInfo.getModelName()%>"><br> <br>
											<label class="label1">Brand</label> <select class="label2"
												name="brand" style="padding: 4px; width: 200px;">
												<option value="<%=itemInfo.getBrand()%>"><%=itemInfo.getBrand()%></option>
												<option value="Apple">Apple</option>
												<option value="Huawei">Huawei</option>
												<option value="Samsung">Samsung</option>
											</select><br> <br> <label class="label1">Condition</label><select
												class="label2" name="condition"
												style="padding: 4px; width: 200px;">
												<option value="<%=itemInfo.getCondition()%>"><%=itemInfo.getCondition()%></option>
												<option value="New">New</option>
												<option value="Used">Used</option>
											</select><br> <br> <label class="label1">Item Price</label><input
												type="text" name="price" class="label2"
												value="<%=itemInfo.getPrice()%>"><br> <br>
											<label class="label1">Item Quantity</label><input
												type="number" name="quantity" class="label2"
												value="<%=itemInfo.getQuantity()%>"><br> <br>
											<label class="label1">Posted On</label><input type="date"
												name="postdate" class="label2"
												value="<%=itemInfo.getPostDate()%>"><br> <br>
											<label class="label1">Description</label>
											<textarea class="form-control label2" id="inputEmail3"
												name="description" style="width: 400px; height: 100px"><%=itemInfo.getDescription()%></textarea>
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
<%@page import="com.hibernate.DeviceBrand"%>
<%@page import="java.util.List"%>
<%@page import="com.hibernate.ElectronicsType"%>
<%@page import="com.hibernate.DAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="./css/bootstrap.css">
<link rel="stylesheet" href="./css/bootstrap.min.css">
<script type="text/javascript">
function populate(s1,s2){
	var s1 = document.getElementById(s1);
	var s2 = document.getElementById(s2);
	s2.innerHTML = "";
	<%DAO dao = new DAO();
	List<DeviceBrand> deviceBrands = dao.deviceBrandFetch();	
	for (DeviceBrand deviceBrand : deviceBrands) {%>
	if(s1.value == "Computer"){
		var optionArray = ["camaro|<%= deviceBrand.getComputer() %>" ];
	} else if (s1.value == "Camera") {
		var optionArray = ["camaro|<%= deviceBrand.getCamera() %>" ];
		}else if (s1.value == "Phone_Tablet") {
		var optionArray = ["camaro|<%= deviceBrand.getPhone_tablet() %>" ];
		}else if (s1.value == "Tv_Other") {
		var optionArray = ["camaro|<%= deviceBrand.getTv_other() %>" ];
		}
		for ( var option in optionArray) {
			var pair = optionArray[option].split("|");
			var newOption = document.createElement("option");
			newOption.value = pair[0];
			newOption.innerHTML = pair[1];
			s2.options.add(newOption);
		}
		
		<% } %>
	}
</script>
</head>
<body>
	<a class="nav-link btn btn-secondary"
		style="color: #fff; width: 200px; margin-top: 5px; position: absolute; right: 20px;"
		href="index.jsp"> Back to List</a>
	<form class="logform" action="additem" method="post"
		style="margin-top: 20px; top: 0; height: 740px;">
		<h3 align="center">Add Items</h3>
		<div class="logdiv">
			<div class="row mb-3">
				<label for="inputPassword3" class="col-sm-2 col-form-label">Electronics
					Type</label>
				<div class="col-sm-10">
					<select class="form-control" id="slct1" name="eletype" style=""
						onchange="populate(this.id,'slct2')">
						<option>-- Select Item Type --</option>
						<%
						ElectronicsType eleType = new ElectronicsType();
						List<ElectronicsType> electronicsType = dao.deviceTypeFetch();
						for (ElectronicsType deviceType : electronicsType) {
						%>
						<option value="<%=deviceType.getDeviceType()%>"><%=deviceType.getDeviceType()%></option>
						<%
						deviceType.setDeviceType(deviceType.getDeviceType());
						}
						%>
					</select>
				</div>
			</div>
			<div class="row mb-3 ">
				<label for="inputEmail3" class="col-sm-2 col-form-label">Address</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="inputEmail3"
						name="address">
				</div>
			</div>
			<div class="row mb-3 ">
				<label for="inputEmail3" class="col-sm-2 col-form-label">Model
					Name</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="inputEmail3"
						name="model">
				</div>
			</div>
			<div class="row mb-3">
				<label for="inputPassword3" class="col-sm-2 col-form-label">Brand</label>
				<div class="col-sm-10">
					<select class="form-control" id="slct2" name="brand" style="">
						<option>-- Select Brand --</option>
					</select>
				</div>
			</div>
			<div class="row mb-3 ">
				<label for="inputEmail3" class="col-sm-2 col-form-label">Condition</label>
				<div class="col-sm-10">
					<input class="form-check-input" id="flexRadioDefault1" type="radio"
						name="condition" value="New" style="margin-left: 50px;" />New <input
						class="form-check-input" id="flexRadioDefault1" type="radio"
						name="condition" value="Used" style="margin-left: 50px;" />Used
				</div>
			</div>
			<div class="row mb-3 ">
				<label for="inputEmail3" class="col-sm-2 col-form-label">Price</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="inputEmail3"
						name="price">
				</div>
			</div>
			<div class="row mb-3 ">
				<label for="inputEmail3" class="col-sm-2 col-form-label">Quantity</label>
				<div class="col-sm-10">
					<input type="number" class="form-control" id="inputEmail3"
						name="quan">
				</div>
			</div>
			<div class="row mb-3 ">
				<label for="inputEmail3" class="col-sm-2 col-form-label">Upload
					Image</label>
				<div class="col-sm-10">
					<input type="file" class="form-control" id="inputEmail3" name="img">
				</div>
			</div>
			<div class="row mb-3 ">
				<label for="inputEmail3" class="col-sm-2 col-form-label">Post
					Date</label>
				<div class="col-sm-10">
					<input type="date" class="form-control" id="inputEmail3"
						placeholder="yyyy/mm/dd" name="date">
				</div>
			</div>
			<div class="row mb-3 ">
				<label for="inputEmail3" class="col-sm-2 col-form-label">Description</label>
				<div class="col-sm-10">
					<textarea class="form-control" id="inputEmail3" name="description"
						style="height: 100px"></textarea>
				</div>
			</div>
			<div class="loga" style="margin-left: 260px;">
				<button type="submit" class="btn btn-primary">Add Item</button>
			</div>

		</div>
	</form>

</body>
</html>
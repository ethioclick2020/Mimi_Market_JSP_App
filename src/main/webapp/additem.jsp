<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
	<form class="logform" action="additem" method="post"
<<<<<<< HEAD
		style="margin-top: 20px; top: 0; height: 740px;">
		<h3 align="center">Add Items</h3>
		<div class="logdiv">
			<div class="row mb-3">
				<label for="inputPassword3" class="col-sm-2 col-form-label">Electronics
					Type</label>
				<div class="col-sm-10">
					<select class="form-control" id="inputEmail3" name="eletype"
						style="">
						<option>-- Select Item Type --</option>
						<option value="Phone">Phone & Tablet</option>
						<option value="Computer">Computers</option>
						<option value="Camera">Camera</option>
						<option value="Other">Tv & Other</option>
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
=======
		style="margin-top: 20px; top: 0; height: 630px;">
		<h3 align="center">Add Items</h3>
		<div class="logdiv">
			<div class="row mb-3 ">
				<label for="inputEmail3" class="col-sm-2 col-form-label">Name</label>
>>>>>>> f27f8e6e6390405e79173531577a1dbed0a462c5
				<div class="col-sm-10">
					<input type="text" class="form-control" id="inputEmail3"
						name="model">
				</div>
			</div>
			<div class="row mb-3">
				<label for="inputPassword3" class="col-sm-2 col-form-label">Brand</label>
				<div class="col-sm-10">
					<select class="form-control" id="inputEmail3" name="brand" style="">
						<option>-- Select Brand --</option>
						<option value="Apple">Apple</option>
						<option value="Huawei">Huawei</option>
						<option value="Samsung">Samsung</option>
<<<<<<< HEAD
						<option value="HP">HP</option>
						<option value="Toshiba">Toshiba</option>
						<option value="MAC">MAC</option>
						<option value="ASUS">ASUS</option>
						<option value="Canon">Canon</option>
						<option value="Nikon">Nikon</option>
						<option value="LG">LG</option>
						<option value="Hitachi">Hitachi</option>
						<option value="Other">Other</option>
=======
>>>>>>> f27f8e6e6390405e79173531577a1dbed0a462c5
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
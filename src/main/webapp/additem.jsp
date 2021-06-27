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
<a class="nav-link btn btn-secondary" style="color: #fff; width: 200px; margin-top: 5px; position: absolute; right: 20px;" href="index.jsp"> Back to List</a>
<form class="logform" action="forward" method="post" style="margin-top: 20px; top: 0; height: 630px;">
 <h3 align="center">Add Items</h3>
  <div class="logdiv">
  <div class="row mb-3 ">
    <label for="inputEmail3" class="col-sm-2 col-form-label">Name</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="inputEmail3" name="item">
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
                </select>
    </div>
  </div>
  <div class="row mb-3 ">
    <label for="inputEmail3" class="col-sm-2 col-form-label">Condition</label>
    <div class="col-sm-10">
      <input class="form-check-input" id="flexRadioDefault1" type="radio" name="condition"  value="New" style="margin-left: 50px;" />New 
	  <input class="form-check-input" id="flexRadioDefault1" type="radio" name="condition"  value="Used" style="margin-left: 50px;" />Used
    </div>
  </div>
  <div class="row mb-3 ">
    <label for="inputEmail3" class="col-sm-2 col-form-label">Price</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="inputEmail3" name="price">
    </div>
  </div>
  <div class="row mb-3 ">
    <label for="inputEmail3" class="col-sm-2 col-form-label">Quantity</label>
    <div class="col-sm-10">
      <input type="number" class="form-control" id="inputEmail3" name="quan">
    </div>
  </div>
  <div class="row mb-3 ">
    <label for="inputEmail3" class="col-sm-2 col-form-label">Upload Image</label>
    <div class="col-sm-10">
      <input type="file" class="form-control" id="inputEmail3" name="img">
    </div>
  </div>
  <div class="row mb-3 ">
    <label for="inputEmail3" class="col-sm-2 col-form-label">Post Date</label>
    <div class="col-sm-10">
      <input type="date" class="form-control" id="inputEmail3" placeholder="yyyy/mm/dd" name="date">
    </div>
  </div>
  <div class="row mb-3 ">
    <label for="inputEmail3" class="col-sm-2 col-form-label">Description</label>
    <div class="col-sm-10">
      <textarea class="form-control" id="inputEmail3" name="description" style="height: 100px"></textarea>
    </div>
  </div>
  <div class="loga" style="margin-left: 260px;" >
  <button type="submit" class="btn btn-primary">Add Item</button>
  </div>
  
  </div>
</form>

</body>
</html>
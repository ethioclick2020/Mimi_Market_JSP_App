<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.* , java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="./css/bootstrap.css">
<link rel="stylesheet" href="./css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<body>
	<form class="logform " action="signin" method="post">
		<div class="logdiv">
			<div class="row mb-3 ">
				<label for="inputEmail3" class="col-sm-2 col-form-label">Name</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="inputEmail3"
						name="username">
				</div>
			</div>
			<div class="row mb-3">
				<label for="inputPassword3" class="col-sm-2 col-form-label">Password</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="inputPassword3"
						name="password">
				</div>
			</div>
			<div class="loga">
				<button type="submit" class="btn btn-primary">Sign in</button>
				<a href="signup.jsp" class="btn btn-primary">Create an Account </a>
			</div>

		</div>
	</form>
</body>
</html>
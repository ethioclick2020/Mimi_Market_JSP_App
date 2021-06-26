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


<% 

String name = request.getParameter("name");
String pass = request.getParameter("pass");

if(request.getMethod().equals("POST")){
Class.forName("com.mysql.jdbc.Driver");
			
			Connection connection =  DriverManager.getConnection("jdbc:mysql://localhost/itemdb","root","3465");
			String sql = "INSERT INTO usertb (Name, Password)  VALUES(?,md5(?)) ";
			
			if(name != "" && pass != ""){
				PreparedStatement preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setString(1, name);
				preparedStatement.setString(2, pass);
				
				preparedStatement.executeUpdate();
				
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("user", name);
				
				response.sendRedirect("index.jsp");
			}
			else{
				response.sendRedirect("error.jsp");
			}
  }
%>

<form class="logform" method="post">
  <div class="logdiv">
  <div class="row mb-3">
    <label for="inputEmail3" class="col-sm-2 col-form-label">Name</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="inputEmail3" name="name">
    </div>
  </div>
  <div class="row mb-3">
    <label for="inputPassword3" class="col-sm-2 col-form-label">Password</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" id="inputPassword3" name="pass">
    </div>
  </div>
  <div class="loga" >
  <button type="submit" class="btn btn-primary">Sign Up</button>
  <a href="signin.jsp" class="btn btn-primary">Already have an Account</a>
  </div>
  </div>
</form>
</body>
</html>
package com.shop;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

<<<<<<< HEAD
import com.hibernate.Authentication;
import com.hibernate.User;

=======
>>>>>>> f27f8e6e6390405e79173531577a1dbed0a462c5
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class UserSignin
 */
@WebServlet("/UserSignin")
public class UserSignin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public UserSignin() {
		// TODO Auto-generated constructor stub
	}

	public void init() {
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String userName = request.getParameter("username");
		String password = request.getParameter("password");

		User user = new User();
<<<<<<< HEAD
		user.setFirstname(userName);
=======
		user.setUserName(userName);
>>>>>>> f27f8e6e6390405e79173531577a1dbed0a462c5
		user.setPassword(password);

		Authentication authentication = new Authentication();

		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("user", userName);

<<<<<<< HEAD
		if (authentication.SignIn(userName, password)) {
=======
		if (authentication.signIn(user) == true) {
>>>>>>> f27f8e6e6390405e79173531577a1dbed0a462c5
			response.sendRedirect("index.jsp");
		} else {
			response.sendRedirect("error.jsp");
		}
	}

}

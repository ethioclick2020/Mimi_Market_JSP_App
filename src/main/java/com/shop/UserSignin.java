package com.shop;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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

		String name = request.getParameter("name");
		String pass = request.getParameter("pass");

		try {
			Class.forName("com.mysql.jdbc.Driver");

			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/itemdb", "root", "3465");

			String sql = "SELECT * FROM itemdb.usertb WHERE Name='" + name + "' && Password = md5('" + pass + "')";

			PreparedStatement preparedStatement = connection.prepareStatement(sql);

			ResultSet resultset = preparedStatement.executeQuery();

			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("user", name);

			if (resultset.next()) {
				response.sendRedirect("index.jsp");
			} else {
				response.sendRedirect("error.jsp");
			}

		}

		catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

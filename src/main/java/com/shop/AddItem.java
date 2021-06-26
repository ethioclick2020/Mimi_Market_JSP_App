package com.shop;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Iterator;

import jakarta.servlet.Servlet;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

/**
 * Servlet implementation class AddItem
 */
@WebServlet("/AddItem")
public class AddItem extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public AddItem() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Item Added");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String name = request.getParameter("item");
		String brand = request.getParameter("brand");
		String condition = request.getParameter("condition");
		String price = request.getParameter("price");
		String quan = request.getParameter("quan");
		String date = request.getParameter("date");
		String desc = request.getParameter("description");
		String img = request.getParameter("img");
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection connection =  DriverManager.getConnection("jdbc:mysql://localhost/itemdb","root","3465");
            String sql = "INSERT INTO itemtb (Model, Brand, Conditions, Price, Quantity, Date, Description, Image)  VALUES(?,?,?,?,?,?,?,?)";
			
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, name);
			preparedStatement.setString(2, brand);
			preparedStatement.setString(3, condition);
			preparedStatement.setString(4, price);
			preparedStatement.setString(5, quan);
			preparedStatement.setString(6, date);
			preparedStatement.setString(7, desc);
			preparedStatement.setString(8, img);
			
			preparedStatement.executeUpdate();
			
			response.sendRedirect("index.jsp");
			
			//response.getWriter().append(condition);
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}

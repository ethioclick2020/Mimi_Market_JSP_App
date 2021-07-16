package com.shop;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.http.HttpSession;

public class Authentication {

	public boolean signUp(User user) {

		try {
			Class.forName("com.mysql.jdbc.Driver");

			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/itemdb", "root", "3465");
			String sql = "INSERT INTO usertb (Name, Password)  VALUES(?,md5(?)) ";

			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, user.getUserName());
			preparedStatement.setString(2, user.getPassword());

			preparedStatement.executeUpdate();

			int execute = preparedStatement.executeUpdate();
			return execute > 0;

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;
	}

	public boolean signIn(User user) {

		boolean status = false;

		try {
			Class.forName("com.mysql.jdbc.Driver");

			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/itemdb", "root", "3465");

			String sql = "SELECT * FROM itemdb.usertb WHERE Name='" + user.getUserName() + "' && Password = md5('"
					+ user.getPassword() + "')";

			PreparedStatement preparedStatement = connection.prepareStatement(sql);

			ResultSet resultset = preparedStatement.executeQuery();
			status = resultset.next();

		}

		catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
	}
}

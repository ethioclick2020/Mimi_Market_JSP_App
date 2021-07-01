package com.shop;

import java.util.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DAO {

	public boolean addItems(ItemInfo itemInfo) {

		try {
			Class.forName("com.mysql.jdbc.Driver");

			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/itemdb", "root", "3465");
			String sql = "INSERT INTO itemtb (Model, Brand, Conditions, Price, Quantity, Date, Description, Image)  VALUES(?,?,?,?,?,?,?,?)";

			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, itemInfo.getModelName());
			preparedStatement.setString(2, itemInfo.getBrand());
			preparedStatement.setString(3, itemInfo.getCondition());
			preparedStatement.setDouble(4, itemInfo.getPrice());
			preparedStatement.setInt(5, itemInfo.getQuantity());
			preparedStatement.setString(6, itemInfo.getPostDate());
			preparedStatement.setString(7, itemInfo.getDescription());
			preparedStatement.setString(8, itemInfo.getImage());

			int execute = preparedStatement.executeUpdate();
			return execute > 0;

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}

	}

	public List<ItemInfo> displayItems() {

		List<ItemInfo> itemsInfo = new ArrayList();

		try {
			Class.forName("com.mysql.jdbc.Driver");

			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/itemdb", "root", "3465");
			String sql = "SELECT * FROM itemdb.itemtb ORDER BY Id DESC";

			PreparedStatement preparedStatement = connection.prepareStatement(sql);

			ResultSet resultset = preparedStatement.executeQuery();
			ItemInfo itemInfo = null;

			while (resultset.next()) {
				itemInfo = new ItemInfo();
				itemInfo.setId(resultset.getInt(1));
				itemInfo.setModelName(resultset.getString(2));
				itemInfo.setBrand(resultset.getString(3));
				itemInfo.setCondition(resultset.getString(4));
				itemInfo.setPrice(resultset.getDouble(5));
				itemInfo.setQuantity(resultset.getInt(6));
				itemInfo.setPostDate(resultset.getString(7));
				itemInfo.setDescription(resultset.getString(8));
				itemInfo.setImage(resultset.getString(9));
				itemsInfo.add(itemInfo);
			}

			return itemsInfo;

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}

	public boolean itemSearch(ItemInfo itemInfo) {

		boolean match = false;

		try {
			Class.forName("com.mysql.jdbc.Driver");

			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/itemdb", "root", "3465");
			String query = "SELECT * FROM itemdb.itemtb WHERE Model like '%" + itemInfo.getItemSearch()
					+ "%' ORDER BY Id DESC ";
			PreparedStatement preparedStatements = connection.prepareStatement(query);
			ResultSet resultset = preparedStatements.executeQuery();
			match = resultset.next();

			System.out.println(itemInfo.getItemSearch());

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return match;
	}

	public List<ItemInfo> itemDetail(String id) {

		List<ItemInfo> itemsInfo = new ArrayList();

		try {

			Class.forName("com.mysql.jdbc.Driver");

			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/itemdb", "root", "3465");
			String query = "SELECT * FROM itemdb.itemtb WHERE Id = '" + id + "'";

			PreparedStatement preparedStatement = connection.prepareStatement(query);
			ResultSet resultset = preparedStatement.executeQuery();

			while (resultset.next()) {
				ItemInfo itemInfo = new ItemInfo();
				itemInfo.setId(Integer.parseInt(resultset.getString(1)));
				itemInfo.setModelName(resultset.getString(2));
				itemInfo.setBrand(resultset.getString(3));
				itemInfo.setCondition(resultset.getString(4));
				itemInfo.setPrice(resultset.getDouble(5));
				itemInfo.setQuantity(resultset.getInt(6));
				itemInfo.setPostDate(resultset.getString(7));
				itemInfo.setDescription(resultset.getString(8));
				itemInfo.setImage(resultset.getString(9));
				itemsInfo.add(itemInfo);
			}

			return itemsInfo;

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}

	public boolean updateItem(ItemInfo id) {

		ItemInfo itemInfo = new ItemInfo();

		try {
			Class.forName("com.mysql.jdbc.Driver");

			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/itemdb", "root", "3465");
			String query = "UPDATE itemtb SET Model = ?, Brand = ?, Conditions = ?, Price = ?, Quantity = ?, "
					+ "Date = ?, Description = ? WHERE Id = '" + id.getId() + "'";

			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, id.getModelName());
			preparedStatement.setString(2, id.getBrand());
			preparedStatement.setString(3, id.getCondition());
			preparedStatement.setDouble(4, id.getPrice());
			preparedStatement.setInt(5, id.getQuantity());
			preparedStatement.setString(6, id.getPostDate());
			preparedStatement.setString(7, id.getDescription());

			preparedStatement.executeUpdate();

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}

		return true;
	}

	public boolean deleteItem(ItemInfo id) {

		ItemInfo itemInfo = new ItemInfo();

		try {
			Class.forName("com.mysql.jdbc.Driver");

			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/itemdb", "root", "3465");
			String query = "DELETE FROM itemtb WHERE Id = '" + id.getId() + "'";
			PreparedStatement preparedStatements = connection.prepareStatement(query);

			preparedStatements.executeUpdate();

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}

		return true;

	}
}

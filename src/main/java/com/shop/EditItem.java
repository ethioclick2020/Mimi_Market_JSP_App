package com.shop;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EditItem
 */
@WebServlet("/EditItem")
public class EditItem extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public EditItem() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		DAO dao = new DAO();
		ItemInfo itemInfo = new ItemInfo();

		String id = request.getParameter("id");
		String modelName = request.getParameter("model");
		String brand = request.getParameter("brand");
		String condition = request.getParameter("condition");
		String itemPrice = request.getParameter("price");
		String quantity = request.getParameter("quantity");
		String postDate = request.getParameter("postdate");
		String description = request.getParameter("description");
		String image = null;

		if (request.getParameter("update") != null) {

			itemInfo.setId(Integer.parseInt(id));
			itemInfo.setModelName(modelName);
			itemInfo.setBrand(brand);
			itemInfo.setCondition(condition);
			itemInfo.setPrice(Double.parseDouble(itemPrice));
			itemInfo.setQuantity(Integer.parseInt(quantity));
			itemInfo.setPostDate(postDate);
			itemInfo.setDescription(description);

			dao.updateItem(itemInfo);

			response.sendRedirect("index.jsp");
		}

		if (request.getParameter("delete") != null) {

			itemInfo.setId(Integer.parseInt(id));
			dao.deleteItem(itemInfo);

			response.sendRedirect("index.jsp");

		}
	}

}

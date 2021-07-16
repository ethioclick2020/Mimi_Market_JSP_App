package com.shop;

import java.io.IOException;

import com.hibernate.DAO;
import com.hibernate.ElectronicsType;
import com.hibernate.ItemInfo;
import com.hibernate.User;
import com.hibernate.UserAddress;

import jakarta.servlet.Servlet;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Item Added");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String modelName = request.getParameter("model");
		String address = request.getParameter("address");
		String eletype = request.getParameter("eletype");
		String brand = request.getParameter("brand");
		String condition = request.getParameter("condition");
		Double price = Double.parseDouble(request.getParameter("price"));
		Integer quan = Integer.parseInt(request.getParameter("quan"));
		String date = request.getParameter("date");
		String description = request.getParameter("description");
		String image = request.getParameter("img");

		int x = image.lastIndexOf('\\');
		String path = image.substring(0, (x + 1));
		String imageName = image.substring(x + 1);

		ItemInfo itemInfo = new ItemInfo();
		itemInfo.setModelName(modelName);
		itemInfo.setBrand(brand);
		itemInfo.setCondition(condition);
		itemInfo.setPrice(price);
		itemInfo.setQuantity(quan);
		itemInfo.setPostDate(date);
		itemInfo.setDescription(description);
		itemInfo.setImage(imageName);

		ElectronicsType electronicsType = new ElectronicsType();

		electronicsType.setDeviceType(eletype);

		UserAddress Address = new UserAddress();
		Address.setAddress(address);

		HttpSession httpSession = request.getSession();
		String name = (String) httpSession.getAttribute("user");
		User user = new User();
		user.setFirstname(name);

		DAO dao = new DAO();
		dao.addItem(itemInfo, user, electronicsType, Address);

		response.sendRedirect("index.jsp");

	}

}

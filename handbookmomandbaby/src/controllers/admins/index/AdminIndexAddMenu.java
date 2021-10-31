package controllers.admins.index;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.MenuDAO;

public class AdminIndexAddMenu extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminIndexAddMenu() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");response.setContentType("text/html");response.setCharacterEncoding("UTF-8");
		MenuDAO menuDAO = new MenuDAO();
		String name = "", result = "", temp = "";
		try {
			name = request.getParameter("name");
			if (name.length() > 0) {
				for (int i = 0; name.length() > 0; i++) {
					if (name.charAt(0) == 32) {
						result = "-1";
						break;
					} else if (name.charAt(0) != 32) {
						temp += name.charAt(i);
						result = menuDAO.addMenuParent(name);
						if (result.equals("1")) {
							result = "1";
						} else {
							result = "-1";
						}
						break;
					} else {

					}

				}
			}
		} catch (Exception e) {
		}
		request.setAttribute("listMenuParent", menuDAO.listMenuParent());
		request.setAttribute("listMenuSon", menuDAO.listMenuSon());
		response.sendRedirect(request.getContextPath() + "/adminindex?result=" + result + "");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");response.setContentType("text/html");response.setCharacterEncoding("UTF-8");
		MenuDAO menuDAO = new MenuDAO();
		String name = "", result = "", temp = "";
		int menuParentId = 0;
		try {
			name = request.getParameter("name");
			menuParentId = Integer.parseInt(request.getParameter("menuParentId"));
			if (name.length() > 0) {
				for (int i = 0; name.length() > 0; i++) {
					if (name.charAt(0) == 32) {
						result = "4";
						break;
					} else if (name.charAt(0) != 32) {
						temp += name.charAt(i);
						result = menuDAO.addMenuSon(name, menuParentId);
						if (result.equals("3")) {
							result = "3";
						} else {
							result = "4";
						}
						break;
					} else {

					}

				}
			}
		} catch (Exception e) {
		}
		request.setAttribute("listMenuParent", menuDAO.listMenuParent());
		request.setAttribute("listMenuSon", menuDAO.listMenuSon());
		response.sendRedirect(request.getContextPath() + "/adminindex?result=" + result + "");
	}

}

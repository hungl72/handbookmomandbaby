package controllers.admins.index;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.MenuDAO;
import models.Menu;

public class AdminDelMenu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminDelMenu() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");response.setContentType("text/html");response.setCharacterEncoding("UTF-8");
		int menu_id = Integer.parseInt(request.getParameter("menu_id"));
		int parent_id = Integer.parseInt(request.getParameter("parent_id"));
		MenuDAO menuDAO = new MenuDAO();
		menuDAO.delMenuParent(menu_id,parent_id);
		for(Menu m : menuDAO.loadMenuParent()) {
			response.getWriter().print("<li><a href=\"javascript:void(0)\" onclick=\"return delParent("+m.getParent_id()+")\">"+m.getMenu_name()+"</a></li>");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");response.setContentType("text/html");response.setCharacterEncoding("UTF-8");
		try {
		int menu_id = Integer.parseInt(request.getParameter("menu_id"));
		MenuDAO menuDAO = new MenuDAO();
		menuDAO.delMenuChildren(menu_id);
		for(Menu m : menuDAO.loadMenuChildren()) {
			response.getWriter().print(" <li><a href=\"javascript:void(0)\" onclick=\"delSon("+m.getMenu_id()+")\">"+m.getMenu_name()+"</a></li>");
		}
	}catch(Exception e) {
		MenuDAO menuDAO = new MenuDAO();
		menuDAO.loadMenuChildren();
		for(Menu m : menuDAO.loadMenuChildren()) {
			response.getWriter().print(" <li><a href=\"javascript:void(0)\" onclick=\"delSon("+m.getMenu_id()+")\">"+m.getMenu_name()+"</a></li>");
		}
	}
	}

}

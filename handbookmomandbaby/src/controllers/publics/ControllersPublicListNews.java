package controllers.publics;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.ListNewsDAO;

public class ControllersPublicListNews extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ControllersPublicListNews() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ListNewsDAO lnd = new ListNewsDAO();
		int menu_id = Integer.parseInt(request.getParameter("menu_id"));
		int currentPage = 1;
		int numberOfItem = 0;
		try {
			currentPage = Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			currentPage = 1;
		}
		numberOfItem = lnd.fullListNewsByMenuId(menu_id).size();
		int numberOfPage = (int)Math.ceil((float)numberOfItem/3);
		if(currentPage > numberOfPage || currentPage < 1) {
			currentPage = 1;
		}
		int offset = (currentPage - 1) * 3;
		request.setAttribute("numberOfPage", numberOfPage);
		request.setAttribute("currentPage", currentPage);
		//request.setAttribute("listContact", lnd.getItemPagination(offset));
		request.setAttribute("menuName", lnd.nameMenu(menu_id));
		request.setAttribute("listNewsMin", lnd.listNewsMin(menu_id,offset));
		request.getRequestDispatcher("/views/public/listnews.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}

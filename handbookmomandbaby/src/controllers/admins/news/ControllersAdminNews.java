package controllers.admins.news;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.ListNewsDAO;

public class ControllersAdminNews extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ControllersAdminNews() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ListNewsDAO listNewsDAO = new ListNewsDAO();
		String result = "";
		if(request.getAttribute("result") == null) {
			result = "0";
		}else {
			result = "1";
		}
		int currentPage = 1;
		int numberOfItem = 0;
		try {
			currentPage = Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			currentPage = 1;
		}
		numberOfItem = listNewsDAO.fullListNews().size();
		int numberOfPage = (int)Math.ceil((float)numberOfItem/3);
		if(currentPage > numberOfPage || currentPage < 1) {
			currentPage = 1;
		}
		int offset = (currentPage - 1) * 3;
		request.setAttribute("fullListNews", listNewsDAO.getItemPagination(offset));
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("numberOfPage", numberOfPage);
		request.setAttribute("result", result);
		//request.setAttribute("fullListNews", listNewsDAO.fullListNews());
		request.getRequestDispatcher("/views/admin/listnewsmanagement/index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}

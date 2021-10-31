package controllers.admins.news;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.ListNewsDAO;

public class ControllersAdminNewsDel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ControllersAdminNewsDel() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ListNewsDAO listNewsDAO = new ListNewsDAO();
		String result = "";
		int id = Integer.parseInt(request.getParameter("id"));
		if(listNewsDAO.deleteListNews(id) > 0) {
			result = "1";
		}else {
			result = "0";
		}
		request.setAttribute("result", result);
		request.getRequestDispatcher("/adminnews").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}

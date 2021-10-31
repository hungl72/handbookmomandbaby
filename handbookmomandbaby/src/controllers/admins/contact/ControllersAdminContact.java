package controllers.admins.contact;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.ContactDAO;

public class ControllersAdminContact extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ControllersAdminContact() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("result", "0");
		ContactDAO contactDAO = new ContactDAO();
		int currentPage = 1;
		int numberOfItem = 0;
		try {
			currentPage = Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			currentPage = 1;
		}
		numberOfItem = contactDAO.listContact().size();
		int numberOfPage = (int)Math.ceil((float)numberOfItem/5);
		if(currentPage > numberOfPage || currentPage < 1) {
			currentPage = 1;
		}
		int offset = (currentPage - 1) * 5;
		request.setAttribute("numberOfPage", numberOfPage);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("listContact", contactDAO.getItemPagination(offset));
		//request.setAttribute("listContact", contactDAO.listContact());
		request.getRequestDispatcher("/views/admin/contactmanagement/index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}

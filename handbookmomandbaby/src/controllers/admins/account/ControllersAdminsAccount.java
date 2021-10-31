package controllers.admins.account;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.AccountDAO;

public class ControllersAdminsAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ControllersAdminsAccount() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AccountDAO accountDAO = new AccountDAO();
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
		numberOfItem = accountDAO.listAccount().size();
		int numberOfPage = (int)Math.ceil((float)numberOfItem/5);
		if(currentPage > numberOfPage || currentPage < 1) {
			currentPage = 1;
		}
		int offset = (currentPage - 1) * 5;
		request.setAttribute("listAccount", accountDAO.getItemPagination(offset));
		request.setAttribute("numberOfPage", numberOfPage);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("result", result);
		//request.setAttribute("listAccount", accountDAO.listAccount());
		request.getRequestDispatcher("/views/admin/accountmanagement/index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}

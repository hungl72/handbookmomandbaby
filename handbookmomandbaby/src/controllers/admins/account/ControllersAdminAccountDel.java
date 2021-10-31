package controllers.admins.account;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.AccountDAO;

public class ControllersAdminAccountDel extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ControllersAdminAccountDel() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AccountDAO accountDAO = new AccountDAO();
		String result = "";
		int id = Integer.parseInt(request.getParameter("id"));
		if(accountDAO.deleteAccount(id) > 0) {
			result = "1";
		}else {
			result = "0";
		}
		request.setAttribute("result", result);
		request.getRequestDispatcher("/adminaccount").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}

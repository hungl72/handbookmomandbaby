package controllers.publics;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daos.AccountDAO;
import models.Account;

public class ControllersPublicLogout extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public ControllersPublicLogout() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Account a = (Account)session.getAttribute("account");
		new AccountDAO().updateStatusLogout(a.getAccount_id());
		session.removeAttribute("account");
		response.sendRedirect(request.getContextPath()+"/index");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}

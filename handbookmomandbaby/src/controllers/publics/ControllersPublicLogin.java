package controllers.publics;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daos.AccountDAO;
import models.Account;

public class ControllersPublicLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ControllersPublicLogin() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("result", "0");
		request.getRequestDispatcher("/views/public/login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");response.setContentType("text/html");response.setCharacterEncoding("UTF-8");
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		AccountDAO accountDAO = new AccountDAO();
		Account account = accountDAO.login(email, pass);
		if(account != null) {
			accountDAO.updateStatusLogin(account.getAccount_id());
			HttpSession session = request.getSession();
			session.setAttribute("account", account);
			response.sendRedirect(request.getContextPath()+"/index");
		}else {
			request.setAttribute("result", "-1");
			request.getRequestDispatcher("/views/public/login.jsp").forward(request, response);
		}
	}

}

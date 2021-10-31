package controllers.admins.auth;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daos.AccountDAO;
import models.Account;
import utils.StringUtil;

public class LoginExpert extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LoginExpert() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/auth/loginexpert.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AccountDAO userDAO = new AccountDAO();
		String username = request.getParameter("email");
		String password = StringUtil.md5(request.getParameter("pass"));
		Account expert =userDAO.loginExpert(username, password);
		if(expert!=null) {
			HttpSession session=request.getSession();
			session.setAttribute("expert", expert);
			response.sendRedirect(request.getContextPath()+"/adminmessage");
		}else {
			request.setAttribute("msg", "-1");
			request.getRequestDispatcher("/views/auth/loginexpert.jsp").forward(request, response);
		}	
	}

}

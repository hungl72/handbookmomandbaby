package controllers.admins.auth;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daos.AccountDAO;
import models.Account;
import utils.StringUtil;
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public LoginController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("msg", "0");
		request.getRequestDispatcher("/views/auth/login.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AccountDAO userDAO = new AccountDAO();
		//thong tin dang nhap
		String username = request.getParameter("username");
		String password = StringUtil.md5(request.getParameter("password"));
		//kiem tra thong tin dang nhap
		Account adminInfo =userDAO.loginAdmin(username, password);
		
		if(adminInfo!=null) {
			//
			//
			HttpSession session=request.getSession();
			session.setAttribute("adminInfo", adminInfo);
			response.sendRedirect(request.getContextPath()+"/adminhome");
		}else {
			request.setAttribute("msg", "-1");
			request.getRequestDispatcher("/views/auth/login.jsp").forward(request, response);
		}	
	}

}

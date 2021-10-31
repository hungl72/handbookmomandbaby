package controllers.publics;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.AccountDAO;

public class ControllersPublicSignup extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public ControllersPublicSignup() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("result", "0");
		request.getRequestDispatcher("/views/public/signup.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");response.setContentType("text/html");response.setCharacterEncoding("UTF-8");
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		String date = request.getParameter("date");
		if(new AccountDAO().signup(username, email, pass,date,"", "","","",0,"noavatar.png",0) > 0) {
			request.setAttribute("result", "1");
			request.getRequestDispatcher("/views/public/login.jsp").forward(request, response);
		}else {
			request.setAttribute("result", "-1");
			request.getRequestDispatcher("/views/public/signup.jsp").forward(request, response);
		}
	}

}

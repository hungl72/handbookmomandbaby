package controllers.publics;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.AccountDAO;

public class ControllersPublicConfirmPass extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ControllersPublicConfirmPass() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		AccountDAO accountDAO = new AccountDAO();
		try {
		if(pass.equals(accountDAO.confirmPass(email,pass).getAccount_pass())) {
			//response.sendRedirect(request.getContextPath()+"/views/public/changepass.jsp");
			request.setAttribute("email", accountDAO.confirmPass(email,pass).getAccount_email());
			request.setAttribute("result", "Chuỗi bí mật trùng khớp !");
			request.getRequestDispatcher("/views/public/changepass.jsp").forward(request, response);
		}
	}catch(Exception e) {
		new AccountDAO().delPass(email);
		response.sendRedirect(request.getContextPath()+"/forgotpass?result=error");
	}
	}

}

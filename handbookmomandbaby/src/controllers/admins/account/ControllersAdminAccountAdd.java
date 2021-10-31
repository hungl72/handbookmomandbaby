package controllers.admins.account;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.AccountDAO;

public class ControllersAdminAccountAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ControllersAdminAccountAdd() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("result", "0");
		request.getRequestDispatcher("/views/admin/accountmanagement/add.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");response.setContentType("text/html");response.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		char a = '0';
		int b = 0;
		try {
		for(int i = 0;name.length() > 0;i++) {
			a = name.charAt(i);
			b = a;
			if(b != 32) {
				if(new AccountDAO().addExpert(name, email) > 0) {
					response.sendRedirect(request.getContextPath()+"/accountadd?result=success");
				}else {
					response.sendRedirect(request.getContextPath()+"/accountadd?result=error");
				}
				break;
			}
		}
		}catch(Exception e) {
			response.sendRedirect(request.getContextPath()+"/accountadd?result=error");
		}
	}

}

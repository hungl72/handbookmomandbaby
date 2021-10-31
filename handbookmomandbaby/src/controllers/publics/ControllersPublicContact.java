package controllers.publics;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daos.ContactDAO;
import models.Account;

public class ControllersPublicContact extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ControllersPublicContact() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("result", "0");
		request.getRequestDispatcher("/views/public/contact.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");response.setContentType("text/html");response.setCharacterEncoding("UTF-8");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		HttpSession session = request.getSession();
		Account account = (Account)session.getAttribute("account");
		int result = 0;
		String msg = "";
		try {
			result = new ContactDAO().insertContact(title, content, account.getAccount_id(),account.getAccount_name());
		} catch (Exception e) {
			// TODO: handle exception
		}
		if(result == 1) {
			msg = "success";
		}else{
			msg = "error";;
		}
		response.sendRedirect(request.getContextPath()+"/contact?msg="+msg+"");
	}

}

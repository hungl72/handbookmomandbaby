package controllers.admins.contact;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.ContactDAO;

public class ControllersAdminContactDel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ControllersAdminContactDel() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int result = 0;
		if(new ContactDAO().delContact(Integer.parseInt(request.getParameter("id"))) > 0) {
			result = 1;
		}else {
			result = 2;
		}
		response.sendRedirect(request.getContextPath()+"/contactindex?result="+result+"");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}

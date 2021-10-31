package controllers.admins.message;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.MessageDAO;

public class ControllersAdminCheckOffline extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ControllersAdminCheckOffline() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().print(""+new MessageDAO().listOffline().getAccount_status()+"");
	}

}

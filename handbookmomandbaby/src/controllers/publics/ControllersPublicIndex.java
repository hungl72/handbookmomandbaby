package controllers.publics;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daos.ListNewsDAO;
import daos.ProductDAO;
import models.Account;

public class ControllersPublicIndex extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ControllersPublicIndex() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("listProductViews", new ProductDAO().listProductViews());
		request.setAttribute("listNewsViews", new ListNewsDAO().listNewsViews());
		request.getRequestDispatcher("/views/public/index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}

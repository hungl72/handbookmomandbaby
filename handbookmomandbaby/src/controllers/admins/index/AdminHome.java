package controllers.admins.index;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.AccountDAO;
import daos.MenuDAO;
import daos.ProductDAO;

public class AdminHome extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminHome() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("countUser", new AccountDAO().countUser());
		request.setAttribute("countMenuParent", new MenuDAO().countMenuParent());
		request.setAttribute("countMenuChildren", new MenuDAO().countMenuChildren());
		request.setAttribute("countProduct", new ProductDAO().countProduct());
		request.getRequestDispatcher("/views/admin/adminhome/index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}

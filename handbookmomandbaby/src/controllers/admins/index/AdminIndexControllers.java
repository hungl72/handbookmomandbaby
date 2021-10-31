package controllers.admins.index;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.MenuDAO;

public class AdminIndexControllers extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminIndexControllers() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");response.setContentType("text/html");response.setCharacterEncoding("UTF-8");
		MenuDAO menuDAO = new MenuDAO();
		try {
		if(((String)request.getAttribute("result")).equals("-1")){
			request.setAttribute("result", "-1");
		}
		}catch(Exception e) {
			
		}
		request.setAttribute("result", "0");
		request.setAttribute("listMenuParent", menuDAO.listMenuParent());
		request.setAttribute("listMenuSon", menuDAO.listMenuSon());
		request.getRequestDispatcher("/views/admin/newsmanagement/newsmanagement.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}

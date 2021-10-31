package controllers.admins.index;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.MenuDAO;
import models.Menu;

public class LoadSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LoadSelect() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");response.setContentType("text/html");response.setCharacterEncoding("UTF-8");
		for(Menu m : new MenuDAO().loadMenuParent()){
			response.getWriter().print("<option value=\""+m.getMenu_id()+"\">"+m.getMenu_name()+"</option>");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");response.setContentType("text/html");response.setCharacterEncoding("UTF-8");
		for(Menu m : new MenuDAO().loadMenuChildren()) {
			response.getWriter().print(" <option value=\""+m.getMenu_id()+"\">"+m.getMenu_name()+"</option>");
		}
	}

}

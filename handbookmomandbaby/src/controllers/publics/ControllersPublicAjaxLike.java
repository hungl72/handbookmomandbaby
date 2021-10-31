package controllers.publics;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.FavouriteDAO;
import models.Account;
import models.Favourite;

public class ControllersPublicAjaxLike extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ControllersPublicAjaxLike() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");response.setContentType("text/html");response.setCharacterEncoding("UTF-8");
		FavouriteDAO favouriteDAO = new FavouriteDAO();
		String favourite_name = request.getParameter("favourite_name");
		String favourite_image = request.getParameter("favourite_image");
		int favourite_status = Integer.parseInt(request.getParameter("favourite_status"));
		int menu_id = Integer.parseInt(request.getParameter("menu_id"));
		int listnews_id = Integer.parseInt(request.getParameter("listnews_id"));
		int IDAccount = Integer.parseInt(request.getParameter("IDAccount"));
		Favourite favourite = favouriteDAO.checkFavourite(listnews_id, IDAccount);	
		if(favourite != null) {
			if(favourite.getFavourite_status() == 1) {
					favouriteDAO.updateFavoủrite(0, listnews_id, IDAccount);
					favouriteDAO.updateImage(favourite_image, IDAccount, listnews_id);
					response.getWriter().print("<a href=\"javascript:void(0)\" id=\"like\" onclick=\"favourite('"+favourite_name+"','"+favourite_image+"',"+0+","+menu_id+","+listnews_id+","+IDAccount+")\"><img  src=\""+request.getContextPath()+"/templates/public/images/heartwhite.png\" style=\"width: auto;height: auto;\"></a>");
			}else {
				favouriteDAO.updateFavoủrite(1, listnews_id, IDAccount);
				favouriteDAO.updateImage(favourite_image, IDAccount, listnews_id);
				response.getWriter().print("<a href=\"javascript:void(0)\" id=\"like\" onclick=\"favourite('"+favourite_name+"','"+favourite_image+"',"+1+","+menu_id+","+listnews_id+","+IDAccount+")\"><img  src=\""+request.getContextPath()+"/templates/public/images/heartred.png\" style=\"width: auto;height: auto;\"></a>");
			}
				}else{
					favouriteDAO.addFavoủrite(favourite_name, favourite_image, 1, menu_id, listnews_id, IDAccount);
					response.getWriter().print("<a href=\"javascript:void(0)\" id=\"like\" onclick=\"favourite('"+favourite_name+"','"+favourite_image+"',"+1+","+menu_id+","+listnews_id+","+IDAccount+")\"><img  src=\""+request.getContextPath()+"/templates/public/images/heartred.png\" style=\"width: auto;height: auto;\"></a>");
					
				}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}

package controllers.publics;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daos.FavouriteDAO;
import models.Account;
import models.Favourite;

public class ControllersPublicListFavourite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ControllersPublicListFavourite() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		try {
			Account account = (Account)session.getAttribute("account");
			request.setAttribute("listFavourite", new FavouriteDAO().listFavourite(account.getAccount_id()));
		}catch(Exception e) {
			request.setAttribute("listFavourite", null);
		}
		request.getRequestDispatcher("/views/public/favourite.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}

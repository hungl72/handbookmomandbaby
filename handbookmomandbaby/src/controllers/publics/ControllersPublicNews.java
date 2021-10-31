package controllers.publics;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.CommentDAO;
import daos.ListNewsDAO;
import models.CommentChildren;

public class ControllersPublicNews extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ControllersPublicNews() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int menu_id = Integer.parseInt(request.getParameter("menu_id"));
		int listnews_id = Integer.parseInt(request.getParameter("listnews_id"));
		CommentDAO commentDAO = new CommentDAO();
		ListNewsDAO lnd = new ListNewsDAO();
		lnd.updateViews(listnews_id);
		request.setAttribute("comment", commentDAO.findAll(listnews_id));
		request.setAttribute("commentChildren", commentDAO.findAllCommentChildrennn(commentDAO.findIdCommentParent(listnews_id)));
		request.setAttribute("menuName", lnd.nameMenu(menu_id));
		request.setAttribute("news", lnd.listNews(menu_id,listnews_id));
		request.setAttribute("listNewsRelate", lnd.listNewsRelate(menu_id, listnews_id));
		request.getRequestDispatcher("/views/public/news.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}

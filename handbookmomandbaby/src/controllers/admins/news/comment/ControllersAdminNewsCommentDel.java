package controllers.admins.news.comment;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.CommentDAO;
import daos.ListNewsDAO;
import models.Comment;
import models.CommentChildren;

public class ControllersAdminNewsCommentDel extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ControllersAdminNewsCommentDel() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CommentDAO commentDAO = new CommentDAO();
		commentDAO.delCommentParent(Integer.parseInt(request.getParameter("id")));
		for(Integer i : new ListNewsDAO().idListNews()){
			for(Comment c : commentDAO.findAllCommentByIDListNews(i)) {
				if(i == c.getIDListnews()) {
					response.getWriter().print("<h5 id=\"contentParent"+c.getComment_id()+"\" onclick=\"contentParent("+c.getComment_id()+","+c.getComment_id()+",0)\" style=\"border: 2px solid red;border-radius: 5px;padding: 0.5rem;font-weight: 600;\">"+c.getComment_content()+" <span style=\"color: indigo;\"> ---> "+c.getNameAccount()+" <a href=\"javascript:void(0)\" style=\"float: right;padding: 0 1rem;\" onclick=\"delParent("+c.getComment_id()+")\">Xóa</a></span><i id=\"down\" style=\"float: right;\" class=\"fas fa-caret-square-down\"></i></h5>\r\n" + 
							"\r\n" + 
							"                            <ul style=\"display: none;\" id=\"contentChildrenc.getComment_id()\" class=\"list-group\">");
				}
				for(CommentChildren cc : commentDAO.findAllCommentChildrennn(c.getComment_id())){
					response.getWriter().print("<li id=\"cc"+cc.getComment_children_id()+"\" class=\"list-group-item\">"+cc.getComment_children_content()+"<span style=\"color: indigo;\"> ---> "+cc.getNameAccount()+"</span><a href=\"javascript:void(0)\" style=\"float: right;\" onclick=\"delChildren("+cc.getComment_children_id()+")\">Xóa</a></li></ul>");
				}
				}
			}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		new CommentDAO().delCommentChildren(Integer.parseInt(request.getParameter("id")));
	}

}

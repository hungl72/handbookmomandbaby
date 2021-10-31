package controllers.publics;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.CommentDAO;
import models.CommentChildren;

public class ControllersPublicChangeCommentChildren extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ControllersPublicChangeCommentChildren() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");response.setContentType("text/html");response.setCharacterEncoding("UTF-8");
		int comment_children_id = Integer.parseInt(request.getParameter("comment_id"));
		String comment_children_content = request.getParameter("comment_content");
		CommentDAO commentDAO = new CommentDAO();
		commentDAO.updateCommentChildren(comment_children_id, comment_children_content);
		CommentChildren cc = commentDAO.findCommentChildrenById(comment_children_id);
			response.getWriter().print("<p style=\"font-weight: bold;padding-left: 20px;\">"+cc.getComment_children_content()+" -> <span style=\"color: #283290;font-weight: bold;\">Đã trả lời bởi</span> : <span style=\"color: #283290;font-weight: bold;\">"+cc.getNameAccount()+"</span> - <span style=\"color: #283290;font-weight: bold;\">Lúc</span> : <span style=\"color: #283290;font-weight: bold;\">"+cc.getComment_children_datecreated()+"</span> <a href=\"javascript:void(0)\"  onclick=\"show("+cc.getComment_children_id()+")\"> Trả lời -> "+cc.getNameAccount()+"</a><a href=\"javascript:void(0)\"  onclick=\"showChangeChildren("+cc.getComment_children_id()+")\"> Sửa</a></p>"
					+ "<span id=\"responseComment\"></span></p>");
			/*
			response.getWriter().print("<textarea class =\"form-control\" id =\"replyContent"+cc.getIDComment()+""+cc.getComment_children_id()+"\" placeholder=\"@"+cc.getNameAccount()+"\">@"+cc.getNameAccount() +"</textarea><a href=\"javascript:void(0)\" onclick=\"post("+cc.getIDComment()+","+cc.getComment_children_id()+")\">Phản hồi</a>"
					+ "<div id=\"changeChildren"+cc.getComment_children_id()+"\"  hidden=\"hidden\">\r\n" + 
					"                        	<textarea id=\"contentChildren"+cc.getComment_children_id()+"\" class =\"form-control\">"+cc.getComment_children_content()+"</textarea>\r\n" + 
					"                        	<a href=\"javascript:void(0)\"  onclick=\"runChangeChildren("+cc.getComment_children_id()+")\"> Sửa nội dung</a>\r\n" + 
					"                        </div>");*/
	}

}

package controllers.publics;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.CommentDAO;
import models.Comment;

public class ControllersPublicChangeComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ControllersPublicChangeComment() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");response.setContentType("text/html");response.setCharacterEncoding("UTF-8");
		int comment_id = Integer.parseInt(request.getParameter("comment_id"));
		String comment_content = request.getParameter("comment_content");
		CommentDAO commentDAO = new CommentDAO();
		commentDAO.updateComment(comment_id, comment_content);
		Comment c = commentDAO.findCommentParentById(comment_id);
		response.getWriter().print(""+c.getComment_content()+" -> <span style=\"color: #283290;font-weight: bold;\">Bình luận bởi</span> : <span style=\"color: #283290;font-weight: bold;\">"+c.getNameAccount()+"</span> - <span style=\"color: #283290;font-weight: bold;\">Lúc</span> : <span style=\"color: #283290;font-weight: bold;\">"+c.getComment_datecreated()+"</span>\r\n" + 
				"                        <a href=\"javascript:void(0)\"  onclick=\"show("+c.getComment_id()+")\"> Trả lời -> "+c.getNameAccount()+"</a><a href=\"javascript:void(0)\"  onclick=\"showChange("+c.getComment_id()+")\"> Sửa</a>");
	}

}

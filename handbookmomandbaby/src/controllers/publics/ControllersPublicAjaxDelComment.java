package controllers.publics;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daos.CommentDAO;
import models.Account;
import models.Comment;
import models.CommentChildren;

public class ControllersPublicAjaxDelComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ControllersPublicAjaxDelComment() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Account account = (Account)session.getAttribute("account");
		CommentDAO commentDAO = new CommentDAO();
		int idNews = Integer.parseInt(request.getParameter("idNews"));
		new CommentDAO().delCommentParent(Integer.parseInt(request.getParameter("comment_id")));
		/*
		for(Comment c : commentDAO.findAll(idNews)) {
        	for(CommentChildren cc : commentDAO.findAllCommentChildrennn(commentDAO.findIdCommentParent(idNews))){
        		if(c.getIDAccount() == account.getAccount_id()) {
        		response.getWriter().print("<p id=\"updateChangeDel"+c.getComment_id()+"\" style=\"font-weight: bold;\">"+c.getComment_content()+" -> <span style=\"color: #283290;font-weight: bold;\">Bình luận bởi</span> : <span style=\"color: #283290;font-weight: bold;\">"+c.getNameAccount()+"</span> - <span style=\"color: #283290;font-weight: bold;\">Lúc</span> : <span style=\"color: #283290;font-weight: bold;\">"+c.getComment_datecreated()+"</span>\r\n" + 
        				"                        <a href=\"javascript:void(0)\"  onclick=\"show("+c.getComment_id()+")\"> Trả lời -> "+c.getNameAccount()+"</a><a href=\"javascript:void(0)\"  onclick=\"showChange("+c.getComment_id()+")\"> Sửa</a></p>");
        		}else {
        			response.getWriter().print("<p id=\"updateChangeDel"+c.getComment_id()+"\" style=\"font-weight: bold;\">"+c.getComment_content()+" -> <span style=\"color: #283290;font-weight: bold;\">Bình luận bởi</span> : <span style=\"color: #283290;font-weight: bold;\">"+c.getNameAccount()+"</span> - <span style=\"color: #283290;font-weight: bold;\">Lúc</span> : <span style=\"color: #283290;font-weight: bold;\">"+c.getComment_datecreated()+"</span>\r\n" + 
            				"                        <a href=\"javascript:void(0)\"  onclick=\"show("+c.getComment_id()+")\"> Trả lời -> "+c.getNameAccount()+"</a></p>");
        		}
        		response.getWriter().print("                        <div id=\"change"+c.getComment_id()+"\"  hidden=\"hidden\">\r\n" + 
        				"                        	<textarea id=\"contentParent"+c.getComment_id()+"\" class =\"form-control\">"+c.getComment_content()+"</textarea>\r\n" + 
        				"                        	<a href=\"javascript:void(0)\"  onclick=\"runChange("+c.getComment_id()+")\"> Sửa nội dung</a>\r\n" + 
        				"                        </div>");
        		response.getWriter().print("<a href=\"javascript:void(0)\" onclick=\"setInterval(loadCommentChildren("+c.getComment_id()+"),1000)\">Xem thêm</a>\r\n" + 
        				"                        <p id=\"reply"+c.getComment_id()+"\" style=\"font-weight: bold;padding-left: 20px;width: 95%;\" hidden=\"hidden;\">\r\n" + 
        				"                        <textarea class =\"form-control\" id =\"replyContent"+c.getComment_id()+""+cc.getComment_children_id()+"\" placeholder=\"@"+c.getNameAccount()+"\"></textarea>\r\n" + 
        				"                        <a href=\"javascript:void(0)\" onclick=\"post("+c.getComment_id()+","+cc.getComment_children_id()+")\">Phản hồi</a></p>\r\n" + 
        				"                        <hr />");
        	}
        }*/
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}

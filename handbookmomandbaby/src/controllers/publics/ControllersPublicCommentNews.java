package controllers.publics;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daos.CommentDAO;
import daos.ProductDAO;
import models.Account;
import models.Comment;
import models.CommentChildren;

public class ControllersPublicCommentNews extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ControllersPublicCommentNews() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");response.setContentType("text/html");response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		Account account = (Account)session.getAttribute("account");
		CommentDAO commentDAO = new CommentDAO();
		int idNews = Integer.parseInt(request.getParameter("idNews"));
		int comment_children_id = 0;
    		ArrayList<Comment> comment = commentDAO.findAll(idNews);
    		if(comment.size() > 0){
    			for(Comment c : comment){
    				response.getWriter().print("<p id=\"updateChangeDel"+c.getComment_id()+"\" style=\"font-weight: bold;\">"+c.getComment_content()+" -> <span style=\"color: #283290;font-weight: bold;\">Bình luận bởi</span> : <span style=\"color: #283290;font-weight: bold;\">"+c.getNameAccount()+"</span> - <span style=\"color: #283290;font-weight: bold;\">Lúc</span> : <span style=\"color: #283290;font-weight: bold;\">"+c.getComment_datecreated()+"</span>\r\n" + 
    						"                        <a href=\"javascript:void(0)\"  onclick=\"show("+c.getComment_id()+")\"> Trả lời -> "+c.getNameAccount()+"</a>");
    				if(c.getIDAccount() == account.getAccount_id()) {
    					response.getWriter().print("<a href=\"javascript:void(0)\"  onclick=\"showChange("+c.getComment_id()+")\"> Sửa</a>\r\n" + 
    							"                         <a href=\"javascript:void(0)\"  onclick=\"del("+c.getComment_id()+")\"> Xóa</a>");
    				}else {}
    				response.getWriter().print("</p>\r\n" + 
    						"                        <div id=\"change"+c.getComment_id()+"\"  hidden=\"hidden\">\r\n" + 
    						"                        	<textarea id=\"contentParent"+c.getComment_id()+"\" class =\"form-control\">"+c.getComment_content()+"</textarea>\r\n" + 
    						"                        	<a href=\"javascript:void(0)\"  onclick=\"runChange("+c.getComment_id()+")\"> Sửa nội dung</a>\r\n" + 
    						"                        </div>\r\n" + 
    						"                        <span id=\"responseComment"+c.getComment_id()+"\"></span>");
                		ArrayList<CommentChildren> commentChildren = commentDAO.findAllCommentChildrennn(commentDAO.findIdCommentParent(idNews));
                		if(commentChildren.size() > 0){
                			for(CommentChildren cc : commentChildren){
                				comment_children_id = cc.getComment_children_id();
                				response.getWriter().print("<p id=\"reply"+comment_children_id+"\" style=\"font-weight: bold;padding-left: 20px;width: 95%;\" hidden=\"hidden;\">\r\n" + 
                						"  						<textarea class =\"form-control\" id =\"replyContent"+cc.getIDComment()+""+cc.getComment_children_id()+"\" placeholder=\"@"+cc.getNameAccount()+"\"></textarea>\r\n" + 
                						"  						<a href=\"javascript:void(0)\" onclick=\"post("+cc.getIDComment()+","+comment_children_id+")\">Phản hồi</a></p>");
                			}
                		}
                		response.getWriter().print("<a href=\"javascript:void(0)\" onclick=\"setInterval(loadCommentChildren("+c.getComment_id()+"),1000)\">Xem thêm</a>\r\n" + 
                				"                        <p id=\"reply"+c.getComment_id()+"\" style=\"font-weight: bold;padding-left: 20px;width: 95%;\" hidden=\"hidden;\">\r\n" + 
                				"                        <textarea class =\"form-control\" id =\"replyContent"+c.getComment_id()+""+comment_children_id+"\" placeholder=\"@"+c.getNameAccount()+"\"></textarea>\r\n" + 
                				"                        <a href=\"javascript:void(0)\" onclick=\"post("+c.getComment_id()+","+comment_children_id+")\">Phản hồi</a></p>\r\n" + 
                				"                        <hr />");
    			}
    		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");response.setContentType("text/html");response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		Account account = (Account)session.getAttribute("account");
		CommentDAO commentDAO = new CommentDAO();
		int idNews = Integer.parseInt(request.getParameter("idNews"));
		String commentContent = request.getParameter("commentContent");
		char a = '0';
		int b = 0;
		for(int i = 0;commentContent.length() > 0;i++) {
			a = commentContent.charAt(i);
			b = a;
			if(b != 32) {
		commentDAO.insertComment(commentContent, new SimpleDateFormat("dd/MM/yyyy").format(Calendar.getInstance().getTime()), account.getAccount_id(), account.getAccount_name(), idNews);
		int comment_children_id = 0;
		ArrayList<Comment> comment = commentDAO.findAll(idNews);
		if(comment.size() > 0){
			for(Comment c : comment){
				response.getWriter().print("<div id=\"commentParentId"+c.getComment_id()+"\">");
				response.getWriter().print("<p id=\"updateChangeDel"+c.getComment_id()+"\" style=\"font-weight: bold;\">"+c.getComment_content()+" -> <span style=\"color: #283290;font-weight: bold;\">Bình luận bởi</span> : <span style=\"color: #283290;font-weight: bold;\">"+c.getNameAccount()+"</span> - <span style=\"color: #283290;font-weight: bold;\">Lúc</span> : <span style=\"color: #283290;font-weight: bold;\">"+c.getComment_datecreated()+"</span>\r\n" + 
						"                        <a href=\"javascript:void(0)\"  onclick=\"show("+c.getComment_id()+")\"> Trả lời -> "+c.getNameAccount()+"</a>");
				if(c.getIDAccount() == account.getAccount_id()) {
					response.getWriter().print("<a href=\"javascript:void(0)\"  onclick=\"showChange("+c.getComment_id()+")\"> Sửa</a>\r\n" + 
							"                         <a href=\"javascript:void(0)\"  onclick=\"del("+c.getComment_id()+")\"> Xóa</a>");
				}else {}
				response.getWriter().print("</p>\r\n" + 
						"                        <div id=\"change"+c.getComment_id()+"\"  hidden=\"hidden\">\r\n" + 
						"                        	<textarea id=\"contentParent"+c.getComment_id()+"\" class =\"form-control\">"+c.getComment_content()+"</textarea>\r\n" + 
						"                        	<a href=\"javascript:void(0)\"  onclick=\"runChange("+c.getComment_id()+")\"> Sửa nội dung</a>\r\n" + 
						"                        </div>\r\n" + 
						"                        <span id=\"responseComment"+c.getComment_id()+"\"></span>");
            		ArrayList<CommentChildren> commentChildren = commentDAO.findAllCommentChildrennn(commentDAO.findIdCommentParent(idNews));
            		if(commentChildren.size() > 0){
            			for(CommentChildren cc : commentChildren){
            				comment_children_id = cc.getComment_children_id();
            				response.getWriter().print("<p id=\"reply"+comment_children_id+"\" style=\"font-weight: bold;padding-left: 20px;width: 95%;\" hidden=\"hidden;\">\r\n" + 
            						"  						<textarea class =\"form-control\" id =\"replyContent"+cc.getIDComment()+""+cc.getComment_children_id()+"\" placeholder=\"@"+cc.getNameAccount()+"\"></textarea>\r\n" + 
            						"  						<a href=\"javascript:void(0)\" onclick=\"post("+cc.getIDComment()+","+comment_children_id+")\">Phản hồi</a></p>");
            			}
            		}
            		response.getWriter().print("<a href=\"javascript:void(0)\" onclick=\"setInterval(loadCommentChildren("+c.getComment_id()+"),1000)\">Xem thêm</a>\r\n" + 
            				"                        <p id=\"reply"+c.getComment_id()+"\" style=\"font-weight: bold;padding-left: 20px;width: 95%;\" hidden=\"hidden;\">\r\n" + 
            				"                        <textarea class =\"form-control\" id =\"replyContent"+c.getComment_id()+""+comment_children_id+"\" placeholder=\"@"+c.getNameAccount()+"\"></textarea>\r\n" + 
            				"                        <a href=\"javascript:void(0)\" onclick=\"post("+c.getComment_id()+","+comment_children_id+")\">Phản hồi</a></p>\r\n" + 
            				"                        <hr />");
            		response.getWriter().print("</div>");
			}
		}
		break;
	}
}
	}

}

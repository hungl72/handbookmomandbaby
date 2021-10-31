package controllers.publics;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daos.CommentDAO;
import models.Account;
import models.CommentChildren;

public class ControllersPublicAjaxCommentChildren extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ControllersPublicAjaxCommentChildren() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int IDComment = Integer.parseInt(request.getParameter("IDComment"));
		int idNews = Integer.parseInt(request.getParameter("idNews"));
		String replyContent = request.getParameter("replyContent");
		char a = '0';
		int b = 0;
		for(int i = 0;replyContent.length() > 0;i++) {
			a = replyContent.charAt(i);
			b = a;
			if(b != 32) {
		HttpSession session = request.getSession();
		Account account = (Account)session.getAttribute("account");
		new CommentDAO().insertCommentChildren(replyContent, new SimpleDateFormat("dd/MM/yyyy").format(new Date().getTime()), account.getAccount_id(), account.getAccount_name(), idNews, IDComment);
		break;
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");response.setContentType("text/html");response.setCharacterEncoding("UTF-8");
		Account account = (Account)request.getSession().getAttribute("account");
		int account_id = 0;
		if(account == null) {
			account_id = 0;
		}else {
			account_id = account.getAccount_id();
		}
		int IDComment = Integer.parseInt(request.getParameter("IDComment"));
		CommentDAO commentDAO = new CommentDAO();
		
		if(account != null) {
			for(CommentChildren cc : commentDAO.findAllCommentChildrennn(IDComment)){
				if(cc.getIDAccount() == account_id) {
				response.getWriter().print("<p id=\"updateChangeDelChildren"+cc.getComment_children_id()+"\" style=\"font-weight: bold;padding-left: 20px;\">"+cc.getComment_children_content()+" -> <span style=\"color: #283290;font-weight: bold;\">Đã trả lời bởi</span> : <span style=\"color: #283290;font-weight: bold;\">"+cc.getNameAccount()+"</span> - <span style=\"color: #283290;font-weight: bold;\">Lúc</span> : <span style=\"color: #283290;font-weight: bold;\">"+cc.getComment_children_datecreated()+"</span> <a href=\"javascript:void(0)\"  onclick=\"show("+cc.getComment_children_id()+")\"> Trả lời -> "+cc.getNameAccount()+"</a><a href=\"javascript:void(0)\"  onclick=\"showChangeChildren("+cc.getComment_children_id()+")\"> Sửa</a></p>"
						+ "<span id=\"responseComment\"></span></p>");
				response.getWriter().print("<p id=\"reply"+cc.getComment_children_id()+"\" style=\"font-weight: bold;padding-left: 20px;width: 95%;\" hidden=\"hidden;\"><textarea class =\"form-control\" id =\"replyContent"+cc.getIDComment()+""+cc.getComment_children_id()+"\" placeholder=\"@"+cc.getNameAccount()+"\"></textarea><a href=\"javascript:void(0)\" onclick=\"post("+cc.getIDComment()+","+cc.getComment_children_id()+")\">Phản hồi</a></p>"
						+ "<div id=\"changeChildren"+cc.getComment_children_id()+"\"  hidden=\"hidden\">\r\n" + 
						"                        	<textarea id=\"contentChildren"+cc.getComment_children_id()+"\" class =\"form-control\">"+cc.getComment_children_content()+"</textarea>\r\n" + 
						"                        	<a href=\"javascript:void(0)\"  onclick=\"runChangeChildren("+cc.getComment_children_id()+")\"> Sửa nội dung</a>\r\n" + 
						"                        </div>");
				}else {
					response.getWriter().print("<p id=\"updateChangeDelChildren"+cc.getComment_children_id()+"\" style=\"font-weight: bold;padding-left: 20px;\">"+cc.getComment_children_content()+" -> <span style=\"color: #283290;font-weight: bold;\">Đã trả lời bởi</span> : <span style=\"color: #283290;font-weight: bold;\">"+cc.getNameAccount()+"</span> - <span style=\"color: #283290;font-weight: bold;\">Lúc</span> : <span style=\"color: #283290;font-weight: bold;\">"+cc.getComment_children_datecreated()+"</span> <a href=\"javascript:void(0)\"  onclick=\"show("+cc.getComment_children_id()+")\"> Trả lời -> "+cc.getNameAccount()+"</a></p>"
							+ "<span id=\"responseComment\"></span></p>");
					response.getWriter().print("<p id=\"reply"+cc.getComment_children_id()+"\" style=\"font-weight: bold;padding-left: 20px;width: 95%;\" hidden=\"hidden;\"><textarea class =\"form-control\" id =\"replyContent"+cc.getIDComment()+""+cc.getComment_children_id()+"\" placeholder=\"@"+cc.getNameAccount()+"\"></textarea><a href=\"javascript:void(0)\" onclick=\"post("+cc.getIDComment()+","+cc.getComment_children_id()+")\">Phản hồi</a></p>"
							+ "<div id=\"changeChildren"+cc.getComment_children_id()+"\"  hidden=\"hidden\">\r\n" + 
							"                        	<textarea id=\"contentChildren"+cc.getComment_children_id()+"\" class =\"form-control\">"+cc.getComment_children_content()+"</textarea>\r\n" + 
							"                        	\r\n" + 
							"                        </div>");
				}
			}
		}else {
			for(CommentChildren cc : commentDAO.findAllCommentChildrennn(IDComment)){
				if(cc.getIDAccount() == account_id) {
				response.getWriter().print("<p id=\"updateChangeDelChildren"+cc.getComment_children_id()+"\" style=\"font-weight: bold;padding-left: 20px;\">"+cc.getComment_children_content()+" -> <span style=\"color: #283290;font-weight: bold;\">Đã trả lời bởi</span> : <span style=\"color: #283290;font-weight: bold;\">"+cc.getNameAccount()+"</span> - <span style=\"color: #283290;font-weight: bold;\">Lúc</span> : <span style=\"color: #283290;font-weight: bold;\">"+cc.getComment_children_datecreated()+"</span> <a href=\"javascript:void(0)\"  onclick=\"show("+cc.getComment_children_id()+")\"> Trả lời -> "+cc.getNameAccount()+"</a><a href=\"javascript:void(0)\"  onclick=\"showChangeChildren("+cc.getComment_children_id()+")\"> Sửa</a></p>"
						+ "<span id=\"responseComment\"></span></p>");
				response.getWriter().print("<p id=\"reply"+cc.getComment_children_id()+"\" style=\"font-weight: bold;padding-left: 20px;width: 95%;\" hidden=\"hidden;\"><textarea class =\"form-control\" id =\"replyContent"+cc.getIDComment()+""+cc.getComment_children_id()+"\" placeholder=\"@"+cc.getNameAccount()+"\"></textarea><a href=\"javascript:void(0)\" onclick=\"alert('Bạn phải đăng nhập trước khi bình luận !')\">Phản hồi</a></p>"
						+ "<div id=\"changeChildren"+cc.getComment_children_id()+"\"  hidden=\"hidden\">\r\n" + 
						"                        	<textarea id=\"contentChildren"+cc.getComment_children_id()+"\" class =\"form-control\">"+cc.getComment_children_content()+"</textarea>\r\n" + 
						"                        	<a href=\"javascript:void(0)\"  onclick=\"runChangeChildren("+cc.getComment_children_id()+")\"> Sửa nội dung</a>\r\n" + 
						"                        </div>");
				}else {
					response.getWriter().print("<p id=\"updateChangeDelChildren"+cc.getComment_children_id()+"\" style=\"font-weight: bold;padding-left: 20px;\">"+cc.getComment_children_content()+" -> <span style=\"color: #283290;font-weight: bold;\">Đã trả lời bởi</span> : <span style=\"color: #283290;font-weight: bold;\">"+cc.getNameAccount()+"</span> - <span style=\"color: #283290;font-weight: bold;\">Lúc</span> : <span style=\"color: #283290;font-weight: bold;\">"+cc.getComment_children_datecreated()+"</span> <a href=\"javascript:void(0)\"  onclick=\"show("+cc.getComment_children_id()+")\"> Trả lời -> "+cc.getNameAccount()+"</a></p>"
							+ "<span id=\"responseComment\"></span></p>");
					response.getWriter().print("<p id=\"reply"+cc.getComment_children_id()+"\" style=\"font-weight: bold;padding-left: 20px;width: 95%;\" hidden=\"hidden;\"><textarea class =\"form-control\" id =\"replyContent"+cc.getIDComment()+""+cc.getComment_children_id()+"\" placeholder=\"@"+cc.getNameAccount()+"\"></textarea><a href=\"javascript:void(0)\" onclick=\"alert('Bạn phải đăng nhập trước khi bình luận !')\">Phản hồi</a></p>"
							+ "<div id=\"changeChildren"+cc.getComment_children_id()+"\"  hidden=\"hidden\">\r\n" + 
							"                        	<textarea id=\"contentChildren"+cc.getComment_children_id()+"\" class =\"form-control\">"+cc.getComment_children_content()+"</textarea>\r\n" + 
							"                        	\r\n" + 
							"                        </div>");
				}
			}
		}
		
	}

}

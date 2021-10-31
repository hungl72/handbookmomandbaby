package controllers.publics;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.FaqDAO;
import models.Faq;

public class ControllersPublicFaq extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ControllersPublicFaq() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("listFaqState0", new FaqDAO().listFaqState0());
		request.setAttribute("listFaqState1", new FaqDAO().listFaqState1());
		request.getRequestDispatcher("/views/public/faq.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");response.setContentType("text/html");response.setCharacterEncoding("UTF-8");
		int IDFaq = Integer.parseInt(request.getParameter("IDFaq"));
		String replyContent = request.getParameter("replyContent");
		FaqDAO faqDAO = new FaqDAO();
		faqDAO.replyFaq(IDFaq, replyContent);
			for(Faq f : faqDAO.listFaqState1()){
				if(f.getFaq_anonymous() == 0) {
					
						response.getWriter().print("<div>\r\n" + 
								"				<a href=\"javascript:void(0);\" onclick=\"question("+f.getFaq_id()+")\"><h3>"+f.getFaq_question()+"<span id=\"plusminus"+f.getFaq_id()+"\" style=\"float: right;\">+</span></h3></a>\r\n" + 
								"				<h5>Câu hỏi đến từ <span style=\"color: #283290;\">"+f.getFaq_username()+"</span> -> Đã trả lời bởi <span style=\"color: #283290;\">chuyên gia</span></h5><a href=\"javascript:void(0)\"  onclick=\"show("+f.getFaq_id()+")\">Sửa câu trả lời</a>\r\n" + 
								"				<p id=\"reply"+f.getFaq_id()+"\" style=\"font-weight: bold;\" hidden=\"hidden;\"><textarea class =\"form-control\" id =\"replyContent"+f.getFaq_id()+"\"></textarea><a href=\"javascript:void(0)\" onclick=\"fix("+f.getFaq_id()+")\">Phản hồi</a></p>\r\n" + 
								"			</div>\r\n" + 
								"			<div class=\"col-md-12 col-xs-12\" >\r\n" + 
								"				<p id=\"responsequestion"+f.getFaq_id()+"\" style=\"display: none;\">"+f.getFaq_feedback()+"</p>\r\n" + 
								"			</div>");
						}else{
						response.getWriter().print("<div>\r\n" + 
								"				<a href=\"javascript:void(0);\" onclick=\"question("+f.getFaq_id()+")\"><h3>"+f.getFaq_question()+"<span id=\"plusminus"+f.getFaq_id()+"\" style=\"float: right;\">+</span></h3></a>\r\n" + 
								"				<h5>Câu hỏi đến từ <span style=\"color: #283290;\">một bạn giấu tên</span> -> Đã trả lời bởi <span style=\"color: #283290;\">chuyên gia</span></h5><a href=\"javascript:void(0)\"  onclick=\"show("+f.getFaq_id()+")\">Sửa câu trả lời</a>\r\n" + 
								"				<p id=\"reply"+f.getFaq_id()+"\" style=\"font-weight: bold;\" hidden=\"hidden;\"><textarea class =\"form-control\" id =\"replyContent"+f.getFaq_id()+"\"></textarea><a href=\"javascript:void(0)\" onclick=\"fix("+f.getFaq_id()+")\">Phản hồi</a></p>\r\n" + 
								"			</div>\r\n" + 
								"			<div class=\"col-md-12 col-xs-12\" >\r\n" + 
								"				<p id=\"responsequestion"+f.getFaq_id()+"\" style=\"display: none;\">"+f.getFaq_feedback()+"</p>\r\n" + 
								"			</div>");
						}
					}
	}
}

package controllers.publics;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.FaqDAO;
import models.Faq;

public class ControllersPublicFixQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ControllersPublicFixQuestion() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");response.setContentType("text/html");response.setCharacterEncoding("UTF-8");
		FaqDAO faqDAO = new FaqDAO();
		int IDFaq = Integer.parseInt(request.getParameter("IDFaq"));
		String replyContent = request.getParameter("replyContent");
		faqDAO.updateQuestion(replyContent, IDFaq);
		Faq faq = faqDAO.findFeedbackFaq(IDFaq);
		response.getWriter().print(""+faq.getFaq_feedback()+"");System.out.println(faq.getFaq_feedback());
	}

}

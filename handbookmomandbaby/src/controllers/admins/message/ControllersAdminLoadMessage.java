package controllers.admins.message;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.MessageDAO;
import models.Message;

public class ControllersAdminLoadMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ControllersAdminLoadMessage() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");response.setContentType("text/html");response.setCharacterEncoding("UTF-8");
		ArrayList<Message> arrMessage = new ArrayList<Message>();
		int id = Integer.parseInt(request.getParameter("id"));
		arrMessage = new MessageDAO().findAll(id);
		for(Message m : arrMessage) {
			if(m.getId_expert() == 2){
				response.getWriter().write("<div class=\"incoming_msg\">\r\n"
						+ "              <div class=\"incoming_msg_img\"> <img src=\"https://ptetutorials.com/images/user-profile.png\" alt=\"sunil\"> </div>\r\n"
						+ "              <div class=\"received_msg\">\r\n"
						+ "                <div class=\"received_withd_msg\">\r\n"
						+ "                  <p>"+m.getMessage_sent()+"</p>\r\n"
						+ "                  <span class=\"time_date\">"+m.getMessage_time_sent()+"</span></div>\r\n"
						+ "              </div>\r\n"
						+ "            </div>");
			}else {
				response.getWriter().write("<div class=\"outgoing_msg\">\r\n"
						+ "              <div class=\"sent_msg\">\r\n"
						+ "                <p>"+m.getMessage_sent()+"</p>\r\n"
						+ "                <span class=\"time_date\">"+m.getMessage_time_sent()+"</span> </div>\r\n"
						+ "            </div>");
			}
		}
	}

}

package controllers.admins.message;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daos.MessageDAO;
import models.Account;
import models.Message;

public class ControllersAdminMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ControllersAdminMessage() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if((Account)session.getAttribute("expert") == null) {
			request.setAttribute("fullMessage", new MessageDAO().findAll(0));
		}else {
			Account a = (Account)session.getAttribute("expert");
		request.setAttribute("fullMessage", new MessageDAO().findAll(a.getAccount_id()));
		}
		request.setAttribute("checkStatus", new MessageDAO().checkStatus());
		request.getRequestDispatcher("/views/admin/message/index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");response.setContentType("text/html");response.setCharacterEncoding("UTF-8");
		ArrayList<Message> arrMessage = new ArrayList<Message>();
		PrintWriter print = response.getWriter();
		HttpSession session = request.getSession();
		Account admin = (Account)session.getAttribute("expert");
		Account account = (Account)session.getAttribute("expert");
		int id_user = 0;
		try {
			if(Integer.parseInt(request.getParameter("id")) != 0) {
				id_user = Integer.parseInt(request.getParameter("id"));
			}
		} catch (Exception e) {
			id_user = 0;
		}
		String name = request.getParameter("username");
		String message = request.getParameter("message");
		try {
		new MessageDAO().insertMessage(message, new SimpleDateFormat("yyyy/MM/dd hh:mm:ss a").format(new Timestamp(new Date().getTime())),name,id_user,2);
		}catch(Exception e) {}
		arrMessage = new MessageDAO().findAll(id_user);
		for(Message m : arrMessage) {
			if(m.getId_expert() == 2){
				print.write("<div class=\"incoming_msg\">\r\n"
						+ "              <div class=\"incoming_msg_img\"> <img src=\"https://ptetutorials.com/images/user-profile.png\" alt=\"sunil\"> </div>\r\n"
						+ "              <div class=\"received_msg\">\r\n"
						+ "                <div class=\"received_withd_msg\">\r\n"
						+ "                  <p>"+m.getMessage_sent()+"</p>\r\n"
						+ "                  <span class=\"time_date\">"+m.getMessage_time_sent()+"</span></div>\r\n"
						+ "              </div>\r\n"
						+ "            </div>");
			}else {
				print.write("<div class=\"outgoing_msg\">\r\n"
						+ "              <div class=\"sent_msg\">\r\n"
						+ "                <p>"+m.getMessage_sent()+"</p>\r\n"
						+ "                <span class=\"time_date\">"+m.getMessage_time_sent()+"</span> </div>\r\n"
						+ "            </div>");
			}
		}
	}
}

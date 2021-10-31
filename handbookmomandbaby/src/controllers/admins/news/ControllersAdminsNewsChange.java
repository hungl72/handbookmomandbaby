package controllers.admins.news;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.FavouriteDAO;
import daos.ListNewsDAO;
import models.Account;
import models.ListNews;
import utils.FileUtil;

@MultipartConfig
public class ControllersAdminsNewsChange extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ControllersAdminsNewsChange() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ListNewsDAO listNewsDAO = new ListNewsDAO();
		request.setAttribute("result", "0");
		int id = Integer.parseInt(request.getParameter("id"));
		request.setAttribute("listNewsById", listNewsDAO.listNewsById(id));
		request.getRequestDispatcher("/views/admin/listnewsmanagement/change.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");response.setCharacterEncoding("UTF-8");request.setCharacterEncoding("UTF-8");
		String listnews_image = FileUtil.upload("picture", request);
		int listnews_id = Integer.parseInt(request.getParameter("id"));
		ListNewsDAO listNewsDAO =  new ListNewsDAO();
		try {
			if("".equals(listnews_image)){
				ListNews listNews = listNewsDAO.listNewsById(listnews_id);
				listnews_image = listNews.getListnews_image();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		String listnews_name = request.getParameter("news");
		String person = request.getParameter("person");
		try {
			Date date = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("date"));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		String arr_menu_id = request.getParameter("menu_id");
		String [] arr_menu_id_split = arr_menu_id.split(",");
		int menu_id = Integer.parseInt(arr_menu_id_split[1]);
		String listnews_content = request.getParameter("content");
		if(listNewsDAO.updateNews(listnews_id, listnews_name, listnews_image, listnews_content, menu_id) > 0) {
			request.setAttribute("result", "1");
			int id = Integer.parseInt(request.getParameter("id"));
			request.setAttribute("listNewsById", listNewsDAO.listNewsById(id));
			request.getRequestDispatcher("/views/admin/listnewsmanagement/change.jsp").forward(request, response);
		}
	}

}

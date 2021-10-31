package controllers.admins.index;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.ListNewsDAO;
import daos.MenuDAO;
import utils.FileUtil;
@MultipartConfig
public class AdminIndexPosts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminIndexPosts() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");response.setContentType("text/html");response.setCharacterEncoding("UTF-8");
		MenuDAO menuDAO = new MenuDAO();
		String picture = FileUtil.upload("picture", request);System.out.println(picture);
		String title = request.getParameter("title");
		int menuSonId = Integer.parseInt(request.getParameter("menuSonId"));
		String content = request.getParameter("content");
		String uploader = "admin";
		String result = "";
		if(new ListNewsDAO().addPost(picture, title, uploader, content, menuSonId).equals("5")) {
			result = "5";
		}else {
			result = "6";
		}
		//request.setAttribute("result", result);
		request.setAttribute("listMenuParent", menuDAO.listMenuParent());
		request.setAttribute("listMenuSon", menuDAO.listMenuSon());
		response.sendRedirect(request.getContextPath()+"/adminindex?result="+result+"");
	}

}

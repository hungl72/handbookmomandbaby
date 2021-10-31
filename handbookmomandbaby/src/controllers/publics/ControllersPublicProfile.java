package controllers.publics;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.AccountDAO;
import utils.FileUtil;
import utils.StringUtil;
@MultipartConfig
public class ControllersPublicProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ControllersPublicProfile() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("profile", new AccountDAO().selectAccount(Integer.parseInt(request.getParameter("id"))));
		request.getRequestDispatcher("/views/public/profile.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");response.setContentType("text/html");response.setCharacterEncoding("UTF-8");
		AccountDAO accountDAO = new AccountDAO();
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String pass = request.getParameter("pass");
		if(StringUtil.md5(pass).equals(accountDAO.selectAccount(id).getAccount_pass())) {
			pass = accountDAO.selectAccount(id).getAccount_pass();
		}else if(pass.equals("") || pass == null){
			pass =  accountDAO.selectAccount(id).getAccount_pass();
		}else {
			pass = StringUtil.md5(pass);
		}
		String birthday = request.getParameter("birthday");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String image = FileUtil.upload("picture", request);
		if(image.equals("")) {
			image = accountDAO.selectAccount(id).getAccount_image();
		}
		if(accountDAO.updateAccount(id, name, accountDAO.selectAccount(id).getAccount_email(), pass, accountDAO.selectAccount(id).getAccount_date().toString(), address, phone,new SimpleDateFormat("yyyy-MM-dd").format(new Date().getTime()), image) > 0) {
			response.sendRedirect(request.getContextPath()+"/profile?id="+id+"&&update=updated");System.out.println("image :"+image);
		}else {
			response.sendRedirect(request.getContextPath()+"/profile?id="+id);
		}
	}

}

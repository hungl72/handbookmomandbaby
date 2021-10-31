package controllers.admins.product;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.ListNewsDAO;
import daos.MenuDAO;
import daos.ProductDAO;
import utils.FileUtil;
@MultipartConfig
public class ControllersAdminProductAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public ControllersAdminProductAdd() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("result", "0");
		request.getRequestDispatcher("/views/admin/productmanagement/add.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");response.setContentType("text/html");response.setCharacterEncoding("UTF-8");
		ProductDAO productDAO = new ProductDAO();
		String product_image = FileUtil.upload("picture", request);
		String product_name = request.getParameter("name");
		double product_price = Double.parseDouble(request.getParameter("money"));
		int category_id = Integer.parseInt(request.getParameter("category"));
		String product_introduce = request.getParameter("introduce");
		String product_description = request.getParameter("content");
		String result = "";
		if(productDAO.addProduct(product_name, product_introduce, product_description, product_image, product_price, category_id) > 0) {
			response.sendRedirect(request.getContextPath()+"/productindex?result=1");
		}else {
			response.sendRedirect(request.getContextPath()+"/productindex?result=0");
		}
		//request.setAttribute("result", result);
		//request.setAttribute("listMenuParent", menuDAO.listMenuParent());
		//request.setAttribute("listMenuSon", menuDAO.listMenuSon());
		//request.getRequestDispatcher("/views/admin/newsmanagement/newsmanagement.jsp").forward(request, response);
		
	}

}

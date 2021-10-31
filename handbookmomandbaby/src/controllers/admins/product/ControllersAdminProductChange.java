package controllers.admins.product;

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

import daos.ListNewsDAO;
import daos.ProductDAO;
import models.ListNews;
import models.Product;
import utils.FileUtil;
@MultipartConfig
public class ControllersAdminProductChange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ControllersAdminProductChange() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("result", "0");
		request.setAttribute("selectProduct", new ProductDAO().listProductById(Integer.parseInt(request.getParameter("id"))));
		request.getRequestDispatcher("/views/admin/productmanagement/change.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");response.setCharacterEncoding("UTF-8");request.setCharacterEncoding("UTF-8");
		String product_image = FileUtil.upload("picture", request);
		int product_id = Integer.parseInt(request.getParameter("id"));
		ProductDAO productDAO = new ProductDAO();
		try {
			if("".equals(product_image)){
				Product product = productDAO.listProductById(product_id);
				product_image = product.getProduct_image();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		String product_name = request.getParameter("product");
		String product_introduce = request.getParameter("introduce");
		String product_description = request.getParameter("description");
		double product_price = Double.parseDouble(request.getParameter("price"));
		String arr_menu_id = request.getParameter("menu_id");
		String [] arr_menu_id_split = arr_menu_id.split(",");
		int category_id = Integer.parseInt(arr_menu_id_split[1]);
		if(productDAO.updateProduct(product_id, product_name, product_introduce, product_description, product_image, product_price, category_id) > 0) {
			//request.setAttribute("result", "1");
			//int id = Integer.parseInt(request.getParameter("id"));
			//request.setAttribute("listNewsById", productDAO.listProductById(product_id));
			//request.getRequestDispatcher("/views/admin/listnewsmanagement/change.jsp").forward(request, response);
			response.sendRedirect(request.getContextPath()+"/productindex?result=3");
		}
	}

}

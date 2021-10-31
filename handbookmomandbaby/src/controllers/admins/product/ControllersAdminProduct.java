package controllers.admins.product;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.ProductDAO;

public class ControllersAdminProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ControllersAdminProduct() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("result", "0");
		ProductDAO productDAO = new ProductDAO();
		int currentPage = 1;
		int numberOfItem = 0;
		try {
			currentPage = Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			currentPage = 1;
		}
		numberOfItem = productDAO.listAllProduct().size();
		int numberOfPage = (int)Math.ceil((float)numberOfItem/3);
		if(currentPage > numberOfPage || currentPage < 1) {
			currentPage = 1;
		}
		int offset = (currentPage - 1) * 3;
		request.setAttribute("numberOfPage", numberOfPage);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("listProduct", productDAO.getItemPagination(offset));
		//request.setAttribute("listProduct", productDAO.listAllProduct());
		request.getRequestDispatcher("/views/admin/productmanagement/index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}

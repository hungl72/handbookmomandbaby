package controllers.publics;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.ProductDAO;

public class PublicControllersAjaxPlusMinus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PublicControllersAjaxPlusMinus() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductDAO productDAO = new ProductDAO();
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		productDAO.updatePlusProductById(product_id);
		response.getWriter().print(productDAO.getQuantityProductById(product_id));
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductDAO productDAO = new ProductDAO();
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		productDAO.updateMinusProductById(product_id);
		response.getWriter().print(productDAO.getQuantityProductById(product_id));
	}

}

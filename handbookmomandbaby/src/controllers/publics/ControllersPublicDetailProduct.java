package controllers.publics;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.ProductDAO;
import daos.StarDAO;

public class ControllersPublicDetailProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ControllersPublicDetailProduct() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		ProductDAO productDAO = new ProductDAO();
		productDAO.updateViews(product_id);
		request.setAttribute("selectValueFinal", new StarDAO().selectValueFinal(product_id));
		request.setAttribute("listProductById", productDAO.listProductById(product_id));
		request.getRequestDispatcher("/views/public/detailproduct.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}

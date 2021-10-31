package controllers.publics;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.ProductDAO;
import daos.StarDAO;

public class ControllersPublicProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ControllersPublicProduct() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductDAO productDAO = new ProductDAO();
		request.setAttribute("listAllProduct", productDAO.listAllProduct());
		request.setAttribute("listProductByCategoryId1", productDAO.listProductByCategoryId(1));
		request.setAttribute("listProductByCategoryId2", productDAO.listProductByCategoryId(2));
		request.setAttribute("listProductByCategoryId3", productDAO.listProductByCategoryId(3));
		request.setAttribute("selectValueFinal1", new StarDAO().selectValueFinal(1));
		request.setAttribute("selectValueFinal2", new StarDAO().selectValueFinal(2));
		request.setAttribute("selectValueFinal3", new StarDAO().selectValueFinal(3));
		request.getRequestDispatcher("/views/public/product.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}

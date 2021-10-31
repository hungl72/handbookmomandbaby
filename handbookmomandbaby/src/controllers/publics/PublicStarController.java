package controllers.publics;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.StarDAO;
import models.Product;
import models.Star;

public class PublicStarController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public PublicStarController() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");response.setContentType("text/html");response.setCharacterEncoding("UTF-8");
		StarDAO starDAO = new StarDAO();
		Star star = null;
		ArrayList<Product> listProductId = starDAO.listProductId();
		String valueStar = request.getParameter("value");
		String [] splitValue = valueStar.split(",");
		float value = Float.parseFloat(splitValue[0]);
		int product_id = Integer.parseInt(splitValue[1]);
		float tam =  value+(starDAO.selectTamCountFinal(product_id).getstar_temporary());
		int count = 1;
		for(Product productid : listProductId) {
			if(productid.getProduct_id() == product_id) {
				count = starDAO.countFinal(product_id);
			}
		}
		float result = tam/count++;
		//starDAO.insertStar(result);
		starDAO.insertTamCount(result,tam,count,product_id);
		response.getWriter().write("Cảm ơn bạn đã đánh giá!");

	}

}

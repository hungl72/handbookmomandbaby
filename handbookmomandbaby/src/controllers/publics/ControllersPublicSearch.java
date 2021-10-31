package controllers.publics;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.ListNewsDAO;
import daos.ProductDAO;

public class ControllersPublicSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ControllersPublicSearch() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");response.setContentType("text/html");response.setCharacterEncoding("UTF-8");
		String query = "";
		try {
			String product = request.getParameter("products");
			String news = request.getParameter("news");
			if(product.equals("query")) {
				 query = request.getParameter("search");
				 request.setAttribute("findListProduct", new ProductDAO().findListProduct(query));
				}else if(news.equals("query")){			
				 query = request.getParameter("search");
				 request.setAttribute("findListNews", new ListNewsDAO().findListNews(query));
				}
		} catch (Exception e) {
			query = request.getParameter("search");
			 request.setAttribute("findListNews", new ListNewsDAO().findListNews(query));
		}
		request.setAttribute("query", query);
		request.getRequestDispatcher("/views/public/search.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}

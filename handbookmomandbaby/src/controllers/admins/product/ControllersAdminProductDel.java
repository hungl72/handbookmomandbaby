package controllers.admins.product;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.ProductDAO;

public class ControllersAdminProductDel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ControllersAdminProductDel() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String result = "";
		if(new ProductDAO().delProduct(Integer.parseInt(request.getParameter("id"))) > 0) {
			result = "2";
		}else {
			result = "3";
		}
		request.setAttribute("result", result);
		response.sendRedirect(request.getContextPath()+"/productindex?result="+result+"");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}

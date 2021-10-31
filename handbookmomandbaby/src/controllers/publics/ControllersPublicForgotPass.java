package controllers.publics;

import java.io.IOException;
import java.math.BigInteger;
import java.net.ConnectException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.AccountDAO;

public class ControllersPublicForgotPass extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ControllersPublicForgotPass() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/public/forgotpassword.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		if(new AccountDAO().checkEmail(email)) {
		MessageDigest md;
        String result = "";
        String md5 = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss.SSS").format(new Date().getTime())+ Math.random();
        try {
            md = MessageDigest.getInstance("MD5");
            md.update(md5.getBytes());
            BigInteger bi = new BigInteger(1, md.digest());
            result = bi.toString(16);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        try {
        if(AutoMail.sendMail(email, "Chuoi bi mat reset mat khau cua ban  !", "Hay nhap day so bi mat nay vao form de tien hanh reset mat khau : " +result)) {
        new AccountDAO().updatePassResetByEmail(email, result);
        request.setAttribute("email", email);
        request.setAttribute("pass", result);
        request.getRequestDispatcher("/views/public/confirm.jsp").forward(request, response);
        }else {
        	response.sendRedirect(request.getContextPath()+"/forgotpass?error=blocked");
        }
        }catch(Exception e) {
        	e.printStackTrace();
        }
		}else {
			response.sendRedirect(request.getContextPath()+"/forgotpass?error=email");
		}
	}

}

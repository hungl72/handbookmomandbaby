package controllers.publics;

import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ControllersResetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ControllersResetPassword() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MessageDigest md;
        String result = "";
        String md5 = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss.SSS").format(new Date().getTime())+ Math.random();System.out.println("MD5 : " +md5);
        try {
            md = MessageDigest.getInstance("MD5");
            md.update(md5.getBytes());
            BigInteger bi = new BigInteger(1, md.digest());
            result = bi.toString(16);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        System.out.println("Convert MD5 : "+result); 
        AutoMail.sendMail("giahungnguyenhuu99@gmail.com", "Chuoi bi mat reset mat khau cua ban  : ", "Hay nhap day so bi mat nay vao form de tien hanh reset mat khau : " +result);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}

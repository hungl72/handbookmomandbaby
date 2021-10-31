package controllers.publics;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class AutoMail {
    public static boolean sendMail(String to,String subject,String text) {
    	String email = "",password = "";
         Properties pro = new Properties();
        pro.put("mail.smtp.auth", "true");
        pro.put("mail.smtp.starttls.enable", "true");
        pro.put("mail.smtp.host", "smtp.gmail.com");
        pro.put("mail.smtp.port", "587");
        Session session = Session.getInstance(pro, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication(){
                return new PasswordAuthentication(email, password);
            }
        });
        try {
            Message mess =new MimeMessage(session);
            mess.setHeader("Content-type", "text/plan;charset=UTF-8");
            mess.setFrom(new InternetAddress(email));
            mess.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            mess.setSubject(subject);
            mess.setText(text);
            Transport.send(mess);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
}

package vn.iotstar.util;

import java.util.Properties;
import jakarta.mail.*;
import jakarta.mail.internet.*;

public class SendMailUtil {
    private static final String EMAIL_FROM = "gpt05092006@gmail.com"; // đổi thành email của bạn
    private static final String APP_PASSWORD = "oygonuffkkmkdeul";  // App Password 16 ký tự

    public static boolean sendMail(String toEmail, String subject, String content) {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(EMAIL_FROM, APP_PASSWORD);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(EMAIL_FROM));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            message.setSubject(subject);
            message.setContent(content, "text/html; charset=UTF-8");
            Transport.send(message);
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static String generateOTP() {
        int otp = (int) (Math.random() * 900000) + 100000; // 6 chữ số
        return String.valueOf(otp);
    }
}
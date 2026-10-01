package vn.iotstar.utils;

import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailUtils {
    public static final String FROM_EMAIL = "phusy779@gmail.com";
    public static final String FROM_PASSWORD = "xyof spcd cbmy wcxl";

    public static boolean sendOtpEmail(String toEmail, String otpCode, String fullname) {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");

        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(FROM_EMAIL, FROM_PASSWORD.replace(" ", ""));
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(FROM_EMAIL, "Sneaker Store - Đinh Phú Sỹ (24162109)", "UTF-8"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            message.setSubject("Mã xác thực kích hoạt tài khoản Sneaker Store (Đề 05)");

            String content = "<h3>Xin chào " + (fullname != null ? fullname : "bạn") + ",</h3>"
                    + "<p>Bạn vừa đăng ký tài khoản tại <b>Cửa Hàng Giày Sneaker Online</b>.</p>"
                    + "<p>Mã OTP kích hoạt tài khoản của bạn là: <b style='font-size: 24px; color: #dc3545; letter-spacing: 4px;'>" + otpCode + "</b></p>"
                    + "<p>Mã này có hiệu lực trong 5 phút. Vui lòng không chia sẻ mã này cho bất kỳ ai.</p>"
                    + "<hr><p><i>Sinh viên thực hiện: Đinh Phú Sỹ - MSSV: 24162109 - Mã đề: 05</i></p>";

            message.setContent(content, "text/html; charset=UTF-8");
            Transport.send(message);
            System.out.println(">>> [EmailUtils] Sent OTP email successfully to: " + toEmail + " | Code: " + otpCode);
            return true;
        } catch (Exception e) {
            System.err.println(">>> [EmailUtils] Failed to send email: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
}

package vn.iotstar.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vn.iotstar.service.IUserService;
import vn.iotstar.service.impl.UserServiceImpl;

@WebServlet(urlPatterns = {"/verify-otp", "/xac-thuc-otp"})
public class VerifyOtpController_24162109 extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private IUserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String msg = req.getParameter("msg");
        String errorParam = req.getParameter("error");
        String action = req.getParameter("action");

        if (email != null) {
            email = email.trim();
            req.setAttribute("email", email);
        }

        // Xử lý gửi lại mã OTP (Resend)
        if ("resend".equalsIgnoreCase(action)) {
            if (email != null && !email.isEmpty()) {
                boolean sent = userService.resendOtp(email);
                if (sent) {
                    req.setAttribute("message", "Mã OTP mới đã được gửi lại vào email của bạn (" + email + ")!");
                } else {
                    req.setAttribute("error", "Không tìm thấy tài khoản với email này để gửi lại mã OTP!");
                }
            } else {
                req.setAttribute("error", "Vui lòng cung cấp địa chỉ email để gửi lại mã OTP!");
            }
        } else if ("sent".equalsIgnoreCase(msg)) {
            req.setAttribute("message", "Mã xác thực OTP đã được gửi đến email của bạn! Vui lòng kiểm tra hộp thư đến (hoặc hòm thư Spam/Rác).");
        } else if ("not_activated".equalsIgnoreCase(errorParam)) {
            req.setAttribute("error", "Tài khoản của bạn chưa kích hoạt. Vui lòng nhập mã OTP để hoàn tất kích hoạt!");
        }

        req.getRequestDispatcher("/WEB-INF/views/auth/verify_otp_24162109.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String otp = req.getParameter("otp");

        if (email != null) {
            email = email.trim();
            req.setAttribute("email", email);
        }

        if (email == null || email.isEmpty() || otp == null || otp.trim().isEmpty()) {
            req.setAttribute("error", "Vui lòng nhập đầy đủ Email và Mã OTP 6 chữ số!");
            req.getRequestDispatcher("/WEB-INF/views/auth/verify_otp_24162109.jsp").forward(req, resp);
            return;
        }

        otp = otp.trim();

        boolean isSuccess = userService.activateAccount(email, otp);
        if (isSuccess) {
            // Kích hoạt thành công -> Chuyển về trang đăng nhập kèm thông báo
            resp.sendRedirect(req.getContextPath() + "/login?msg=activated");
        } else {
            req.setAttribute("error", "Mã OTP không chính xác hoặc tài khoản đã được kích hoạt trước đó! Vui lòng kiểm tra lại hoặc bấm 'Gửi lại mã OTP'.");
            req.getRequestDispatcher("/WEB-INF/views/auth/verify_otp_24162109.jsp").forward(req, resp);
        }
    }
}

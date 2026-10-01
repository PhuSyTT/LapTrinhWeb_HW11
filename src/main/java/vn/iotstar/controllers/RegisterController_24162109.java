package vn.iotstar.controllers;

import java.io.IOException;
import java.net.URLEncoder;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vn.iotstar.service.IUserService;
import vn.iotstar.service.impl.UserServiceImpl;

@WebServlet(urlPatterns = {"/register", "/dang-ky"})
public class RegisterController_24162109 extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private IUserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/auth/register_24162109.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String fullname = req.getParameter("fullname");
        String password = req.getParameter("password");
        String repassword = req.getParameter("repassword");
        String phone = req.getParameter("phone");

        // Giữ lại giá trị người dùng đã nhập
        req.setAttribute("username", username);
        req.setAttribute("email", email);
        req.setAttribute("fullname", fullname);
        req.setAttribute("phone", phone);

        // 1. Kiểm tra rỗng
        if (username == null || username.trim().isEmpty() ||
            email == null || email.trim().isEmpty() ||
            fullname == null || fullname.trim().isEmpty() ||
            password == null || password.trim().isEmpty()) {
            req.setAttribute("error", "Vui lòng điền đầy đủ các thông tin bắt buộc!");
            req.getRequestDispatcher("/WEB-INF/views/auth/register_24162109.jsp").forward(req, resp);
            return;
        }

        username = username.trim();
        email = email.trim();
        fullname = fullname.trim();
        password = password.trim();

        // 2. Kiểm tra mật khẩu khớp nhau
        if (repassword != null && !password.equals(repassword.trim())) {
            req.setAttribute("error", "Mật khẩu xác nhận không trùng khớp!");
            req.getRequestDispatcher("/WEB-INF/views/auth/register_24162109.jsp").forward(req, resp);
            return;
        }

        // 3. Kiểm tra trùng Username
        if (userService.checkExistUsername(username)) {
            req.setAttribute("error", "Tên đăng nhập '" + username + "' đã được sử dụng! Vui lòng chọn tên khác.");
            req.getRequestDispatcher("/WEB-INF/views/auth/register_24162109.jsp").forward(req, resp);
            return;
        }

        // 4. Kiểm tra trùng Email
        if (userService.checkExistEmail(email)) {
            req.setAttribute("error", "Email '" + email + "' đã tồn tại trong hệ thống! Vui lòng dùng email khác.");
            req.getRequestDispatcher("/WEB-INF/views/auth/register_24162109.jsp").forward(req, resp);
            return;
        }

        // 5. Thực hiện đăng ký tài khoản và gửi mã OTP qua Gmail
        boolean isSuccess = userService.register(username, email, fullname, password, phone);
        if (isSuccess) {
            String encodedEmail = URLEncoder.encode(email, "UTF-8");
            resp.sendRedirect(req.getContextPath() + "/verify-otp?email=" + encodedEmail + "&msg=sent");
        } else {
            req.setAttribute("error", "Đăng ký thất bại! Vui lòng thử lại sau.");
            req.getRequestDispatcher("/WEB-INF/views/auth/register_24162109.jsp").forward(req, resp);
        }
    }
}

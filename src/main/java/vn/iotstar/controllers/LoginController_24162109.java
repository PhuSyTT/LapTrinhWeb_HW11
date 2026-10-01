package vn.iotstar.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vn.iotstar.entity.User;
import vn.iotstar.service.IUserService;
import vn.iotstar.service.impl.UserServiceImpl;

@WebServlet(urlPatterns = {"/login", "/dang-nhap"})
public class LoginController_24162109 extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private IUserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session != null && session.getAttribute("account") != null) {
            User user = (User) session.getAttribute("account");
            redirectByRole(user, req, resp);
            return;
        }

        String msg = req.getParameter("msg");
        if ("registered".equals(msg)) {
            req.setAttribute("message", "Đăng ký thành công! Vui lòng kiểm tra mã OTP gửi về Email để kích hoạt tài khoản.");
        } else if ("activated".equals(msg)) {
            req.setAttribute("message", "Tài khoản của bạn đã được kích hoạt thành công! Hãy đăng nhập ngay.");
        } else if ("logged_out".equals(msg)) {
            req.setAttribute("message", "Bạn đã đăng xuất thành công khỏi hệ thống.");
        }

        req.getRequestDispatcher("/WEB-INF/views/auth/login_24162109.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String usernameOrEmail = req.getParameter("username");
        String password = req.getParameter("password");

        if (usernameOrEmail == null || usernameOrEmail.trim().isEmpty() ||
            password == null || password.trim().isEmpty()) {
            req.setAttribute("error", "Vui lòng nhập đầy đủ Tên đăng nhập và Mật khẩu!");
            req.getRequestDispatcher("/WEB-INF/views/auth/login_24162109.jsp").forward(req, resp);
            return;
        }

        usernameOrEmail = usernameOrEmail.trim();
        password = password.trim();

        User user = userService.findByUsername(usernameOrEmail);
        if (user == null) {
            user = userService.findByEmail(usernameOrEmail);
        }

        if (user == null || !password.equals(user.getPassword())) {
            req.setAttribute("error", "Tài khoản hoặc mật khẩu không chính xác!");
            req.setAttribute("username", usernameOrEmail);
            req.getRequestDispatcher("/WEB-INF/views/auth/login_24162109.jsp").forward(req, resp);
            return;
        }

        // Kiểm tra tài khoản đã kích hoạt OTP chưa (0: Chưa kích hoạt, 1: Đã kích hoạt)
        if (user.getStatus() != null && user.getStatus() == 0) {
            resp.sendRedirect(req.getContextPath() + "/verify-otp?email=" + user.getEmail() + "&error=not_activated");
            return;
        }

        // Đăng nhập thành công -> Lưu vào Session
        HttpSession session = req.getSession(true);
        session.setAttribute("account", user);
        session.setAttribute("username", user.getUsername());

        // Điều hướng theo vai trò (User / Seller / Admin)
        redirectByRole(user, req, resp);
    }

    private void redirectByRole(User user, HttpServletRequest req, HttpServletResponse resp) throws IOException {
        if (user.getRole() != null) {
            int roleId = user.getRole().getRoleId();
            String roleName = user.getRole().getRoleName();

            if (roleId == 2 || "SELLER".equalsIgnoreCase(roleName) || user.getSeller() != null) {
                // Seller -> Vào trang chủ Seller
                resp.sendRedirect(req.getContextPath() + "/seller/home");
                return;
            } else if (roleId == 1 || "ADMIN".equalsIgnoreCase(roleName)) {
                // Admin -> Vào trang quản trị Admin
                resp.sendRedirect(req.getContextPath() + "/admin/home");
                return;
            }
        }
        // User mặc định -> Vào trang chủ User
        resp.sendRedirect(req.getContextPath() + "/home");
    }
}

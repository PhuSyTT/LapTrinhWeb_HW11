package vn.iotstar.controllers;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.Map;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vn.iotstar.data.MockDataStore;
import vn.iotstar.entity.User;
import vn.iotstar.model.CartItemModel;
import vn.iotstar.model.OrderModel;

@WebServlet(urlPatterns = {"/checkout"})
public class CheckoutController_24162109 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        @SuppressWarnings("unchecked")
        Map<Integer, CartItemModel> cart = (Map<Integer, CartItemModel>) session.getAttribute("cart");

        if (cart == null || cart.isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/cart");
            return;
        }

        double totalAmount = 0.0;
        int totalItems = 0;
        for (CartItemModel item : cart.values()) {
            totalAmount += item.getTotalPrice();
            totalItems += item.getQuantity();
        }

        User account = (User) session.getAttribute("account");

        req.setAttribute("cartItems", cart.values());
        req.setAttribute("totalAmount", totalAmount);
        req.setAttribute("totalItems", totalItems);
        req.setAttribute("account", account);

        req.getRequestDispatcher("/WEB-INF/views/web/checkout_24162109.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        HttpSession session = req.getSession();
        @SuppressWarnings("unchecked")
        Map<Integer, CartItemModel> cart = (Map<Integer, CartItemModel>) session.getAttribute("cart");

        if (cart == null || cart.isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/cart");
            return;
        }

        String fullname = req.getParameter("fullname");
        String phone = req.getParameter("phone");
        String email = req.getParameter("email");
        String address = req.getParameter("address");
        String note = req.getParameter("note");

        // Validation
        if (fullname == null || fullname.trim().isEmpty() ||
            phone == null || phone.trim().isEmpty() ||
            address == null || address.trim().isEmpty()) {
            
            double totalAmount = 0.0;
            int totalItems = 0;
            for (CartItemModel item : cart.values()) {
                totalAmount += item.getTotalPrice();
                totalItems += item.getQuantity();
            }
            req.setAttribute("cartItems", cart.values());
            req.setAttribute("totalAmount", totalAmount);
            req.setAttribute("totalItems", totalItems);
            req.setAttribute("error", "Vui lòng điền đầy đủ Họ tên, Số điện thoại và Địa chỉ nhận hàng!");
            req.setAttribute("fullname", fullname);
            req.setAttribute("phone", phone);
            req.setAttribute("email", email);
            req.setAttribute("address", address);
            req.setAttribute("note", note);
            req.getRequestDispatcher("/WEB-INF/views/web/checkout_24162109.jsp").forward(req, resp);
            return;
        }

        // Build Order
        OrderModel order = new OrderModel();
        String orderId = "AK" + (100000 + new Random().nextInt(900000));
        order.setOrderId(orderId);
        order.setCustomerName(fullname.trim());
        order.setPhone(phone.trim());
        order.setEmail(email != null ? email.trim() : "");
        order.setAddress(address.trim());
        order.setNote(note != null ? note.trim() : "");
        order.setPaymentMethod("COD (Thanh toán khi nhận hàng)");

        double totalAmount = 0.0;
        for (CartItemModel item : cart.values()) {
            order.getItems().add(new CartItemModel(item.getProduct(), item.getQuantity()));
            totalAmount += item.getTotalPrice();

            // Giảm tồn kho tương ứng
            if (item.getProduct() != null) {
                MockDataStore.reduceStock(item.getProduct().getProductId(), item.getQuantity());
            }
        }
        order.setTotalAmount(totalAmount);

        // Lưu đơn hàng vào hệ thống
        MockDataStore.saveOrder(order);

        // Dọn sạch giỏ hàng sau khi đặt thành công
        session.removeAttribute("cart");
        session.setAttribute("cartCount", 0);
        session.setAttribute("lastOrder", order);

        resp.sendRedirect(req.getContextPath() + "/order-success?orderId=" + URLEncoder.encode(orderId, "UTF-8"));
    }
}

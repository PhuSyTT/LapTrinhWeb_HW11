package vn.iotstar.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vn.iotstar.data.MockDataStore;
import vn.iotstar.model.OrderModel;

@WebServlet(urlPatterns = {"/order-success"})
public class OrderSuccessController_24162109 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String orderId = req.getParameter("orderId");
        OrderModel order = null;

        if (orderId != null && !orderId.trim().isEmpty()) {
            order = MockDataStore.findOrderById(orderId);
        }

        if (order == null) {
            HttpSession session = req.getSession();
            order = (OrderModel) session.getAttribute("lastOrder");
        }

        if (order == null) {
            resp.sendRedirect(req.getContextPath() + "/home");
            return;
        }

        req.setAttribute("order", order);
        req.getRequestDispatcher("/WEB-INF/views/web/order_success_24162109.jsp").forward(req, resp);
    }
}

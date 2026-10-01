package vn.iotstar.controllers;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vn.iotstar.entity.Product;
import vn.iotstar.model.CartItemModel;
import vn.iotstar.service.IProductService;
import vn.iotstar.service.impl.ProductServiceImpl;

@WebServlet(urlPatterns = {
    "/cart",
    "/cart/add",
    "/cart/update",
    "/cart/delete",
    "/cart/clear"
})
public class CartController_24162109 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private IProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uri = req.getRequestURI();
        if (uri.endsWith("/cart/delete")) {
            handleDeleteItem(req, resp);
        } else if (uri.endsWith("/cart/clear")) {
            handleClearCart(req, resp);
        } else if (uri.endsWith("/cart/add")) {
            // GET /cart/add?productId=...&quantity=...
            handleAddToCart(req, resp);
        } else if (uri.endsWith("/cart/update")) {
            handleUpdateQuantity(req, resp);
        } else {
            showCartPage(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String uri = req.getRequestURI();
        if (uri.endsWith("/cart/add")) {
            handleAddToCart(req, resp);
        } else if (uri.endsWith("/cart/update")) {
            handleUpdateQuantity(req, resp);
        } else {
            showCartPage(req, resp);
        }
    }

    private void showCartPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        @SuppressWarnings("unchecked")
        Map<Integer, CartItemModel> cart = (Map<Integer, CartItemModel>) session.getAttribute("cart");

        double totalAmount = 0.0;
        int totalItems = 0;

        if (cart != null && !cart.isEmpty()) {
            for (CartItemModel item : cart.values()) {
                totalAmount += item.getTotalPrice();
                totalItems += item.getQuantity();
            }
            req.setAttribute("cartItems", cart.values());
        }

        req.setAttribute("totalAmount", totalAmount);
        req.setAttribute("totalItems", totalItems);
        session.setAttribute("cartCount", totalItems);

        req.getRequestDispatcher("/WEB-INF/views/web/cart_24162109.jsp").forward(req, resp);
    }

    private void handleAddToCart(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession();
        @SuppressWarnings("unchecked")
        Map<Integer, CartItemModel> cart = (Map<Integer, CartItemModel>) session.getAttribute("cart");
        if (cart == null) {
            cart = new HashMap<>();
        }

        try {
            int productId = Integer.parseInt(req.getParameter("productId"));
            int quantity = 1;
            String qtyParam = req.getParameter("quantity");
            if (qtyParam != null && !qtyParam.trim().isEmpty()) {
                quantity = Math.max(1, Integer.parseInt(qtyParam));
            }

            Product product = productService.findById(productId);
            if (product != null) {
                int maxStock = product.getAmount() > 0 ? product.getAmount() : 99;
                
                if (cart.containsKey(productId)) {
                    CartItemModel existing = cart.get(productId);
                    int newQty = existing.getQuantity() + quantity;
                    if (newQty > maxStock) {
                        newQty = maxStock;
                        session.setAttribute("cartWarning", "Số lượng trong giỏ của \"" + product.getProductName() + "\" đã đạt mức tồn kho tối đa (" + maxStock + ").");
                    }
                    existing.setQuantity(newQty);
                } else {
                    if (quantity > maxStock) {
                        quantity = maxStock;
                        session.setAttribute("cartWarning", "Số lượng yêu cầu vượt quá tồn kho. Đã tự động điều chỉnh về tối đa (" + maxStock + ").");
                    }
                    cart.put(productId, new CartItemModel(product, quantity));
                }

                session.setAttribute("cart", cart);

                // Update cart badge count
                int totalItems = 0;
                for (CartItemModel item : cart.values()) {
                    totalItems += item.getQuantity();
                }
                session.setAttribute("cartCount", totalItems);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Check if user clicked "Mua Ngay (COD)"
        String buyNow = req.getParameter("buyNow");
        if ("true".equalsIgnoreCase(buyNow)) {
            resp.sendRedirect(req.getContextPath() + "/checkout");
        } else {
            resp.sendRedirect(req.getContextPath() + "/cart");
        }
    }

    private void handleUpdateQuantity(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession();
        @SuppressWarnings("unchecked")
        Map<Integer, CartItemModel> cart = (Map<Integer, CartItemModel>) session.getAttribute("cart");

        if (cart != null) {
            try {
                int productId = Integer.parseInt(req.getParameter("productId"));
                int quantity = Integer.parseInt(req.getParameter("quantity"));

                if (cart.containsKey(productId)) {
                    if (quantity <= 0) {
                        cart.remove(productId);
                    } else {
                        CartItemModel item = cart.get(productId);
                        int maxStock = item.getProduct() != null && item.getProduct().getAmount() > 0 ? item.getProduct().getAmount() : 99;
                        if (quantity > maxStock) {
                            quantity = maxStock;
                            session.setAttribute("cartWarning", "Đã giới hạn số lượng theo tồn kho khả dụng (" + maxStock + ").");
                        }
                        item.setQuantity(quantity);
                    }
                }

                session.setAttribute("cart", cart);

                int totalItems = 0;
                for (CartItemModel item : cart.values()) {
                    totalItems += item.getQuantity();
                }
                session.setAttribute("cartCount", totalItems);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        resp.sendRedirect(req.getContextPath() + "/cart");
    }

    private void handleDeleteItem(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession();
        @SuppressWarnings("unchecked")
        Map<Integer, CartItemModel> cart = (Map<Integer, CartItemModel>) session.getAttribute("cart");

        if (cart != null) {
            try {
                int productId = Integer.parseInt(req.getParameter("productId"));
                cart.remove(productId);
                session.setAttribute("cart", cart);

                int totalItems = 0;
                for (CartItemModel item : cart.values()) {
                    totalItems += item.getQuantity();
                }
                session.setAttribute("cartCount", totalItems);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        resp.sendRedirect(req.getContextPath() + "/cart");
    }

    private void handleClearCart(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession();
        session.removeAttribute("cart");
        session.setAttribute("cartCount", 0);
        resp.sendRedirect(req.getContextPath() + "/cart");
    }
}

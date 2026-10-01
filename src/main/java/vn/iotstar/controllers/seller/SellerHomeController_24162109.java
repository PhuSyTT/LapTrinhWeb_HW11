package vn.iotstar.controllers.seller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vn.iotstar.entity.Product;
import vn.iotstar.entity.Seller;
import vn.iotstar.entity.User;
import vn.iotstar.service.IProductService;
import vn.iotstar.service.ISellerService;
import vn.iotstar.service.impl.ProductServiceImpl;
import vn.iotstar.service.impl.SellerServiceImpl;

@WebServlet(urlPatterns = {"/seller/home", "/seller"})
public class SellerHomeController_24162109 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private IProductService productService = new ProductServiceImpl();
    private ISellerService sellerService = new SellerServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("account") == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        User user = (User) session.getAttribute("account");
        // Kiểm tra quyền Seller hoặc Admin
        boolean isSeller = (user.getRole() != null && (user.getRole().getRoleId() == 2 || "SELLER".equalsIgnoreCase(user.getRole().getRoleName())))
                        || user.getSeller() != null;
        boolean isAdmin = user.getRole() != null && (user.getRole().getRoleId() == 1 || "ADMIN".equalsIgnoreCase(user.getRole().getRoleName()));

        if (!isSeller && !isAdmin) {
            resp.sendRedirect(req.getContextPath() + "/home");
            return;
        }

        // Xác định thông tin Seller
        int sellerId = 1;
        Seller seller = user.getSeller();
        if (seller != null) {
            sellerId = seller.getSellerId();
        } else {
            Seller found = sellerService.findById(1);
            if (found != null) {
                seller = found;
                sellerId = found.getSellerId();
            }
        }

        List<Product> sellerProducts = productService.findBySellerId(sellerId);
        int totalProducts = (sellerProducts != null) ? sellerProducts.size() : 0;
        int totalStock = 0;
        if (sellerProducts != null) {
            for (Product p : sellerProducts) {
                if (p.getAmount() != null) {
                    totalStock += p.getAmount();
                }
            }
        }

        req.setAttribute("seller", seller);
        req.setAttribute("sellerId", sellerId);
        req.setAttribute("sellerProducts", sellerProducts);
        req.setAttribute("totalProducts", totalProducts);
        req.setAttribute("totalStock", totalStock);

        req.getRequestDispatcher("/WEB-INF/views/seller/home_24162109.jsp").forward(req, resp);
    }
}

package vn.iotstar.controllers;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vn.iotstar.entity.Product;
import vn.iotstar.entity.Seller;
import vn.iotstar.service.IProductService;
import vn.iotstar.service.impl.ProductServiceImpl;

@WebServlet(urlPatterns = {"/products", "/san-pham", "/products-by-seller"})
public class ProductListController_24162109 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private IProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Lấy tất cả sản phẩm gom nhóm theo từng Seller (Mã cửa hàng - SellerID)
        Map<Seller, List<Product>> productsBySeller = productService.findAllGroupedBySeller();

        int totalCount = 0;
        if (productsBySeller != null) {
            for (List<Product> list : productsBySeller.values()) {
                if (list != null) {
                    totalCount += list.size();
                }
            }
        }

        req.setAttribute("productsBySeller", productsBySeller);
        req.setAttribute("totalCount", totalCount);

        req.getRequestDispatcher("/WEB-INF/views/web/products_by_seller_24162109.jsp").forward(req, resp);
    }
}

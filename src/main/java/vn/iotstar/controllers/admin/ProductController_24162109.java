package vn.iotstar.controllers.admin;

import java.io.IOException;
import java.sql.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vn.iotstar.entity.Category;
import vn.iotstar.entity.Product;
import vn.iotstar.entity.Seller;
import vn.iotstar.entity.User;
import vn.iotstar.service.ICategoryService;
import vn.iotstar.service.IProductService;
import vn.iotstar.service.ISellerService;
import vn.iotstar.service.impl.CategoryServiceImpl;
import vn.iotstar.service.impl.ProductServiceImpl;
import vn.iotstar.service.impl.SellerServiceImpl;

@WebServlet(urlPatterns = {
    "/admin/product/list",
    "/admin/product/add",
    "/admin/product/edit",
    "/admin/product/delete"
})
public class ProductController_24162109 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private IProductService productService = new ProductServiceImpl();
    private ICategoryService categoryService = new CategoryServiceImpl();
    private ISellerService sellerService = new SellerServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        if (!checkAdminAuth(req, resp)) return;

        String path = req.getServletPath();

        if (path.endsWith("/add")) {
            showAddForm(req, resp);
        } else if (path.endsWith("/edit")) {
            showEditForm(req, resp);
        } else if (path.endsWith("/delete")) {
            deleteProduct(req, resp);
        } else {
            listProducts(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        if (!checkAdminAuth(req, resp)) return;

        String path = req.getServletPath();

        if (path.endsWith("/add")) {
            saveAddProduct(req, resp);
        } else if (path.endsWith("/edit")) {
            saveEditProduct(req, resp);
        } else if (path.endsWith("/delete")) {
            deleteProduct(req, resp);
        } else {
            listProducts(req, resp);
        }
    }

    private boolean checkAdminAuth(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("account") == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return false;
        }
        User user = (User) session.getAttribute("account");
        boolean isAdmin = user.getRole() != null && (user.getRole().getRoleId() == 1 || "ADMIN".equalsIgnoreCase(user.getRole().getRoleName()));
        if (!isAdmin) {
            resp.sendRedirect(req.getContextPath() + "/home");
            return false;
        }
        return true;
    }

    private void listProducts(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String keyword = req.getParameter("keyword");
        int page = 1;
        int pageSize = 5; // Phân trang 5 sản phẩm / trang

        try {
            String pageStr = req.getParameter("page");
            if (pageStr != null && !pageStr.isEmpty()) {
                page = Integer.parseInt(pageStr);
                if (page < 1) page = 1;
            }
        } catch (NumberFormatException e) {
            page = 1;
        }

        List<Product> products;
        long totalItems;

        if (keyword != null && !keyword.trim().isEmpty()) {
            keyword = keyword.trim();
            products = productService.searchByName(keyword, page, pageSize);
            totalItems = productService.countByKeyword(keyword);
            req.setAttribute("keyword", keyword);
        } else {
            products = productService.findAll(page, pageSize);
            totalItems = productService.count();
        }

        int totalPages = (int) Math.ceil((double) totalItems / pageSize);
        if (totalPages < 1) totalPages = 1;

        req.setAttribute("products", products);
        req.setAttribute("currentPage", page);
        req.setAttribute("totalPages", totalPages);
        req.setAttribute("totalItems", totalItems);

        String msg = req.getParameter("msg");
        if ("added".equals(msg)) req.setAttribute("message", "Thêm sản phẩm giày mới thành công!");
        else if ("updated".equals(msg)) req.setAttribute("message", "Cập nhật thông tin sản phẩm thành công!");
        else if ("deleted".equals(msg)) req.setAttribute("message", "Xóa sản phẩm thành công!");

        req.getRequestDispatcher("/WEB-INF/views/admin/product/product_list_24162109.jsp").forward(req, resp);
    }

    private void showAddForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("categories", categoryService.findAll());
        req.setAttribute("sellers", sellerService.findAll());
        req.setAttribute("isEdit", false);
        req.getRequestDispatcher("/WEB-INF/views/admin/product/product_form_24162109.jsp").forward(req, resp);
    }

    private void showEditForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStr = req.getParameter("id");
        if (idStr == null || idStr.isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/admin/product/list");
            return;
        }

        try {
            int id = Integer.parseInt(idStr);
            Product product = productService.findById(id);
            if (product == null) {
                resp.sendRedirect(req.getContextPath() + "/admin/product/list");
                return;
            }
            req.setAttribute("product", product);
            req.setAttribute("categories", categoryService.findAll());
            req.setAttribute("sellers", sellerService.findAll());
            req.setAttribute("isEdit", true);
            req.getRequestDispatcher("/WEB-INF/views/admin/product/product_form_24162109.jsp").forward(req, resp);
        } catch (NumberFormatException e) {
            resp.sendRedirect(req.getContextPath() + "/admin/product/list");
        }
    }

    private void saveAddProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productName = req.getParameter("productName");
        String productCodeStr = req.getParameter("productCode");
        String categoryIdStr = req.getParameter("categoryId");
        String sellerIdStr = req.getParameter("sellerId");
        String priceStr = req.getParameter("price");
        String amountStr = req.getParameter("amount");
        String stockStr = req.getParameter("stock");
        String images = req.getParameter("images");
        String description = req.getParameter("description");
        String statusStr = req.getParameter("status");

        if (productName == null || productName.trim().isEmpty() || priceStr == null || priceStr.trim().isEmpty()) {
            req.setAttribute("error", "Tên sản phẩm và Giá bán không được để trống!");
            req.setAttribute("categories", categoryService.findAll());
            req.setAttribute("sellers", sellerService.findAll());
            req.setAttribute("isEdit", false);
            req.getRequestDispatcher("/WEB-INF/views/admin/product/product_form_24162109.jsp").forward(req, resp);
            return;
        }

        Product product = new Product();
        product.setProductName(productName.trim());
        if (productCodeStr != null && !productCodeStr.trim().isEmpty()) {
            product.setProductCode(Long.parseLong(productCodeStr.trim()));
        } else {
            product.setProductCode(System.currentTimeMillis() % 10000);
        }

        if (categoryIdStr != null && !categoryIdStr.trim().isEmpty()) {
            Category category = categoryService.findById(Integer.parseInt(categoryIdStr));
            product.setCategory(category);
        }

        if (sellerIdStr != null && !sellerIdStr.trim().isEmpty()) {
            Seller seller = sellerService.findById(Integer.parseInt(sellerIdStr));
            product.setSeller(seller);
        }

        product.setPrice(Double.parseDouble(priceStr.trim()));
        product.setAmount(amountStr != null && !amountStr.trim().isEmpty() ? Integer.parseInt(amountStr.trim()) : 10);
        product.setStock(stockStr != null && !stockStr.trim().isEmpty() ? Integer.parseInt(stockStr.trim()) : 50);
        product.setImages(images != null && !images.trim().isEmpty() ? images.trim() : "https://images.unsplash.com/photo-1552346154-21d32810aba3?w=600");
        product.setDescription(description != null ? description.trim() : "");
        product.setStatus(statusStr != null ? Integer.parseInt(statusStr) : 1);
        product.setWishlist(0);
        product.setCreateDate(new Date(System.currentTimeMillis()));

        productService.insert(product);
        resp.sendRedirect(req.getContextPath() + "/admin/product/list?msg=added");
    }

    private void saveEditProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStr = req.getParameter("productId");
        String productName = req.getParameter("productName");
        String productCodeStr = req.getParameter("productCode");
        String categoryIdStr = req.getParameter("categoryId");
        String sellerIdStr = req.getParameter("sellerId");
        String priceStr = req.getParameter("price");
        String amountStr = req.getParameter("amount");
        String stockStr = req.getParameter("stock");
        String images = req.getParameter("images");
        String description = req.getParameter("description");
        String statusStr = req.getParameter("status");

        if (idStr == null || productName == null || productName.trim().isEmpty()) {
            req.setAttribute("error", "Vui lòng nhập đầy đủ thông tin sản phẩm!");
            req.setAttribute("categories", categoryService.findAll());
            req.setAttribute("sellers", sellerService.findAll());
            req.setAttribute("isEdit", true);
            req.getRequestDispatcher("/WEB-INF/views/admin/product/product_form_24162109.jsp").forward(req, resp);
            return;
        }

        try {
            int id = Integer.parseInt(idStr);
            Product product = productService.findById(id);
            if (product != null) {
                product.setProductName(productName.trim());
                if (productCodeStr != null && !productCodeStr.trim().isEmpty()) {
                    product.setProductCode(Long.parseLong(productCodeStr.trim()));
                }
                if (categoryIdStr != null && !categoryIdStr.trim().isEmpty()) {
                    Category category = categoryService.findById(Integer.parseInt(categoryIdStr));
                    product.setCategory(category);
                }
                if (sellerIdStr != null && !sellerIdStr.trim().isEmpty()) {
                    Seller seller = sellerService.findById(Integer.parseInt(sellerIdStr));
                    product.setSeller(seller);
                }
                if (priceStr != null && !priceStr.trim().isEmpty()) {
                    product.setPrice(Double.parseDouble(priceStr.trim()));
                }
                if (amountStr != null && !amountStr.trim().isEmpty()) {
                    product.setAmount(Integer.parseInt(amountStr.trim()));
                }
                if (stockStr != null && !stockStr.trim().isEmpty()) {
                    product.setStock(Integer.parseInt(stockStr.trim()));
                }
                if (images != null && !images.trim().isEmpty()) {
                    product.setImages(images.trim());
                }
                product.setDescription(description != null ? description.trim() : "");
                product.setStatus(statusStr != null ? Integer.parseInt(statusStr) : 1);

                productService.update(product);
            }
            resp.sendRedirect(req.getContextPath() + "/admin/product/list?msg=updated");
        } catch (Exception e) {
            req.setAttribute("error", "Lỗi khi cập nhật sản phẩm: " + e.getMessage());
            req.setAttribute("categories", categoryService.findAll());
            req.setAttribute("sellers", sellerService.findAll());
            req.setAttribute("isEdit", true);
            req.getRequestDispatcher("/WEB-INF/views/admin/product/product_form_24162109.jsp").forward(req, resp);
        }
    }

    private void deleteProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String idStr = req.getParameter("id");
        if (idStr != null && !idStr.isEmpty()) {
            try {
                int id = Integer.parseInt(idStr);
                productService.delete(id);
                resp.sendRedirect(req.getContextPath() + "/admin/product/list?msg=deleted");
                return;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        resp.sendRedirect(req.getContextPath() + "/admin/product/list");
    }
}

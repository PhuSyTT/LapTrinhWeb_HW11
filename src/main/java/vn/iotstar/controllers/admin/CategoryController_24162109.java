package vn.iotstar.controllers.admin;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vn.iotstar.entity.Category;
import vn.iotstar.entity.User;
import vn.iotstar.service.ICategoryService;
import vn.iotstar.service.impl.CategoryServiceImpl;

@WebServlet(urlPatterns = {
    "/admin/category/list",
    "/admin/category/add",
    "/admin/category/edit",
    "/admin/category/delete"
})
public class CategoryController_24162109 extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ICategoryService categoryService = new CategoryServiceImpl();

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
            deleteCategory(req, resp);
        } else {
            listCategories(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        if (!checkAdminAuth(req, resp)) return;

        String path = req.getServletPath();

        if (path.endsWith("/add")) {
            saveAddCategory(req, resp);
        } else if (path.endsWith("/edit")) {
            saveEditCategory(req, resp);
        } else if (path.endsWith("/delete")) {
            deleteCategory(req, resp);
        } else {
            listCategories(req, resp);
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

    private void listCategories(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String keyword = req.getParameter("keyword");
        int page = 1;
        int pageSize = 5; // Phân trang 5 danh mục / trang

        try {
            String pageStr = req.getParameter("page");
            if (pageStr != null && !pageStr.isEmpty()) {
                page = Integer.parseInt(pageStr);
                if (page < 1) page = 1;
            }
        } catch (NumberFormatException e) {
            page = 1;
        }

        List<Category> categories;
        long totalItems;

        if (keyword != null && !keyword.trim().isEmpty()) {
            keyword = keyword.trim();
            categories = categoryService.searchByName(keyword, page, pageSize);
            totalItems = categoryService.countByKeyword(keyword);
            req.setAttribute("keyword", keyword);
        } else {
            categories = categoryService.findAll(page, pageSize);
            totalItems = categoryService.count();
        }

        int totalPages = (int) Math.ceil((double) totalItems / pageSize);
        if (totalPages < 1) totalPages = 1;

        req.setAttribute("categories", categories);
        req.setAttribute("currentPage", page);
        req.setAttribute("totalPages", totalPages);
        req.setAttribute("totalItems", totalItems);

        String msg = req.getParameter("msg");
        if ("added".equals(msg)) req.setAttribute("message", "Thêm danh mục mới thành công!");
        else if ("updated".equals(msg)) req.setAttribute("message", "Cập nhật danh mục thành công!");
        else if ("deleted".equals(msg)) req.setAttribute("message", "Xóa danh mục thành công!");

        req.getRequestDispatcher("/WEB-INF/views/admin/category/category_list_24162109.jsp").forward(req, resp);
    }

    private void showAddForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("isEdit", false);
        req.getRequestDispatcher("/WEB-INF/views/admin/category/category_form_24162109.jsp").forward(req, resp);
    }

    private void showEditForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStr = req.getParameter("id");
        if (idStr == null || idStr.isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/admin/category/list");
            return;
        }

        try {
            int id = Integer.parseInt(idStr);
            Category category = categoryService.findById(id);
            if (category == null) {
                resp.sendRedirect(req.getContextPath() + "/admin/category/list");
                return;
            }
            req.setAttribute("category", category);
            req.setAttribute("isEdit", true);
            req.getRequestDispatcher("/WEB-INF/views/admin/category/category_form_24162109.jsp").forward(req, resp);
        } catch (NumberFormatException e) {
            resp.sendRedirect(req.getContextPath() + "/admin/category/list");
        }
    }

    private void saveAddCategory(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String categoryName = req.getParameter("categoryName");
        String images = req.getParameter("images");
        String statusStr = req.getParameter("status");

        if (categoryName == null || categoryName.trim().isEmpty()) {
            req.setAttribute("error", "Tên danh mục không được để trống!");
            req.setAttribute("isEdit", false);
            req.getRequestDispatcher("/WEB-INF/views/admin/category/category_form_24162109.jsp").forward(req, resp);
            return;
        }

        Category category = new Category();
        category.setCategoryName(categoryName.trim());
        category.setImages(images != null && !images.trim().isEmpty() ? images.trim() : "https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?w=500");
        category.setStatus(statusStr != null ? Integer.parseInt(statusStr) : 1);

        categoryService.insert(category);
        resp.sendRedirect(req.getContextPath() + "/admin/category/list?msg=added");
    }

    private void saveEditCategory(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStr = req.getParameter("categoryId");
        String categoryName = req.getParameter("categoryName");
        String images = req.getParameter("images");
        String statusStr = req.getParameter("status");

        if (idStr == null || categoryName == null || categoryName.trim().isEmpty()) {
            req.setAttribute("error", "Vui lòng nhập đầy đủ thông tin danh mục!");
            req.setAttribute("isEdit", true);
            req.getRequestDispatcher("/WEB-INF/views/admin/category/category_form_24162109.jsp").forward(req, resp);
            return;
        }

        try {
            int id = Integer.parseInt(idStr);
            Category category = categoryService.findById(id);
            if (category != null) {
                category.setCategoryName(categoryName.trim());
                if (images != null && !images.trim().isEmpty()) {
                    category.setImages(images.trim());
                }
                category.setStatus(statusStr != null ? Integer.parseInt(statusStr) : 1);
                categoryService.update(category);
            }
            resp.sendRedirect(req.getContextPath() + "/admin/category/list?msg=updated");
        } catch (Exception e) {
            req.setAttribute("error", "Lỗi khi cập nhật danh mục: " + e.getMessage());
            req.setAttribute("isEdit", true);
            req.getRequestDispatcher("/WEB-INF/views/admin/category/category_form_24162109.jsp").forward(req, resp);
        }
    }

    private void deleteCategory(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String idStr = req.getParameter("id");
        if (idStr != null && !idStr.isEmpty()) {
            try {
                int id = Integer.parseInt(idStr);
                categoryService.delete(id);
                resp.sendRedirect(req.getContextPath() + "/admin/category/list?msg=deleted");
                return;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        resp.sendRedirect(req.getContextPath() + "/admin/category/list");
    }
}

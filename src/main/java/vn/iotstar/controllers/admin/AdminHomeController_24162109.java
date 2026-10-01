package vn.iotstar.controllers.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vn.iotstar.service.ICategoryService;
import vn.iotstar.service.IProductService;
import vn.iotstar.service.IUserService;
import vn.iotstar.service.impl.CategoryServiceImpl;
import vn.iotstar.service.impl.ProductServiceImpl;
import vn.iotstar.service.impl.UserServiceImpl;

@WebServlet(urlPatterns = {"/admin/home", "/admin"})
public class AdminHomeController_24162109 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private ICategoryService categoryService = new CategoryServiceImpl();
    private IProductService productService = new ProductServiceImpl();
    private IUserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        long countCategory = categoryService.count();
        long countProduct = productService.count();
        long countUser = userService.findAll().size();

        req.setAttribute("countCategory", countCategory);
        req.setAttribute("countProduct", countProduct);
        req.setAttribute("countUser", countUser);

        req.getRequestDispatcher("/WEB-INF/views/admin/home_24162109.jsp").forward(req, resp);
    }
}

package vn.iotstar.data;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.atomic.AtomicInteger;
import vn.iotstar.entity.*;
import vn.iotstar.model.OrderModel;

public class MockDataStore {

    private static final List<UserRole> roles = new CopyOnWriteArrayList<>();
    private static final List<Seller> sellers = new CopyOnWriteArrayList<>();
    private static final List<User> users = new CopyOnWriteArrayList<>();
    private static final List<Category> categories = new CopyOnWriteArrayList<>();
    private static final List<Product> products = new CopyOnWriteArrayList<>();
    private static final List<OrderModel> orders = new CopyOnWriteArrayList<>();

    private static final AtomicInteger nextUserId = new AtomicInteger(10);
    private static final AtomicInteger nextCategoryId = new AtomicInteger(10);
    private static final AtomicInteger nextProductId = new AtomicInteger(20);
    private static final AtomicInteger nextSellerId = new AtomicInteger(10);

    static {
        initData();
    }

    private static void initData() {
        // 1. Roles
        UserRole roleAdmin = new UserRole(1, "Admin");
        UserRole roleSeller = new UserRole(2, "Seller");
        UserRole roleUser = new UserRole(3, "User");
        roles.add(roleAdmin);
        roles.add(roleSeller);
        roles.add(roleUser);

        // 2. Sellers
        Seller seller1 = new Seller(1, "Aura Flagship Store", "https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=200", 1);
        Seller seller2 = new Seller(2, "Kicks Elite Saigon", "https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?w=200", 1);
        sellers.add(seller1);
        sellers.add(seller2);

        // 3. Users
        User uAdmin = new User(1, "admin", "admin@aurakicks.vn", "Đinh Phú Sỹ (Admin)", "123", "https://cdn-icons-png.flaticon.com/512/3135/3135715.png", "0912345678", 1, null, roleAdmin, null);
        User uSeller = new User(2, "seller", "seller@aurakicks.vn", "Aura Flagship Store", "123", "https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=200", "0987654321", 1, null, roleSeller, seller1);
        User uUser = new User(3, "user", "user@aurakicks.vn", "Đinh Phú Sỹ", "123", "https://cdn-icons-png.flaticon.com/512/3135/3135768.png", "0909090909", 1, null, roleUser, null);
        users.add(uAdmin);
        users.add(uSeller);
        users.add(uUser);

        // 4. Categories
        Category cat1 = new Category(1, "Sneakers Thể Thao Streetwear", "https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?w=400", 1);
        Category cat2 = new Category(2, "Giày Chạy Bộ Performance Running", "https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400", 1);
        Category cat3 = new Category(3, "Giày Chunky Cá Tính & Platform", "https://images.unsplash.com/photo-1552346154-21d32810aba3?w=400", 1);
        Category cat4 = new Category(4, "Giày Bóng Rổ Basketball Pro", "https://images.unsplash.com/photo-1515955656352-a1fa3ffcd111?w=400", 1);
        categories.add(cat1);
        categories.add(cat2);
        categories.add(cat3);
        categories.add(cat4);

        // 5. Products với hình ảnh thực tế chất lượng cao
        long now = System.currentTimeMillis();
        Date today = new Date(now);

        Product p1 = new Product(1, "Nike Air Zoom Pegasus 40 Aura Edition", 1001L, cat2,
                "Dòng giày chạy bộ huyền thoại với đệm Zoom Air đàn hồi cực tốt, màu đỏ gradient trẻ trung năng động.",
                3290000.0, 50, 50, "https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=700&auto=format&fit=crop&q=80", 12, 1, today, seller1);

        Product p2 = new Product(2, "Adidas Ultraboost Light Cyber Cyan", 1002L, cat2,
                "Đế Boost siêu nhẹ tối tân, hoàn trả năng lượng tối đa trên từng bước chạy bền bỉ.",
                3890000.0, 40, 40, "https://images.unsplash.com/photo-1584735935682-2f2b69dff9d2?w=700&auto=format&fit=crop&q=80", 25, 1, today, seller1);

        Product p3 = new Product(3, "Balenciaga Triple S Chunky Neon Aurora", 1003L, cat3,
                "Thiết kế Chunky hầm hố phá cách, đế 3 tầng thời thượng tạo điểm nhấn phong cách Cyberpunk.",
                8900000.0, 15, 15, "https://images.unsplash.com/photo-1552346154-21d32810aba3?w=700&auto=format&fit=crop&q=80", 8, 1, today, seller1);

        Product p4 = new Product(4, "Nike Dunk Low Retro Panda Edition", 1004L, cat1,
                "Đôi sneaker quốc dân phối màu trắng đen cổ điển, dễ phối đồ mọi phong cách dạo phố.",
                2990000.0, 80, 80, "https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?w=700&auto=format&fit=crop&q=80", 45, 1, today, seller1);

        Product p5 = new Product(5, "New Balance 550 Vintage White Violet", 1005L, cat1,
                "Thiết kế bóng rổ thập niên 80 retro, phối màu vintage cực hot nâng tầm trang phục thường ngày.",
                2750000.0, 60, 60, "https://images.unsplash.com/photo-1539185441755-769473a23570?w=700&auto=format&fit=crop&q=80", 30, 1, today, seller2);

        Product p6 = new Product(6, "Puma RS-X Efekt Dark Neon Glow", 1006L, cat3,
                "Phong cách Futuristic với các dải màu neon phát quang nổi bật cuốn hút mọi ánh nhìn.",
                2450000.0, 30, 30, "https://images.unsplash.com/photo-1608231387042-66d1773070a5?w=700&auto=format&fit=crop&q=80", 19, 1, today, seller2);

        Product p7 = new Product(7, "Asics Gel-Kayano 30 Platinum Core", 1007L, cat2,
                "Hệ thống 4D Guidance System bảo vệ khớp chân và nâng đỡ bàn chân hoàn hảo cho cự ly dài.",
                3600000.0, 25, 25, "https://images.unsplash.com/photo-1587563871167-1ee9c731aefb?w=700&auto=format&fit=crop&q=80", 15, 1, today, seller2);

        Product p8 = new Product(8, "Air Jordan 1 Retro High OG Chicago", 1008L, cat4,
                "Huyền thoại bóng rổ không thể thay thế, chất da thật cao cấp kết hợp màu Chicago kinh điển.",
                6500000.0, 20, 20, "https://images.unsplash.com/photo-1515955656352-a1fa3ffcd111?w=700&auto=format&fit=crop&q=80", 60, 1, today, seller2);

        products.add(p1);
        products.add(p2);
        products.add(p3);
        products.add(p4);
        products.add(p5);
        products.add(p6);
        products.add(p7);
        products.add(p8);
    }

    // ==========================================
    // USER ROLES
    // ==========================================
    public static UserRole findRoleById(int id) {
        for (UserRole r : roles) {
            if (r.getRoleId() == id) return r;
        }
        return null;
    }

    public static UserRole findRoleByName(String name) {
        for (UserRole r : roles) {
            if (r.getRoleName().equalsIgnoreCase(name)) return r;
        }
        return null;
    }

    public static List<UserRole> findAllRoles() {
        return new ArrayList<>(roles);
    }

    // ==========================================
    // SELLERS
    // ==========================================
    public static Seller findSellerById(int id) {
        for (Seller s : sellers) {
            if (s.getSellerId() == id) return s;
        }
        return null;
    }

    public static List<Seller> findAllSellers() {
        return new ArrayList<>(sellers);
    }

    public static void insertSeller(Seller s) {
        s.setSellerId(nextSellerId.incrementAndGet());
        sellers.add(s);
    }

    public static void updateSeller(Seller s) {
        for (int i = 0; i < sellers.size(); i++) {
            if (sellers.get(i).getSellerId() == s.getSellerId()) {
                sellers.set(i, s);
                return;
            }
        }
    }

    public static void deleteSeller(int id) {
        sellers.removeIf(s -> s.getSellerId() == id);
    }

    // ==========================================
    // USERS
    // ==========================================
    public static User findUserById(int id) {
        for (User u : users) {
            if (u.getUserId() == id) return u;
        }
        return null;
    }

    public static User findUserByUsername(String username) {
        if (username == null) return null;
        for (User u : users) {
            if (username.equalsIgnoreCase(u.getUsername())) return u;
        }
        return null;
    }

    public static User findUserByEmail(String email) {
        if (email == null) return null;
        for (User u : users) {
            if (email.equalsIgnoreCase(u.getEmail())) return u;
        }
        return null;
    }

    public static User findUserByUsernameOrEmail(String val) {
        if (val == null) return null;
        for (User u : users) {
            if (val.equalsIgnoreCase(u.getUsername()) || val.equalsIgnoreCase(u.getEmail())) {
                return u;
            }
        }
        return null;
    }

    public static List<User> findAllUsers() {
        return new ArrayList<>(users);
    }

    public static void insertUser(User user) {
        if (user.getUserId() == 0) {
            user.setUserId(nextUserId.incrementAndGet());
        }
        users.add(user);
    }

    public static void updateUser(User user) {
        for (int i = 0; i < users.size(); i++) {
            if (users.get(i).getUserId() == user.getUserId()) {
                users.set(i, user);
                return;
            }
        }
    }

    public static void deleteUser(int id) {
        users.removeIf(u -> u.getUserId() == id);
    }

    public static long countUsers() {
        return users.size();
    }

    // ==========================================
    // CATEGORIES
    // ==========================================
    public static Category findCategoryById(int id) {
        for (Category c : categories) {
            if (c.getCategoryId() == id) return c;
        }
        return null;
    }

    public static List<Category> findAllCategories() {
        List<Category> list = new ArrayList<>(categories);
        Collections.reverse(list);
        return list;
    }

    public static List<Category> findAllCategories(int page, int pageSize) {
        List<Category> list = findAllCategories();
        int from = Math.max(0, (page - 1) * pageSize);
        if (from >= list.size()) return new ArrayList<>();
        int to = Math.min(list.size(), from + pageSize);
        return list.subList(from, to);
    }

    public static List<Category> searchCategoryByName(String keyword, int page, int pageSize) {
        List<Category> list = new ArrayList<>();
        String kw = keyword == null ? "" : keyword.toLowerCase().trim();
        for (Category c : categories) {
            if (c.getCategoryName() != null && c.getCategoryName().toLowerCase().contains(kw)) {
                list.add(c);
            }
        }
        Collections.reverse(list);
        int from = Math.max(0, (page - 1) * pageSize);
        if (from >= list.size()) return new ArrayList<>();
        int to = Math.min(list.size(), from + pageSize);
        return list.subList(from, to);
    }

    public static void insertCategory(Category category) {
        if (category.getCategoryId() == 0) {
            category.setCategoryId(nextCategoryId.incrementAndGet());
        }
        categories.add(category);
    }

    public static void updateCategory(Category category) {
        for (int i = 0; i < categories.size(); i++) {
            if (categories.get(i).getCategoryId() == category.getCategoryId()) {
                categories.set(i, category);
                return;
            }
        }
    }

    public static void deleteCategory(int id) {
        categories.removeIf(c -> c.getCategoryId() == id);
    }

    public static long countCategories() {
        return categories.size();
    }

    public static long countCategoriesByKeyword(String keyword) {
        String kw = keyword == null ? "" : keyword.toLowerCase().trim();
        long count = 0;
        for (Category c : categories) {
            if (c.getCategoryName() != null && c.getCategoryName().toLowerCase().contains(kw)) {
                count++;
            }
        }
        return count;
    }

    // ==========================================
    // PRODUCTS
    // ==========================================
    public static Product findProductById(int id) {
        for (Product p : products) {
            if (p.getProductId() == id) return p;
        }
        return null;
    }

    public static List<Product> findAllProducts() {
        List<Product> list = new ArrayList<>(products);
        Collections.reverse(list);
        return list;
    }

    public static List<Product> findAllProducts(int page, int pageSize) {
        List<Product> list = findAllProducts();
        int from = Math.max(0, (page - 1) * pageSize);
        if (from >= list.size()) return new ArrayList<>();
        int to = Math.min(list.size(), from + pageSize);
        return list.subList(from, to);
    }

    public static List<Product> findProductsBySellerId(int sellerId) {
        List<Product> list = new ArrayList<>();
        for (Product p : products) {
            if (p.getSeller() != null && p.getSeller().getSellerId() == sellerId) {
                list.add(p);
            }
        }
        Collections.reverse(list);
        return list;
    }

    public static List<Product> findProductsByCategoryId(int categoryId) {
        List<Product> list = new ArrayList<>();
        for (Product p : products) {
            if (p.getCategory() != null && p.getCategory().getCategoryId() == categoryId) {
                list.add(p);
            }
        }
        Collections.reverse(list);
        return list;
    }

    public static List<Product> searchProductByName(String keyword, int page, int pageSize) {
        List<Product> list = new ArrayList<>();
        String kw = keyword == null ? "" : keyword.toLowerCase().trim();
        for (Product p : products) {
            if (p.getProductName() != null && p.getProductName().toLowerCase().contains(kw)) {
                list.add(p);
            }
        }
        Collections.reverse(list);
        int from = Math.max(0, (page - 1) * pageSize);
        if (from >= list.size()) return new ArrayList<>();
        int to = Math.min(list.size(), from + pageSize);
        return list.subList(from, to);
    }

    public static void insertProduct(Product product) {
        if (product.getProductId() == 0) {
            product.setProductId(nextProductId.incrementAndGet());
        }
        if (product.getCategory() != null && product.getCategory().getCategoryId() > 0) {
            Category c = findCategoryById(product.getCategory().getCategoryId());
            if (c != null) product.setCategory(c);
        }
        if (product.getSeller() != null && product.getSeller().getSellerId() > 0) {
            Seller s = findSellerById(product.getSeller().getSellerId());
            if (s != null) product.setSeller(s);
        }
        products.add(product);
    }

    public static void updateProduct(Product product) {
        for (int i = 0; i < products.size(); i++) {
            if (products.get(i).getProductId() == product.getProductId()) {
                if (product.getCategory() != null && product.getCategory().getCategoryId() > 0) {
                    Category c = findCategoryById(product.getCategory().getCategoryId());
                    if (c != null) product.setCategory(c);
                }
                if (product.getSeller() != null && product.getSeller().getSellerId() > 0) {
                    Seller s = findSellerById(product.getSeller().getSellerId());
                    if (s != null) product.setSeller(s);
                }
                products.set(i, product);
                return;
            }
        }
    }

    public static void deleteProduct(int id) {
        products.removeIf(p -> p.getProductId() == id);
    }

    public static long countProducts() {
        return products.size();
    }

    public static long countProductsByKeyword(String keyword) {
        String kw = keyword == null ? "" : keyword.toLowerCase().trim();
        long count = 0;
        for (Product p : products) {
            if (p.getProductName() != null && p.getProductName().toLowerCase().contains(kw)) {
                count++;
            }
        }
        return count;
    }

    // Giảm số lượng tồn kho khi đặt hàng thành công
    public static synchronized boolean reduceStock(int productId, int quantity) {
        Product p = findProductById(productId);
        if (p != null) {
            int currentAmount = p.getAmount() != null ? p.getAmount() : 0;
            if (currentAmount >= quantity) {
                p.setAmount(currentAmount - quantity);
                p.setStock(currentAmount - quantity);
                return true;
            }
        }
        return false;
    }

    // ==========================================
    // ORDERS
    // ==========================================
    public static void saveOrder(OrderModel order) {
        orders.add(order);
    }

    public static OrderModel findOrderById(String orderId) {
        if (orderId == null) return null;
        for (OrderModel o : orders) {
            if (orderId.equalsIgnoreCase(o.getOrderId())) {
                return o;
            }
        }
        return null;
    }

    public static List<OrderModel> findAllOrders() {
        return new ArrayList<>(orders);
    }
}

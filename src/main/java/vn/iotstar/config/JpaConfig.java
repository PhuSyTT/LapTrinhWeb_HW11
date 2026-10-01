package vn.iotstar.config;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class JpaConfig {
    // Đặt USE_MOCK_DATA = true để chạy thử nghiệm độc lập trên VS Code mà không cần SQL Server!
    // Đổi về false khi bạn muốn kết nối trực tiếp vào MS SQL Server.
    public static boolean USE_MOCK_DATA = true;

    private static EntityManagerFactory factory;

    public static EntityManager getEntityManager() {
        if (factory == null || !factory.isOpen()) {
            factory = Persistence.createEntityManagerFactory("WebOnline_De05");
        }
        return factory.createEntityManager();
    }

    public static void close() {
        if (factory != null && factory.isOpen()) {
            factory.close();
        }
    }
}


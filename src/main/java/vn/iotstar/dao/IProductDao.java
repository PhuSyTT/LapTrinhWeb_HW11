package vn.iotstar.dao;

import java.util.List;
import vn.iotstar.entity.Product;

public interface IProductDao {
    Product findById(int id);
    List<Product> findAll();
    List<Product> findAll(int page, int pageSize);
    List<Product> findBySellerId(int sellerId);
    List<Product> findByCategoryId(int categoryId);
    List<Product> searchByName(String keyword, int page, int pageSize);
    long count();
    long countByKeyword(String keyword);
    void insert(Product product);
    void update(Product product);
    void delete(int id) throws Exception;
}

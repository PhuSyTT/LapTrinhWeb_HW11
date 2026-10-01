package vn.iotstar.service;

import java.util.List;
import java.util.Map;
import vn.iotstar.entity.Product;
import vn.iotstar.entity.Seller;

public interface IProductService {
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
    Map<Seller, List<Product>> findAllGroupedBySeller();
}

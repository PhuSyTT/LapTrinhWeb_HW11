package vn.iotstar.dao;

import java.util.List;
import vn.iotstar.entity.Category;

public interface ICategoryDao {
    Category findById(int id);
    List<Category> findAll();
    List<Category> findAll(int page, int pageSize);
    List<Category> searchByName(String keyword, int page, int pageSize);
    long count();
    long countByKeyword(String keyword);
    void insert(Category category);
    void update(Category category);
    void delete(int id) throws Exception;
}

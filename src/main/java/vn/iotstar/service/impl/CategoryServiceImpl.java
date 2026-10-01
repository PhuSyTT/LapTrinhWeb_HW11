package vn.iotstar.service.impl;

import java.util.List;
import vn.iotstar.dao.ICategoryDao;
import vn.iotstar.dao.impl.CategoryDaoImpl;
import vn.iotstar.entity.Category;
import vn.iotstar.service.ICategoryService;

public class CategoryServiceImpl implements ICategoryService {
    private ICategoryDao categoryDao = new CategoryDaoImpl();

    @Override
    public Category findById(int id) {
        return categoryDao.findById(id);
    }

    @Override
    public List<Category> findAll() {
        return categoryDao.findAll();
    }

    @Override
    public List<Category> findAll(int page, int pageSize) {
        return categoryDao.findAll(page, pageSize);
    }

    @Override
    public List<Category> searchByName(String keyword, int page, int pageSize) {
        return categoryDao.searchByName(keyword, page, pageSize);
    }

    @Override
    public long count() {
        return categoryDao.count();
    }

    @Override
    public long countByKeyword(String keyword) {
        return categoryDao.countByKeyword(keyword);
    }

    @Override
    public void insert(Category category) {
        categoryDao.insert(category);
    }

    @Override
    public void update(Category category) {
        categoryDao.update(category);
    }

    @Override
    public void delete(int id) throws Exception {
        categoryDao.delete(id);
    }
}

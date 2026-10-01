package vn.iotstar.service.impl;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import vn.iotstar.dao.IProductDao;
import vn.iotstar.dao.ISellerDao;
import vn.iotstar.dao.impl.ProductDaoImpl;
import vn.iotstar.dao.impl.SellerDaoImpl;
import vn.iotstar.entity.Product;
import vn.iotstar.entity.Seller;
import vn.iotstar.service.IProductService;

public class ProductServiceImpl implements IProductService {
    private IProductDao productDao = new ProductDaoImpl();
    private ISellerDao sellerDao = new SellerDaoImpl();

    @Override
    public Product findById(int id) {
        return productDao.findById(id);
    }

    @Override
    public List<Product> findAll() {
        return productDao.findAll();
    }

    @Override
    public List<Product> findAll(int page, int pageSize) {
        return productDao.findAll(page, pageSize);
    }

    @Override
    public List<Product> findBySellerId(int sellerId) {
        return productDao.findBySellerId(sellerId);
    }

    @Override
    public List<Product> findByCategoryId(int categoryId) {
        return productDao.findByCategoryId(categoryId);
    }

    @Override
    public List<Product> searchByName(String keyword, int page, int pageSize) {
        return productDao.searchByName(keyword, page, pageSize);
    }

    @Override
    public long count() {
        return productDao.count();
    }

    @Override
    public long countByKeyword(String keyword) {
        return productDao.countByKeyword(keyword);
    }

    @Override
    public void insert(Product product) {
        productDao.insert(product);
    }

    @Override
    public void update(Product product) {
        productDao.update(product);
    }

    @Override
    public void delete(int id) throws Exception {
        productDao.delete(id);
    }

    @Override
    public Map<Seller, List<Product>> findAllGroupedBySeller() {
        List<Seller> sellers = sellerDao.findAll();
        Map<Seller, List<Product>> map = new LinkedHashMap<>();
        for (Seller s : sellers) {
            List<Product> prods = productDao.findBySellerId(s.getSellerId());
            map.put(s, prods);
        }
        return map;
    }
}

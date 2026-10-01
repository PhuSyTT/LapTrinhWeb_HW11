package vn.iotstar.dao;

import java.util.List;
import vn.iotstar.entity.Seller;

public interface ISellerDao {
    Seller findById(int id);
    List<Seller> findAll();
    void insert(Seller seller);
    void update(Seller seller);
    void delete(int id) throws Exception;
}

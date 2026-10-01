package vn.iotstar.service;

import java.util.List;
import vn.iotstar.entity.Seller;

public interface ISellerService {
    Seller findById(int id);
    List<Seller> findAll();
    void insert(Seller seller);
    void update(Seller seller);
    void delete(int id) throws Exception;
}

package vn.iotstar.service.impl;

import java.util.List;
import vn.iotstar.dao.ISellerDao;
import vn.iotstar.dao.impl.SellerDaoImpl;
import vn.iotstar.entity.Seller;
import vn.iotstar.service.ISellerService;

public class SellerServiceImpl implements ISellerService {
    private ISellerDao sellerDao = new SellerDaoImpl();

    @Override
    public Seller findById(int id) {
        return sellerDao.findById(id);
    }

    @Override
    public List<Seller> findAll() {
        return sellerDao.findAll();
    }

    @Override
    public void insert(Seller seller) {
        sellerDao.insert(seller);
    }

    @Override
    public void update(Seller seller) {
        sellerDao.update(seller);
    }

    @Override
    public void delete(int id) throws Exception {
        sellerDao.delete(id);
    }
}

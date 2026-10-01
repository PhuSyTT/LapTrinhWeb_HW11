package vn.iotstar.dao.impl;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;
import vn.iotstar.config.JpaConfig;
import vn.iotstar.dao.ISellerDao;
import vn.iotstar.data.MockDataStore;
import vn.iotstar.entity.Seller;

public class SellerDaoImpl implements ISellerDao {

    @Override
    public Seller findById(int id) {
        if (JpaConfig.USE_MOCK_DATA) {
            return MockDataStore.findSellerById(id);
        }
        EntityManager em = JpaConfig.getEntityManager();
        try {
            return em.find(Seller.class, id);
        } finally {
            em.close();
        }
    }

    @Override
    public List<Seller> findAll() {
        if (JpaConfig.USE_MOCK_DATA) {
            return MockDataStore.findAllSellers();
        }
        EntityManager em = JpaConfig.getEntityManager();
        try {
            String jpql = "SELECT s FROM Seller s ORDER BY s.sellerId ASC";
            TypedQuery<Seller> query = em.createQuery(jpql, Seller.class);
            return query.getResultList();
        } finally {
            em.close();
        }
    }

    @Override
    public void insert(Seller seller) {
        if (JpaConfig.USE_MOCK_DATA) {
            MockDataStore.insertSeller(seller);
            return;
        }
        EntityManager em = JpaConfig.getEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.persist(seller);
            trans.commit();
        } catch (Exception e) {
            if (trans.isActive()) trans.rollback();
            e.printStackTrace();
            throw e;
        } finally {
            em.close();
        }
    }

    @Override
    public void update(Seller seller) {
        if (JpaConfig.USE_MOCK_DATA) {
            MockDataStore.updateSeller(seller);
            return;
        }
        EntityManager em = JpaConfig.getEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.merge(seller);
            trans.commit();
        } catch (Exception e) {
            if (trans.isActive()) trans.rollback();
            e.printStackTrace();
            throw e;
        } finally {
            em.close();
        }
    }

    @Override
    public void delete(int id) throws Exception {
        if (JpaConfig.USE_MOCK_DATA) {
            MockDataStore.deleteSeller(id);
            return;
        }
        EntityManager em = JpaConfig.getEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            Seller s = em.find(Seller.class, id);
            if (s != null) {
                em.remove(s);
            }
            trans.commit();
        } catch (Exception e) {
            if (trans.isActive()) trans.rollback();
            e.printStackTrace();
            throw e;
        } finally {
            em.close();
        }
    }
}


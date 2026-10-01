package vn.iotstar.dao.impl;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;
import vn.iotstar.config.JpaConfig;
import vn.iotstar.dao.IProductDao;
import vn.iotstar.data.MockDataStore;
import vn.iotstar.entity.Product;

public class ProductDaoImpl implements IProductDao {

    @Override
    public Product findById(int id) {
        if (JpaConfig.USE_MOCK_DATA) {
            return MockDataStore.findProductById(id);
        }
        EntityManager em = JpaConfig.getEntityManager();
        try {
            return em.find(Product.class, id);
        } finally {
            em.close();
        }
    }

    @Override
    public List<Product> findAll() {
        if (JpaConfig.USE_MOCK_DATA) {
            return MockDataStore.findAllProducts();
        }
        EntityManager em = JpaConfig.getEntityManager();
        try {
            String jpql = "SELECT p FROM Product p ORDER BY p.productId DESC";
            TypedQuery<Product> query = em.createQuery(jpql, Product.class);
            return query.getResultList();
        } finally {
            em.close();
        }
    }

    @Override
    public List<Product> findAll(int page, int pageSize) {
        if (JpaConfig.USE_MOCK_DATA) {
            return MockDataStore.findAllProducts(page, pageSize);
        }
        EntityManager em = JpaConfig.getEntityManager();
        try {
            String jpql = "SELECT p FROM Product p ORDER BY p.productId DESC";
            TypedQuery<Product> query = em.createQuery(jpql, Product.class);
            query.setFirstResult((page - 1) * pageSize);
            query.setMaxResults(pageSize);
            return query.getResultList();
        } finally {
            em.close();
        }
    }

    @Override
    public List<Product> findBySellerId(int sellerId) {
        if (JpaConfig.USE_MOCK_DATA) {
            return MockDataStore.findProductsBySellerId(sellerId);
        }
        EntityManager em = JpaConfig.getEntityManager();
        try {
            String jpql = "SELECT p FROM Product p WHERE p.seller.sellerId = :sellerId ORDER BY p.productId DESC";
            TypedQuery<Product> query = em.createQuery(jpql, Product.class);
            query.setParameter("sellerId", sellerId);
            return query.getResultList();
        } finally {
            em.close();
        }
    }

    @Override
    public List<Product> findByCategoryId(int categoryId) {
        if (JpaConfig.USE_MOCK_DATA) {
            return MockDataStore.findProductsByCategoryId(categoryId);
        }
        EntityManager em = JpaConfig.getEntityManager();
        try {
            String jpql = "SELECT p FROM Product p WHERE p.category.categoryId = :categoryId ORDER BY p.productId DESC";
            TypedQuery<Product> query = em.createQuery(jpql, Product.class);
            query.setParameter("categoryId", categoryId);
            return query.getResultList();
        } finally {
            em.close();
        }
    }

    @Override
    public List<Product> searchByName(String keyword, int page, int pageSize) {
        if (JpaConfig.USE_MOCK_DATA) {
            return MockDataStore.searchProductByName(keyword, page, pageSize);
        }
        EntityManager em = JpaConfig.getEntityManager();
        try {
            String jpql = "SELECT p FROM Product p WHERE p.productName LIKE :keyword ORDER BY p.productId DESC";
            TypedQuery<Product> query = em.createQuery(jpql, Product.class);
            query.setParameter("keyword", "%" + keyword + "%");
            query.setFirstResult((page - 1) * pageSize);
            query.setMaxResults(pageSize);
            return query.getResultList();
        } finally {
            em.close();
        }
    }

    @Override
    public long count() {
        if (JpaConfig.USE_MOCK_DATA) {
            return MockDataStore.countProducts();
        }
        EntityManager em = JpaConfig.getEntityManager();
        try {
            String jpql = "SELECT COUNT(p) FROM Product p";
            return em.createQuery(jpql, Long.class).getSingleResult();
        } finally {
            em.close();
        }
    }

    @Override
    public long countByKeyword(String keyword) {
        if (JpaConfig.USE_MOCK_DATA) {
            return MockDataStore.countProductsByKeyword(keyword);
        }
        EntityManager em = JpaConfig.getEntityManager();
        try {
            String jpql = "SELECT COUNT(p) FROM Product p WHERE p.productName LIKE :keyword";
            TypedQuery<Long> query = em.createQuery(jpql, Long.class);
            query.setParameter("keyword", "%" + keyword + "%");
            return query.getSingleResult();
        } finally {
            em.close();
        }
    }

    @Override
    public void insert(Product product) {
        if (JpaConfig.USE_MOCK_DATA) {
            MockDataStore.insertProduct(product);
            return;
        }
        EntityManager em = JpaConfig.getEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.persist(product);
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
    public void update(Product product) {
        if (JpaConfig.USE_MOCK_DATA) {
            MockDataStore.updateProduct(product);
            return;
        }
        EntityManager em = JpaConfig.getEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.merge(product);
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
            MockDataStore.deleteProduct(id);
            return;
        }
        EntityManager em = JpaConfig.getEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            Product p = em.find(Product.class, id);
            if (p != null) {
                em.remove(p);
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


package vn.iotstar.dao.impl;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;
import vn.iotstar.config.JpaConfig;
import vn.iotstar.dao.ICategoryDao;
import vn.iotstar.data.MockDataStore;
import vn.iotstar.entity.Category;

public class CategoryDaoImpl implements ICategoryDao {

    @Override
    public Category findById(int id) {
        if (JpaConfig.USE_MOCK_DATA) {
            return MockDataStore.findCategoryById(id);
        }
        EntityManager em = JpaConfig.getEntityManager();
        try {
            return em.find(Category.class, id);
        } finally {
            em.close();
        }
    }

    @Override
    public List<Category> findAll() {
        if (JpaConfig.USE_MOCK_DATA) {
            return MockDataStore.findAllCategories();
        }
        EntityManager em = JpaConfig.getEntityManager();
        try {
            String jpql = "SELECT c FROM Category c ORDER BY c.categoryId DESC";
            TypedQuery<Category> query = em.createQuery(jpql, Category.class);
            return query.getResultList();
        } finally {
            em.close();
        }
    }

    @Override
    public List<Category> findAll(int page, int pageSize) {
        if (JpaConfig.USE_MOCK_DATA) {
            return MockDataStore.findAllCategories(page, pageSize);
        }
        EntityManager em = JpaConfig.getEntityManager();
        try {
            String jpql = "SELECT c FROM Category c ORDER BY c.categoryId DESC";
            TypedQuery<Category> query = em.createQuery(jpql, Category.class);
            query.setFirstResult((page - 1) * pageSize);
            query.setMaxResults(pageSize);
            return query.getResultList();
        } finally {
            em.close();
        }
    }

    @Override
    public List<Category> searchByName(String keyword, int page, int pageSize) {
        if (JpaConfig.USE_MOCK_DATA) {
            return MockDataStore.searchCategoryByName(keyword, page, pageSize);
        }
        EntityManager em = JpaConfig.getEntityManager();
        try {
            String jpql = "SELECT c FROM Category c WHERE c.categoryName LIKE :keyword ORDER BY c.categoryId DESC";
            TypedQuery<Category> query = em.createQuery(jpql, Category.class);
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
            return MockDataStore.countCategories();
        }
        EntityManager em = JpaConfig.getEntityManager();
        try {
            String jpql = "SELECT COUNT(c) FROM Category c";
            return em.createQuery(jpql, Long.class).getSingleResult();
        } finally {
            em.close();
        }
    }

    @Override
    public long countByKeyword(String keyword) {
        if (JpaConfig.USE_MOCK_DATA) {
            return MockDataStore.countCategoriesByKeyword(keyword);
        }
        EntityManager em = JpaConfig.getEntityManager();
        try {
            String jpql = "SELECT COUNT(c) FROM Category c WHERE c.categoryName LIKE :keyword";
            TypedQuery<Long> query = em.createQuery(jpql, Long.class);
            query.setParameter("keyword", "%" + keyword + "%");
            return query.getSingleResult();
        } finally {
            em.close();
        }
    }

    @Override
    public void insert(Category category) {
        if (JpaConfig.USE_MOCK_DATA) {
            MockDataStore.insertCategory(category);
            return;
        }
        EntityManager em = JpaConfig.getEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.persist(category);
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
    public void update(Category category) {
        if (JpaConfig.USE_MOCK_DATA) {
            MockDataStore.updateCategory(category);
            return;
        }
        EntityManager em = JpaConfig.getEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.merge(category);
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
            MockDataStore.deleteCategory(id);
            return;
        }
        EntityManager em = JpaConfig.getEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            Category cat = em.find(Category.class, id);
            if (cat != null) {
                em.remove(cat);
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


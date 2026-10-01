package vn.iotstar.dao.impl;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;
import vn.iotstar.config.JpaConfig;
import vn.iotstar.dao.IUserDao;
import vn.iotstar.data.MockDataStore;
import vn.iotstar.entity.User;

public class UserDaoImpl implements IUserDao {

    @Override
    public User findById(int id) {
        if (JpaConfig.USE_MOCK_DATA) {
            return MockDataStore.findUserById(id);
        }
        EntityManager em = JpaConfig.getEntityManager();
        try {
            return em.find(User.class, id);
        } finally {
            em.close();
        }
    }

    @Override
    public User findByUsername(String username) {
        if (JpaConfig.USE_MOCK_DATA) {
            return MockDataStore.findUserByUsername(username);
        }
        EntityManager em = JpaConfig.getEntityManager();
        try {
            String jpql = "SELECT u FROM User u WHERE u.username = :username";
            TypedQuery<User> query = em.createQuery(jpql, User.class);
            query.setParameter("username", username);
            List<User> list = query.getResultList();
            return list.isEmpty() ? null : list.get(0);
        } finally {
            em.close();
        }
    }

    @Override
    public User findByEmail(String email) {
        if (JpaConfig.USE_MOCK_DATA) {
            return MockDataStore.findUserByEmail(email);
        }
        EntityManager em = JpaConfig.getEntityManager();
        try {
            String jpql = "SELECT u FROM User u WHERE u.email = :email";
            TypedQuery<User> query = em.createQuery(jpql, User.class);
            query.setParameter("email", email);
            List<User> list = query.getResultList();
            return list.isEmpty() ? null : list.get(0);
        } finally {
            em.close();
        }
    }

    @Override
    public User findByUsernameOrEmail(String usernameOrEmail) {
        if (JpaConfig.USE_MOCK_DATA) {
            return MockDataStore.findUserByUsernameOrEmail(usernameOrEmail);
        }
        EntityManager em = JpaConfig.getEntityManager();
        try {
            String jpql = "SELECT u FROM User u WHERE u.username = :val OR u.email = :val";
            TypedQuery<User> query = em.createQuery(jpql, User.class);
            query.setParameter("val", usernameOrEmail);
            List<User> list = query.getResultList();
            return list.isEmpty() ? null : list.get(0);
        } finally {
            em.close();
        }
    }

    @Override
    public List<User> findAll() {
        if (JpaConfig.USE_MOCK_DATA) {
            return MockDataStore.findAllUsers();
        }
        EntityManager em = JpaConfig.getEntityManager();
        try {
            String jpql = "SELECT u FROM User u";
            TypedQuery<User> query = em.createQuery(jpql, User.class);
            return query.getResultList();
        } finally {
            em.close();
        }
    }

    @Override
    public void insert(User user) {
        if (JpaConfig.USE_MOCK_DATA) {
            MockDataStore.insertUser(user);
            return;
        }
        EntityManager em = JpaConfig.getEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.persist(user);
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
    public void update(User user) {
        if (JpaConfig.USE_MOCK_DATA) {
            MockDataStore.updateUser(user);
            return;
        }
        EntityManager em = JpaConfig.getEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.merge(user);
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
            MockDataStore.deleteUser(id);
            return;
        }
        EntityManager em = JpaConfig.getEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            User user = em.find(User.class, id);
            if (user != null) {
                em.remove(user);
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

    @Override
    public boolean checkExistEmail(String email) {
        return findByEmail(email) != null;
    }

    @Override
    public boolean checkExistUsername(String username) {
        return findByUsername(username) != null;
    }
}


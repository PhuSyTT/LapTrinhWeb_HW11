package vn.iotstar.dao.impl;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import vn.iotstar.config.JpaConfig;
import vn.iotstar.dao.IUserRoleDao;
import vn.iotstar.data.MockDataStore;
import vn.iotstar.entity.UserRole;

public class UserRoleDaoImpl implements IUserRoleDao {

    @Override
    public UserRole findById(int id) {
        if (JpaConfig.USE_MOCK_DATA) {
            return MockDataStore.findRoleById(id);
        }
        EntityManager em = JpaConfig.getEntityManager();
        try {
            return em.find(UserRole.class, id);
        } finally {
            em.close();
        }
    }

    @Override
    public UserRole findByName(String name) {
        if (JpaConfig.USE_MOCK_DATA) {
            return MockDataStore.findRoleByName(name);
        }
        EntityManager em = JpaConfig.getEntityManager();
        try {
            String jpql = "SELECT r FROM UserRole r WHERE UPPER(r.roleName) = UPPER(:name)";
            TypedQuery<UserRole> query = em.createQuery(jpql, UserRole.class);
            query.setParameter("name", name);
            List<UserRole> list = query.getResultList();
            return list.isEmpty() ? null : list.get(0);
        } finally {
            em.close();
        }
    }

    @Override
    public List<UserRole> findAll() {
        if (JpaConfig.USE_MOCK_DATA) {
            return MockDataStore.findAllRoles();
        }
        EntityManager em = JpaConfig.getEntityManager();
        try {
            String jpql = "SELECT r FROM UserRole r ORDER BY r.roleId ASC";
            TypedQuery<UserRole> query = em.createQuery(jpql, UserRole.class);
            return query.getResultList();
        } finally {
            em.close();
        }
    }
}


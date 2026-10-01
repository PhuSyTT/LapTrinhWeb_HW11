package vn.iotstar.service.impl;

import java.util.List;
import vn.iotstar.dao.IUserRoleDao;
import vn.iotstar.dao.impl.UserRoleDaoImpl;
import vn.iotstar.entity.UserRole;
import vn.iotstar.service.IUserRoleService;

public class UserRoleServiceImpl implements IUserRoleService {
    private IUserRoleDao userRoleDao = new UserRoleDaoImpl();

    @Override
    public UserRole findById(int id) {
        return userRoleDao.findById(id);
    }

    @Override
    public UserRole findByName(String name) {
        return userRoleDao.findByName(name);
    }

    @Override
    public List<UserRole> findAll() {
        return userRoleDao.findAll();
    }
}

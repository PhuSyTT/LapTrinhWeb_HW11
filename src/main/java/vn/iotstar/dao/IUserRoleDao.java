package vn.iotstar.dao;

import java.util.List;
import vn.iotstar.entity.UserRole;

public interface IUserRoleDao {
    UserRole findById(int id);
    UserRole findByName(String name);
    List<UserRole> findAll();
}

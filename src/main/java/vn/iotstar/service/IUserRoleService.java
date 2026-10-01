package vn.iotstar.service;

import java.util.List;
import vn.iotstar.entity.UserRole;

public interface IUserRoleService {
    UserRole findById(int id);
    UserRole findByName(String name);
    List<UserRole> findAll();
}

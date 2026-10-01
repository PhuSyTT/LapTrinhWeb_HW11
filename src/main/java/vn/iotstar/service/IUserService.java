package vn.iotstar.service;

import java.util.List;
import vn.iotstar.entity.User;

public interface IUserService {
    User login(String usernameOrEmail, String password);
    User findById(int id);
    User findByUsername(String username);
    User findByEmail(String email);
    List<User> findAll();
    void insert(User user);
    void update(User user);
    void delete(int id) throws Exception;
    boolean checkExistEmail(String email);
    boolean checkExistUsername(String username);
    boolean register(String username, String email, String fullname, String password, String phone);
    boolean activateAccount(String email, String otpCode);
    boolean resendOtp(String email);
}

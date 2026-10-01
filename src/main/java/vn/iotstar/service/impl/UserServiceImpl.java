package vn.iotstar.service.impl;

import java.util.List;
import java.util.Random;
import vn.iotstar.dao.IUserDao;
import vn.iotstar.dao.IUserRoleDao;
import vn.iotstar.dao.impl.UserDaoImpl;
import vn.iotstar.dao.impl.UserRoleDaoImpl;
import vn.iotstar.entity.User;
import vn.iotstar.entity.UserRole;
import vn.iotstar.service.IUserService;
import vn.iotstar.utils.EmailUtils;

public class UserServiceImpl implements IUserService {
    private IUserDao userDao = new UserDaoImpl();
    private IUserRoleDao userRoleDao = new UserRoleDaoImpl();

    @Override
    public User login(String usernameOrEmail, String password) {
        User user = userDao.findByUsernameOrEmail(usernameOrEmail);
        if (user != null && password != null && password.equals(user.getPassword())) {
            // Check status (1: Active, 0: Pending/Inactive)
            if (user.getStatus() != null && user.getStatus() == 1) {
                return user;
            }
        }
        return null;
    }

    @Override
    public User findById(int id) {
        return userDao.findById(id);
    }

    @Override
    public User findByUsername(String username) {
        return userDao.findByUsername(username);
    }

    @Override
    public User findByEmail(String email) {
        return userDao.findByEmail(email);
    }

    @Override
    public List<User> findAll() {
        return userDao.findAll();
    }

    @Override
    public void insert(User user) {
        userDao.insert(user);
    }

    @Override
    public void update(User user) {
        userDao.update(user);
    }

    @Override
    public void delete(int id) throws Exception {
        userDao.delete(id);
    }

    @Override
    public boolean checkExistEmail(String email) {
        return userDao.checkExistEmail(email);
    }

    @Override
    public boolean checkExistUsername(String username) {
        return userDao.checkExistUsername(username);
    }

    @Override
    public boolean register(String username, String email, String fullname, String password, String phone) {
        if (checkExistUsername(username) || checkExistEmail(email)) {
            return false;
        }

        // Generate 6 digit OTP
        String otpCode = String.format("%06d", new Random().nextInt(999999));

        User user = new User();
        user.setUsername(username);
        user.setEmail(email);
        user.setFullname(fullname);
        user.setPassword(password);
        user.setPhone(phone);
        user.setCode(otpCode);
        user.setStatus(0); // 0 = Chưa kích hoạt, 1 = Đã kích hoạt

        // Default role is USER (roleId = 3)
        UserRole userRole = userRoleDao.findById(3);
        if (userRole == null) {
            userRole = userRoleDao.findByName("USER");
        }
        user.setRole(userRole);

        userDao.insert(user);

        // Send OTP via email in async or sync
        try {
            EmailUtils.sendOtpEmail(email, otpCode, fullname);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return true;
    }

    @Override
    public boolean activateAccount(String email, String otpCode) {
        User user = userDao.findByEmail(email);
        if (user != null && user.getCode() != null && user.getCode().trim().equalsIgnoreCase(otpCode.trim())) {
            user.setStatus(1); // Activate
            user.setCode(null); // Clear OTP
            userDao.update(user);
            return true;
        }
        return false;
    }

    @Override
    public boolean resendOtp(String email) {
        if (email == null || email.trim().isEmpty()) {
            return false;
        }
        User user = userDao.findByEmail(email.trim());
        if (user != null) {
            String newOtp = String.format("%06d", new Random().nextInt(999999));
            user.setCode(newOtp);
            userDao.update(user);
            try {
                EmailUtils.sendOtpEmail(email.trim(), newOtp, user.getFullname());
            } catch (Exception e) {
                e.printStackTrace();
            }
            return true;
        }
        return false;
    }
}

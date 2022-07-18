package com.whut.service.impl;

import com.whut.dao.IUserDao;
import com.whut.pojo.User;
import com.whut.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 陈爽
 */
@Service("userService")
public class UserServiceImpl implements IUserService {

    @Autowired
    private IUserDao iUserDao;

    @Override
    public boolean userLogin(User user) {
        String username = user.getUsername();
        String userpwd = user.getUserpwd();
        User User= iUserDao.findUserByName(username);
         if(User!=null){
             String userpwdDB = User.getUserpwd();
             return userpwd.equals(userpwdDB);
         }
         return false;
    }

    @Override
    public boolean isUserExist(String username){
        User User= iUserDao.findUserByName(username);
        return User != null;
    }
    @Override
    public boolean isPwdTrue(String username, String userpwd){
        User User= iUserDao.findUserByName(username);
        if(User != null){
            return User.getUserpwd().equals(userpwd);
        }
        return false;
    }

    @Override
    public boolean addUser(User user){
        iUserDao.addUser(user);
        return iUserDao.findUserByName(user.getUsername())!=null;
    }

    @Override
    public User getUserByName(String username){
        return iUserDao.findUserByName(username);
    }

    @Override
    public void updateUser(User user){
        iUserDao.updateUser(user);
    }

    @Override
    public List<User> findAll() {
        return iUserDao.findAll();
    }

    @Override
    public List<User> searchAll(String username){
        return iUserDao.searchAll("%"+username+"%");
    }


    @Override
    public boolean delUser(String username){
        iUserDao.deleteUserByName(username);
        return iUserDao.findUserByName(username)==null;
    }

}

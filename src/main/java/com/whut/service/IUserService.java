package com.whut.service;

import com.whut.pojo.User;

import java.util.List;

public interface IUserService {
    public boolean userLogin(User user);

    public boolean isUserExist(String username);

    public boolean isPwdTrue(String username,String userpwd);

    public boolean addUser(User user);

    public User getUserByName(String username);

    public void updateUser(User user);

    public List<User> findAll();

    public boolean delUser(String username);

    public  List<User> searchAll(String username);
}

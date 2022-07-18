package com.whut.dao;


import com.whut.pojo.User;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IUserDao {

    @Select("select * from user_info where username=#{username}")
    public User findUserByName(String username);

    @Insert("insert into user_info(`username`,`userpwd`,`email`,`balance`,`birthday`,`nickname`) values(#{username},#{userpwd},#{email},#{balance},#{birthday},#{nickname})")
    public void addUser(User user);

    @Delete("delete from user_info where username=#{username}")
    public void deleteUserByName(String username);

    @Update("update user_info set username=#{username},userpwd=#{userpwd},email=#{email},balance=#{balance},birthday=#{birthday},nickname=#{nickname} where username=#{username}")
    public void updateUser(User user);

    @Select("select * from user_info")
    public List<User> findAll();

    @Select("select * from user_info where username like #{username}")
    public List<User> searchAll(String username);

}

package com.whut.controller;

import com.whut.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Objects;

@RestController
public class AjaxController {

    @Autowired
    private IUserService userService;

//    @RequestMapping(name="a",produces = "application/json; charset=utf-8")
     @RequestMapping("a")
     public String ajax(String username,String userpwd) {
        String msg = "";
        //模拟数据库中存在数据
        if (username!=null){
            if (userService.isUserExist(username)){
                msg = "OK";
            }else {
                msg = "FIND_ERR";
            }
        }
        if (userpwd!=null){
            if (userService.isPwdTrue(username,userpwd)){
                msg = "OK";
            }else {
                msg = "PWD_ERR";
            }
        }
        //由于@RestController注解，将msg转成json格式返回
        return msg;
    }

    @RequestMapping(value = "deluser")
    public String deluser(String username){
        if(userService.delUser(username)){
            return "OK";
        }else{
            return "ERR";
        }
    }

    @RequestMapping("userchangepwd")
    public String userchangepwd(String username,String email) {
        String msg = "";
        //模拟数据库中存在数据
        if (username!=null){
            if (userService.isUserExist(username)){
                if(Objects.equals(email, userService.getUserByName(username).getEmail())) {
                    msg="OK";
                }else{
                    msg = "EMAIL_ERR";
                }
            }
            else {
                msg = "FIND_ERR";
            }
        }
        return msg;
    }

    @RequestMapping("usersign")
    public String usersign(String username) {
        String msg = "";
        //模拟数据库中存在数据
        if (username!=null){
            if (userService.isUserExist(username)){
               msg= "EXIST";
            }
            else {
                msg = "OK";
            }
        }else{
            msg="NULL";
        }
        return msg;
    }


}

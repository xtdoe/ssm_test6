package com.whut.controller;

import com.alibaba.fastjson.JSONArray;
import com.whut.pojo.User;
import com.whut.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class UsersController {

    @Autowired
    private IUserService userService;

    @RequestMapping("userInfo/{username}")
    public String userInfo(@PathVariable String username, Model model) {
        model.addAttribute("userS", userService.getUserByName(username));
        model.addAttribute("userT", datechange(userService.getUserByName(username).getBirthday()));
        return "userInfo";
    }

    @RequestMapping("userManage")
    public String userManage() {
        return "userManage";
    }

    @RequestMapping("userInfodo")
    public String userInfodo(User user, Model model) {
        userService.updateUser(user);
        model.addAttribute("userS", user);
        model.addAttribute("userT", datechange(user.getBirthday()));
        return "userInfo";
    }

    @RequestMapping("userInfodoM")
    public String userInfodoM(User user, Model model) {
        userService.updateUser(user);
        return "userManage";
    }


    @RequestMapping("userPwddo")
    public String userPwddo(User user, Model model) {
        User userDB = userService.getUserByName(user.getUsername());
        if(userDB!=null){
            userDB.setUserpwd(user.getUserpwd());
            userService.updateUser(userDB);
        }
        return "userInfo";
    }

    @RequestMapping("findAll/{username}")
    public String findAll(Model model,@PathVariable String username) {
        List<User> users = userService.findAll();
        List<String> usert = new ArrayList<String>();
        model.addAttribute("users", users);
        for ( User user:users){
            usert.add(datechange(user.getBirthday()));
        }
        model.addAttribute("userT", usert);
        model.addAttribute("usernow",userService.getUserByName(username));
        return "userManage";
    }



    @RequestMapping("findAllJSON")
    @ResponseBody
    public String findAllJSON(@RequestParam(required = false ,defaultValue = "") String name) {
        List<User> users = userService.searchAll(name);
        String s =" { \"code\": 0, \"msg\": \"\", \"count\":  " ;
        s+=users.size();
        s+=", \"data\":";
        s +=dataChange(users);
        s+="}";
        return s;
    }

    @RequestMapping(value = "findone/{p}")
    public String findone(@PathVariable String p, Model model){
            model.addAttribute("user",userService.getUserByName(p));
            return "userManage";
    }


    public String datechange(Date date) {
        Date time = date;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String timeFormat = sdf.format(time);
        return timeFormat;
    }

    public static String dataChange(List<User> list) {
        JSONArray JSON = new JSONArray();
        List<User> userList =list;
        return JSON.toJSONString(userList);
    }
}
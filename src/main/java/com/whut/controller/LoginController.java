package com.whut.controller;

import com.whut.pojo.User;
import com.whut.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

    @Autowired
    private IUserService userService;

    @RequestMapping(value = "/")
    public ModelAndView loginstart(){
        ModelAndView modol = new ModelAndView("start");
        return modol;
    }

    @RequestMapping(value = "login")
    public ModelAndView login(){
        ModelAndView modol = new ModelAndView("start");
        return modol;
    }

    @RequestMapping(value = "logindo")
    public String logindo(User user, Model model){
        if(userService.userLogin(user)) {
            model.addAttribute("users",userService.getUserByName(user.getUsername()));
            return "main";
        }
        else {
            return "start";
        }
    }

    @RequestMapping(value = "sign")
    public ModelAndView sign(){
        ModelAndView modol = new ModelAndView("sign");
        return modol;
    }


    @RequestMapping(value = "signdo")
    public ModelAndView signdo(User user, Model model){
        ModelAndView modelAndView = new ModelAndView();
        if(userService.addUser(user)) {
            modelAndView.setViewName("start");
        }
        else {
            modelAndView.setViewName("sign");
        }
        return modelAndView;
    }

    @RequestMapping(value = "changepwd")
    public ModelAndView changepwd(){
        ModelAndView modol = new ModelAndView("changepwd");
        return modol;
    }

    @RequestMapping(value = "changepwddo")
    public ModelAndView changepwddo(User user){
        ModelAndView model = new ModelAndView("changepwd");
        User userDB= userService.getUserByName(user.getUsername());
        if(userDB!=null){
            userDB.setUserpwd(user.getUserpwd());
            userService.updateUser(userDB);
            model.setViewName("start");
        }else{
            model.setViewName("changepwd");
        }
        return model;
    }

}



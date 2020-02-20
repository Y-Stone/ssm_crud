package cn.stone.controller;

import cn.stone.domain.Msg;
import cn.stone.domain.User;
import cn.stone.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * @program: crud
 * @description: User控制器
 * @author: Stone
 * @create: 2020-02-20 13:09
 **/
@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public String loginUser(User user, HttpSession httpSession, Model model){
        User loginUser = userService.loginUser(user);
        if(loginUser == null){
            //用户名或密码错误
            model.addAttribute("msg", "账号或密码错误！");
            return "login";
        }else{
            /*登录成功！*/
            httpSession.setAttribute("LOGIN_USER", loginUser);
            return "list";
        }
    }

    /*退出登录*/
    @RequestMapping("/logout")
    @ResponseBody
    public Msg logout(HttpSession httpSession){
        /*清空session*/
        httpSession.invalidate();
        return Msg.success();
    }

    /*跳转登录页面*/
    @RequestMapping("/toLogin")
    public String toLogin(){
        return "login";
    }
}

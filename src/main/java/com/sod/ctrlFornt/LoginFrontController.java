package com.sod.ctrlFornt;


import com.sod.pojo.User;
import com.sod.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@RequestMapping("/login")
public class LoginFrontController {
    @Autowired
    private UserService userService;


    @RequestMapping("/toLogin")
    public String tomain() {
        //跳转到登录页面
        return "/front/login";
    }

    @RequestMapping("/doLogin")

    public String  Login(String username, String password, Model model, HttpSession session) {
        //判断用户名和密码是否为空
        if(StringUtils.isEmpty(username) || StringUtils.isEmpty(password)){
            //表示用户名和密码为空
            model.addAttribute("errorInfo", "用户名或密码不能为空");

            //跳转到用户登陆页面
            return "/front/login";
        }

//        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(16);
//        username = encoder.encode(username);
//        User user=userService.findUserByUserNameAndPassword(username,password);
//        if(user!=null&&user.getState().equals("1")){
//            //同时找到名字和密码
//            //跳转到主页面
//            session.setAttribute("user",user);
//            return "/front/index";
//        }
        User user = userService.findUserByUserNameEmailTel(username);
        if(user!=null&&user.getState().equals("0")){
            model.addAttribute("errorInfo", "该用户未激活");

            //跳转到用户登陆页面
            return "/front/login";
        }
//        model.addAttribute("errorInfo", "用户名或密码错误");

        session.setAttribute("user",user);
        return "/front/index";

    }

    /**
     * 判断用户是否被禁用
     * @param name
     * @param
     */
    @RequestMapping("/checkName")
    public void checkName(String name, HttpServletResponse response,HttpSession session) throws IOException {
        User user1 = userService.findUserByName(name);
        if (user1 != null) {
            if (user1.getState().equals("0")) {
                session.removeAttribute("user");
               response.getWriter().write("该用户暂未激活");
            }

        }

    }

}

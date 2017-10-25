package com.sod.ctrlBacked;


import com.sod.pojo.User;
import com.sod.pojo.UserAdmin;
import com.sod.service.UserAdminService;
import com.sod.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;


@Controller
@RequestMapping("/backed")
public class LoginBackConreoller {
    @Autowired
   private UserAdminService userAdminService;


    @RequestMapping("/login")
    public String  BackLogin() {




        return "/backed/login";
    }

    //后台退出登录页面，关闭seesion
    @RequestMapping("/loginOut")
    public String  BackLoginOut( HttpSession session) {


        session.removeAttribute("userAdmin");

        return "/backed/login";
    }

    //后台登录页面
   @RequestMapping("/toLogin")
    public String  Login(String username, String password, Model model, HttpSession session) {
        //判断用户名和密码是否为空
        if(StringUtils.isEmpty(username) || StringUtils.isEmpty(password)){
            //表示用户名和密码为空
            model.addAttribute("errorInfo", "用户名或密码不能为空");

            //跳转到用户登陆页面
            return "/backed/login";
        }
        UserAdmin userAdmin=userAdminService.findUserAdminByUserAdminNameAndPassword(username,password);
        if(userAdmin!=null&&userAdmin.getAdminState().equals("1")){
            //同时找到名字和密码
            //跳转到主页面
            session.setAttribute("userAdmin",userAdmin);
            return "redirect:/admin/index";
        }
        model.addAttribute("errorInfo", "用户名或密码错误");
        return "/backed/login";

    }

}

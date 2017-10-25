package com.sod.ctrlFornt;


import com.sod.exception.MsgException;
import com.sod.pojo.User;
import com.sod.service.UserService;
import com.sod.utils.MailUtil;
import com.sod.utils.SDKTestSendTemplateSMS;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Random;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/register")
    public String tomain(){

        return "/front/register";
    }

    /**
     * 注册用户
     * @param user
     * @param address
     * @param model
     * @return
     */

    @RequestMapping("/saveUser")
    public  String  saveUser(String verstr,User user, String address, Model model,HttpSession session) {
        //验证前台提交的数据
        System.out.println("verstr");
        String teleVer = (String)session.getAttribute("teleVer");
        if(StringUtils.isEmpty(verstr)){
            model.addAttribute("msg","请输入验证码");
            return "/front/register";
        }
        else if (StringUtils.isEmpty(teleVer)){
            model.addAttribute("msg","请发送验证码");
            return "/front/register";
        }
        else if (!verstr.equals(teleVer)) {
            model.addAttribute("msg","验证码错误!!!");
            return "/front/register";
        }

        try {
            user.checkData();
            User user2 = userService.findUserByName(user.getUsername());
            if (user2 == null) {
                BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(16);
                String password = encoder.encode(user.getPassword());
                user.setPassword(password);
                userService.saveUser(user,address);
                MailUtil.activateMail(user);
                session.removeAttribute("teleVer");
                return "/front/transfer1";
            }
            model.addAttribute("msg","该用户已经存在");
            return "/front/register";
        } catch (MsgException e) {
            e.printStackTrace();
            model.addAttribute("msg",e.getMessage());
            return "/front/register";

        }

    }

    /**
     * 邮箱中的连接点击后
     * @return
     */
    @RequestMapping("/activatEmail")
    public String mailboxVerification(String userId, HttpSession session){
        //设置数据库user表中是否激活 设为已激活
        String state = "1";
        userService.updateState(state,userId);
        User user = userService.findUserByUserId(userId);
        return "/front/transfer2";
    }

    /**
     * 判断用户名是否存在
     * @param name
     * @param response
     * @throws IOException
     */

    @RequestMapping(value = "/checkUserName", produces="text/plain;charset=UTF-8")
    @ResponseBody
    public void checkUserName(String name, HttpServletResponse response) throws IOException {
        User user2 = userService.findUserByName(name);
        if (user2 != null) {
                response.getWriter().write("该用户已存在");
        }
    }

    /**
     * 用户提交建议
     * 现在只为重定向回主页，数据库具体没实现建议收集
     * @return
     */
    @RequestMapping("/submitAdvise")
    public String submitAdvise(){
        return "/front/transfer3";
    }

    @RequestMapping("/SendVer")
    public void SendVer(String tele,HttpSession session){
        Random random = new Random();
        String sendId ="";
        for (int i=0;i<6;i++){
            sendId=sendId+random.nextInt(9);
        }
        session.setAttribute("teleVer",sendId);
        SDKTestSendTemplateSMS.test(tele,sendId);
    }

    /**
     *
     */
    @RequestMapping("/checkUpdatePassword")
    public String toUpdatePassword(String username,Model model){
        User user = userService.findUserByName(username);
        if(user==null ){
            model.addAttribute("errorInfo","用户名不存在");
            return "forward:/login/toLogin";
        }
        if( StringUtils.isEmpty(username)){
            model.addAttribute("errorInfo","请输入用户名");
            return "forward:/login/toLogin";
        }
        MailUtil.ForgetPassword(user);
        return "redirect:/home/index";
    }


    @RequestMapping("/toUpdatePassword")
    public String toUpdatePassword(Model model,String userId) {
        model.addAttribute("userId",userId);
        return "/front/updatePassword";
    }

    @RequestMapping("/updatePassword")
    public String updatePassword(String password,String userId){
        userService.updatePasswordById(new BCryptPasswordEncoder().encode(password),userId);
        return "redirect:/login/toLogin";
    }
}

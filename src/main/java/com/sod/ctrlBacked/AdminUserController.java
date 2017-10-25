package com.sod.ctrlBacked;

import com.sod.pojo.*;
import com.sod.service.*;
import net.minidev.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 后台 会员管理
 */
@Controller
@RequestMapping("/admin")
public class AdminUserController {
    /**
     * 商品
     */
    @Autowired
    private ProductService productService;
    /**
     * 订单
     */
    @Autowired
    private OrderListService orderListService;
    /**
     * 用户
     */
    @Autowired
    private UserService userService;
    /**
     * 管理员
     */
    @Autowired
    private UserAdminService userAdminService;

    @Autowired
    private OrderService orderService;

    @RequestMapping("/index")
    public String toAdmin(){
        return "/backed/index";
    }

    @RequestMapping("/home")
    public String toHome(Model model){
        //用户数量
        int userCount = userService.findUserCount();
        //订单数量
        int orderCount = orderListService.findOrderCount();
        //商品数量
        int prodCount = productService.findProdCount();
        //交易总金额
        Double allMoney = orderListService.findAllMoney();
        model.addAttribute("userCount",userCount);
        model.addAttribute("orderCount",orderCount);
        model.addAttribute("prodCount",prodCount);
        model.addAttribute("allMoney",allMoney);

        return "/backed/home";
    }


    /**
     * 会员管理-会员列表
     * @return
     */
    @RequestMapping("/userList")
    public String toUserList(Model model){
        List<User> userList = userService.findAll();
        model.addAttribute("userList",userList);

        model.addAttribute("count",userList.size());
        return "/backed/user_list";
    }

    /**
     * 会员管理-会员记录管理
     * @return
     */
    @RequestMapping("/integration")
    public String toIntegration(){
        return "/backed/integration";
    }


    /**
     * 后台用户修改ajax实现
     * @return
     */
    @RequestMapping("/updateUser")
    public String updateUser(String userInfo,String gender,String state,String userId){
        userService.updateUserAndUInfo(userInfo,gender,userId);
        return "redirect:/admin/userList";
    }

    /**
     * 更改用户状态
     * @return
     */
    @RequestMapping("/updateState")
    public String updateState(String userId,String state){
        userService.updateState(state,userId);
        return "redirect:/admin/userList";
    }

    /**
     * 用户删除(删除user表 还有userInfo表)
     * @return
     */
    @RequestMapping("/deleteUser")
    public String deleteUser(String userId){
        userService.deleteUser(userId);
        return "redirect:/admin/userList";
    }

    @RequestMapping("/findUserByUserId")
    @ResponseBody
    public String findUserByUserId(String userId){

        User user = userService.findUserByUserId(userId);
        UserInfo userInfo = userService.fundUserInfoByUserId(userId);
        Map userMap = new HashMap();
        userMap.put("user",user);
        userMap.put("userInfo",userInfo);
        String str = JSONObject.toJSONString(userMap);
        System.out.println("str");

        return str;
    }
    /**
     * 菜品管理-菜品列表
     * @return
     */
    @RequestMapping("/prodList")
    public String toProductsList(Model model){
        List<Product> productList = productService.findAllProd();
        model.addAttribute("ProductNums",productList.size());
        model.addAttribute("productList",productList);
        return "/backed/Products_List";
    }

    /**
     * 交易管理-交易信息
     * @return
     */
    @RequestMapping("/transaction")
    public String toTransaction(Model model){
        List<OrderList> orderLists = orderListService.findAll();
        model.addAttribute("orderLists",orderLists);
        return "/backed/transaction";
    }

    /**
     * 交易管理-订单管理
     * @return
     */
    @RequestMapping("/orderMge")
    public String toOrderform(Model model){
        //查找所有订单的所有信息
        List<OrderInfo> orderInfoList = orderService.findOrderInfoList();
        //传递订单信息
        model.addAttribute("orderInfoList",orderInfoList);
        //返回到订单管理页面
        return "/backed/Orderform";
    }
    /**
     * 管理员管理-管理员列表
     * @return
     */
    @RequestMapping("/adminList")
    public String toAdminCompetence(Model model){
        List<UserAdmin> userAdminList = userAdminService.findAll();
        model.addAttribute("userAdminList",userAdminList);
        return "/backed/admin_Competence";
    }

    /**
     * ajax新增管理员
     * @param userAdmin
     * @param adminState
     */
    @RequestMapping("/saveUserAdmin")
    public String saveuserAdmin(String userAdmin,String adminState){
        userAdminService.saveuserAdmin(userAdmin,adminState);
        return "redirect:/admin/adminList";
    }
}

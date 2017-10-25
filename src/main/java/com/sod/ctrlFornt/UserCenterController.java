package com.sod.ctrlFornt;



import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.util.StringUtils;
import com.sod.pojo.*;
import com.sod.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/front/userCenter")
public class UserCenterController {

    @Autowired
    private UserService userService;


    @RequestMapping("/update")
    public String selectByPrimaryKey(User user,Model model,HttpSession session){

        User oldUser = (User)session.getAttribute("user");
        if(StringUtils.isEmpty(user.getPassword())){
            user.setPassword(oldUser.getPassword());
        } else {
            String password = new BCryptPasswordEncoder().encode(user.getPassword());
            user.setPassword(password);
        }
        if(StringUtils.isEmpty(user.getEamil())){
            user.setEamil(oldUser.getEamil());
        }
        if(StringUtils.isEmpty(user.getTelephone())){
            user.setTelephone(oldUser.getTelephone());
        }
        if(!StringUtils.isEmpty(user.getInfo().getGender())){
            user.getInfo().setUserInfoId(oldUser.getUserId());
            userService.updateUserInfo(user.getInfo());
        }
        userService.updateByPrimaryKeySelective(user);
        User newUser = userService.selectByPrimaryKey(oldUser.getUserId());
        session.setAttribute("user",newUser);
       
        return"redirect:/front/userCenter/toIndex";
    }

    @RequestMapping("/addCreate")
    public String addCreate() {
        return "/front/userCenter/addCreate";
    }

    @RequestMapping("/toAddress")
    public String toAddress(Model model,HttpSession session){

        User user = (User)session.getAttribute("user");


       String userId = user.getUserId();

        List<UserAddress> userAddressList = userService.selectByUserId(userId);
        model.addAttribute("userAddressList",userAddressList);
        return "/front/userCenter/address";
    }

    @RequestMapping("/addAddress")
    public String addAddress(UserAddress userAddress) {
        String addId = UUID.randomUUID().toString();
        userAddress.setAddId(addId);
        if("1".equals(userAddress.getAddState())){
            userService.updateAddressState(userAddress.getAddId());
        }
        userService.insertUserAddress(userAddress);

        return "redirect:/front/userCenter/toAddress";
    }

    @RequestMapping("/toUpdateAddress")
    public String toUpdateAddress(@RequestParam("addId") String addId, Model model) {


        UserAddress userAddress = userService.selectAddressByAddId(addId);
        model.addAttribute("userAddress",userAddress);
        return "/front/userCenter/addUpdate";
    }

    @RequestMapping("/toOrderList")
    public String toOrderList(Model model,HttpSession session){
        User user = (User)session.getAttribute("user");
        List<OrderList> orderLists = userService.findOrderList(user.getUserId());
        model.addAttribute("orderLists",orderLists);

        return "/front/userCenter/orderList";
    }

    @RequestMapping("/toOrderInfo")
    public String toOrderInfo(@RequestParam("orderId")String orderId,@RequestParam("orderAddress")String orderAddress,Model model){
        List<OrderItem> orderItemList = userService.selectOrderItemListByOrderId(orderId);
        model.addAttribute("orderItemList",orderItemList);
        model.addAttribute("orderAddress",orderAddress);
        return "/front/userCenter/order";
    }

    @RequestMapping("/toIndex")
    public String toIndex(HttpSession session,Model model) {
        User user = (User)session.getAttribute("user");
        UserInfo userInfo = userService.findUserInfo(user.getUserId());
        model.addAttribute("userInfo",userInfo);
        return "/front/userCenter/index";
    }

    @RequestMapping("/toFavor")
    public String toFavor(HttpSession session,Model model){
        User user = (User)session.getAttribute("user");
        List<Favor> favorList = userService.findFavorList(user.getUserId());
        model.addAttribute("favorList",favorList);
        return "/front/userCenter/favor";
    }

    @RequestMapping("/toDeleteAddress")
    public String toDeleteAddress(@RequestParam("addId") String addId){

        userService.deleteAddressByAddId(addId);

        return "redirect:/front/userCenter/toAddress";
    }

    @RequestMapping("/updateAddress")
    public String updateAddress(UserAddress userAddress) {
        if("1".equals(userAddress.getAddState())){
            userService.updateAddressState(userAddress.getAddId());
        }
        userService.updateAddress(userAddress);

        return "redirect:/front/userCenter/toAddress";
    }


    @RequestMapping("/logout")
    public String logout(HttpSession session){

        session.removeAttribute("user");
        return "redirect:/index";
    }
}

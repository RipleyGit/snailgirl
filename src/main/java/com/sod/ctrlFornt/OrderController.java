package com.sod.ctrlFornt;


import com.sod.pojo.*;
import com.sod.service.OrderService;
import com.sod.service.UserService;
import com.sod.utils.PaymentUtils;
import com.sod.utils.PropUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/order")
public class OrderController {
    @Autowired
    private OrderService orderService;

    @Autowired
    private UserService userService;
   /*
     跳转到订单界面
    */
    @RequestMapping("/toOrder")
    public String toOrder(HttpSession session,Model model){
        User user = (User) session.getAttribute("user");
        //地址列表
        List<UserAddress> addressList = userService.selectAddressByUserId(user.getUserId());

        List<DCRemark> dcRemarkList = userService.selectRemarkByUserId(user.getUserId());

        Map<Product, Integer> map = (Map<Product, Integer>) session.getAttribute("cartMap");
        Double totalMoney = 0.0;
        for (Product product : map.keySet()) {
            totalMoney = totalMoney +  Double.valueOf(product.getProdPrice())*map.get(product);
        }

        model.addAttribute("totalMoney",totalMoney);

        model.addAttribute("addressList", addressList);

        model.addAttribute("dcRemarkList", dcRemarkList);

        return "/front/order";
    }

    /**
     * 创建订单 及订单项中响应的信息
     * @param orderList
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("/createOrder")
    public String toCreateOrder(OrderList orderList,HttpSession session,Model model){

        User user = (User) session.getAttribute("user");

        String orderId = UUID.randomUUID().toString();
        //设置订单用户ID
        orderList.setUserId(user.getUserId());
        //设置订单ID
        orderList.setOrderId(orderId);
        //订单状态为 下单中
        orderList.setOrderState("1");
        //支付状态设置为待付款
        orderList.setPayState("0");
        //拼接下单时间
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String dateStr = sdf.format(new Date())+" "+orderList.getOrderTime();
        orderList.setOrderTime(dateStr);
        //定义初始总金额
        Double totalMoney = 0.0;
        //订单项
        List<OrderItem> list = new ArrayList<>();
        Map<Product, Integer> map = (Map<Product, Integer>) session.getAttribute("cartMap");
        for (Product product : map.keySet()) {
            //封装订单项信息
            OrderItem  orderItem = new OrderItem();
            orderItem.setOrderId(orderId);
            orderItem.setProdId(product.getProdId());
            Integer buyNum = map.get(product);
            orderItem.setBuyNum(buyNum.toString());
            list.add(orderItem);
            //统计总金额
            totalMoney += Double.valueOf(product.getProdPrice())*buyNum;
        }
        //将总计金额录入
        orderList.setTotalMoney(totalMoney.toString());

        //添加订单到数据库
        orderService.insertOrder(orderList,list);

        //清空购物车
        map.clear();

        model.addAttribute("order",orderList);
        model.addAttribute("totalMoney",totalMoney);

        return "/front/pay";
    }

}

package com.sod.service;

import com.sod.mapper.OrderItemMapper;
import com.sod.mapper.OrderListMapper;
import com.sod.pojo.OrderInfo;
import com.sod.pojo.OrderItem;
import com.sod.pojo.OrderList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import java.util.ArrayList;
import java.util.List;
@Service
public class OrderServiceImpl implements  OrderService{
    @Autowired
    private OrderItemMapper orderItemMapper;
    @Autowired
    private OrderListMapper orderListMapper;

    @Autowired
    private WebSocket webSocket;

    //根据id查找订单
    @Override
    public OrderList findOrderById(String oid) {
        return orderListMapper.findOrderById(oid);
    }
    //获取所有订单的所有信息
    @Override
    public List<OrderInfo> findOrderInfoList() {
        //创建一个含有所有订单信息的list
        List<OrderInfo> orderInfoList = new ArrayList<OrderInfo>();
        //查找所有订单
        List<OrderList> orderList = orderListMapper.findAll();
        //遍历订单获取相应的订单项
        for (OrderList order:orderList) {
            //创建一个含有所有订单对象
            OrderInfo orderInfo = new OrderInfo();
            //为对象注入订单信息
            orderInfo.setOrderList(order);
            //根据订单id查找所有订单项
            List<OrderItem> orderItemList = orderItemMapper.findOrderItemsById(order.getOrderId());
            //为对象注入所有的对象对单项
            orderInfo.setOrderItems(orderItemList);
            orderInfoList.add(orderInfo);
        }
        return orderInfoList;
    }

    @Override
    @Transactional(isolation = Isolation.DEFAULT, propagation = Propagation.REQUIRED)
    public void insertOrder(OrderList orderList, List<OrderItem> list) {

        try {
            //将订单插入订单列表中
            orderListMapper.insertOrderList(orderList);
//            int b=1/0;
            //将订单项遍历插入订单项列表中
            for (OrderItem orderItem : list) {
                orderItemMapper.insert(orderItem);
            }

            webSocket.sendMessage(orderList.getOrderId());

        } catch (Exception e) {
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            e.printStackTrace();

        }


    }

    @Override
    public void updateOrderPayState(String r6_order, int i) {
        orderListMapper.updateOrderPayState(r6_order,i);
    }
}

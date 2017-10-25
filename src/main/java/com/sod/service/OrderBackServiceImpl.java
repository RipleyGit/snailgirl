package com.sod.service;

import com.sod.mapper.OrderItemMapper;
import com.sod.mapper.OrderListMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

@Service
public class OrderBackServiceImpl implements OrderBackService{
    @Autowired
    public OrderListMapper orderListMapper;
    @Autowired
    public OrderItemMapper orderItemMapper;
    /*
        根据订单id删除订单和订单项
     */
    @Override
    @Transactional(isolation = Isolation.DEFAULT, propagation = Propagation.REQUIRED)
    public void deleteOrderById(String[] orderIds) {
        orderItemMapper.deleteOrderItemsByOrderId(orderIds);
        orderListMapper.deleteOrderListByOrderId(orderIds);

    }

    @Override
    @Transactional(isolation = Isolation.DEFAULT, propagation = Propagation.REQUIRED)
    public void updateOrderState(String orderId,String state) {
        orderListMapper.updateOrderState(orderId,state);
    }
}

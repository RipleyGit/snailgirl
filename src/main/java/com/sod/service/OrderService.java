package com.sod.service;

import com.sod.pojo.OrderInfo;
import com.sod.pojo.OrderItem;
import com.sod.pojo.OrderList;
import com.sod.pojo.Product;

import java.util.List;
import java.util.Map;

public interface OrderService {

    OrderList findOrderById(String oid);

    List<OrderInfo> findOrderInfoList();

    void insertOrder(OrderList orderList, List<OrderItem> list);

    void updateOrderPayState(String r6_order, int i);
}

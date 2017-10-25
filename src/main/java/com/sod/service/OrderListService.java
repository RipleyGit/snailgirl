package com.sod.service;

import com.sod.pojo.OrderList;

import java.util.List;

public interface OrderListService {
    public List<OrderList> findAll();

    int findOrderCount();

    Double findAllMoney();

    List<Integer> getOrderState(String s);

    List<List<String>> getExcleList(String s);
}

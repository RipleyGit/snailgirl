package com.sod.mapper;

import com.sod.pojo.OrderList;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderListMapper {
    int deleteByPrimaryKey(String orderId);

    int insert(OrderList record);

    int insertSelective(OrderList record);

    OrderList selectByPrimaryKey(String orderId);

    int updateByPrimaryKeySelective(OrderList record);

    int updateByPrimaryKey(OrderList record);

    List<OrderList> selectByUserId(String userId);

    void insertOrderList(OrderList orderList);

    OrderList findOrderById(String oid);


    List<OrderList> findAll();

    int findOrderCount();

    List<String> findAllMoney();

    List<OrderList> findOrderCountByDate(String yearTime, String state);

    void deleteOrderListByOrderId(String[] orderIds);

    void updateOrderState(@Param("orderId") String orderId,@Param("state") String state);

    void updateOrderPayState(@Param("orderId") String r6_order,@Param("state")int i);
}
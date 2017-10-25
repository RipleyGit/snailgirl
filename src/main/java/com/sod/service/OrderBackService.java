package com.sod.service;

public interface OrderBackService {
    public void deleteOrderById(String[] orderIds) ;

    void updateOrderState(String orderId,String state);
}

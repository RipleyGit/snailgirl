package com.sod.service;

import com.sod.mapper.OrderListMapper;
import com.sod.pojo.OrderList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
@Service
public class OrderListServiceImpl implements OrderListService{
    @Autowired
    private OrderListMapper orderListMapper;

    @Override
    public List<OrderList> findAll() {
        return orderListMapper.findAll();
    }

    @Override
    public int findOrderCount() {
        return orderListMapper.findOrderCount();
    }

    @Override
    public Double findAllMoney() {
        List<String> list = orderListMapper.findAllMoney();

        Double dMoney = new Double(0);
        for (String s : list) {
            dMoney = + Double.valueOf(s);
        }

        return dMoney;
    }

    @Override
    public List<Integer> getOrderState(String state) {
        List<Integer> list = new ArrayList<>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
        String dateStr = sdf.format(new Date());
        for (int i=1;i<=12;i++){
            int len=String.valueOf(i).length();
            String yearTime = dateStr+"-"+ ("0" + String.valueOf(i)).substring(len-1,len+1)+"%";
            Integer count = orderListMapper.findOrderCountByDate(yearTime,state).size();
            list.add(count);
        }
        return list;
    }

    @Override
    public List<List<String>> getExcleList(String state) {
        List<List<String>> listList = new ArrayList<List<String>>();

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
        String dateStr = sdf.format(new Date());
        for (int i=1;i<=12;i++) {
            List<String> list = new ArrayList<>();
            list.add(i+"月");
            int len = String.valueOf(i).length();
            String yearTime = dateStr + "-" + ("0" + String.valueOf(i)).substring(len - 1, len + 1) + "%";
            List<OrderList> oList = orderListMapper.findOrderCountByDate(yearTime,state);

            list.add(String.valueOf(oList.size()));
            Double tMoney = new Double(0);
            for (OrderList orderList : oList) {
                tMoney = + Double.valueOf(orderList.getTotalMoney());
            }
            list.add(String.valueOf(tMoney));

            listList.add(list);
        }
        return listList;
    }

}

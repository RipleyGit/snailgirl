package com.sod.mapper;

import com.sod.pojo.StockOrder;

public interface StockOrderMapper {
    int deleteByPrimaryKey(String stockId);

    int insert(StockOrder record);

    int insertSelective(StockOrder record);

    StockOrder selectByPrimaryKey(String stockId);

    int updateByPrimaryKeySelective(StockOrder record);

    int updateByPrimaryKey(StockOrder record);
}
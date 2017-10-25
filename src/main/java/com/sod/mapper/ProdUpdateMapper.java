package com.sod.mapper;

import com.sod.pojo.ProdUpdate;

public interface ProdUpdateMapper {
    int insert(ProdUpdate record);

    int insertSelective(ProdUpdate record);
}
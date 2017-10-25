package com.sod.mapper;

import com.sod.pojo.DCRemark;

public interface DCRemarkMapper {
    int deleteByPrimaryKey(String remarkId);

    int insert(DCRemark record);

    int insertSelective(DCRemark record);

    DCRemark selectByPrimaryKey(String remarkId);

    int updateByPrimaryKeySelective(DCRemark record);

    int updateByPrimaryKey(DCRemark record);
}
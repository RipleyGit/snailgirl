package com.sod.mapper;

import com.sod.pojo.UserInfo;

import java.util.Map;

public interface UserInfoMapper {
    int deleteByPrimaryKey(String userInfoId);

    int insert(UserInfo record);

    int insertSelective(UserInfo record);

    UserInfo selectByPrimaryKey(String userInfoId);

    int updateByPrimaryKeySelective(UserInfo record);

    int updateByPrimaryKey(UserInfo record);

    void updateUserAndUInfo(Map<String, String> map);

    void deleteUser(String userId);

    UserInfo fundUserInfoByUserId(String userId);
}
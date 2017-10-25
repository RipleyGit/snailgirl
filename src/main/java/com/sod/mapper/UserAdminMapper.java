package com.sod.mapper;

import com.sod.pojo.UserAdmin;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface UserAdminMapper {
    int deleteByPrimaryKey(String adminId);

    int insert(UserAdmin record);

    int insertSelective(UserAdmin record);

    UserAdmin selectByPrimaryKey(String adminId);

    int updateByPrimaryKeySelective(UserAdmin record);

    int updateByPrimaryKey(UserAdmin record);

    List<UserAdmin> findAll();

    UserAdmin findUserAdminByUserAdminNameAndPassword(@Param("username") String username,@Param("password") String password);

    void saveuserAdmin(Map<String, String> map);
}
package com.sod.mapper;

import com.sod.pojo.User;

import com.sod.pojo.DCRemark;
import com.sod.pojo.User;
import com.sod.pojo.UserAddress;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface UserMapper {
    int deleteByPrimaryKey(String userId);

    void insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(String userId);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    List<User> findUserList();

    //根据用户名查询用户真实信息
     User findUserByUserNameAndPassword(@Param("username") String username,@Param("password") String password);
     //根据用户名查找
    User findUserByUserName(@Param("username") String username);

    void updateState(@Param("state") String state,@Param("userId") String userId);

    List<User> findAll();

    int findUserCount();

	
    //根据用户ID查询用户使用过的地址
    List<UserAddress> selectAddressByUserId(String userId);

    /**
     * 根据用户ID查询用户使用过的备注
     * @param userId
     * @return
     */
    List<DCRemark> selectRemarkByUserId(String userId);
    
    void updateUserAndUInfo(Map<String, String> map);
    //通过userId删除user_s表中的数据
    void deleteUser(String userId);

    User findUserByUserId(String userId);

    void updatePasswordById(@Param("password") String password, @Param("userId") String userId);

    User findUserByUserNameEmailTel(String username);

    User findUserByUserNameToLogin(String username);
}
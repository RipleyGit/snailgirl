package com.sod.service;


import com.sod.mapper.*;
import com.sod.pojo.*;
import com.sod.mapper.UserAddressMapper;
import com.sod.mapper.UserInfoMapper;
import com.sod.mapper.UserMapper;
import com.sod.pojo.User;
import com.sod.pojo.UserAddress;
import com.sod.pojo.UserInfo;
import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * Created by LYJ on 2017/10/17.
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private OrderListMapper orderListMapper;
    @Autowired
    private OrderItemMapper orderItemMapper;
    @Autowired
    private FavorMapper favorMapper;
    @Autowired
    private UserInfoMapper userInfoMapper;
    @Autowired
    private UserAddressMapper userAddressMapper;
    @Override
    public List<User> findUserList() {
        return userMapper.findUserList();
    }

    @Override
    @Transactional(isolation = Isolation.DEFAULT, propagation = Propagation.REQUIRED)
    public void updateByPrimaryKeySelective(User user) {
        userMapper.updateByPrimaryKeySelective(user);
    }

    @Override
    public User selectByPrimaryKey(String userId) {
        return userMapper.selectByPrimaryKey(userId);
    }

    @Override
    public List<UserAddress> selectByUserId(String userId) {
        return userAddressMapper.selectByUserId(userId);
    }

    @Override
    @Transactional(isolation = Isolation.DEFAULT, propagation = Propagation.REQUIRED)
    public void insertUserAddress(UserAddress userAddress) {
        userAddressMapper.insertSelective(userAddress);
    }

    @Override
    @Transactional(isolation = Isolation.DEFAULT, propagation = Propagation.REQUIRED)
    public void updateAddress(UserAddress userAddress) {
        userAddressMapper.updateByPrimaryKeySelective(userAddress);
    }

    @Override
    @Transactional(isolation = Isolation.DEFAULT, propagation = Propagation.REQUIRED)
    public void updateAddressState(String addId) {
        userAddressMapper.updateAddressState(addId);
    }

    @Override
    public UserAddress selectAddressByAddId(String addId) {
        return userAddressMapper.selectByPrimaryKey(addId);
    }

    @Override
    @Transactional(isolation = Isolation.DEFAULT, propagation = Propagation.REQUIRED)
    public void deleteAddressByAddId(String addId) {
        userAddressMapper.deleteByPrimaryKey(addId);
    }

    @Override
    public List<OrderList> findOrderList(String userId) {
        return orderListMapper.selectByUserId(userId);
    }

    @Override
    public List<OrderItem> selectOrderItemListByOrderId(String orderId) {
        return orderItemMapper.selectOrderItemListByOrderId(orderId);
    }

    @Override
    public List<Favor> findFavorList(String userId) {
        return favorMapper.findFavorList(userId);
    }


    @Override
    @Transactional(isolation = Isolation.DEFAULT, propagation = Propagation.REQUIRED)
    public void saveUser(User user,String address) {

            String userId=UUID.randomUUID().toString();
            user.setState("0");
            user.setUserId(userId);
            userMapper.insert(user);

            UserAddress userAddress=new UserAddress();
            userAddress.setAddId(UUID.randomUUID().toString());
            userAddress.setUserId(userId);
            userAddress.setAddInfo(address);
            userAddress.setAddState("1");
            userAddressMapper.insert(userAddress);
            UserInfo userInfo=new UserInfo();
            userInfo.setUserInfoId(userId);
            userInfoMapper.insert(userInfo);




    }

    @Override
    public User findUserByUserNameAndPassword(String username, String password) {

        return userMapper.findUserByUserNameAndPassword(username,password);
    }

    @Override
    @Transactional(isolation = Isolation.DEFAULT, propagation = Propagation.REQUIRED)
    public User findUserByName(String username) {
        return userMapper.findUserByUserName(username);
    }


    @Override
    @Transactional(isolation = Isolation.DEFAULT, propagation = Propagation.REQUIRED)
    public void updateState(String state, String userId) {
        userMapper.updateState(state,userId);
    }

    @Override
    public List<User> findAll() {
        return userMapper.findAll();
    }


    @Override
    public int findUserCount() {
        return userMapper.findUserCount();
    }
@Override
@Transactional(isolation = Isolation.DEFAULT, propagation = Propagation.REQUIRED)
    public void updateUserAndUInfo(String userInfo, String gender, String userId) {
        String[] userInfos = userInfo.split(",");

        Map<String,String> map = new HashMap<String, String>();
        map.put("username",userInfos[1]);
        map.put("realName",userInfos[2]);
        map.put("telephone",userInfos[3]);
        map.put("gender",gender);
        map.put("userId",userId);

        userMapper.updateUserAndUInfo(map);
        userInfoMapper.updateUserAndUInfo(map);
    }

    @Override
    public UserInfo findUserInfo(String userId) {
        return userInfoMapper.selectByPrimaryKey(userId);
    }

    @Override
    @Transactional(isolation = Isolation.DEFAULT, propagation = Propagation.REQUIRED)
    public void deleteUser(String userId) {
        userMapper.deleteUser(userId);
        userInfoMapper.deleteUser(userId);
    }

    @Override
    public User findUserByUserId(String userId) {
        return userMapper.findUserByUserId(userId);
    }

    @Override
    public UserInfo fundUserInfoByUserId(String userId) {
        return userInfoMapper.fundUserInfoByUserId(userId);
    }
    @Override
    public List<UserAddress> selectAddressByUserId(String userId) {
        return userMapper.selectAddressByUserId(userId);
    }

    /**
     *
     * @param userId
     * @return
     */
    @Override
    public List<DCRemark> selectRemarkByUserId(String userId) {
        return userMapper.selectRemarkByUserId(userId);
    }

    @Override
    @Transactional(isolation = Isolation.DEFAULT, propagation = Propagation.REQUIRED)
    public void updateUserInfo(UserInfo userInfoId) {
        userInfoMapper.updateByPrimaryKeySelective(userInfoId);
    }

    @Override
    public void updatePasswordById(String password, String userId) {
        userMapper.updatePasswordById(password,userId);
        System.out.println(password);
        System.out.println(userId);
    }

    @Override
    public User findUserByUserNameEmailTel(String username) {
        return userMapper.findUserByUserNameEmailTel(username);
    }


}

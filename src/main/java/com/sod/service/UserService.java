package com.sod.service;

import com.sod.pojo.*;

import java.util.List;

/**
 * Created by LYJ on 2017/10/17.
 */
public interface UserService {
    public List<User> findUserList();

    void updateByPrimaryKeySelective(User user);

    User selectByPrimaryKey(String userId);

    List<UserAddress> selectByUserId(String userId);

    void insertUserAddress(UserAddress userAddress);

    void updateAddress(UserAddress userAddress);

    void updateAddressState(String addId);

    UserAddress selectAddressByAddId(String addId);

    void deleteAddressByAddId(String addId);

    List<OrderList> findOrderList(String userId);

    List<OrderItem> selectOrderItemListByOrderId(String orderId);

    List<Favor> findFavorList(String userId);

    void saveUser(User user,String address);

    public User findUserByUserNameAndPassword(String username,String password);
    public User findUserByName(String username);

    /**
     * 修改用户激活状态
     * @param state
     * @param userId
     */
    void updateState(String state, String userId);

    /**
     * 查询用户所有信息
     * @return
     */
    List<User> findAll();

    int findUserCount();

    /**
     * 通过userId修改用户表信息，和用户扩展表信息
     * @param userInfo
     * @param gender
     * @param userId
     */
    void updateUserAndUInfo(String userInfo, String gender, String userId);

    UserInfo findUserInfo(String userId);

    /**
     * 用户删除(删除user表 还有userInfo表)
     * @param userId
     */
    void deleteUser(String userId);




    /**
     * 根据用户Id查找用户
     * @return
     */
    User findUserByUserId(String userId);

    /**
     * 根据用户Id查找用户
     * @return
     */
    UserInfo fundUserInfoByUserId(String userId);
    /**
     * 根据用户ID查询用户使用过的地址
     * @param userId
     * @return
     */
    List<UserAddress> selectAddressByUserId(String userId);
    /**
     * 根据用户ID查询用户使用过的备注
     * @param userId
     * @return
     */
    List<DCRemark> selectRemarkByUserId(String userId);

    void updateUserInfo(UserInfo info);

    void updatePasswordById(String password, String userId);

    User findUserByUserNameEmailTel(String username);


}

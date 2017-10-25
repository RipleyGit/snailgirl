package com.sod.service;

import com.sod.mapper.UserAdminMapper;
import com.sod.pojo.UserAdmin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;


@Service
public class UserAdminServiceImpl implements UserAdminService{

    @Autowired
    private UserAdminMapper userAdminMapper;
    @Override
    public List<UserAdmin> findAll() {
        return userAdminMapper.findAll();
    }

    @Override
    public UserAdmin findUserAdminByUserAdminNameAndPassword(String username, String password) {
        return userAdminMapper.findUserAdminByUserAdminNameAndPassword(username,password);
    }

    @Override
    @Transactional(isolation = Isolation.DEFAULT, propagation = Propagation.REQUIRED)
    public void saveuserAdmin(String userAdmin, String adminState) {
        String[] userAdmins = userAdmin.split(",");

        Map<String,String> map = new HashMap<String, String>();
        map.put("adminId", UUID.randomUUID().toString());
        map.put("adminName",userAdmins[1]);
        map.put("adminPassword",userAdmins[2]);
        map.put("adminJob",userAdmins[3]);
        map.put("adminState",adminState);
        userAdminMapper.saveuserAdmin(map);
    }
}

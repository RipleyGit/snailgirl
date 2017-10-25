package com.sod.service;

import com.sod.pojo.UserAdmin;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface UserAdminService {
    public List<UserAdmin> findAll();
    public UserAdmin findUserAdminByUserAdminNameAndPassword(String username,String password);

    /**
     * 新增管理员
     * @param userAdmin
     * @param adminState
     */
    @Transactional(isolation = Isolation.DEFAULT, propagation = Propagation.REQUIRED)
    void saveuserAdmin(String userAdmin, String adminState);
}

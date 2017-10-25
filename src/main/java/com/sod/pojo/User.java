package com.sod.pojo;

import com.sod.exception.MsgException;
import org.springframework.util.StringUtils;

//用户
public class User {
    private String userId;   //用户Id

    private String username; //用户名

    private String password; //用户密码
    private String password2; //用户密码
    private String state;     //用户状态

    private String telephone;//用户手机号

    private String eamil;     //用户邮箱

    private UserInfo info; //用户信息扩展

    public UserInfo getInfo() {
        return info;
    }

    public void setInfo(UserInfo info) {
        this.info = info;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state == null ? null : state.trim();
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone == null ? null : telephone.trim();
    }

    public String getEamil() {
        return eamil;
    }

    public void setEamil(String eamil) {
        this.eamil = eamil == null ? null : eamil.trim();
    }

    @Override
    public String toString() {
        return "User{" +
                "userId='" + userId + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", state='" + state + '\'' +
                ", telephone='" + telephone + '\'' +
                ", eamil='" + eamil + '\'' +
                '}';
    }
    public void checkData() throws MsgException {
        if(StringUtils.isEmpty(username)){
            throw new MsgException("用户名不能为空！");
        }
        if(StringUtils.isEmpty(password)){
            throw new MsgException("密码不能为空！");

        }
        if(StringUtils.isEmpty(telephone)){
            throw new MsgException("电话号码不能为空！");
        }

        if(StringUtils.isEmpty(eamil)){
            throw new MsgException("邮箱不能为空");

        }
        if(!eamil.matches("^\\w+@\\w+(\\.\\w+)+$")){
            throw new MsgException("邮箱格式不正确");
        }
        if(!telephone.matches("^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$")){
            throw new MsgException("电话号码不正确");
        }
    }


}
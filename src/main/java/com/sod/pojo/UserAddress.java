package com.sod.pojo;

//用户地址表
public class UserAddress {
    private String addId;     //地址ID

    private String userId;   //用户ID

    private String addInfo;  //用户地址

    private String addRemark;//用户说明

    private String addState;  //使用状态

    public String getAddId() {
        return addId;
    }

    public void setAddId(String addId) {
        this.addId = addId == null ? null : addId.trim();
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public String getAddInfo() {
        return addInfo;
    }

    public void setAddInfo(String addInfo) {
        this.addInfo = addInfo == null ? null : addInfo.trim();
    }

    public String getAddRemark() {
        return addRemark;
    }

    public void setAddRemark(String addRemark) {
        this.addRemark = addRemark == null ? null : addRemark.trim();
    }

    public String getAddState() {
        return addState;
    }

    public void setAddState(String addState) {
        this.addState = addState == null ? null : addState.trim();
    }
}
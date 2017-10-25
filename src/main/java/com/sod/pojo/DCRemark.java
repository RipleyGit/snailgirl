package com.sod.pojo;

//配送备注表
public class DCRemark {
    private String remarkId;  //配送备注ID

    private String userId;    //用户ID

    private String remarkInfo;//配送备注信息

    public String getRemarkId() {
        return remarkId;
    }

    public void setRemarkId(String remarkId) {
        this.remarkId = remarkId == null ? null : remarkId.trim();
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public String getRemarkInfo() {
        return remarkInfo;
    }

    public void setRemarkInfo(String remarkInfo) {
        this.remarkInfo = remarkInfo == null ? null : remarkInfo.trim();
    }
}
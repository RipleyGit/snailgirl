package com.sod.pojo;

//管理员列表
public class UserAdmin {
    private String adminId;        //管理员ID

    private String adminName;      //管理员用户名

    private String adminPassword;  //管理员密码

    private String adminState;      //管理员状态

    private String adminJob;        //管理员职位

    public String getAdminId() {
        return adminId;
    }

    public void setAdminId(String adminId) {
        this.adminId = adminId == null ? null : adminId.trim();
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName == null ? null : adminName.trim();
    }

    public String getAdminPassword() {
        return adminPassword;
    }

    public void setAdminPassword(String adminPassword) {
        this.adminPassword = adminPassword == null ? null : adminPassword.trim();
    }

    public String getAdminState() {
        return adminState;
    }

    public void setAdminState(String adminState) {
        this.adminState = adminState == null ? null : adminState.trim();
    }

    public String getAdminJob() {
        return adminJob;
    }

    public void setAdminJob(String adminJob) {
        this.adminJob = adminJob == null ? null : adminJob.trim();
    }
}
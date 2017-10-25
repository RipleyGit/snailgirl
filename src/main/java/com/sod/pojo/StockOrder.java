package com.sod.pojo;

//采购订单
public class StockOrder {
    private String stockId;     //采购订单ID

    private String adminId;     //管理员ID

    private String stockTime;   //采购时间

    private String stockMoney;  //采购金额

    private String stockRemark; //采购单备注

    public String getStockId() {
        return stockId;
    }

    public void setStockId(String stockId) {
        this.stockId = stockId == null ? null : stockId.trim();
    }

    public String getAdminId() {
        return adminId;
    }

    public void setAdminId(String adminId) {
        this.adminId = adminId == null ? null : adminId.trim();
    }

    public String getStockTime() {
        return stockTime;
    }

    public void setStockTime(String stockTime) {
        this.stockTime = stockTime == null ? null : stockTime.trim();
    }

    public String getStockMoney() {
        return stockMoney;
    }

    public void setStockMoney(String stockMoney) {
        this.stockMoney = stockMoney == null ? null : stockMoney.trim();
    }

    public String getStockRemark() {
        return stockRemark;
    }

    public void setStockRemark(String stockRemark) {
        this.stockRemark = stockRemark == null ? null : stockRemark.trim();
    }
}
package com.sod.pojo;

//材料单
public class StockMate {
    private String mateId;     //材料单ID

    private String stockId;    //采购订单ID

    private String mateName;   //货品名称

    private String mateType;   //货品类型

    private String mateNum;    //货品数量

    private String matePrice;  //货品单价

    private String mateUnit;   //货品单位

    private String mateRemark; //材料单备注

    public String getMateId() {
        return mateId;
    }

    public void setMateId(String mateId) {
        this.mateId = mateId == null ? null : mateId.trim();
    }

    public String getStockId() {
        return stockId;
    }

    public void setStockId(String stockId) {
        this.stockId = stockId == null ? null : stockId.trim();
    }

    public String getMateName() {
        return mateName;
    }

    public void setMateName(String mateName) {
        this.mateName = mateName == null ? null : mateName.trim();
    }

    public String getMateType() {
        return mateType;
    }

    public void setMateType(String mateType) {
        this.mateType = mateType == null ? null : mateType.trim();
    }

    public String getMateNum() {
        return mateNum;
    }

    public void setMateNum(String mateNum) {
        this.mateNum = mateNum == null ? null : mateNum.trim();
    }

    public String getMatePrice() {
        return matePrice;
    }

    public void setMatePrice(String matePrice) {
        this.matePrice = matePrice == null ? null : matePrice.trim();
    }

    public String getMateUnit() {
        return mateUnit;
    }

    public void setMateUnit(String mateUnit) {
        this.mateUnit = mateUnit == null ? null : mateUnit.trim();
    }

    public String getMateRemark() {
        return mateRemark;
    }

    public void setMateRemark(String mateRemark) {
        this.mateRemark = mateRemark == null ? null : mateRemark.trim();
    }
}
package com.sod.pojo;

//订单项列表
public class OrderItem {
    private String orderId;  //订单ID

    public String getProdId() {
        return prodId;
    }

    public void setProdId(String prodId) {
        this.prodId = prodId;
    }

    private String prodId;    //商品ID

    private String buyNum;   //商品数量

    private Product product;  //商品信息

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId == null ? null : orderId.trim();
    }



    public String getBuyNum() {
        return buyNum;
    }

    public void setBuyNum(String buyNum) {
        this.buyNum = buyNum == null ? null : buyNum.trim();
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}
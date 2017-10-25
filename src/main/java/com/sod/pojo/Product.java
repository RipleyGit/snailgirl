package com.sod.pojo;

//商品列表
public class Product {
    private String prodId;    //商品ID

    private String prodName;  //商品名称

    private String prodImg;   //商品图片

    private String prodType;  //商品类型

    private String prodPrice; //商品单价

    private String prodNum;    //商品库存

    private String saleNum;    //商品销量

    private String prodDes;    //商品描述

    private String prodState;  //商品状态

    public String getProdId() {
        return prodId;
    }

    public void setProdId(String prodId) {
        this.prodId = prodId == null ? null : prodId.trim();
    }

    public String getProdName() {
        return prodName;
    }

    public void setProdName(String prodName) {
        this.prodName = prodName == null ? null : prodName.trim();
    }

    public String getProdImg() {
        return prodImg;
    }

    public void setProdImg(String prodImg) {
        this.prodImg = prodImg == null ? null : prodImg.trim();
    }

    public String getProdType() {
        return prodType;
    }

    public void setProdType(String prodType) {
        this.prodType = prodType == null ? null : prodType.trim();
    }

    public String getProdPrice() {
        return prodPrice;
    }

    public void setProdPrice(String prodPrice) {
        this.prodPrice = prodPrice == null ? null : prodPrice.trim();
    }

    public String getProdNum() {
        return prodNum;
    }

    public void setProdNum(String prodNum) {
        this.prodNum = prodNum == null ? null : prodNum.trim();
    }

    public String getSaleNum() {
        return saleNum;
    }

    public void setSaleNum(String saleNum) {
        this.saleNum = saleNum == null ? null : saleNum.trim();
    }

    public String getProdDes() {
        return prodDes;
    }

    public void setProdDes(String prodDes) {
        this.prodDes = prodDes == null ? null : prodDes.trim();
    }

    public String getProdState() {
        return prodState;
    }

    public void setProdState(String prodState) {
        this.prodState = prodState == null ? null : prodState.trim();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Product product = (Product) o;

        if (prodId != null ? !prodId.equals(product.prodId) : product.prodId != null) return false;
        if (prodName != null ? !prodName.equals(product.prodName) : product.prodName != null) return false;
        if (prodImg != null ? !prodImg.equals(product.prodImg) : product.prodImg != null) return false;
        if (prodType != null ? !prodType.equals(product.prodType) : product.prodType != null) return false;
        if (prodPrice != null ? !prodPrice.equals(product.prodPrice) : product.prodPrice != null) return false;
        if (prodNum != null ? !prodNum.equals(product.prodNum) : product.prodNum != null) return false;
        if (saleNum != null ? !saleNum.equals(product.saleNum) : product.saleNum != null) return false;
        if (prodDes != null ? !prodDes.equals(product.prodDes) : product.prodDes != null) return false;
        return prodState != null ? prodState.equals(product.prodState) : product.prodState == null;
    }

    @Override
    public int hashCode() {
        int result = prodId != null ? prodId.hashCode() : 0;
        result = 31 * result + (prodName != null ? prodName.hashCode() : 0);
        result = 31 * result + (prodImg != null ? prodImg.hashCode() : 0);
        result = 31 * result + (prodType != null ? prodType.hashCode() : 0);
        result = 31 * result + (prodPrice != null ? prodPrice.hashCode() : 0);
        result = 31 * result + (prodNum != null ? prodNum.hashCode() : 0);
        result = 31 * result + (saleNum != null ? saleNum.hashCode() : 0);
        result = 31 * result + (prodDes != null ? prodDes.hashCode() : 0);
        result = 31 * result + (prodState != null ? prodState.hashCode() : 0);
        return result;
    }
}
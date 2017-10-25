package com.sod.service;

import com.sod.pojo.Product;

import java.util.List;

public interface ProductService {
    public List<Product> findAll();

    List<Product> findAllBySearch(String search);

    Product findProdById(String prodId);


    void deleteProducts(String[] prodIds);

    int findProdCount();

    void saveProduct(Product prod);

    void updateState(String state, String prodId);


    void updateProd(Product prod);

    List<Product> findAllProd();

    List<Product> findAllProdByType(String prodType);

    String getImgURL(String fileName);

    List<Product> findProductList(String page,String prodType);

    String findProductCount(String prodType);
}

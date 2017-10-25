package com.sod.mapper;

import com.sod.pojo.Product;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProductMapper {
    public int deleteByPrimaryKey(String prodId);

    public int insert(Product record);

    public int insertSelective(Product record);

    public Product selectByPrimaryKey(String prodId);

    public int updateByPrimaryKeySelective(Product record);

    public int updateByPrimaryKey(Product record);

    public List<Product> findAll();

    public Product findProdById(String prodId);

    List<Product> findAllBySearch(@Param("search") String search);

    void deleteProducts(String[] prodIds);

    int findProdCount();

    List<Product> findAllProdByType(String prodType);

    void saveProduct(Product prod);

    void updateState(@Param("state") String state,@Param("prodId") String prodId);


    void updateProd(Product prod);

    List<Product> findAllProd();

    List<Product> findProductList(@Param("page") String page,@Param("prodType") String prodType);

    String findProductCount(@Param("prodType")String prodType);
}
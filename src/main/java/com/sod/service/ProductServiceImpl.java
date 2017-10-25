package com.sod.service;

import com.sod.mapper.ProductMapper;
import com.sod.pojo.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;
@Service
public class ProductServiceImpl implements  ProductService{
    @Autowired
    private ProductMapper productMapper;

    @Override
    public List<Product> findAll() {
        return productMapper.findAll();
    }

    @Override
    public List<Product> findAllBySearch(String search) {

        return productMapper.findAllBySearch(search);
    }

    @Override
    public Product findProdById(String prodId) {
        return productMapper.findProdById(prodId);
    }

    @Override
    @Transactional(isolation = Isolation.DEFAULT, propagation = Propagation.REQUIRED)
    public void deleteProducts(String[] prodIds) {
        productMapper.deleteProducts(prodIds);
    }
    @Override
    public int findProdCount() {
        return productMapper.findProdCount();
    }

    /**
     * 通过菜的种类查找菜
     * @param prodType
     * @return
     */
    @Override
    public List<Product> findAllProdByType(String prodType) {
        return productMapper.findAllProdByType(prodType);
    }


    /**
     * 分页查看
     * @param page
     * @return
     */
    @Override
    public String getImgURL(String fileName) {
        String str="/statile/back/products/caitu/"+fileName;

        return str;
    }

    @Override
    public List<Product> findProductList(String page,String prodType) {
        page = String.valueOf((Integer.valueOf(page)-1)*5);
        return productMapper.findProductList(page,prodType);
    }

    /**
     * 查找商品数量
     * @return
     */
    @Override
    public String findProductCount(String prodType) {
        String maxPage = productMapper.findProductCount(prodType);
        if(Integer.valueOf(maxPage)%5>0){
            maxPage = String.valueOf(Integer.valueOf(maxPage)/5+1);
        }else {
            maxPage = String.valueOf(Integer.valueOf(maxPage)/5);
        }

        return maxPage;
    }

    @Override
    @Transactional(isolation = Isolation.DEFAULT, propagation = Propagation.REQUIRED)
    public void saveProduct(Product prod) {
        String prodId=UUID.randomUUID().toString();
        prod.setProdId(prodId);
        prod.setProdState("1");
        prod.setSaleNum("0");

        productMapper.saveProduct(prod);
    }

    @Override
    @Transactional(isolation = Isolation.DEFAULT, propagation = Propagation.REQUIRED)
    public void updateState(String state, String prodId) {
        productMapper.updateState(state,prodId);
    }

    @Override
    @Transactional(isolation = Isolation.DEFAULT, propagation = Propagation.REQUIRED)
    public void updateProd(Product prod) {
        productMapper.updateProd(prod);
    }

    @Override
    public List<Product> findAllProd() {
       return  productMapper.findAllProd();
    }



}

package com.sod.ctrlFornt;


import com.alibaba.fastjson.JSON;
import com.sod.pojo.Product;
import com.sod.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/prod")
public class ProductController {

    @Autowired
    private ProductService productService;
    /**
     *  展示全部的商品
     * @param model
     * @return
     */
    @RequestMapping("/productList")
    public String toProductList(Model model){
        List<Product> productList = productService.findAll();
        model.addAttribute("productList",productList);
        return "/front/popular-Restaurents";
    }

    /**
     * 获取菜品的图片
     * @param prodImg
     * @param request
     * @param res
     * @throws ServletException
     * @throws IOException
     */
    @RequestMapping("/productImage")
    public void getProductImage(String prodImg, HttpServletRequest request, HttpServletResponse res) throws ServletException, IOException {

        request.getRequestDispatcher(prodImg).forward(request, res);
    }

    /**
     * 点击商品图片，根据商品id展示相关信息
     * @param prodId
     * @param model
     * @return
     */
    @RequestMapping("/toviewProd")
    public String toView(String prodId,Model model){
        Product prod=productService.findProdById(prodId);
        model.addAttribute("prod",prod);

        return "/front/product_Info";
    }
    /**
     * 通过条件查询
     * @param search
     * @param model
     * @return
     */
    @RequestMapping("/prodListBySearch")
    public String ProdListBySearchAction(String search,Model model) {
        //2.调用service层的方法查询指定的商品
        List<Product> list = productService.findAllBySearch(search);
        model.addAttribute("page","1");
        model.addAttribute("maxPage","1");
        model.addAttribute("prodType","");
        //如果没有找到商品，跳转到NotFound页面
        if(list.size()==0){
            return "/front/NotFoundProd";
        }
        //3.将所有商品的集合存入request域 并转发带prod_list页面
        model.addAttribute("productList", list);
        return "/front/popular-Restaurents";
    }

    /**
     * 往购物车中添加一条数据
     * @param pid
     * @param request
     */
    @RequestMapping("/updateCart/{pid}/{val}")
    public void updateCart(@PathVariable String pid, @PathVariable String val, HttpServletRequest request){
        Product prod = productService.findProdById(pid);
        Map<Product,Integer> map = (Map<Product, Integer>) request.getSession().getAttribute("cartMap");

        Integer vals = Integer.valueOf(val);
        if(vals < 0){
            map.remove(prod);
        }else{
            map.put(prod, map.containsKey(prod) ? map.get(prod) + vals : 1);
        }
        request.getSession().setAttribute("cartMap",map);

    }

    /**
     * 前台通过Ajax获取购物车数据
     * @param request
     * @return
     */
    @RequestMapping("/getCartMap")
    public String getCartMap(HttpServletRequest request){
        Map<Product,Integer> map = (Map<Product, Integer>) request.getSession().getAttribute("cartMap");
        String cartJson = JSON.toJSONString(map);
        //JSONObject jsonObject = JSONObject.parseObject(cartJson);

        return cartJson;
    }
    /**
     *  展示全部的商品(分页版)
     * @param model
     * @return
     */
    @RequestMapping("/ProductListByType")
    public String toProductList(String page,String prodType,Model model){
        List<Product> productList = productService.findProductList(page,prodType);
        String maxPage = productService.findProductCount(prodType);
        //为分页查看准备数据
        model.addAttribute("productList",productList);
        model.addAttribute("page",page);
        model.addAttribute("maxPage",maxPage);
        model.addAttribute("prodType",prodType);

        return "/front/popular-Restaurents";
    }

}

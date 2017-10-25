package com.sod.ctrlFornt;


import com.alibaba.fastjson.JSON;
import com.sod.pojo.Product;
import com.sod.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
@RequestMapping("/home")
public class HomeController {

    @Autowired
    private ProductService productService;

    @RequestMapping("/index")
    public String tomain(){

        return "/front/index";
    }
    @RequestMapping("/toContact")
    public String toContact(){
        return "/front/contact";
    }



}

package com.sod.ctrlBacked;

import com.sod.pojo.Product;
import com.sod.service.ProductService;
import com.sod.utils.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@Controller
@RequestMapping("prodMge")
public class ProdMgeController {

    @Autowired
    private ProductService productService;
    /**
     * 跳转到商品添加页面
     * @return
     */
    @RequestMapping("/addProd")
    public String addProduct(){

        return "/backed/Product_add";
    }

    /**
     * 保存添加的商品
     * @param
     * @return
     */
    @RequestMapping("/saveProd")
    public String saveProd( @RequestParam("img") MultipartFile file, HttpServletRequest request,Product prod){
        String contentType = file.getContentType();
        String fileName = file.getOriginalFilename();

        String filePath = request.getSession().getServletContext().getRealPath("/staticfile/back/products/caitu/");

        try {
            FileUtil.uploadFile(file.getBytes(), filePath, fileName);
        } catch (Exception e) {
            e.printStackTrace();
        }
        //String[] filePaths= filePath.split("/staticfile");



        String imgURL=productService.getImgURL(fileName);


        prod.setProdImg(imgURL);
        productService.saveProduct(prod);

        //跳转到商品列表页面
        return "redirect:/admin/prodList";


    }

    /**
     * 删除商品
     * @param prodIds
     * @return
     */
    @RequestMapping("/delete")
    public String deleteProducts(@RequestParam("prodId") String[] prodIds){

        productService.deleteProducts(prodIds);

        //跳转到商品列表页面
        return "redirect:/admin/prodList";

    }

    /**
     * 设置启用状态
     * @param prodId
     * @return
     */
    @RequestMapping("toStart")
    public String toStart(String prodId){

        String state="1";
        productService.updateState(state,prodId);

        return "redirect:/admin/prodList";
    }

    /**
     * 设置停用状态
     * @param prodId
     * @return
     */
    @RequestMapping("toStop")
    public String toStop(String prodId){

        String state="0";
        productService.updateState(state,prodId);

        return "redirect:/admin/prodList";
    }

    /**
     * 跳转到修改商品页面
     * @param prodId
     * @param model
     * @return
     */
    @RequestMapping("toUpdate")
    public String toupdate(String prodId,Model model){

        Product prod=productService.findProdById(prodId);

        model.addAttribute("prod",prod);

        return "/backed/ProductUpdate";

    }

    /**
     * 修改商品
     * @param prod
     * @return
     */
    @RequestMapping("updateProd")
    public  String updateProd(Product prod){

        productService.updateProd(prod);

        //跳转到商品列表页面
        return "redirect:/admin/prodList";

    }
}

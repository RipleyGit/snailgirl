package com.sod.ctrlBacked;

import com.sod.service.OrderBackService;
import com.sod.service.OrderListService;
import com.sod.utils.ExportExcelUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/orderMge")
public class OrderMgeController {

    @Autowired
    private OrderListService orderListService;
    @Autowired
    private OrderBackService orderBackService;

    @RequestMapping("/getExcle/{type}")
    public void exclePort(@PathVariable String type, HttpServletResponse response){
        try {

            OutputStream out = response.getOutputStream();

            String[] headers = { "月份", "订单数","金额" };
            ExportExcelUtils exportExcel = new ExportExcelUtils();
            HSSFWorkbook workbook = new HSSFWorkbook();
            int SHEET_NUM = -1;
            if("2".equals(type)||"1".equals(type)){
                List<List<String>> data = orderListService.getExcleList("0");
                exportExcel.exportExcel(workbook,++SHEET_NUM,"未付款",headers,data,out);
            }
            if("3".equals(type)||"1".equals(type)){
                List<List<String>> data = orderListService.getExcleList("1");
                exportExcel.exportExcel(workbook,++SHEET_NUM,"已付款",headers,data,out);
            }
            if("4".equals(type)||"1".equals(type)){
                List<List<String>> data = orderListService.getExcleList("2");
                exportExcel.exportExcel(workbook,++SHEET_NUM,"已过期",headers,data,out);
            }

            SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss"); // 定义文件名格式

            String fname = format.format(new Date())+".xls";

            fname = new String(fname.getBytes("iso8859-1"),"utf-8");
            //告知浏览器以附件下载的方式打开
            response.setContentType("text/html;charset=gbk");

            response.setHeader("Content-Disposition","attachment;filename="+fname);
            workbook.write(out);
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    @ResponseBody
    @RequestMapping(value = "/getStatis",method = RequestMethod.GET)
    public Map<String,Object> getStatis(){
        Map<String, Object> map = new HashMap<String, Object>();
        //年每月未付款订单
        List<Integer> noPay = orderListService.getOrderState("0");
        //年每月已付款订单
        List<Integer> yesPay = orderListService.getOrderState("1");
        //年每月已过期订单
        List<Integer> overPay = orderListService.getOrderState("2");
        //所有订单
        List<Integer> allSum = new ArrayList<Integer>();
        for (int i = 0; i < noPay.size(); i++) {
            allSum.add(noPay.get(i) + yesPay.get(i) + overPay.get(i));
        }
        map.put("noPay", noPay);
        map.put("yesPay",yesPay);
        map.put("overPay",overPay);
        map.put("allSum", allSum);

        return map;
    }
    /**
     * 根据订单id删除订单和订单项
     * @param orderIds
     */
    @RequestMapping("/deleteOrder")

    public String delOrder(@RequestParam("orderId") String[] orderIds){
        orderBackService.deleteOrderById(orderIds);
        System.out.println("删除成功");
        return "redirect:/admin/orderMge";
    }
    @RequestMapping("/updateOrderState")
    public void updateOrderState(String orderId,String state){
        orderBackService.updateOrderState(orderId,state);
    }
}

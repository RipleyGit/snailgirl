package com.sod.ctrlFornt;

import com.sod.pojo.OrderList;
import com.sod.pojo.Product;
import com.sod.service.OrderService;
import com.sod.utils.PaymentUtils;
import com.sod.utils.PropUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.sod.utils.PaymentUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Map;
import java.util.UUID;

@Controller
public class PayController {
    @Autowired
    private OrderService orderService;

    /*
     *  跳转支付
     */
    @RequestMapping("/pay")
    public String toPay(Model model, @RequestParam("orderId") String oid, String pd_FrpId){
        //2、准备第三方支付平台需要的参数
        String p0_Cmd = "Buy";//业务类型
        String p1_MerId = PropUtils.getProperty("p1_MerId");
        String p2_Order = oid;//商户的订单号
        //测试时使用
        String p3_Amt = "0.01";//订单金额
        //“正式发布”的时候使用
        /*OrderList orderList = orderService.findOrderById(oid);
        String p3_Amt = ""+orderList.getTotalMoney();*/
        String p4_Cur = "CNY";//交易币种
        String p5_Pid = "";//商品名称
        String p6_Pcat = "";//商品分类
        String p7_Pdesc ="";//商品描述
        String p8_Url = PropUtils.getProperty("responseURL");
        String p9_SAF = "";//送货地址
        String pa_MP = "";//商户的扩展信息
        //支付通道编码  pd_FrpId

        //应答机制
        String pr_NeedResponse = "1";
        //调用工具类生产数据签名
        String hmac = PaymentUtils.buildHmac(p0_Cmd,
                p1_MerId, p2_Order, p3_Amt, p4_Cur, p5_Pid,
                p6_Pcat, p7_Pdesc, p8_Url, p9_SAF, pa_MP,
                pd_FrpId, pr_NeedResponse, PropUtils.getProperty("keyValue"));
        //3、将以上产生保存request
        model.addAttribute("pd_FrpId", pd_FrpId);
        model.addAttribute("p0_Cmd", p0_Cmd);
        model.addAttribute("p1_MerId", p1_MerId);
        model.addAttribute("p2_Order", p2_Order);
        model.addAttribute("p3_Amt", p3_Amt);
        model.addAttribute("p4_Cur", p4_Cur);
        model.addAttribute("p5_Pid", p5_Pid);
        model.addAttribute("p6_Pcat", p6_Pcat);
        model.addAttribute("p7_Pdesc", p7_Pdesc);
        model.addAttribute("p8_Url", p8_Url);
        model.addAttribute("p9_SAF", p9_SAF);
        model.addAttribute("pa_MP", pa_MP);
        model.addAttribute("pr_NeedResponse", pr_NeedResponse);
        model.addAttribute("hmac", hmac);
        //4、转发到confirm.jsp
        return "/front/confirm";
    }

    @RequestMapping("/callBack")
    public  String paySucess(HttpServletResponse response,HttpServletRequest request){
        //1、接收参数
        String p1_MerId = request.getParameter("p1_MerId");
        String r0_Cmd = request.getParameter("r0_Cmd");
        String r1_Code = request.getParameter("r1_Code");
        String r2_TrxId = request.getParameter("r2_TrxId");
        String r3_Amt = request.getParameter("r3_Amt");
        String r4_Cur =request.getParameter("r4_Cur");
        String r5_Pid = request.getParameter("r5_Pid");
        //商品订单号
        String r6_Order = request.getParameter("r6_Order");
        String r7_Uid = request.getParameter("r7_Uid");
        String r8_MP = request.getParameter("r8_MP");
        //交易结果的返回类型:1表示重定向  2点对点通讯
        String r9_BType = request.getParameter("r9_BType");
        String rb_BankId = request.getParameter("rb_BankId");
        //银行交易的流水号
        String ro_BankOrderId = request.getParameter("ro_BankOrderId");
        //在第三方支付平台上完成支付的时间
        String rp_PayDate = request.getParameter("rp_PayDate");
        String rq_CardNo = request.getParameter("rq_CardNo");
        String ru_Trxtime = request.getParameter("ru_Trxtime");
        //签名数据
        String hmac = request.getParameter("hmac");
        boolean result = PaymentUtils.verifyCallback(hmac, p1_MerId, r0_Cmd,
                r1_Code, r2_TrxId, r3_Amt, r4_Cur, r5_Pid, r6_Order,
                r7_Uid, r8_MP, r9_BType, PropUtils.getProperty("keyValue"));
        if(result){//数据未被修改
            if("1".equals(r9_BType)){//表示重定向过来的
                //测试使用，正式发布前要删除以下两行代码
                orderService.updateOrderPayState(r6_Order,1);
            }else if("2".equals(r9_BType)){//点对点通知
                if("1".equals(r1_Code)){//点对点通知支付完成
                    //修改订单的支付状态
                    orderService.updateOrderPayState(r6_Order,1);
                    //响应给第三方支付平台 success
                }
            }

        }else{
            System.out.println("数据被篡改了。。。");
        }
        return "/front/paySuccess";
    }
}

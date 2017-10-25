<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="${sod}/staticfile/back/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="${sod}/staticfile/back/css/style.css"/>
    <link href="${sod}/staticfile/back/assets/css/codemirror.css" rel="stylesheet">
    <link rel="stylesheet" href="${sod}/staticfile/back/assets/css/ace.min.css" />
    <link rel="stylesheet" href="${sod}/staticfile/back/assets/css/font-awesome.min.css" />
    <!--[if IE 7]>
    <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
    <![endif]-->
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
    <![endif]-->
    <script src="${sod}/staticfile/back/assets/js/jquery.min.js"></script>

    <!-- <![endif]-->

    <!--[if IE]>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <![endif]-->

    <!--[if !IE]> -->

    <script type="text/javascript">
        window.jQuery || document.write("<script src='${sod}/staticfile/back/assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
    </script>

    <!-- <![endif]-->

    <!--[if IE]>
    <script type="text/javascript">
        window.jQuery || document.write("<script src='assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
    </script>
    <![endif]-->

    <script type="text/javascript">
        if("ontouchend" in document) document.write("<script src='${sod}/staticfile/back/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
    </script>
    <script src="${sod}/staticfile/back/assets/js/bootstrap.min.js"></script>
    <script src="${sod}/staticfile/back/assets/js/typeahead-bs2.min.js"></script>
    <!-- page specific plugin scripts -->
    <script src="${sod}/staticfile/back/assets/js/jquery.dataTables.min.js"></script>
    <script src="${sod}/staticfile/back/assets/js/jquery.dataTables.bootstrap.js"></script>
    <script type="text/javascript" src="${sod}/staticfile/back/js/H-ui.js"></script>
    <script type="text/javascript" src="${sod}/staticfile/back/js/H-ui.admin.js"></script>
    <script src="${sod}/staticfile/back/assets/layer/layer.js" type="text/javascript" ></script>
    <script src="${sod}/staticfile/back/assets/laydate/laydate.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            var arr=[]
            $("input[name='delete']").click(function () {
                $("input[name='oId']:checked").each (function () {
                    arr.push($(this).val());
                });
                $("input[name='orderId']").val(arr);
            });
        });
    </script>
    <title>订单列表</title>
</head>

<body>
<div class="page-content clearfix">

        <div class="d_Confirm_Order_style">

            <!---->
            <form action="/orderMge/deleteOrder" method="post">
            <div class="border clearfix">
       <span class="l_f">

       <input type="submit" name="delete" class="btn btn-danger" value="批量删除" /><i class="icon-trash"></i>
       </span>

            </div>
            <!---->
            <div class="table_menu_list">
                <!--订单列表展示-->
                <table class="table table-striped table-bordered table-hover" id="sample-table">
                    <thead>
                    <tr>
                        <th width="25px"><label><input type="checkbox" onclick="checkAll('orderId',this)" class="ace"><span class="lbl"></span></label></th>
                        <th width="120px">订单编号</th>
                        <th width="250px">菜品名称</th>
                        <th width="100px">总价</th>
                        <th width="100px">订单时间</th>
                        <th width="180px">订单类型</th>
                        <th width="80px">数量</th>
                        <th width="70px">状态</th>
                        <th width="200px">操作</th>
                    </tr>
                    <tr hidden="hidden">
                        <td><input name="orderId" type="text"/></td>
                    </tr>
                    </thead>
                    <tbody>
                    <c:set var="num" value="0"></c:set>
                    <c:forEach items="${orderInfoList}" var="orderInfo">
                    <tr>
                        <td><label><input type="checkbox" name="oId" value="${orderInfo.orderList.orderId}" class="ace"><span class="lbl"></span></label></td>
                        <td>${orderInfo.orderList.orderId}</td>
                        <td class="order_product_name">
                            <select style="width: 100px;">
                                <option value="">所点菜品</option>
                                <c:forEach items="${orderInfo.orderItems}" var="orderItem" varStatus="i">
                                    <option value="${orderItem.product.prodId}">${orderItem.product.prodName}</option>
                                    <c:set var="num" value="${i.count}"/>
                                </c:forEach>
                            </select>
                        </td>
                        <td>${orderInfo.orderList.totalMoney}</td>
                        <td>${orderInfo.orderList.orderTime}</td>
                        <td>${orderInfo.orderList.orderType}</td>
                        <td>${num}</td>
                        <td class="td-status">
                         <span>
                             <span class="label label-success radius"><c:if test="${orderInfo.orderList.payState==0}">待支付</c:if></span>
                             <span class="label label-success radius"><c:if test="${orderInfo.orderList.payState==1}">已支付</c:if></span>
                             <span class="label label-defaunt radius"><c:if test="${orderInfo.orderList.payState==2}">已过期</c:if></span>
                        </span>
                        </td>
                        <td class="td-manage">
                            <a onClick="member_stop(this,'${orderInfo.orderList.orderId}')"  href="javascript:;" title="过期"  class="btn btn-xs btn-success">失效</a>
                            <a title="启用" onclick="member_start(this,'${orderInfo.orderList.orderId}')" href="javascript:;"  class="btn btn-xs btn-info" >启用</a>
                            <a title="删除" href="javascript:;"  onclick="member_del(this,'${orderInfo.orderList.orderId}')" class="btn btn-xs btn-warning" ><i class="icon-trash  bigger-120"></i></a>
                        </td>
                    </tr>
                    </c:forEach>

                    </tbody>
                </table>

            </div>
            </form>
        </div>

    </div>

<!--添加用户图层-->
</body>
</html>
<script>
    jQuery(function($) {
        var oTable1 = $('#sample-table').dataTable( {
            "aaSorting": [[ 1, "desc" ]],//默认第几个排序
            "bStateSave": true,//状态保存
            "aoColumnDefs": [
                //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
                {"orderable":false,"aTargets":[0,8,9]}// 制定列不参与排序
            ] } );


        $('table th input:checkbox').on('click' , function(){
            var that = this;
            $(this).closest('table').find('tr > td:first-child input:checkbox')
                .each(function(){
                    this.checked = that.checked;
                    $(this).closest('tr').toggleClass('selected');
                });

        });

        $('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
        function tooltip_placement(context, source) {
            var $source = $(source);
            var $parent = $source.closest('table')
            var off1 = $parent.offset();
            var w1 = $parent.width();

            var off2 = $source.offset();
            var w2 = $source.width();

            if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
            return 'left';
        }
    })
    /*用户-添加*/
    $('#member_add').on('click', function(){
        layer.open({
            type: 1,
            title: '添加用户',
            maxmin: true,
            shadeClose: true, //点击遮罩关闭层
            area : ['800px' , ''],
            content:$('#add_menber_style'),
            btn:['提交','取消'],
            yes:function(index,layero){
                var num=0;
                var str="";
                $(".add_menber input[type$='text']").each(function(n){
                    if($(this).val()=="")
                    {

                        layer.alert(str+=""+$(this).attr("name")+"不能为空！\r\n",{
                            title: '提示框',
                            icon:0,
                        });
                        num++;
                        return false;
                    }
                });
                if(num>0){  return false;}
                else{
                    layer.alert('添加成功！',{
                        title: '提示框',
                        icon:1,
                    });
                    layer.close(index);
                }
            }
        });
    });
    /*用户-查看*/
    function member_show(title,url,id,w,h){
        layer_show(title,url+'#?='+id,w,h);
    }
    /*订单-停用*/
    function member_stop(obj,id){
        layer.confirm('确认要停用吗？',function(index){
            $(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已过期</span>');
            $.post("${ sod }/orderMage/updateOrderState?state=2",{"orderId":id});
            layer.msg('已停用!',{icon: 5,time:1000});
        });
    }

    /*订单-启用*/
    function member_start(obj,id){
        layer.confirm('确认要启用吗？',function(index){
            $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">未支付</span>');
            $.post("${ sod }/orderMage/updateOrderState?state=0",{"orderId":id});
            layer.msg('已启用!',{icon: 6,time:1000});
        });
    }
    /*订单-删除*/
    function member_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            $(obj).parents("tr").remove();
            $.post("${ sod }/orderMage/updateOrderState?state=1",{"orderId":id});
            layer.msg('已删除!',{icon:1,time:1000});
        });
    }
    laydate({
        elem: '#start',
        event: 'focus'
    });
</script>

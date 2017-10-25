<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="${ sod }/staticfile/back/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="${ sod }/staticfile/back/css/style.css"/>
    <link rel="stylesheet" href="${ sod }/staticfile/back/assets/css/font-awesome.min.css" />
    <link href="${ sod }/staticfile/back/assets/css/codemirror.css" rel="stylesheet">
    <link rel="stylesheet" href="${ sod }/staticfile/back/font/css/font-awesome.min.css" />
    <link href="${ sod }/staticfile/back/css/button.css" rel="stylesheet"/>
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="${ sod }/staticfile/back/assets/css/ace-ie.min.css" />
    <![endif]-->
    <!--[if IE 7]>
    <link rel="stylesheet" href="${ sod }/staticfile/back/assets/css/font-awesome-ie7.min.css" />
    <![endif]-->
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="${ sod }/staticfile/back/assets/css/ace-ie.min.css" />
    <![endif]-->
    <script src="${ sod }/staticfile/back/assets/js/ace-extra.min.js"></script>
    <!--[if lt IE 9]>
    <script src="${ sod }/staticfile/back/assets/js/html5shiv.js"></script>
    <script src="${ sod }/staticfile/back/assets/js/respond.min.js"></script>
    <![endif]-->
    <!--[if !IE]> -->
    <script src="${ sod }/staticfile/back/js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <!-- <![endif]-->
    <script src="${ sod }/staticfile/back/assets/dist/echarts.js"></script>
    <script src="${ sod }/staticfile/back/assets/js/bootstrap.min.js"></script>
    <title>交易</title>
</head>

<body>
<div class=" page-content clearfix">

    <div class="t_Record row ">
        <div id="main" style="height:400px; overflow:hidden; width:100%; overflow:auto" ></div>

        <a class="col-lg-3 col-sm-3 col-md-3 button button-royal button-rounded button-raised" href="${ sod }/orderMge/getExcle/1">导出所有表格</a>
        <a class="col-lg-3 col-sm-3 col-md-3 button button-royal button-rounded button-raised" href="${ sod }/orderMge/getExcle/2">导出未支付表格</a>
        <a class="col-lg-3 col-sm-3 col-md-3 button button-royal button-rounded button-raised" href="${ sod }/orderMge/getExcle/3">导出已支付表格</a>
        <a class="col-lg-3 col-sm-3 col-md-3 button button-royal button-rounded button-raised" href="${ sod }/orderMge/getExcle/4">导出支付过期表格</a>

    </div>

</div>
</body>
</html>
<script type="text/javascript">
    var overPay =[];
    var noPay=[];
    var yesPay=[];
    var allSum=[];

    $(document).ready(function(){

        $(".t_Record").width($(window).width()-60);
        //当文档窗口发生改变时 触发
        $(window).resize(function(){
            $(".t_Record").width($(window).width()-60);
        });

        $.ajax({
            type:"get",
            url:"${sod}/orderMge/getStatis",
            contentType:"application/json;charset=utf-8",
            dataType:"json",
            async: false,
            success:function(data) {

                allSum=data.allSum;
                overPay=data.overPay;
                noPay=data.noPay;
                yesPay=data.yesPay;


            },
            error:function()
            {
                //出错时回调该函数

                alert("error");
            }
        });

    });

    require.config({
        paths: {
            echarts: '${ sod }/staticfile/back/assets/dist'
        }
    });
    require(
        [
            'echarts',
            'echarts/theme/macarons',
            'echarts/chart/bar',
            'echarts/chart/line'  // 按需加载所需图表，如需动态类型切换功能，别忘了同时加载相应图表

        ],
        function (ec,theme) {
            var myChart = ec.init(document.getElementById('main'),theme);
            option = {
                title : {
                    text: '月购买订单交易记录',
                    subtext: '实时获取用户订单购买记录'
                },
                tooltip : {
                    trigger: 'axis'
                },
                legend: {
                    data:['所有订单','未支付','已支付','支付过期']
                },
                toolbox: {
                    show : true,
                    feature : {
                        mark : {show: false},

                        dataView : {show: true, readOnly: true},
                        magicType : {show: true, type: ['line', 'bar']},
                        restore : {show: true},
                        saveAsImage : {show: true}
                    }
                },
                calculable : true,
                xAxis : [
                    {
                        type : 'category',
                        data : ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
                    }
                ],
                yAxis : [
                    {
                        type : 'value'
                    }
                ],
                series : [
                    {
                        name:'所有订单',
                        type:'bar',
                        data:allSum,
                        markPoint : {
                            data : [
                                {type : 'max', name: '最大值'},
                                {type : 'min', name: '最小值'}
                            ]
                        }
                    },
                    {
                        name:'所有订单',
                        type:'line',
                        data:allSum,
                        markPoint : {
                            data : [
                                {type : 'max', name: '最大值'},
                                {type : 'min', name: '最小值'}
                            ]
                        }
                    },
                    {
                        name:'未支付',
                        type:'bar',
                        data:noPay,
                        markPoint : {
                            data : [
                                {name : '年最高', type:'max', symbolSize:18},
                                {name : '年最低', type:'min', }
                            ]
                        },


                    },
                    {
                        name:'未支付',
                        type:'line',
                        data:noPay,
                        markPoint : {
                            data : [
                                {name : '年最高', type:'max', symbolSize:18},
                                {name : '年最低', type:'min', }
                            ]
                        },


                    }
                    , {
                        name:'已支付',
                        type:'bar',
                        data:yesPay,
                        markPoint : {
                            data : [
                                {name : '年最高', type:'max', symbolSize:18},
                                {name : '年最低', type:'min', }
                            ]
                        },

                    }
                    , {
                        name:'已支付',
                        type:'line',
                        data:yesPay,
                        markPoint : {
                            data : [
                                {name : '年最高', type:'max', symbolSize:18},
                                {name : '年最低', type:'min', }
                            ]
                        },

                    }
                    , {
                        name:'支付过期',
                        type:'bar',
                        data:overPay,
                        markPoint : {
                            data : [
                                {name : '年最高', type:'max', symbolSize:18},
                                {name : '年最低', type:'min', }
                            ]
                        },

                    }
                    , {
                        name:'支付过期',
                        type:'line',
                        data:overPay,
                        markPoint : {
                            data : [
                                {name : '年最高', type:'max', symbolSize:18},
                                {name : '年最低', type:'min', }
                            ]
                        },

                    }
                ]
            };
            myChart.setOption(option);
        }
    );
</script>
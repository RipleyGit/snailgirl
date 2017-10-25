<%--
  Created by IntelliJ IDEA.
  User: Ripley
  Date: 2017/10/19
  Time: 12:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <link href="${ sod }/staticfile/back/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="${ sod }/staticfile/back/css/style.css"/>
    <link rel="stylesheet" href="${ sod }/staticfile/back/assets/css/font-awesome.min.css" />
    <link href="${ sod }/staticfile/back/assets/css/codemirror.css" rel="stylesheet">
    <!--[if IE 7]>
    <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
    <![endif]-->
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
    <![endif]-->
    <script src="${ sod }/staticfile/back/assets/js/ace-extra.min.js"></script>
    <!--[if lt IE 9]>
    <script src="${ sod }/staticfile/back/assets/js/html5shiv.js"></script>
    <script src="${ sod }/staticfile/back/assets/js/respond.min.js"></script>
    <![endif]-->
    <!--[if !IE]> -->
    <script src="${ sod }/staticfile/back/assets/js/jquery.min.js"></script>
    <!-- <![endif]-->
    <script src="${ sod }/staticfile/back/js/echarts_cake.js"></script>
    <script src="${ sod }/staticfile/back/assets/js/bootstrap.min.js"></script>
</head>

<body>
<div class="page-content clearfix">

    <div class="state-overview clearfix">
        <div class="col-lg-3 col-sm-6">
            <section class="panel">
                <a href="#" title="商城会员">
                    <div class="symbol terques">
                        <i class="icon-user"></i>
                    </div>
                    <div class="value">
                        <h1>${ userCount }</h1>
                        <p>商城用户</p>
                    </div>
                </a>
            </section>
        </div>
        <div class="col-lg-3 col-sm-6">
            <section class="panel">
                <div class="symbol red">
                    <i class="icon-tags"></i>
                </div>
                <div class="value">
                    <h1>${ prodCount }</h1>
                    <p>商品数量</p>
                </div>
            </section>
        </div>
        <div class="col-lg-3 col-sm-6">
            <section class="panel">
                <div class="symbol yellow">
                    <i class="icon-shopping-cart"></i>
                </div>
                <div class="value">
                    <h1>${ orderCount }</h1>
                    <p>商城订单</p>
                </div>
            </section>
        </div>
        <div class="col-lg-3 col-sm-6">
            <section class="panel">
                <div class="symbol blue">
                    <i class="icon-bar-chart"></i>
                </div>
                <div class="value">
                    <h1>￥${ allMoney }</h1>
                    <p>交易总金额</p>
                </div>
            </section>
        </div>
    </div>
    <!--实时交易记录-->
    <div class="clearfix">
        <div class="t_Record">
            <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
            <div id="main" style="width: 855px;height:400px;"></div>
        </div>
        <div class="news_style">
            <div class="title_name">最新消息</div>
            <ul class="list">
                <li><i class="icon-bell red"></i><a href="#">一个有梦想的团队。</a></li>
                <li><i class="icon-bell red"></i><a href="#">The Sound Of Dream</a></li>
                <li><i class="icon-bell red"></i><a href="#">田螺菇凉</a></li>
                <li><i class="icon-bell red"></i><a href="#">美食！美食！美食！</a></li>
                <li><i class="icon-bell red"></i><a href="#">后台系统找那个是开通了。</a></li>
            </ul>
        </div>
    </div>

    <script type="text/javascript">
        $(document).ready(function(){
            // 基于准备好的dom，初始化echarts实例
            var myChart = echarts.init(document.getElementById('main'));


            var option = {
                title:{
                    text: '全年用户各种订单统计',
                    subtext: '实时获取订单记录',
                    x:'center'
                },
                tooltip: {
                    trigger:'item',
                },
                legend: {
                    orient:'vertical',
                    left: 'left',
                    data: ['所有订单','未支付订单','已支付订单','支付过期订单']
                },
                toolbox : {
                    show : true,
                    feature : {
                        mark : {
                            show : true
                        },
                        dataView : {
                            show : true,
                            readOnly : false
                        },

                        restore : {
                            show : true
                        },
                        saveAsImage : {
                            show : true
                        }
                    }
                },
                series : [
                    {
                        name: '访问来源',
                        type: 'pie',
                        radius : '55%',
                        center: ['55%', '60%'],
                        data:[
                            {value:overPay, name:'支付过期订单'},
                            {value:yesPay, name:'已支付订单'},
                            {value:noPay, name:'未支付订单'},
                            {value:allSum, name:'所有订单'}
                        ]
                    }
                ]
            };


            // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option);

        });
        var overPay;
        var noPay;
        var yesPay;
        var allSum;

        $.ajax({
            type:"get",
            url:"${sod}/orderMge/getStatis",
            contentType:"application/json;charset=utf-8",
            dataType:"json",
            async: false,
            success:function(data) {

                allSum=getSum(data.allSum);
                overPay=getSum(data.overPay);
                noPay=getSum(data.noPay);
                yesPay=getSum(data.yesPay);


            },
            error:function()
            {
                //出错时回调该函数

                alert("error");
            }
        });

        function getSum(array){
            var sum = 0;
            for (var i = 0; i < array.length; i++){
                sum += parseInt(array[i]);
            }
            return sum;
        }



    </script>
</div>
</body>
</html>


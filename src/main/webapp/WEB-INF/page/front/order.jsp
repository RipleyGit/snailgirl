<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<title>order page</title>
	<%@include file="base.jsp"%>
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<style type="text/css">
		#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}
	</style>
	<script src="${sod}/staticfile/front/js/jquery-1.7.2.min.js"></script>
	<script src="${ sod }/staticfile/front/js/jquery.carouFredSel-6.1.0-packed.js"></script>
	<script src="${ sod }/staticfile/front/js/tms-0.4.1.js"></script>
	<script src="${sod}/staticfile/back/assets/layer/layer.js" type="text/javascript" ></script>
	<%--百度地图所需密钥--%>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=91NajUS8YYXWBAGWVe1jtjpfsMraM5Bb"></script>


	<script>
        $(window).load(function(){
            $('.slider')._TMS({
                show:0,
                pauseOnHover:false,
                prevBu:'.prev',
                nextBu:'.next',
                playBu:false,
                duration:800,
                preset:'fade',
                pagination:true,//'.pagination',true,'<ul></ul>'
                pagNums:false,
                slideshow:8000,
                numStatus:false,
                banners:false,
                waitBannerAnimation:false,
                progressBar:false
            })
        });

        $(window).load (
            function(){$('.carousel1').carouFredSel({auto: false,prev: '.prev',next: '.next', width: 960, items: {
                visible : {min: 1,
                    max: 4
                },
                height: 'auto',
                width: 240,

            }, responsive: false,

                scroll: 1,

                mousewheel: false,

                swipe: {onMouse: false, onTouch: false}});


            });

	</script>
	<script src="${ sod }/staticfile/front/js/jquery.easydropdown.js"></script>

</head>
<body>


<!-- header-section-starts -->
<%@include file="head.jsp"%>
<!-- header-section-ends -->
<div class="order-section-page">
	<div class="dropdown-button">

	</div>
	<form method="post" action="${sod}/order/createOrder" class="order-form">
		<div class="ordering-form">
			<div class="container">
				<div class="col-md-6 order-form-grids">
					<div class="order-form-grid  wow fadeInLeft" data-wow-delay="0.4s">

						<h5>订单信息</h5>

						<input type="hidden" name="userId" value="${user.userId}">

						<span>订单类型</span>
						<div class="dropdown-button">
							<select class="dropdown" tabindex="9" data-settings='{"wrapperClass":"flat"}' name="orderType">
								<option value="0">配送</option>
								<option value="1">堂食</option>
								<option value="2">自定义</option>
							</select>
						</div>
						<span>送货地址</span><br>
						<div class="dropdown-button">
							<select class="dropdown" tabindex="9" data-settings='{"wrapperClass":"flat"}' name="addInfo" id="wsw">
								<option value="0" selected="selected">请选择送货地址</option>
								<option value="自定义">自定义</option>
								<c:forEach items="${addressList}" var="addr">
									<option value="${addr.addInfo}" >${addr.addInfo}</option>
								</c:forEach>
							</select>
						</div>

						<span>收货地址</span><br>
							<input class="text" readonly="readonly" name="dcAdd" type="text" id="myAdd"/><br>

						<span>总金额</span><br>
						<input type="text" class="text" value="${totalMoney}" readonly="readonly" name="totalMoney" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '${totalMoney}';}"><br>

						<span>配送时间</span><br>
						<input type="time" class="text" value="配送时间" name="orderTime" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}"><br>

						<span>备注信息</span><br>
						<div style="padding: 10px;margin-bottom: 5px;width: 380px">
							<c:forEach items="${dcRemarkList}" var="remark">
								<button class="btn btn-default info-button">${remark.remarkInfo}</button>
							</c:forEach>
						</div>
						<textarea cols="30" rows="5" name="remarkInfo">

						</textarea>

						<div class="wow swing animated" data-wow-delay= "0.4s">
							<input type="submit" class="btn btn-success" style="margin-top:15px;" value="立即下单" >
						</div>
					</div>
				</div>
				<div   class="col-md-6 ordering-image wow bounceIn" data-wow-delay="0.4s" >
					<div style="width: 600px; height: 400px " id="allmap">

					</div>
				</div>
			</div>
		</div>
	</form>
</div>
<!--添加自定义地址图层-->
<div id="add_addr_style" style="display:none">
	<ul >
		<li><label>自定义地址：</label><input name="username" type="text"  class="text_add"/></li>
	</ul>
</div>
<!-- footer-section-starts -->
<%@include file="foot.jsp"%>

<script type="text/javascript">
	var cityName;
    $(window).load (
        function(){
            cityName = $("#wsw option:checked").val();
            setCity(cityName);

        });

    $("#wsw").change(function(){
        cityName = $("#wsw option:checked").val();
        if(cityName != "自定义" && cityName != "0"){
            setCity(cityName);
            $("#myAdd").val(cityName);
		}
        if(cityName == "自定义"){
            add_addr();
        }
    });

    /*自定义地址*/
    function add_addr(){
        layer.open({
            type: 1,
            title: '自定义地址',
            maxmin: true,
            shadeClose:false, //点击遮罩关闭层
            area : ['260px' , '140px'],
            content:$('#add_addr_style'),
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

                    $(".text_add").each(function () {
                        cityName = $(this).val();
                    });


                    layer.alert('添加成功！',{
                        title: '提示框',
                        icon:1,
                    });
                    setCity(cityName);
                    $("#myAdd").val(cityName);
                    layer.close(index);
                }
            }
        });
    }












    var infoArr = [];
	$(".info-button").toggle(function(e){
	    var $e = $(e.target);
	    $e.removeClass("btn-default").addClass("btn-success");
	    infoArr.push($e.html())
	},function(e){
        var $e = $(e.target);
        $e.removeClass("btn-success").addClass("btn-default");
        infoArr.splice( infoArr.indexOf( $e.target.html() ),1);
	})
    $("[type=submit]").click(function(e){
        e.preventDefault();
        var textArea = $('[name=remarkInfo]');
        infoArr.push(textArea.val());
        var textArea = textArea.val( infoArr.toString() ).slice(150);
        $(".order-form").submit();
    });



    var map = new BMap.Map("allmap");    // 创建Map实例
    map.setCurrentCity("杭州");			// 设置地图显示的城市 此项是必须设置的
    map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
    map.centerAndZoom(new BMap.Point(116.404, 39.915), 11);

    var search = new BMap.LocalSearch("中国", {
        onSearchComplete: function (result) {
            if (search.getStatus() == BMAP_STATUS_SUCCESS) {
                var res = result.getPoi(0);
                var point = res.point;
                map.centerAndZoom(point, 11);
            }

        }, renderOptions: {  //结果呈现设置，
            map: map,
            autoViewport: true,
            selectFirstResult: true
        }, onInfoHtmlSet: function (poi, html) {
            // alert(html.innerHTML)
        }

    });

    //设置城市的函数
    function setCity(city) {
        search.search(city);
        //初始化显示的城市
        search.search(city);
    }

    // 添加定位控件
    var geolocationControl = new BMap.GeolocationControl();
    geolocationControl.addEventListener("locationSuccess", function(e){
        // 定位成功事件
        var address = '';
        address += e.addressComponent.province;
        address += e.addressComponent.city;
        address += e.addressComponent.district;
        address += e.addressComponent.street;
        address += e.addressComponent.streetNumber;
        alert("当前定位地址为：" + address);
    });
    geolocationControl.addEventListener("locationError",function(e){
        // 定位失败事件
        alert(e.message);
    });
    map.addControl(geolocationControl);


    //自动提示
    function G(id) {
        return document.getElementById(id);
    }

    map.centerAndZoom("北京",12);                   // 初始化地图,设置城市和地图级别。

    var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
        {"input" : "suggestId"
            ,"location" : map
        });

    ac.addEventListener("onhighlight", function(e) {  //鼠标放在下拉列表上的事件
        var str = "";
        var _value = e.fromitem.value;
        var value = "";
        if (e.fromitem.index > -1) {
            value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
        }
        str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;

        value = "";
        if (e.toitem.index > -1) {
            _value = e.toitem.value;
            value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
        }
        str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
        G("searchResultPanel").innerHTML = str;
    });

    var myValue;
    ac.addEventListener("onconfirm", function(e) {    //鼠标点击下拉列表后的事件
        var _value = e.item.value;
        myValue = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
        G("searchResultPanel").innerHTML ="onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;

        setPlace();
    });

    function setPlace(){
        map.clearOverlays();    //清除地图上所有覆盖物
        function myFun(){
            var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
            map.centerAndZoom(pp, 18);
            map.addOverlay(new BMap.Marker(pp));    //添加标注
        }
        var local = new BMap.LocalSearch(map, { //智能搜索
            onSearchComplete: myFun
        });
        local.search(myValue);
    }

</script>
</body>
</html>

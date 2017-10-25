
// 百度地图API功能
var map = new BMap.Map("allmap");    // 创建Map实例
//map.centerAndZoom(new BMap.Point(119.910309, 28.456266), 11);  // 初始化地图,设置中心点坐标和地图级别
map.addControl(new BMap.MapTypeControl());   //添加地图类型控件
map.setCurrentCity("北京");    // 设置地图显示的城市 此项是必须设置的
map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
map.centerAndZoom(new BMap.Point(116.404, 39.915), 11);

// 添加带有定位的导航控件
var navigationControl = new BMap.NavigationControl({
    // 靠左上角位置
    anchor: BMAP_ANCHOR_TOP_RIGHT,
    // LARGE类型
    type: BMAP_NAVIGATION_CONTROL_LARGE,
    // 启用显示定位
    enableGeolocation: true
});
map.addControl(navigationControl);
map.addEventListener("dragend", function(){
    var center = map.getCenter();
});
var search = new BMap.LocalSearch("中国", {
    onSearchComplete: function(result){
        if (search.getStatus() == BMAP_STATUS_SUCCESS){
            var res = result.getPoi(0);
            var point = res.point;
            map.centerAndZoom(point, 11);
        }

    },renderOptions: {  //结果呈现设置，
        map: map,
        autoViewport: true,
        selectFirstResult: true
    } ,onInfoHtmlSet:function(poi,html){
        // alert(html.innerHTML)
    }

});

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
    $("#suggestId").val(address);
    /*alert("当前定位地址为：" + address);*/
});
geolocationControl.addEventListener("locationError",function(e){
    // 定位失败事件
    alert(e.message);
});
map.addControl(geolocationControl);

var size = new BMap.Size(10, 20);
map.addControl(new BMap.CityListControl({
    anchor: BMAP_ANCHOR_TOP_LEFT,
    offset: size,
}));



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


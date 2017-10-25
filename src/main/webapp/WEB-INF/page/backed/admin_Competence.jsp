<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link href="${sod}/staticfile/back/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="${sod}/staticfile/back/css/style.css"/>
    <link href="${sod}/staticfile/back/assets/css/codemirror.css" rel="stylesheet">
    <link rel="stylesheet" href="${sod}/staticfile/back/assets/css/ace.min.css" />
    <link rel="stylesheet" href="${sod}/staticfile/back/font/css/font-awesome.min.css" />
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
    <![endif]-->
    <script src="${sod}/staticfile/back/js/jquery-1.9.1.min.js"></script>
    <script src="${sod}/staticfile/back/assets/js/bootstrap.min.js"></script>
    <script src="${sod}/staticfile/back/assets/js/typeahead-bs2.min.js"></script>
    <script src="${sod}/staticfile/back/assets/js/jquery.dataTables.min.js"></script>
    <script src="${sod}/staticfile/back/assets/js/jquery.dataTables.bootstrap.js"></script>
    <script src="${sod}/staticfile/back/assets/layer/layer.js" type="text/javascript" ></script>
    <script src="${sod}/staticfile/back/assets/laydate/laydate.js" type="text/javascript"></script>
    <title>管理权限</title>
    <style >
        table{

           border-spacing: 10px;
        }
    </style>
</head>

<body>
<div class="margin clearfix">
    <div class="border clearfix">
       <span class="l_f">
        <a href="javascript:void(0);" onclick="admin_add()" id="Competence_add" class="btn btn-warning" title="添加管理员"><i class="fa fa-plus">添加管理员</i></a>
        <%--<a href="javascript:ovid()" class="btn btn-danger"><i class="fa fa-trash"></i> 批量删除</a>
       </span>
        <span class="r_f">共：<b>5</b>类</span>--%>
    </div>
    <div class="compete_list">
        <table id="sample-table-1" class="table table-striped table-bordered table-hover">
            <thead>
            <tr>
                <th class="center"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
                <th>管理员职位</th>
                <th>管理员用户名</th>
                <th class="hidden-480">状态</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${userAdminList}" var="u">
            <tr>
                <td class="center"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
                <td>${u.adminJob}</td>
                <td class="hidden-480">${u.adminName}</td>
                <td class="td-status" >
                    <c:if test="${u.adminState ==1}"><span class="label label-success radius"><font color="white">已启用</font></span></c:if>
                    <c:if test="${u.adminState ==0}"><span class="label label-defaunt radius"><font color="white">已停用</font></span></c:if>
                </td>
            </tr>
            </c:forEach>

            </tbody>
        </table>
    </div>
</div>
<!--添加用户图层-->
<div class="add_menber" id="add_menber_style" style="display:none">
    <ul class=" page-content">
        <li><label class="label_name">管理员用户名：</label><span class="add_name"><input name="adminName" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
        <li><label class="label_name">管理员密码：</label><span class="add_name"><input name="adminPassword" type="password"  class="text_add"/></span><div class="prompt r_f"></div></li>
            <div class="prompt r_f"></div>
        </li>
        <li><label class="label_name">管理员职位：</label><span class="add_name"><input name="adminJob" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
        <li><label class="label_name">状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态：</label><span class="add_name">
     <label><input name="adminState" type="radio" value="1"/><span class="lbl">开启</span></label>&nbsp;&nbsp;&nbsp;
     <label><input name="adminState"type="radio" value="0"/><span class="lbl">关闭</span></label></span><div class="prompt r_f"></div></li>
    </ul>
</div>
</body>
</html>
<script type="text/javascript">

    /*权限-删除*/
    function Competence_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            $(obj).parents("tr").remove();
            layer.msg('已删除!',{icon:1,time:1000});
        });
    }
    /*修改权限*/
    function Competence_del(id){
        window.location.href ="Competence.html?="+id;
    };
    /*字数限制*/
    function checkLength(which) {
        var maxChars = 200; //
        if(which.value.length > maxChars){
            layer.open({
                icon:2,
                title:'提示框',
                content:'您出入的字数超多限制!',
            });
            // 超过限制的字数了就将 文本框中的内容按规定的字数 截取
            which.value = which.value.substring(0,maxChars);
            return false;
        }else{
            var curr = maxChars - which.value.length; //250 减去 当前输入的
            document.getElementById("sy").innerHTML = curr.toString();
            return true;
        }
    };
    /*用户-编辑*/
    function admin_add(){
        layer.open({
            type: 1,
            title: '添加管理员信息',
            maxmin: true,
            shadeClose:false, //点击遮罩关闭层
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
                    var userAdmin="action" ;
                    $(".text_add").each(function () {
                        userAdmin = userAdmin + ","+ $(this).val();
                    });
                    var adminState = $("input[name='adminState']:checked").val();

                    window.location.href="${ sod }/admin/saveUserAdmin?userAdmin="+userAdmin+"&adminState="+adminState;
                    layer.alert('添加成功！',{
                        title: '提示框',
                        icon:1,
                    });


                    layer.close(index);
                }
            }
        });
    }
</script>
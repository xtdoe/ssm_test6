<%--
  Created by IntelliJ IDEA.
  User: 陈爽
  Date: 2021/11/22
  Time: 18:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/layui/2.6.8/css/layui.css" integrity="sha512-gK5o6RvUyTWSY+nO4Q9kJKGXbffUbV+u/R3bOAnCiOSIGt8GNDkvLvsQC2WaxyIQwGS56zpwt1TajavwKXBwKA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/layui/2.6.8/layui.js" integrity="sha512-lH7rGfsFWwehkeyJYllBq73IsiR7RH2+wuOVjr06q8NKwHp5xVnkdSvUm8RNt31QCROqtPrjAAd1VuNH0ISxqQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<style>
    body{margin: 10px;}
</style>
<body>
<input type="hidden" style="display:none" id="usernow" value="${usernow.username}"/>
<div class="demoTable" style="text-align: right;right: 5%">
    <div class="layui-inline">
        <input class="layui-input" name="keyword" id="demoReload" autocomplete="off" placeholder="请输入用户名">
    </div>
    <button class="layui-btn" data-type="reload" id="namebutton">
        <i class="layui-icon layui-icon-search layuiadmin-button-btn"></i>搜索</button>
</div>
<table class="layui-form" lay-data="{height:590, url:'${pageContext.request.contextPath}/findAllJSON', page:true, id:'test'}" lay-filter="test">
    <thead>
    <tr>
        <th lay-data="{field:'username', width:200 ,sort:true}">用户名</th>
        <th lay-data="{field:'userpwd', width:200, }">密码</th>
        <th lay-data="{field:'email' ,width:300 }">邮箱</th>
        <th lay-data="{field:'balance', width:150}">余额</th>
        <th lay-data="{field:'birthday', width:150 ,templet: '#titleTpl'}">生日</th>
        <th lay-data="{field:'nickname', width:150}">昵称</th>
        <th lay-data="{fixed: 'right', width:150, align:'center', toolbar: '#barDemo'}">操作</th>
    </tr>
    </thead>
    <tbody>
    </tbody>

</table>


<script>
    table = layui.table //表格
    table.init('test', {
        height: 600 //设置高度
        ,limit: 20
    });

    table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
        const value = obj.data; //获得当前行数据
        const username = value.username;
        const layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
        const tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）
        if(layEvent === 'detail'){
        } else if(layEvent === 'del'){ //删除
            layer.confirm('真的删除行么', function(index){
                layer.close(index);
                if(username===$("#usernow").val()){
                    layer.msg("不能删除当前账户");
                }else{
                    $.ajax({
                        url:"${pageContext.request.contextPath}/deluser",
                        data:{'username': username },
                        success:function (result) {
                            if (result.toString()==='OK'){
                                layer.alert("删除成功");
                                obj.del();
                            }else if(result.toString()==='ERR'){
                                layer.alert("ERR_1");
                            }else{
                                layer.alert("ERR_2");
                            }
                        },
                        error:function () {
                            layer.msg("ERR_3");
                        }
                    });
                }


            });
        } else if(layEvent === 'edit'){
            layer.open({
                type: 1,
                title: '修改信息',
                area: ['30%', '70%'],
                content: $('#biaodan'),
                success:function () {
                    $("#inputusername").val(value.username);
                    $("#inputuserpwd").val(value.userpwd);
                    $("#inputemail").val(value.email);
                    $("#inputbalance").val(value.balance);
                    $("#inputbirthday").val(layui.util.toDateString(value.birthday,'yyyy-MM-dd'));
                    $("#inputnickname").val(value.nickname);
                }
            });
            //同步更新缓存对应的值
            obj.update({});
        }
    });
    $(window).ready(function () {
        $("#namebutton").click(function () {
            var inputVal = $("#demoReload").val()
            table.reload('test', {
                url: '${pageContext.request.contextPath}/findAllJSON'
                ,where: {
                    name : inputVal
                }
                ,page: {
                    curr: 1
                }
            });
        });
    })

    function sub1(){
        document.userform.onsubmit;
    }

</script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script type="text/html" id="toolbar01">
    <input class="text" style="height:30px;width:157px;" name="searchname" id="searchname"
           placeholder="请输入姓名">
    <a id="searchbutton" lay-filter="" style="position: absolute;left: 144px;">
        <i class="layui-icon layui-icon-search" style="background:#fff;padding:5px;"></i>
    </a>
</script>
<script type="text/html" id="titleTpl">
    {{ layui.util.toDateString(d.birthday,'yyyy-MM-dd') }}
</script>

<div style="display: none;text-align: center" id="biaodan">
    <form class="layui-form layui-form-pane" action="${pageContext.request.contextPath}/userInfodoM" name="userform">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">用户名</label>
                <div class="layui-input-block">
                    <input id="inputusername" type="text" name="username"  required  lay-verify="required" placeholder="" autocomplete="off" class="layui-input" style="width: 100%" readonly>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">密码</label>
                <div class="layui-input-block">
                    <input id="inputuserpwd" type="text" name="userpwd" value="" required  lay-verify="required" placeholder="" autocomplete="off" class="layui-input" style="width: 100%" >
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">邮箱</label>
                <div class="layui-input-block">
                    <input id="inputemail" type="email" name="email" value="" required  lay-verify="required" placeholder="" autocomplete="off" class="layui-input" style="width: 100%">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">余额</label>
                <div class="layui-input-block">
                    <input id="inputbalance" type="text" name="balance" required  value="" lay-verify="required" placeholder="" autocomplete="off" class="layui-input" style="width: 100%">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">昵称</label>
                <div class="layui-input-block">
                    <input id="inputnickname" type="text" name="nickname" value="" required  lay-verify="required" placeholder="" autocomplete="off" class="layui-input" style="width: 100%">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">生日</label>
                <div class="layui-input-block">
                    <input  id="inputbirthday" type="date" name="birthday" min="1970-01-01" value="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" style="width: 100%">
                </div>
            </div>
        </div>
        <button class="layui-btn" style="align-content: center"  onclick="sub1()">提交</button>
    </form>
</div>

</body>
</html>


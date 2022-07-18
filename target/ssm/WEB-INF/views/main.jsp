<%--<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>--%>
<%--<html>--%>

<%--<head>--%>
<%--    <meta charset="utf-8">--%>
<%--    <link href="${pageContext.request.contextPath}/statics/css/blue.css" rel="stylesheet" type="text/css" id="css" charset="utf-8" />--%>
<%--    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>--%>
<%--    <title>主界面</title>--%>
<%--    <style>--%>

<%--    </style>--%>

<%--    <script>--%>
<%--        function blue(){--%>
<%--            const obj = document.getElementById("css");--%>
<%--            obj.setAttribute("href","${pageContext.request.contextPath}/statics/css/blue.css");--%>
<%--        }--%>
<%--        function yellow(){--%>
<%--            const obj = document.getElementById("css");--%>
<%--            obj.setAttribute("href","${pageContext.request.contextPath}/statics/css/yellow.css");--%>
<%--        }--%>

<%--        $(document).ready(function() {--%>
<%--            $("#test").click(function() {--%>
<%--                $(".column.left").toggle();--%>
<%--            });--%>
<%--        });--%>

<%--    </script>--%>
<%--</head>--%>

<%--<body>--%>
<%--    <div class="top">--%>
<%--        <button id="test" onclick="">隐藏</button>--%>
<%--        <h4>管理系统演示</h4>--%>
<%--    </div>--%>

<%--    <div class="middle">--%>
<%--        <div class="column left">--%>
<%--            <button class="button1">首页</button><br>--%>
<%--            <hr>--%>
<%--            <button class="button1" onclick="blue()">深蓝</button><br>--%>
<%--            <button class="button1" onclick="yellow()">橘黄</button><br>--%>
<%--            <hr>--%>
<%--            <button class="button1">用户管理</button><br>--%>
<%--            <button class="button1">文章管理</button><br><br><br><br>--%>
<%--            <br><br><br><br><br><br><br>--%>
<%--        </div>--%>

<%--        <div class="column right">--%>
<%--            <p>欢迎使用本系统！</p>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <div class="bottom">--%>
<%--        <h1>武汉理工大学©2021</h1>--%>
<%--    </div>--%>

<%--</body>--%>

<%--</html>--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<!DOCTYPE html>--%>
<html>
<head>
    <meta charset="utf-8">
    <title>SSM</title>
<%--    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>--%>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/layui/2.6.8/css/layui.css" integrity="sha512-gK5o6RvUyTWSY+nO4Q9kJKGXbffUbV+u/R3bOAnCiOSIGt8GNDkvLvsQC2WaxyIQwGS56zpwt1TajavwKXBwKA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<%--    <link rel="stylesheet" href=""  media="all">--%>
<%--    <script type="text/javascript" src="layui-v2.3.0/layui/layui.js"></script>--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/layui/2.6.8/layui.js" integrity="sha512-lH7rGfsFWwehkeyJYllBq73IsiR7RH2+wuOVjr06q8NKwHp5xVnkdSvUm8RNt31QCROqtPrjAAd1VuNH0ISxqQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <meta http-equiv="Cache-Control" content="no-transform" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=yes" />
    <style type="text/css">
        .x-iframe{
            width: 100%;
            height: 100%;
        }
        .layui-tab-item{
            width: 100%;
            height: 100%;
        }
        button_close{
            margin: 0;
            border: 0;
            background-color: black;
        }

        @media(max-width:800px)
        {
            .layui-body{
                left: 0;
            }
            .layui-footer{
                left: 0;
            }
        }

    </style>
    <script>
        let flag = 0;
        function buttonClose() {
            if(flag==0){
                $('.layui-side.layui-bg-cyan').width(0);
                $('.layui-body').css('left', 0);
                $('.layui-footer').css('left', 0);
                flag=1;
                $('#button_icon').attr("class","layui-icon layui-icon-next");
            }else{
                $('.layui-side.layui-bg-cyan').width(200);
                $('.layui-body').css('left', 200);
                $('.layui-footer').css('left', 200);
                flag=0;
                $('#button_icon').attr("class","layui-icon layui-icon-prev");
            }
        }

        $(window).resize(function(){
            if( $(window).width() < 800 ) {
                $('.layui-side.layui-bg-cyan').width(0);
                $('.layui-body').css('left', 0);
                $('.layui-footer').css('left', 0);
                flag=1;
                $('#button_icon').attr("class","layui-icon layui-icon-next");
            }
        });

        $(window).ready(function () {

        })

    </script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-bg-black layui-header">
        <div class="layui-logo">
            <button type="button" class="layui-btn layui-btn-primary" id="button_close" onclick="buttonClose()">
                <i class="layui-icon layui-icon-next" id="button_icon"></i>
            </button>
            &nbsp;&nbsp;管理系统
        </div>
        <ul class="layui-nav layui-layout-left"></ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item ">
                <a href="">
                    <i class="layui-icon layui-icon-log"></i>
                </a>
            </li>
            <li class="layui-nav-item">
                <a href="">
                    <i class="layui-icon layui-icon-link"></i>
                </a>
            </li>
            <li class="layui-nav-item" lay-unselect="">
                <a href="" ><img src="//t.cn/RCzsdCq" class="layui-nav-img">${users.nickname}</a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:;">修改信息</a></dd>
                    <dd><a href="javascript:;">安全管理</a></dd>
                    <dd><a href="${pageContext.request.contextPath}/login">退出登录</a></dd>
                </dl>
            </li>
        </ul>
    </div>

    <div class="layui-side layui-bg-cyan">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item"><a href="" >首页</a></li>
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">功能模块</a>
                    <dl class="layui-nav-child">
                        <dd><a href="${pageContext.request.contextPath}/userInfo/${users.username}" target="menuFrame" >个人中心</a></dd>
                        <dd><a href="${pageContext.request.contextPath}/findAll/${users.username}" target="menuFrame">用户管理</a></dd>
                        <dd><a href="${pageContext.request.contextPath}/userManage" target="menuFrame">文章管理</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body" id="show">
        <!-- 内容主体区域 -->
        <iframe id="menuFrame" name="menuFrame" width="100%" height="100%"></iframe>
    </div>

    <div class="layui-footer">
        ${users.email}
    </div>

</div>
</body>
</html>
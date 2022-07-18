<%--
  Created by IntelliJ IDEA.
  User: 陈爽
  Date: 2021/11/18
  Time: 15:17
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: txllg
  Date: 2020/7/28
  Time: 10:26
  To change this template use File | Settings | File Templates.
--%>


<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--  <title>Title</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<a href="LoginController/login">Login</a><br>--%>

<%--根据id查询--%>
<%--<form action="moviesController/findOne">--%>
<%--  id:<input type="text" name="id"><br>--%>
<%--  <input type="submit" value="提交">--%>
<%--</form><br>--%>

<%--添加电影--%>
<%--<form action="moviesController/addMovie">--%>
<%--  name:<input type="text" name="name"><br>--%>
<%--  director:<input type="text" name="director"><br>--%>
<%--  actor:<input type="text" name="actor"><br>--%>
<%--  <input type="submit" value="提交">--%>
<%--</form><br>--%>


<%--修改电影--%>
<%--<form action="moviesController/modifyMovie">--%>
<%--  id:<input type="text" name="id"><br>--%>
<%--  name:<input type="text" name="name"><br>--%>
<%--  director:<input type="text" name="director"><br>--%>
<%--  actor:<input type="text" name="actor"><br>--%>
<%--  <input type="submit" value="提交">--%>
<%--</form><br>--%>


<%--删除电影--%>
<%--<form action="moviesController/deleteMovie">--%>
<%--  id:<input type="text" name="id"><br>--%>
<%--  <input type="submit" value="提交">--%>
<%--</form>--%>

<%--</body>--%>
<%--</html>--%>


<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>SSM登录</title>
    <link  href="${pageContext.request.contextPath}/statics/css/start.css" rel="stylesheet" type="text/css"  charset="utf-8"/>
</head>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script>
    function a1(){
        $.ajax({
            url:"${pageContext.request.contextPath}/a",
            data:{'username':$("#username").val()},
            // type:"post",
            // dataType:"json",
            success:function (result) {
                if (result.toString()==='OK'){
                    $("#userInfo").css("color","green");
                    result="√";
                }else if(result.toString()==='FIND_ERR'){
                    $("#userInfo").css("color","red");
                    result="找不到该用户";
                }
                $("#userInfo").html(result);
            },
            error:function (result){
                alert(result);
            }

        });
    }
    function a2(){
        $.ajax({
            url:"${pageContext.request.contextPath}/a",
            data:{'username':$("#username").val(), 'userpwd':$("#userpwd").val()},
            success:function (result) {
                if (result.toString()==='OK'){
                    $("#pwdInfo").css("color","green");
                    result="√";
                }else if(result.toString()==='PWD_ERR'){
                    $("#pwdInfo").css("color","red");
                    result="密码错误";
                }
                $("#pwdInfo").html(result);
            },
            error:function (result) {
                alert(result);
            }

        });
    }
    <%--$(document).ready(function() {--%>
    <%--});--%>
</script>
<body>
<div class="header">
    <h2>登录</h2>
</div>
<div class="row">
    <div class="column side">
        <button class="button button1">QQ登录</button><br>
        <button class="button button2">微信登录</button><br>
        <button class="button button3">支付宝登录</button><br>
    </div>
    <div class="column middle">
        <h2>or</h2>
    </div>
    <div class="column side">
        <form action="${pageContext.request.contextPath}/logindo" id="loginForm">
            <input type="text" name="username" class="input" id="username"  placeholder="用户名"
                   size="32" onblur="a1()" required/>
            <div id="userInfodiv">
                <span id="userInfo"></span>
            </div><br/>
            <input type="password" name="userpwd" class="input" id="userpwd"  placeholder="密码"
                   size="32" onblur="a2()" required/>
            <div div="pwdInfodiv">
                <span id="pwdInfo"></span>
            </div>
            <br/>
            <input type="submit" class="button buttonup" value="登录"/>
        </form>
        <br>
    </div>
</div>

<div class="footer">
    <a href="${pageContext.request.contextPath}/sign">
        <button class="button buttonfooter" >注册</button>
    </a>
    <a href="${pageContext.request.contextPath}/changepwd">
        <button class="button buttonfooter" onclick="" >忘记密码？</button>
    </a>
</div>

</body>

</html>




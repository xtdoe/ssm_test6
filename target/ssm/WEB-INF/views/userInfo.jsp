<%--
  Created by IntelliJ IDEA.
  User: 陈爽
  Date: 2021/11/22
  Time: 18:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>

    <title>userInfo.jsp</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/layui/2.6.8/css/layui.css" integrity="sha512-gK5o6RvUyTWSY+nO4Q9kJKGXbffUbV+u/R3bOAnCiOSIGt8GNDkvLvsQC2WaxyIQwGS56zpwt1TajavwKXBwKA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/layui/2.6.8/layui.js" integrity="sha512-lH7rGfsFWwehkeyJYllBq73IsiR7RH2+wuOVjr06q8NKwHp5xVnkdSvUm8RNt31QCROqtPrjAAd1VuNH0ISxqQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<style>
    .layui-tab-content{
        background-color: #ffffff;
    }
</style>
<script>

    $(window).ready(function () {

    })


    function DateToStr(date) {
        var year = date.getFullYear();
        var month = (date.getMonth() + 1).toString();
        var day = (date.getDate()).toString();
        if (month.length == 1) {
            month = "0" + month;
        }
        if (day.length == 1) {
            day = "0" + day;
        }
        dateTime = year + "-" + month + "-" + day;
        return dateTime;
    }

    function sub1(){
        document.userform.onsubmit;
        alert("修改成功");
        window.location.reload();
    }

    function sub2() {
            var old1 = $("#oldpwd1").val();
            var old2 = $("#oldpwd2").val();
            var new1 = $("#userpwd").val();
            var new2 = $("#newpwd").val();
            if(old1===old2){
                if(new1===new2){
                    alert("修改密码成功");
                    document.infoForm.onsubmit;
                }else{
                    alert("新密码不相等");
                    $("#username").val($("#usernow").val());
                    return false;
                }
            }else {
                alert("原密码错误");
                $("#username").val($("#usernow").val());
                return false;
            }
    }

</script>

<body>

<div class="layui-tab">
    <ul class="layui-tab-title">
        <li class="layui-this">个人资料</li>
        <li>修改密码</li>
    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
            <div class="layui-row layui-col-space10">
                <div class="layui-col-md4"></div>
                <div class="layui-col-md4">
                    <form class="layui-form layui-form-pane" action="${pageContext.request.contextPath}/userInfodo" name="userform">
                        <div class="layui-form-item">
                            <label class="layui-form-label">用户名</label>
                            <div class="layui-input-block">
                                <input type="text" name="username" value="${userS.username}" required  lay-verify="required" placeholder="" autocomplete="off" class="layui-input" style="width: 100%" readonly>
                            </div>
                        </div>
                        <input type="hidden" name="userpwd" value="${userS.userpwd}" required  lay-verify="required" placeholder="" autocomplete="off" class="layui-input" style="width: 100%" >
                        <div class="layui-form-item">
                            <label class="layui-form-label">邮箱</label>
                            <div class="layui-input-block">
                                <input type="email" name="email" value="${userS.email}" required  lay-verify="required" placeholder="" autocomplete="off" class="layui-input" style="width: 100%">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">余额</label>
                            <div class="layui-input-block">
                                <input type="text" name="balance" required  value="${userS.balance}" lay-verify="required" placeholder="" autocomplete="off" class="layui-input" style="width: 100%">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">生日</label>
                            <div class="layui-input-block">
                                <input id="birthday" type="date" name="birthday" value="${userT}" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" style="width: 100%">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">昵称</label>
                            <div class="layui-input-block">
                                <input type="text" name="nickname" value="${userS.nickname}" required  lay-verify="required" placeholder="" autocomplete="off" class="layui-input" style="width: 100%">
                            </div>
                        </div>
                                <button class="layui-btn"  style="align-content: center"  onclick="sub1()">提交</button>
                    </form>
                </div>
                <div class="layui-col-md4"></div>
            </div>
        </div>
        <div class="layui-tab-item">
            <div class="layui-row layui-col-space10">
                <div class="layui-col-md4"></div>
                <div class="layui-col-md4">
                    <form class="layui-form layui-form-pane" action="${pageContext.request.contextPath}/userPwddo" name="infoForm" onsubmit="return sub2()">
                        <div class="layui-form-item">
                            <label class="layui-form-label">用户名</label>
                            <div class="layui-input-block">
                                <input type="text" name="username" value="${userS.username}" required  lay-verify="required" placeholder="" autocomplete="off" class="layui-input" style="width: 100%" readonly>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">旧密码</label>
                            <div class="layui-input-block">
                                <input id="oldpwd1" type="password" name="oldname" value="" required  lay-verify="required" placeholder="" autocomplete="off" class="layui-input" style="width: 100%" >
                            </div>
                        </div>
                                 <input id="oldpwd2" type="hidden" name="oldname1" value="${userS.userpwd}" required  lay-verify="required" placeholder="" autocomplete="off" class="layui-input" style="width: 100%" >
                        <div class="layui-form-item">
                        <label class="layui-form-label">新密码</label>
                        <div class="layui-input-block">
                            <input id="userpwd" type="password" name="userpwd" value="" required  lay-verify="required" placeholder="" autocomplete="off" class="layui-input" style="width: 100%" >
                        </div>
                    </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">重复新密码</label>
                            <div class="layui-input-block">
                                <input id="newpwd" type="password" name="username2" value="" required  lay-verify="required" placeholder="" autocomplete="off" class="layui-input" style="width: 100%" >
                            </div>
                        </div>
                                <input type="submit" class="layui-btn" style="align-content: center"  onclick=""/>
                    </form>
                </div>
                <div class="layui-col-md4"></div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

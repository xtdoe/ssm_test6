<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>注册</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<style>
* {
  box-sizing: border-box;
}

body {
  margin: 0;
  text-align: center;
  background-color:#f5f5f5;
}

.header {
  text-align: center;
}

input{
    outline-style: none;
    border: 1px solid #ccc; 
    border-radius: 5px;
    padding: 8px 10px;
    width: 280px;
    font-size: 18px;
}

.button {
    color: rgb(255, 255, 255);
    background-color: #05be02ab;
    border: none;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
}

</style>

</head>
<script>
    function ajaxname() {
        $.ajax({
            url:"${pageContext.request.contextPath}/usersign",
            data:{'username':$("#username").val()},
            success:function (result) {
                if (result.toString()==='OK'){
                    $("#userInfo").css("color","green");
                    result="√";
                }else if(result.toString()==='EXIST'){
                    $("#userInfo").css("color","red");
                    result="该用户名已存在";
                }
                $("#userInfo").html(result);
            },
            error:function (result){
                alert(result);
            }
        });
    }


    function sub(){
        // name.replace(/(^\s*)|(\s*$)/g,'') === "" || pwd.replace(/(^\s*)|(\s*$)/g,'') === ""
        var kg = "^[ ]+$";
        var kgtest = new RegExp(kg);
        var name= $("#username").val();
        var pwd= $("#userpwd").val();
        if(kgtest.test(name)  || kgtest.test(pwd)) {
            alert("用户名和密码存在空格");
        }
        else {
            $.ajax({
                url:"${pageContext.request.contextPath}/usersign",
                data:{'username':$("#username").val()},
                success:function (result) {
                    if (result.toString()==='OK'){
                        alert("注册成功");
                        document.signForm.onsubmit;
                    }else if(result.toString()==='EXIST'){
                        alert("用户名已存在");
                    }
                },
                error:function (result){
                    alert(result);
                }
            });
        }
    }



</script>

<body>

<div class="header">
  <h2>注册</h2>
</div>

<form action="${pageContext.request.contextPath}/signdo" id="signForm" name="signForm">
    <input type="text" name="username" class="input" id="username" value="" placeholder="用户名"
    size="32" onblur="ajaxname()" required />
    <div><span id="userInfo"></span></div><br/>
    <input type="password" name="userpwd" class="input" id="userpwd" value="" placeholder="密码"
    size="32" required /><br/><br/>
    <input type="email" name="email" class="input" value="" id="email"  placeholder="电子邮箱"
    size="32" required /><br/><br/>
    <input type="date" name="birthday" class="input" value="1970-01-01" id="birthday"  placeholder="生日" size="32">
    <br/><br/>
    <input type="hidden" name="balance" value=0 id="balance" required/>
    <input type="text" name="nickname" class="input" id="nickname" value="" placeholder="昵称"
           size="32"required /><br/><br/>
    <button  class="button buttonyes"  onclick="sub()">注册</button>
</form>
<div class="footer"><br/>
    <a href="${pageContext.request.contextPath}/login">
        <button class="button buttonfooter"  >返回登录界面</button>
    </a>
</div>

</body>
</html>
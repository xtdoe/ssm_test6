<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>忘记密码</title>
<style>
* {
  box-sizing: border-box;
}

body {
  text-align: center;
  margin: 0;
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
    <script>
        function sub(){
            if($("#userpwd").val()!==$("#newpwd").val() ){
                alert("密码不一致");
            }else if( $("#code").val() !== $("#username").val() ){
                alert("验证码错误");
            }else{
                $.ajax({
                    url:"${pageContext.request.contextPath}/userchangepwd",
                    data:{'username':$("#username").val(),"email":$("#email").val() },
                    success:function (result) {
                        if (result.toString()==='OK'){
                            document.form.onsubmit;
                            alert("修改成功")
                        }
                    },
                    error:function (result){
                        alert(result);
                    }

                });
            }
        }
    </script>
</head>

<body>

<div class="header">
  <h2>忘记密码</h2>
</div>

<form action="${pageContext.request.contextPath}/changepwddo" name="form">
    <input type="text" name="username" id="username" class="input"  value="" placeholder="用户名"
    size="32" required /><br/><br/>
    <input type="email" name="email" class="input" id="email" value="" placeholder="邮箱"
           size="32" required/><br/><br/>
    <input type="text" name="code" class="input" id="code" value="" placeholder="验证码"
           size="32" required/><br/><br/>
    <input type="password" name="userpwd" id="userpwd" class="input" value="" placeholder="新密码"
    size="32"  required/><br/><br/>
    <input type="password" name="newpwd" id="newpwd" class="input" value="" placeholder="确认密码"
    size="32" required/><br/><br/>
    <button class="button buttonyes" onclick="sub()">确认</button>
	</form>
<div class="footer"> <br/>
    <a href="${pageContext.request.contextPath}/login">
        <button class="button buttonfooter" onclick="">返回登录界面</button>
    </a>

</div>

</body>
</html>
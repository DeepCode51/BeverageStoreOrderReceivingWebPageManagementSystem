<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>



<!DOCTYPE html>
<html>
<head>
    <title>登录</title>
    <meta charset="utf-8">
    <link href="css/style.css" rel='stylesheet' type='text/css' />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%--<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>--%>
</head>
<script src="<%=basePath %>/admin/assets/js/jquery-1.11.0.min.js" type="text/javascript"></script>

<body>

<script>
    function checkLogin() {
        var uname = $("#username").val();
        var pwd = $("#userpwd").val();
        var utype = $("#utype").val();
        if (uname == "" || pwd=="") {
            $("#checkLogin").html("用户名或者密码不能为空！");
        } else {
            $.ajax({
                url : "alogin.do",
                type : "post",
                data : {
                    "uname":uname,
                    "utype":utype,
                    "pwd":pwd
                },

                dataType : "json",
                success : function(result) {
                    //alert(result.info);
                    console.log(result);
                    console.log(result.info);
                    if (result.info == "ok") {
                        $("#checkLogin").html("登录成功！");
                        window.location.href="index2.jsp";
                    } else {
                        $("#checkLogin").html("用户名、角色或者密码错误！");
                        return false;
                    }
                },
                error : function() {
                    alert("系统处理中！");
                    return false;
                }

            });
        }

    }
</script>
<!-----start-main---->
<div class="main">
    <div class="login-form">
        <h1>后台登录</h1>
        <div class="head">
            <img src="images/user.png" alt=""/>
        </div>
        <form method="post" action="#" ><%--onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'USERNAME';}"--%>
            <input type="text" class="text" name="uname" id="username" placeholder="请输入用户名"  >
            <%--onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}"--%>
            <input type="password"  name="pwd" id="userpwd" placeholder="请输入密码" >
            <select name="utype" id="utype" style="width: 100%;">
                <option value="管理员">管理员</option>
                <option value="员工">员工</option>
            </select>

            <div id="checkLogin" style="color: #f00;" ></div>
           <%-- <p id="checkLogin"></p>--%>
            <div class="submit" style="margin-top: 20px;">
                <button onclick="checkLogin()" type="button">登录</button>
               <%-- <button onclick="window.location.href='register.jsp'" type="button">注册</button>--%>
                <%--<input type="submit" onclick="return checkLogin();" value="登录" >--%>
            </div>

            <%--<p><a href="doLossPwd.jsp" &lt;%&ndash;onclick="window.location.href='doLossPwd.jsp'"&ndash;%&gt;>忘记密码？</a></p>--%>
        </form>
    </div>
    <!--//End-login-form-->
    <!-----start-copyright---->
    <div class="copy-right">
        <p>  Copyright &copy; 饮品店接单网页</p>
    </div>
    <!-----//end-copyright---->
</div>
<!-----//end-main---->

</body>

</html>



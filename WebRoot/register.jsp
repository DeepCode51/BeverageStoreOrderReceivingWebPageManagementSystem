<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.util.Info" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">


<jsp:include page="head.jsp"></jsp:include>

<script src="assets/js/userAdd.js"></script>
<script charset="utf-8" src="<%=path%>/js/popup.js"></script>
<script src="assets/js/jquery-1.11.0.min.js"></script>

<body>

<jsp:include page="header.jsp"></jsp:include>

<!--====== HEADER PART END ======-->
<!--====== OFF CANVAS START ======-->
<jsp:include page="left.jsp"></jsp:include>
<!--====== OFF CANVAS END ======-->
<!--====== BREADCRUMB PART START ======-->

<section class="breadcrumb-area" style="background-image: url(assets/img/bg/04.jpg);">
    <div class="container">
        <div class="breadcrumb-text">
            <span>用户注册页面</span>
            <h2 class="page-title">注册</h2>

            <ul class="breadcrumb-nav">
                <li><a href="index">首页</a></li>
                <li class="active">注册</li>
            </ul>
        </div>
    </div>
</section>
<!--====== BREADCRUMB PART END ======-->
<!--====== CONTACT PART START ======-->
<section class="contact-part pt-115 pb-115">
    <div class="container">
        <!-- Contact Info -->
        <%-- <div class="contact-info">
             <div class="row justify-content-center">
                 <div class="col-lg-4 col-sm-6 col-10">
                     <div class="info-box">
                         <div class="icon">
                             <i class="flaticon-home"></i>
                         </div>
                         <div class="desc">
                             <h4>Office Address</h4>
                             <p>19/A, Cirikon City hall Tower New York, NYC</p>
                         </div>
                     </div>
                 </div>
                 <div class="col-lg-4 col-sm-6 col-10">
                     <div class="info-box">
                         <div class="icon">
                             <i class="flaticon-phone"></i>
                         </div>
                         <div class="desc">
                             <h4>Phone Number</h4>
                             <p>+ 97656 8675 7864 7 <br> + 876 766 8675 765 6</p>
                         </div>
                     </div>
                 </div>
                 <div class="col-lg-4 col-sm-6 col-10">
                     <div class="info-box">
                         <div class="icon">
                             <i class="flaticon-message"></i>
                         </div>
                         <div class="desc">
                             <h4>Email Address</h4>
                             <p>info@webmail.com <br> jobs.webmail@mail.com</p>
                         </div>
                     </div>
                 </div>
             </div>
         </div>--%>
        <!-- Contact Mapts -->
        <%--  <div class="contact-maps mb-30" id="map"></div>--%>



        <!-- Contact Form -->
        <div class="contact-form">
            <form action="reg.do" method="post" enctype="multipart/form-data">
                <div class="row">
                    <div class="col-md-6">
                        <div class="input-group mb-30">
                            <span class="icon"><i class="far fa-user"></i></span>
                            <input type="text" placeholder="请输入用户名" name="uname" id="username" onclick="return checkuname()"  >
                            <span id='checku' class="spanInit" ></span>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="input-group mb-30">
                            <span class="icon"><i class="far fa-envelope"></i></span>
                            <input type="text" placeholder="请输入姓名"  id="tname" name="tname"  >
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="input-group mb-30">
                            <span class="icon"><i class="far fa-key"></i></span>
                            <input type="password" placeholder="密码" name="pwd" id="txtPwd"  onblur="return checkpwd()">
                            <span id='prompt_pwd'  class="spanInit" ></span>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="input-group mb-30">
                            <span class="icon"><i class="far fa-key"></i></span>
                            <input type="password" placeholder="请再次输入密码" name="pwdc" id="txtConfirmPwd" onblur="return checkpwdc()">
                            <span id='prompt_confirmpwd'  class="spanInit" ></span>
                        </div>
                    </div>



                    <div class="col-md-6">
                        <div class="input-group mb-30">
                            <span class="icon"><i class="far fa-phone"></i></span>
                            <input type="text" placeholder="请输入电话号码" id="txtPhone" name="tel" onblur="return checktel()">
                            <span id='prompt_phone' class="spanInit" ></span>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="input-group mb-30">
                            <span class="icon"><i class="far fa-book"></i></span>
                            <input type="text" placeholder="请输入年龄" name="age">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="input-group mb-30">
                            <span class="icon"><i class="far fa-edit"></i></span>
                            <input type="text" placeholder="请输入电子邮箱" name="email">
                        </div>
                    </div>
                    <%--<div class="col-md-6">
                    <div class="input-group mb-30">
                        <span class="icon"><i class="far fa-image"></i></span>
                    </div>
                    </div>--%>
                    <div class="col-md-6">
                           <input type="file" name="file">
                    </div>
                    <div class="col-md-6">
                        <div class="input-group mb-30">
                            <span class="icon"></span>
                            <select name="sex" class="input-group mb-100">
                                <option value="0">请选择性别</option>
                                <option value="男">男</option>
                                <option value="女">女</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="input-group textarea mb-30">
                            <span class="icon"><i class="far fa-pen"></i></span>
                            <textarea placeholder="请输入地址" name="address"></textarea>
                        </div>
                    </div>
                    <div class="col-12 text-center">
                        <button type="submit" class="main-btn btn-filled">提交</button>
                    </div>
                </div>
            </form>
        </div>
        </div>
    </div>
</section>
<!--====== CONTACT PART END ======-->
<!--====== Back to Top ======-->
<a href="#" class="back-to-top" id="backToTop">
    <i class="fal fa-angle-double-up"></i>
</a>
<!--====== FOOTER PART START ======-->
<jsp:include page="footer.jsp"></jsp:include>
<script >
    function checkuname() {
        var name = $("#username").val();
        console.log(name);
        if(name==""||(name.length<3||name.length>12)){
            $("#checku").html("用户账号不能为空且长度在3～12位之间！");
            $("input[id=username]").focus();
        } else {
            $("#checku").html("");
            $.ajax({
                url : "checkName.do",
                type : "post",
                data : "uname=" + name,
                dataType : "json",
                success:function(result){
                    if(result.info=="ng"){
                        $("#checku").html("用户名存在，请更换！");
                        $("input[id=username]").focus();
                        return false;
                    }else{
                        $("#checku").html("可以用");
                        return true;
                    }
                },
                error:function(){
                    alert("请求失败！");
                    return false;
                }

            });
        }

    }
</script>
</body>

</html>






<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>



<!DOCTYPE html>
<html lang="en">


<jsp:include page="head.jsp"></jsp:include>

<script>
    function checkLogin() {
        var uname = $("#uname").val();
        var pwd = $("#pwd").val();
        if (uname == "" || pwd=="") {
            $("#checkLogin").html("用户名或者密码不能为空！");
        } else {
            $("#checku").html("");
            $.ajax({
                url : "login.do",
                type : "post",
                data : {
                    "uname":uname,
                    "pwd":pwd
                },

                dataType : "json",
                success : function(result) {
                    if (result.info == "ok") {
                        $("#checkLogin").html("登录成功！");
                        window.location.href="index.do";
                    } else {
                        $("#checkLogin").html("用户名或者密码错误！");
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
            <span>用户登录页面</span>
            <h2 class="page-title">登录</h2>

            <ul class="breadcrumb-nav">
                <li><a href="index">首页</a></li>
                <li class="active">登录</li>
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
            <form action="login.do" method="post">
                <div class="row">
                    <div class="col-md-12">
                        <div class="input-group mb-30">
                            <span class="icon"><i class="far fa-user"></i></span>
                            <input type="text" placeholder="登录名" name="uname" id="uname" >
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="input-group mb-30">
                            <span class="icon"><i class="far fa-key"></i></span>
                            <input type="password" placeholder="密码" name="pwd" id="pwd">
                        </div>
                    </div>
                    <%--<div class="col-md-6">
                        <div class="input-group mb-30">
                            <span class="icon"><i class="far fa-phone"></i></span>
                            <input type="text" placeholder="Add phone number">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="input-group mb-30">
                            <span class="icon"><i class="far fa-book"></i></span>
                            <input type="text" placeholder="Select Subject">
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="input-group textarea mb-30">
                            <span class="icon"><i class="far fa-pen"></i></span>
                            <textarea placeholder="Enter messages"></textarea>
                        </div>
                    </div>--%>
                    <div class="col-12" id="checkLogin"></div>
                    <div class="col-12 text-center">
                        <button type="button" class="main-btn btn-filled" onclick="checkLogin();">登录</button>
                    </div>
                </div>
            </form>
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

</body>

</html>

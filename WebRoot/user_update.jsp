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
<script src="assets/js/regist.js"></script>
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
            <span>用户修改页面</span>
            <h2 class="page-title">修改</h2>

            <ul class="breadcrumb-nav">
                <li><a href="index">首页</a></li>
                <li class="active">修改</li>
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
            <form action="addShowInfo.do" method="post"  enctype="multipart/form-data"><%--enctype="multipart/form-data"--%>
                    <div class="col-md-12">
                        <div class="input-group mb-30">
                            <span class="icon"><b>账号</b>：</span>
                            <input type="text" placeholder="请输入"  id="username" value="${user.uname}" readonly >
                            <input type="hidden" value="${user.id}" name="id"  id="id" >
                            <span id='checku' class="spanInit" ></span>
                        </div>
                    </div>

                <div class="col-md-12">
                    <div class="input-group mb-30">
                        <span class="icon"><b>余额</b>：</span>
                        <input type="text" placeholder="余额"   value="${user.money}" readonly  >
                        <span  class="spanInit" ></span>
                    </div>
                </div>
                    <div class="col-md-12">
                        <div class="input-group mb-30">
                            <span class="icon"><b>姓名</b>：</span>
                            <input type="text" placeholder="请输入姓名"  name="tname" value="${user.tname}"   >
                            <span id='checku1' class="spanInit" ></span>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="input-group mb-30">
                            <span class="icon"><b>图片</b>：</span>
                            <img src="upload/${user.img}" width="50px;" height="50px;" style="margin-left: 100px;">
                          <input type="file" name="file">
                        </div>
                    </div>
                    
                    <div class="col-md-12">
                        <div class="input-group mb-30">
                            <span class="icon"><b>密码</b>：</span>
                            <input type="password" placeholder="密码" name="pwd"  value="${user.pwd}" onblur="return checkpwd2()">
                            <span id='prompt_pwd'  class="spanInit" ></span>
                        </div>
                    </div>



                    <div class="col-md-12">
                        <div class="input-group mb-30">
                           <%-- <span class="icon"><b>性别</b>：</span>--%>
                            <select name="sex" style="margin-left: 100px;">
                                <option value="${user.sex}">${user.sex}</option>
                                <option value="男">男</option>
                                <option value="女">女</option>
                            </select>
                        </div>
                    </div>


                    <div class="col-md-12">
                        <div class="input-group mb-30">
                            <span class="icon"><i class="far fa-phone"></i>：</span>
                            <input type="text" placeholder="请输入电话号码" id="txtPhone" name="tel" value="${user.tel}" onblur="return checktel()">
                            <span id='prompt_phone' class="spanInit" ></span>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="input-group mb-30">
                            <span class="icon"><b>年龄</b>：</span>
                            <input type="text" placeholder="请输入年龄" name="age" value="${user.age}">
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="input-group mb-30">
                            <span class="icon"><i class="far fa-book"></i>：</span>
                            <input type="text" placeholder="请输入电子邮箱" name="email" value="${user.email}">
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="input-group mb-30">
                            <span class="icon"><b>地区</b>：</span>
                            <input type="text" placeholder="请输入所在地区" name="address" value="${user.address}">
                        </div>
                    </div>
                    <%--<div class="col-md-6">
                        <div class="input-group mb-30">
                            <span class="icon"><i class="far fa-book"></i>身份证号：</span>
                            <input type="text" placeholder="请输入身份证号" name="idnumber">
                        </div>
                    </div>--%>

                    <%--<div class="col-md-6">
                        <div class="input-group mb-30">
                            <span class="icon"><i class="far fa-book"></i>预留问题：</span>
                            <input type="text" placeholder="请输入预留问题：" name="mbanswer">
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="input-group mb-30">
                            <span class="icon"><i class="far fa-book"></i>问题答案 ：</span>
                            <input type="text" placeholder="请输入问题答案 " name="question">
                        </div>
                    </div>--%>

                    <%--<div class="col-12">
                        <div class="input-group textarea mb-30">
                            <span class="icon"><i class="far fa-pen"></i></span>
                            <textarea placeholder="Enter messages"></textarea>
                        </div>
                    </div>--%>
                    <div class="col-12 text-center">
                        <button type="submit" class="main-btn btn-filled">提交</button>
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






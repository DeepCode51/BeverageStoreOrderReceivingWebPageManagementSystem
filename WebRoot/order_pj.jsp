<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="com.util.Info" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html>
<html lang="en">


<jsp:include page="head.jsp"></jsp:include>
<script src="assets/js/regist.js"></script>

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
            <span>订单评价页面</span>
            <h2 class="page-title">订单评价</h2>

            <ul class="breadcrumb-nav">
                <li><a href="index">首页</a></li>
                <li class="active">订单评价</li>
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
            <form action="addOrder_pj.do"
                  method="post"><%--enctype="multipart/form-data"--%>

                <div class="col-md-12">
                    <div class="input-group mb-30">
                        <span class="icon"><b>编号</b>：</span>
                        <input type="text" value="${orders.ono }" readonly="readonly">
                        <input type="hidden" value="${orders.id}" name="id">
                    </div>
                </div>

                <div class="col-md-12">
                    <div class="input-group mb-30">
                        <span class="icon"><b>时间</b>：</span>
                        <input type="text" value="${orders.stime }" readonly="readonly">
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="input-group mb-30">
                        <span class="icon"><b>总价</b>：</span>
                        <input type="text" value="${orders.zprice }" readonly="readonly">
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="input-group mb-30">
                        <span class="icon"><b>状态</b>：</span>
                        <input type="text" value="${orders.status }" readonly="readonly">
                    </div>
                </div>

                <c:forEach items="${list }" var="s">
                <div class="col-md-12">
                    <div class="input-group mb-30">
                        <span class="icon"><b>饮品</b>：</span>
                                <input type="text" value="${goods.name }" readonly="readonly">


                    </div>
                </div>
                <div class="col-md-12">
                    <div class="input-group mb-30">
                        <span class="icon"><b>图片</b>：</span>
                                <img alt="" src="./upload/${goods.img }" width="50" height="50" style="    margin-left: 100px;">


                    </div>
                </div>
                <div class="col-md-12">
                    <div class="input-group mb-30">
                        <span class="icon"><b>数量</b>：</span>
                        <input type="text" value="${order.amount }" readonly="readonly">
                    </div>
                </div>
                </c:forEach>

                <div class="col-md-12">
                    <div class="input-group mb-30">
                        <span class="icon"><b>姓名</b>：</span>
                        <input type="text" value="${user.tname }" readonly="readonly">
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="input-group mb-30">
                        <span class="icon"><b>账号</b>:</span>
                        <input type="text"  value="${user.uname }" readonly="readonly">
                    </div>
                </div>

                <div class="col-md-12">
                    <div class="input-group mb-30">
                        <span class="icon"><b>电话</b>：</span>
                        <input type="text"  value="${user.tel }" readonly="readonly">
                    </div>
                </div>

                <div class="col-md-12">
                    <div class="input-group mb-30">
                        <span class="icon"><b>地址</b>：</span>
                        <input type="text"  value="${user.address }" readonly="readonly">
                    </div>
                </div>
                <div class="col-12">
                    <div class="input-group textarea mb-30">
                        <span>评价内容：</span>
                        <textarea placeholder="请输入内容" name="pj"></textarea>
                    </div>
                </div>
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






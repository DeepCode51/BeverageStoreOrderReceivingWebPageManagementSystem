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
            <span>用户充值页面</span>
            <h2 class="page-title">充值</h2>

            <ul class="breadcrumb-nav">
                <li><a href="index">首页</a></li>
                <li class="active">充值</li>
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
            <form action="chongZhi.do" method="post" ><%--enctype="multipart/form-data"--%>
                <div class="col-md-12">
                        <div class="input-group mb-30">
                            <span class="icon"><i class="far fa-user"></i></span>
                            <input id="" type="text" value="${user.uname }(账号)"  readonly="readonly"  />
                            <input type="hidden"  value="${user.id}" name="id"  id="id" >
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="input-group mb-30">
                            <span class="icon"><i class="far fa-user"></i></span>
                            <input type="text" placeholder="${user.tname}"  name="tname" value="${user.tname}(姓名)"  readonly>
                        </div>
                    </div>
                <div class="col-md-12">
                    <div class="input-group mb-30">
                        <span class="icon"><i class="far fa-user"></i></span>
                        <input  type="text" value="${user.money }(当前余额)"  readonly="readonly"  />
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="input-group mb-30">
                        <span class="icon"><i class="far fa-user"></i></span>
                        <input  type="number" name="money" min="1" value="1" placeholder="充值金额(大于1元)" required="required"  />
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






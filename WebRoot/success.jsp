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
            <span>信息提示页面</span>
            <h2 class="page-title">信息提示</h2>

            <ul class="breadcrumb-nav">
                <li><a href="index">首页</a></li>
                <li class="active">信息提示</li>
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
            <form action="#" method="post">
                <div class="row">
                    <div class="col-md-12">
                        <div class="input-group mb-30">
                            <h2>${sessionScope.info}
                                </h2>
                        </div>
                    </div>
<%session.removeAttribute("info");%>
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

</body>

</html>






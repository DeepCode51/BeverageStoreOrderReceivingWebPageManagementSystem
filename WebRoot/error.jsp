<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>



<!DOCTYPE html>
<html lang="zxx">

<jsp:include page="head.jsp"></jsp:include>

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
<!--====== ROOM-DETAILS START ======-->
<section class="room-details pt-120 pb-90">
    <div class="container">
        <div class="row">
            <!-- details -->
            <div class="col-lg-8">
                <div class="deatils-box">
                    <div class="title-wrap">
                        <div class="title">
                            <div class="room-cat"></div>
                            <h2>${sessionScope.info}</h2>
                        </div>
                        <a href="register.jsp">重新识别</a>
                    </div>
                    <p>

                    </p>

                </div>


            </div>
        </div>

    </div>
    </div>
</section>
<!--====== ROOM-DETAILS END ======-->
<!--====== Back to Top ======-->
<a href="#" class="back-to-top" id="backToTop">
    <i class="fal fa-angle-double-up"></i>
</a>
<!--====== FOOTER PART START ======-->
<jsp:include page="footer.jsp"></jsp:include>


</body>

</html>




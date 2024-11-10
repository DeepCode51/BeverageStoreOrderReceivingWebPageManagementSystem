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
            <span>新闻动态</span>
            <h2 class="page-title">${news.name}</h2>

            <ul class="breadcrumb-nav">
                <li><a href="index">首页</a></li>
                <li class="active">${news.ntype}</li>
            </ul>
        </div>
    </div>
</section>






<!--====== BREADCRUMB PART END ======-->
<!--====== PLACES CONTENT START ======-->
<section class="places-wrapper pt-120 pb-120">
    <div class="container">
        <div class="places-details">
            <div class="main-thumb mb-50">
                <img src="./upload/${news.img }" alt="images" style="width: 100%;  height: 500px;">
            </div>
            <div class="title-wrap mb-50 d-flex align-items-center justify-content-between">
                <div class="title">
                    <span class="place-cat">标题：</span>
                    <h2>${news.name}</h2>
                </div>
                <div class="link">
                    <a href="#">${news.ntype}列表</a>
                </div>
            </div>

           <%--<div class="meta-info">
                <div class="content-box">
                 <ul class="post-links">
                    <li><a href="#"><i class="fa fa-user"></i> By:  Michale John</a></li>
                    <li><a href="#"><i class="fa fa-tag"></i> Accomodation</a></li>
                    <li><a href="#"><i class="fa fa-comments-o"></i> Comments: 8</a></li>
                </ul>
                </div>
            </div>--%>


            <p>${news.pubtime}</p>
            <hr>


            <p class="mb-25">
               详情： ${news.note }
            </p>
        </div>

        <!-- Places Boxes -->
        <%--div class="places-boxes pt-115">
            <!-- Title -->
            <div class="section-title text-center mb-50">
                <span class="title-tag">Popular</span>
                <h2>Highlights Places</h2>
            </div>
            <div class="row justify-content-center">
                <div class="col-lg-3 col-md-4 col-sm-6 col-10">
                    <div class="place-box mt-30">
                        <div class="place-bg-wrap">
                            <div class="place-bg" style="background-image: url(assets/img/places/01.jpg);"></div>
                        </div>
                        <div class="desc">
                            <h4><a href="places-details.html">Duplex Restaurant</a></h4>
                            <span class="time">1,500m | 21 min. Walk</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 col-10">
                    <div class="place-box mt-30">
                        <div class="place-bg-wrap">
                            <div class="place-bg" style="background-image: url(assets/img/places/02.jpg);"></div>
                        </div>
                        <div class="desc">
                            <h4><a href="places-details.html">Duplex Restaurant</a></h4>
                            <span class="time">1,500m | 21 min. Walk</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 col-10">
                    <div class="place-box mt-30">
                        <div class="place-bg-wrap">
                            <div class="place-bg" style="background-image: url(assets/img/places/03.jpg);"></div>
                        </div>
                        <div class="desc">
                            <h4><a href="places-details.html">Duplex Restaurant</a></h4>
                            <span class="time">1,500m | 21 min. Walk</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 col-10">
                    <div class="place-box mt-30">
                        <div class="place-bg-wrap">
                            <div class="place-bg" style="background-image: url(assets/img/places/04.jpg);"></div>
                        </div>
                        <div class="desc">
                            <h4><a href="places-details.html">Duplex Restaurant</a></h4>
                            <span class="time">1,500m | 21 min. Walk</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>--%>
    </div>
</section>
<!--====== PLACES CONTENT END ======-->
<!--====== Back to Top ======-->
<a href="#" class="back-to-top" id="backToTop">
    <i class="fal fa-angle-double-up"></i>
</a>

<jsp:include page="footer.jsp"></jsp:include>

</body>

</html>


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
<!--====== BANNER PART START ======-->


<section class="banner-area banner-style-one">
    <div class="container container-custom-two">
        <div class="row align-items-center">

            <div class="col-lg-6 col-md-6 wow fadeInLeft" data-wow-delay="0.5s">
                <div class="banner-thumb d-none d-md-block">
                    <div class="hero-slider-one">

                        <c:forEach items="${list}" var="n">
                            <div class="banner-content">
						<span class="promo-tag wow fadeInDown">${n.pubtime}</span>
                                <h1 class="title wow fadeInLeft" > ${n.name}
                                </h1>
                                <ul>
                                    <li>
                                        <a class="main-btn btn-filled wow fadeInUp"  href="showNews.do?id=${n.id }">查看</a>
                                    </li>
                                    <%--<li>
                                        <a class="main-btn btn-border wow fadeInUp"  href="#">Learn
                                            More</a>
                                    </li>--%>
                                </ul>
                            </div>
                            <%--<div class="single-thumb">
                                <img src="./upload/${n.img}" alt="images" width="500px" height="600px;">
                            </div>--%>
                        </c:forEach>

                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-6 wow fadeInRight" data-wow-delay="0.5s">
                <div class="banner-thumb d-none d-md-block">
                    <div class="hero-slider-one">
                        <c:forEach items="${list}" var="n">
                        <div class="single-thumb">
                            <img src="upload/${n.img}" alt="images" width="500px" height="600px;">
                        </div>
                        </c:forEach>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--====== ABOUT PART END ======-->

<!--====== BOOKING FORM START ======-->
<div class="booking-form boxed-layout">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-xl-10 col-11">
                <div class="booking-form-inner">
                    <form action="selectGoodsList.do" method="post">
                        <div class="row align-items-end">
                            <div class="col-lg-3 col-md-6">
                                <div class="inputs-filed mt-30">
                                    <label for="dialog-name-label">名称：</label>
                                    <div class="icon"><i class="fal fa-edit"></i></div>
                                    <%--<input type="text" placeholder="24th march 2020" name="arrival-date"
                                           id="arrival-date">--%>
                                    <input type="text" placeholder="请输入名称" name="name" id="dialog-name-label">
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6">
                                <div class="inputs-filed mt-30">
                                    <label for="guests">分类：</label>
                                    <select name="fid" id="guests">
                                        <option value="" disabled selected>请选择分类：</option>
                                        <c:forEach items="${tlist}" var="f">
                                            <option value="${f.id}">${f.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6">
                                <div class="inputs-filed mt-30">
                                    <button type="submit">搜索</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!--====== BOOKING FORM EN ======-->
<!--====== Our Apartments START ======-->
<%--<section class="pt-115 pb-115 bg-white">
    <div class="container">
        <div class="section-title text-center mb-30">
            <span class="title-tag"> facilities </span>
            <h2>Apartments & Condos</h2>
        </div>
        <div class="text-center mb-20">
            <a href="#">View more
                <i class="fal fa-arrow-right ml-2"></i>
            </a>
        </div>
        <div class="row">
            <div class="col-lg-3 col-md-6">
                <div class="apartment-box">
                    <div class="image-box">
                        <a href="#" class="d-block">
                            <img src="assets/img/room-suite/01.jpg" alt="img">
                        </a>
                    </div>
                    <div class="content-box-2">
                        <h3 class="title">
                            <a href="#">Plex Apartment</a>
                        </h3>
                        <p>1 Person, Queed Bed, 2 Windows</p>
                        <span class="price">$345/Month</span>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="apartment-box">
                    <div class="image-box">
                        <a href="#" class="d-block">
                            <img src="assets/img/room-suite/02.jpg" alt="img">
                        </a>
                    </div>
                    <div class="content-box-2">
                        <h3 class="title">
                            <a href="#">Luxury Apartment</a>
                        </h3>
                        <p>1 Person, Queed Bed, 2 Windows</p>
                        <span class="price">$345/Month</span>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="apartment-box">
                    <div class="image-box">
                        <a href="#" class="d-block">
                            <img src="assets/img/room-suite/03.jpg" alt="img">
                        </a>
                    </div>
                    <div class="content-box-2">
                        <h3 class="title">
                            <a href="#">Garden Apartment</a>
                        </h3>
                        <p>1 Person, Queed Bed, 2 Windows</p>
                        <span class="price">$345/Month</span>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="apartment-box">
                    <div class="image-box">
                        <a href="#" class="d-block">
                            <img src="assets/img/room-suite/01.jpg" alt="img">
                        </a>
                    </div>
                    <div class="content-box-2">
                        <h3 class="title">
                            <a href="#">Duplex Apartment</a>
                        </h3>
                        <p>1 Person, Queed Bed, 2 Windows</p>
                        <span class="price">$345/Month</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>--%>
<!--====== Our Apartments End ======-->

<!--====== Condos Overlay START ======-->
<%--<section class="condos-overlay-sec">
    <div class="container-fluid p-0">
        <div class="row no-gutters">
            <div class="col-lg-3 col-md-6">
                <div class="condo-item" style="background-image: url(assets/img/condos/menu-gallery-1.jpg);">
                    <div class="title">
                        <i class="fal fa-plus text-white"></i>
                        <h4 class="text-white">City Hotel</h4>
                    </div>
                    <div class="title title-hidden">
                        <h4 class="text-white mt-0">City Homestay</h4>
                        <p class="text-white">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do</p>
                        <div class="book-btn">
                            <a href="#"><i class="fal fa-long-arrow-right"></i>
                                Book now
                            </a>
                        </div>
                    </div>
                    <a href="#" class="main-btn btn-border">Starting at $300</a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="condo-item" style="background-image: url(assets/img/condos/menu-gallery-2.jpg);">
                    <div class="title">
                        <i class="fal fa-plus text-white"></i>
                        <h4 class="text-white">City Hotel</h4>
                    </div>
                    <div class="title title-hidden">
                        <h4 class="text-white mt-0">City Homestay</h4>
                        <p class="text-white">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do</p>
                        <div class="book-btn">
                            <a href="#"><i class="fal fa-long-arrow-right"></i>
                                Book now
                            </a>
                        </div>
                    </div>
                    <a href="#" class="main-btn btn-border">Starting at $300</a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="condo-item" style="background-image: url(assets/img/condos/menu-gallery-3.jpg);">
                    <div class="title">
                        <i class="fal fa-plus text-white"></i>
                        <h4 class="text-white">City Hotel</h4>
                    </div>
                    <div class="title title-hidden">
                        <h4 class="text-white mt-0">City Homestay</h4>
                        <p class="text-white">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do</p>
                        <div class="book-btn">
                            <a href="#"><i class="fal fa-long-arrow-right"></i>
                                Book now
                            </a>
                        </div>
                    </div>
                    <a href="#" class="main-btn btn-border">Starting at $300</a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="condo-item" style="background-image: url(assets/img/condos/menu-gallery-4.jpg);">
                    <div class="title">
                        <i class="fal fa-plus text-white"></i>
                        <h4 class="text-white">City Hotel</h4>
                    </div>
                    <div class="title title-hidden">
                        <h4 class="text-white mt-0">City Homestay</h4>
                        <p class="text-white">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do</p>
                        <div class="book-btn">
                            <a href="#"><i class="fal fa-long-arrow-right"></i>
                                Book now
                            </a>
                        </div>
                    </div>
                    <a href="#" class="main-btn btn-border">Starting at $300</a>
                </div>
            </div>
        </div>
    </div>
</section>--%>
<!--====== Condos Overlay END ======-->

<!--====== CORE FEATURES START ======-->
<%--<section class="core-feature-section bg-white pt-115 pb-115">
    <div class="container">
        <div class="section-title text-center mb-50">
            <span class="title-tag"> facilities </span>
            <h2>Core Features</h2>
        </div>
        <!-- Featre Loop -->
        <div class="row features-loop">
            <div class="col-lg-4 col-sm-6 order-1">
                <div class="feature-box wow fadeInLeft" data-wow-delay=".3s">
                    <div class="icon">
                        <i class="flaticon-rating"></i>
                    </div>
                    <h3><a href="#">Have High Rating</a></h3>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                        tempor incididunt ut labore et dolore magna..
                    </p>
                    <span class="count">01</span>
                </div>
            </div>
            <div class="col-lg-4 col-sm-6 order-2">
                <div class="feature-box wow fadeInDown" data-wow-delay=".4s">
                    <div class="icon">
                        <i class="flaticon-clock"></i>
                    </div>
                    <h3><a href="#">Quiet Hours</a></h3>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                        tempor incididunt ut labore et dolore magna..
                    </p>
                    <span class="count">02</span>
                </div>
            </div>
            <div class="col-lg-4 col-sm-6 order-3 order-sm-4 order-lg-3">
                <div class="feature-box wow fadeInRight" data-wow-delay=".5s">
                    <div class="icon">
                        <i class="flaticon-location-pin"></i>
                    </div>
                    <h3><a href="#">Best Locations</a></h3>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                        tempor incididunt ut labore et dolore magna..
                    </p>
                    <span class="count">03</span>
                </div>
            </div>
            <div class="col-lg-4 col-sm-6 order-4 order-sm-3 order-lg-4">
                <div class="feature-box wow fadeInLeft" data-wow-delay=".6s">
                    <div class="icon">
                        <i class="flaticon-clock-1"></i>
                    </div>
                    <h3><a href="#">Free Cancellation</a></h3>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                        tempor incididunt ut labore et dolore magna..
                    </p>
                    <span class="count">04</span>
                </div>
            </div>
            <div class="col-lg-4 col-sm-6 order-5">
                <div class="feature-box wow fadeInUp" data-wow-delay=".7s">
                    <div class="icon">
                        <i class="flaticon-credit-card"></i>
                    </div>
                    <h3><a href="#">Payment Options</a></h3>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                        tempor incididunt ut labore et dolore magna..
                    </p>
                    <span class="count">05</span>
                </div>
            </div>
            <div class="col-lg-4 col-sm-6 order-6">
                <div class="feature-box wow fadeInRight" data-wow-delay=".8s">
                    <div class="icon">
                        <i class="flaticon-discount"></i>
                    </div>
                    <h3><a href="#">Special Offers</a></h3>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                        tempor incididunt ut labore et dolore magna..
                    </p>
                    <span class="count">06</span>
                </div>
            </div>
        </div>
    </div>
</section>--%>
<!--====== CORE FEATURES END ======-->

<!--====== COUNTER UP START ======-->
<%--<section class="counter-section bg-black">
    <div class="container">
        <div class="counter-inner pt-100 pb-60">
            <div class="row justify-content-center">
                <div class="col-xl-10 col-11">
                    <div class="row">
                        <div class="col-lg-3 col-6">
                            <div
                                    class="counter-box box-layout d-flex justify-content-center justify-content-lg-start">
                                <div>
                                    <div class="icon">
                                        <img src="assets/img/icon/01.png" alt="Icon">
                                    </div>
                                    <h4><span class="counter">84</span>k<span class="plus-icon">+</span></h4>
                                    <span class="title">Apartmentss in Album</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-6">
                            <div class="counter-box box-layout d-flex justify-content-center">
                                <div>
                                    <div class="icon">
                                        <img src="assets/img/icon/02.png" alt="Icon">
                                    </div>
                                    <h4><span class="counter">10</span>M<span class="plus-icon">+</span></h4>
                                    <span class="title">Active Backers Around World</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-6">
                            <div class="counter-box box-layout d-flex justify-content-center">
                                <div>
                                    <div class="icon">
                                        <img src="assets/img/icon/03.png" alt="Icon">
                                    </div>
                                    <h4><span class="counter">02</span>k<span class="plus-icon">+</span></h4>
                                    <span class="title">Categories Served</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-6">
                            <div
                                    class="counter-box box-layout d-flex justify-content-center justify-content-lg-end">
                                <div>
                                    <div class="icon">
                                        <img src="assets/img/icon/04.png" alt="Icon">
                                    </div>
                                    <h4><span class="counter">100</span>M<span class="plus-icon">+</span></h4>
                                    <span class="title">Ideas Raised Funds</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>--%>
<!--====== COUNTER UP END ======-->

<!--====== TEXT BLOCK START ======-->
<%--<section class="text-block bg-black with-pattern pt-115 pb-115">
    <div class="container">
        <div class="row align-items-center justify-content-center">
            <div class="col-lg-6 col-md-10 order-2 order-lg-1">
                <div class="block-text">
                    <div class="section-title mb-20">
                        <span class="title-tag">intro video</span>
                        <h2>Meet With Our
                            Luxury Place.</h2>
                    </div>
                    <p class="pr-50">
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt
                        ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco
                        laboris nisi ut aliquip ex ea commodo consequat you have to understand this.
                    </p>
                    <a href="#" class="main-btn btn-filled mt-40">Book now</a>
                </div>
            </div>
            <div class="col-lg-6 col-md-10 order-1 order-lg-2 wow fadeInRight" data-wow-delay=".3s">
                <div class="video-wrap video-wrap-two mb-small"
                     style="background-image: url(assets/img/text-block/03.jpg);">
                    <a href="" class="popup-video"><i class="fas fa-play"></i></a>
                </div>
            </div>
        </div>
    </div>
    <div class="pattern-wrap">
        <div class="pattern"></div>
    </div>
</section>--%>
<!--====== TEXT BLOCK END ======-->

<!--====== TEAM START ======-->

<%--<section class="team-section bg-white has-slider pt-115 pb-85">
    <div class="container-fluid">
        <div class="row team-loop team-slider-one">
            <c:forEach items="${plist}" var="p">
            <div class="col-lg-3">
                <div class="member-box">
                    <div class="member-img">
                        <img src="./upload/${p.img}" alt="Team-Image" width="360px;" height="260px;">
                    </div>
                    <div class="member-info">
                        <h3>${p.name}</h3>
                        <span>Founder & CEO</span>
                    </div>
                    <a href="#" class="socail-trigger">+</a>
                </div>
            </div>
            </c:forEach>
            <div class="col-lg-3">
                <div class="member-box">
                    <div class="member-img">
                        <img src="assets/img/team/02.jpg" alt="Team-Image">
                    </div>
                    <div class="member-info">
                        <h3>hilixer b. browni</h3>
                        <span>co-founder</span>
                    </div>
                    <a href="#" class="socail-trigger">+</a>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="member-box">
                    <div class="member-img">
                        <img src="assets/img/team/03.jpg" alt="Team-Image">
                    </div>
                    <div class="member-info">
                        <h3>pokoloko k. kilix</h3>
                        <span>consultant</span>
                    </div>
                    <a href="#" class="socail-trigger">+</a>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="member-box">
                    <div class="member-img">
                        <img src="assets/img/team/04.jpg" alt="Team-Image">
                    </div>
                    <div class="member-info">
                        <h3>pokoloko k. kilix</h3>
                        <span>consultant</span>
                    </div>
                    <a href="#" class="socail-trigger">+</a>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="member-box">
                    <div class="member-img">
                        <img src="assets/img/team/05.jpg" alt="Team-Image">
                    </div>
                    <div class="member-info">
                        <h3>pokoloko k. kilix</h3>
                        <span>consultant</span>
                    </div>
                    <a href="#" class="socail-trigger">+</a>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="member-box">
                    <div class="member-img">
                        <img src="assets/img/team/01.jpg" alt="Team-Image">
                    </div>
                    <div class="member-info">
                        <h3>Rosalina D. William</h3>
                        <span>Founder & CEO</span>
                    </div>
                    <a href="#" class="socail-trigger">+</a>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="member-box">
                    <div class="member-img">
                        <img src="assets/img/team/02.jpg" alt="Team-Image">
                    </div>
                    <div class="member-info">
                        <h3>hilixer b. browni</h3>
                        <span>co-founder</span>
                    </div>
                    <a href="#" class="socail-trigger">+</a>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="member-box">
                    <div class="member-img">
                        <img src="assets/img/team/03.jpg" alt="Team-Image">
                    </div>
                    <div class="member-info">
                        <h3>pokoloko k. kilix</h3>
                        <span>consultant</span>
                    </div>
                    <a href="#" class="socail-trigger">+</a>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="member-box">
                    <div class="member-img">
                        <img src="assets/img/team/04.jpg" alt="Team-Image">
                    </div>
                    <div class="member-info">
                        <h3>pokoloko k. kilix</h3>
                        <span>consultant</span>
                    </div>
                    <a href="#" class="socail-trigger">+</a>
                </div>
            </div>
        </div>
    </div>
</section>--%>

<!--====== TEAM END ======-->

<!--====== LATEST NEWS START ======-->
<section class="latest-news pt-115 pb-115">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-6 col-md-8 col-sm-7">
                <div class="section-title">
                    <span class="title-tag">饮品</span>
                    <h2>饮品列表</h2>
                </div>
            </div>
            <div class="col-lg-6 col-md-4 col-sm-5 d-none d-sm-block">
                <div class="latest-post-arrow arrow-style text-right">

                </div>
            </div>
        </div>
        <!-- Latest post loop -->
        <div class="row latest-post-slider mt-80">
            <c:forEach items="${glist }" var="p">
            <div class="col-lg-4">
                <div class="latest-post-box">
                    <a href="showGoods.do?id=${p.id }"><div class="post-img" style="background-image: url(./upload/${p.img}); width: 360px; height: 260px;"></div></a>
                    <div class="post-desc">
                        <ul class="post-meta">
                            <li>
                                <a href="showGoods.do?id=${p.id }"><i class="fal fa-calendar-alt"></i>${p.pubtime}</a>
                            </li>
                            <li>
                                <a href="showGoods.do?id=${p.id }"><i class="fal fa-user"></i>${p.name}</a>
                            </li>
                        </ul>
                        <h4><a href="showGoods.do?id=${p.id }">${p.name}</a></h4>
                        <p>
                           分类：
                                <c:forEach items="${tlist}" var="f">
                                    <c:if test="${f.id==p.fid}">
                                        <a href="selectGoodsList.do?fid=${f.id}">${f.name}</a>
                                    </c:if>
                                </c:forEach>
                        </p>
                    </div>
                </div>
            </div>
            </c:forEach>
        </div>
    </div>
</section>
<!--====== LATEST NEWS END ======-->
<!--====== Back to Top ======-->
<a href="#" class="back-to-top" id="backToTop">
    <i class="fal fa-angle-double-up"></i>
</a>
<!--====== FOOTER PART START ======-->
<jsp:include page="footer.jsp"></jsp:include>
</body>

</html>

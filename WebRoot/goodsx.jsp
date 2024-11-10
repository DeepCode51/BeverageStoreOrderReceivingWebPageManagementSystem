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
            <span>饮品</span>
            <h2 class="page-title">饮品详情</h2>

            <ul class="breadcrumb-nav">
                <li><a href="index">首页</a></li>
                <li class="active">饮品详情</li>
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
                            <h2>${goods.name}</h2>
                        </div>
                        <div class="price">
                            ￥：${goods.price}<span></span>
                        </div>
                    </div>
                    <div class="thumb">
                        <img src="./upload/${goods.img}" alt="images" width="100%" height="400px;">
                    </div>
                    <div class="room-rules clearfix mb-60">
                        <h3 class="subtitle">饮品信息</h3>
                        <ul class="room-rules-list">
                            <li><code>饮品分类 :</code>
                                <c:forEach items="${tlist }" var="t">
                                    <c:if test="${t.id==goods.fid }">
                                        <a href="selectGoodsList.do?fid=${t.id}"> ${t.name }</a>
                                    </c:if>
                                </c:forEach> </li>
                             <%--<li><code>目前状态 :</code> ${goods.status }</li>--%>
                            <li><code>发布时间 :</code> ${goods.pubtime }</li>
                        </ul>
                    </div>
                    <hr>
                    <p>
                      详情：${goods.note}
                    </p>
                    <hr>
                    <%--<div class="room-fearures clearfix mt-60 mb-60">
                        <h3 class="subtitle">Amenities</h3>
                        <ul class="room-fearures-list">
                            <li><i class="fal fa-bath"></i> Air conditioner</li>
                            <li><i class="fal fa-wifi"></i>High speed WiFi</li>
                            <li><i class="fal fa-key"></i>Strong Locker</li>
                            <li><i class="fal fa-cut"></i>Breakfast</li>
                            <li><i class="fal fa-guitar"></i>Kitchen</li>
                            <li><i class="fal fa-lock"></i>Smart Security</li>
                            <li><i class="fal fa-broom"></i>Cleaning</li>
                            <li><i class="fal fa-shower"></i>Shower</li>
                            <li><i class="fal fa-headphones-alt"></i>24/7 Online Support</li>
                            <li><i class="fal fa-shopping-basket"></i>Grocery</li>
                            <li><i class="fal fa-bed"></i>Single bed</li>
                            <li><i class="fal fa-users"></i>Expert Team</li>
                            <li><i class="fal fa-shopping-cart"></i>shop near</li>
                            <li><i class="fal fa-bus"></i>Towels</li>
                        </ul>
                    </div>--%>
                    <%--<p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt
                        ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco
                        laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in
                        voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat
                        cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed
                        ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque
                        laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi
                        architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit
                        aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione
                        voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet,
                        consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et
                        dolore magnam aliquam quaerat voluptatem.
                    </p>--%>
                    <%--<div class="testimonials mt-60 mb-20">
                        <div class="row">
                            <div class="col-lg-6 col-sm-6">
                                <div class="testimonial-box">
                                    <div class="client-img">
                                        <img src="assets/img/testimonial/01.png" alt="images">
                                        <span class="check"><i class="fal fa-check"></i></span>
                                    </div>
                                    <h3>Rosalina D. William</h3>
                                    <span class="clinet-post">Founder, qux co.</span>
                                    <p>
                                        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                        tempor
                                        incididunt ut labore et dolore.
                                    </p>
                                </div>
                            </div>
                            <div class="col-lg-6 col-sm-6">
                                <div class="testimonial-box">
                                    <div class="client-img">
                                        <img src="assets/img/testimonial/02.png" alt="images">
                                        <span class="check"><i class="fal fa-check"></i></span>
                                    </div>
                                    <h3>Donald H. Hilixer</h3>
                                    <span class="clinet-post">Founder, hilix</span>
                                    <p>
                                        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                        tempor
                                        incididunt ut labore et dolore.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>--%>
                    <%--商品--%>
                   <%--<div class="cancellation-box clearfix mb-60">
                       <h3 class="subtitle">Cancellation</h3>
                       <p>
                           Phasellus volutpat neque a tellus venenatis, a euismod augue facilisis. Fusce ut metus
                           mattis, consequat metus nec, luctus lectus. Pellentesque orci quis hendrerit sed eu
                           dolor. <strong>Cancel up</strong> to <strong>14 days</strong> to get a full refund.
                       </p>
                   </div>
                    <div class="table-responsive"> <table class="table table-striped"> <colgroup> <col class="col-xs-1"> <col class="col-xs-7"> </colgroup><tbody>
--%>

                </div>

                    <%--<div class="room-map mb-60" id="roomMap"></div>
                    <div class="related-room">
                        <h3 class="subtitle">Related Apartments</h3>
                        <div class="row room-gird-loop">
                            <div class="col-lg-6 col-sm-6">
                                <div class="room-box mb-30">
                                    <div class="room-img-wrap">
                                        <div class="room-img"
                                             style="background-image: url(assets/img/room/13.jpg);">
                                        </div>
                                    </div>
                                    <div class="room-desc">
                                        <ul class="icons">
                                            <li><i class="fal fa-bed"></i></li>
                                            <li><i class="fal fa-wifi"></i></li>
                                            <li><i class="fal fa-car"></i></li>
                                            <li><i class="fal fa-coffee"></i></li>
                                            <li><i class="fal fa-concierge-bell"></i></li>
                                            <li><i class="fal fa-compress-arrows-alt"></i></li>
                                            <li><i class="fal fa-swimmer"></i></li>
                                        </ul>
                                        <h4 class="title"><a href="#">Minimal Duplex Apartment</a></h4>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipi sicing elit, sed do eiusmod
                                            tempor.</p>
                                        <span class="price">$345/Month</span>
                                        <a href="#" class="book-btn">Booking Now</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 col-sm-6">
                                <div class="room-box mb-30">
                                    <div class="room-img-wrap">
                                        <div class="room-img"
                                             style="background-image: url(assets/img/room/14.jpg);">
                                        </div>
                                    </div>
                                    <div class="room-desc">
                                        <ul class="icons">
                                            <li><i class="fal fa-bed"></i></li>
                                            <li><i class="fal fa-wifi"></i></li>
                                            <li><i class="fal fa-car"></i></li>
                                            <li><i class="fal fa-coffee"></i></li>
                                            <li><i class="fal fa-concierge-bell"></i></li>
                                            <li><i class="fal fa-compress-arrows-alt"></i></li>
                                            <li><i class="fal fa-swimmer"></i></li>
                                        </ul>
                                        <h4 class="title"><a href="#">Minimal Duplex Apartment</a></h4>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipi sicing elit, sed do eiusmod
                                            tempor.</p>
                                        <span class="price">$345/Month</span>
                                        <a href="#" class="book-btn">Booking Now</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>--%>
            </div>
            <!-- form -->
            <div class="col-lg-4">
                <div class="room-booking-form">
                    <h5 class="title">预定信息</h5>
                    <form action="#" method="post">
                        <%--<div class="input-group input-group-two left-icon mb-20">
                            <label for="arrival-date">Check In</label>
                            <div class="icon"><i class="fal fa-calendar-alt"></i></div>
                            <input type="text" placeholder="20-6-2020" name="arrival-date" id="arrival-date">
                        </div>
                        <div class="input-group input-group-two left-icon mb-20">
                            <label for="departure-date">Check Out</label>
                            <div class="icon"><i class="fal fa-calendar-alt"></i></div>
                            <input type="text" placeholder="30-6-2020" name="departure-date" id="departure-date">
                        </div>
                        <div class="input-group input-group-two left-icon mb-20">
                            <label for="room">Apartments</label>
                            <select name="room" id="room">
                                <option value="1">1 Apartment</option>
                                <option value="2" selected>2 Apartment</option>
                                <option value="4">4 Apartment</option>
                                <option value="8">8 Apartment</option>
                            </select>
                        </div>
                        <div class="input-group input-group-two left-icon mb-20">
                            <label for="departure-date">Guest</label>
                            <select name="guest" id="guest">
                                <option value="8">8 Guest</option>
                                <option value="10" selected>10 Guest</option>
                                <option value="12">12 Guest</option>
                                <option value="15">15 Guest</option>
                            </select>
                        </div>--%>
                        <div class="input-group">


                            <c:if test="${sessionScope.user==null }">
                                请登录后操作！
                                <a href="login.jsp" class="res-btn">登录</a>
                            </c:if>
                            <c:if test="${sessionScope.user!=null }">
                                <a href="addShop.do?fid=${goods.id }"  class="main-btn btn-filled">加入购物车</a>
                                <br>
                               <%-- <button class="main-btn btn-filled">提交</button>--%>
                                <%--<a href="doAddBbs_liuYan?uid=${goods.uid }" class="res-btn">投诉及建议</a>--%>
                            </c:if>

                        </div>
                    </form>
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




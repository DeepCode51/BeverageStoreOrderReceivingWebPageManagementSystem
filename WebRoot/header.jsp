<%--解决jsp页面中文乱码--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!--[if lte IE 9]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
<![endif]-->

<!--====== PRELOader ======-->
<div class="preloader d-flex align-items-center justify-content-center">
    <div class="cssload-container">
        <div class="cssload-loading"><i></i><i></i><i></i><i></i></div>
    </div>
</div>

<header class="header-absolute sticky-header">
    <div class="container container-custom-one">
        <div class="nav-container d-flex align-items-center justify-content-between">
            <!-- Main Menu -->
            <div class="nav-menu d-lg-flex align-items-center">

                <!-- Navbar Close Icon -->
                <div class="navbar-close">
                    <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                </div>

                <!-- Off canvas Menu  -->
                <div class="toggle">
                    <%--<img src="assets/img/log.png" width="300" height="100px;">--%>
                    <%--<a href="#" id="offCanvasBtn"><i class="fal fa-bars"></i></a>--%>
                  <h3>饮品店接单网页</h3>
                </div>
                <!-- Mneu Items -->
                <div class="menu-items">
                    <ul>
                        <li>
                            <a href="index.do"><h4>首页</h4></a>
                            <ul class="submenu">
                                <%--<li><a href="index.html" class="active">Home One</a></li>
                                <li><a href="index-2.html">Home Two</a></li>
                                <li><a href="index-3.html">Home Three</a></li>--%>
                            </ul>
                        </li>
                        <li>
                            <a href="showNewsList.do"><h4>新闻公告</h4></a>
                        </li>
                        <li>
                            <a href="#"><h4>饮品类型</h4></a>
                            <ul class="submenu">
                                <c:forEach items="${tlist }" var="t">
                                    <li><a href="selectGoodsList.do?fid=${t.id }">${t.name }</a></li>
                                </c:forEach>
                            </ul>
                        </li>
                        <li>
                            <a href="showGoodsList.do"><h4>饮品</h4></a>
                        </li>
                      <li>
                        <a href="showGoodsList_tj.do"><h4>推荐饮品</h4></a>
                      </li>

                        <li>
                            <a href="showShop.do"><h4>购物车</h4></a>
                        </li>
                        <li>
                            <a href="doAddMoney.do"><h4>充值</h4></a>
                        </li>
                       <%-- <li><a href="#">Pages</a>
                            <ul class="submenu">
                                <li>
                                    <a href="places.html">Places Near By</a>
                                    <ul class="submenu">
                                        <li><a href="places-details.html">Places Details</a></li>
                                    </ul>
                                </li>
                                <li><a href="classification.html">Classification</a></li>
                                <li><a href="gallery.html">Our Gallery</a></li>
                                <li><a href="contact.html">Contact Us</a></li>
                                <li><a href="about.html">About Us</a></li>
                                <li><a href="broker.html">Brokers</a></li>
                            </ul>
                        </li>--%>
                        <c:if test="${sessionScope.user.utype!=null }">
                            <li><a href="#" style="color: #f00"><h4>${sessionScope.user.uname }</h4></a>
                                <ul class="submenu">
                                    <%--<li>
                                        <a href="showUserInfo2l">Places Near By</a>
                                        <ul class="submenu">
                                            <li><a href="places-details.html">Places Details</a></li>
                                        </ul>
                                    </li>--%>
                                    <li><a href="showInfo.do">个人信息</a></li>
                                    <li><a href="bbsList.do">我的投诉及建议</a></li>
                                    <li><a href="myOrdersList.do">我的订单</a></li>
                                </ul>
                            </li>
                        </c:if>
                        <li><a href="<%=path%>/admin/login.jsp" target="_blank;"><h4>后台</h4></a></li>
                    </ul>
                </div>

                <!-- from pushed-item -->
                <div class="nav-pushed-item"></div>
            </div>

            <!-- Site Logo -->
            <div class="site-logo">
                <a href="index"><%--<img src="assets/img/logo.png" alt="Logo">--%></a>
            </div>

            <!-- Header Info Pussed To Menu Wrap -->
            <div class="nav-push-item">
                <!-- Header Info -->
                <div class="header-info d-lg-flex align-items-center">
                <c:if test="${sessionScope.user.utype==null }">
                    <div class="item">
                        <%--<i class="fal fa-phone"></i>
                        <span>Phone Number</span>--%>
                        <a href="login.jsp">
                            <h5 class="title">登录</h5>
                        </a>
                    </div>
                    <div class="item">
                        <%--<i class="fal fa-envelope"></i>
                        <span>Email Address</span>--%>
                        <a href="register.jsp">
                            <h5 class="title">注册</h5>
                        </a>
                    </div>
                </c:if>

                    <c:if test="${sessionScope.user.uname!=null }">
                        <div class="item">
                                <%--<i class="fal fa-phone"></i>
                                <span>Phone Number</span>--%>
                            <%--<img src="./upload/${sessionScope.user.img}" width="30" height="30"/> 车牌号：${user.uname }--%>
                        </div>
                        <div class="item">
                                <%--<i class="fal fa-envelope"></i>
                                <span>Email Address</span>--%>
                             <a href="loginOut.do" <%--onclick="return loginOut();"--%>> <h6 class="title" style="color: #f00">退出</h6></a>

                        </div>
                    </c:if>
                </div>
            </div>

            <!-- Navbar Toggler -->
            <div class="navbar-toggler">
                <span></span><span></span><span></span>
            </div>
        </div>
    </div>
</header>
<script>
        function loginOut() {

            //console.log("session=="+session.getStorageKey("user"));
            sessionStorage.removeItem("user");
        window.location.href='register.jsp';
    }
</script>
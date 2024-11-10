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
            <span>新闻列表</span>
            <h2 class="page-title">新闻列表</h2>

            <ul class="breadcrumb-nav">
                <li><a href="#">首页</a></li>
                <li class="active">新闻列表</li>
            </ul>
        </div>
    </div>
</section>
<!--====== BREADCRUMB PART END ======-->
<!--====== BLOG SECTION START ======-->
<section class="blog-section pt-120 pb-120">
    <div class="container">
    <div class="footer-subscibe-area pt-120 pb-120">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-8">
                        <div class="subscribe-text text-center">
                            <!-- <div class="footer-logo mb-45">
                                <img src="assets/img/logo-2.png" alt="images">
                            </div> -->
                            <!-- <p>
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed doing
                                eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                                quis nostrud exercitation ullamco laboris nisi.
                            </p> -->
                            <form action="searchNews.do" class="subscribe-form mt-50" method="post">
                                <input type="text" placeholder="请输入新闻的名称" name="name">
                                <button type="submit" class="main-btn btn-filled" >搜索</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-lg-12 col-md-10">
                <div class="blog-loop">
                    <c:forEach items="${list }" var="news">
                    <div class="post-box mb-40">
                        <div class="post-media">
                            <img src="./upload/${news.img }" alt="Image" style="width: 100%;  height: 500px;">
                        </div>
                        <div class="post-desc">
                            <a href="#" class="cat">新闻列表</a>
                            <h2>
                                <a href="#">${news.name}</a>
                            </h2>
                            <ul class="post-meta">
                                <%--<li><a href="#"><i class="far fa-eye"></i>232 Views</a></li>
                                <li><a href="#"><i class="far fa-comments"></i>35 Comments</a></li>--%>
                                <li><a href="#"><i class="far fa-calendar-alt"></i>${news.pubtime}<span></span></a></li>
                            </ul>
                            <%--<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                                incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                                exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute
                                irure dolor in reprehenderit in voluptate velit esse cillum dolore.</p>--%>

                            <div class="post-footer">
                                <div class="author">
                                    <a href="#">
                                        <%--<c:forEach items="${ulist}" var="u">
                                            <c:if test="${news.uid==u.id}">
                                                <img src="upload/${u.img}" alt="Image" width="50px" height="50px;" >
                                                发布者：${u.tname}
                                            </c:if>
                                        </c:forEach>--%>

                                    </a>
                                </div>
                                <div class="read-more">
                                    <a href="showNews.do?id=${news.id }"><i class="far fa-arrow-right"></i>查看详情</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>

                </div>
                </div>
                <div class="pagination-wrap">
                    <ul>
                        <c:if test="${sessionScope.p==1 }">
                            <c:if test="${page.page>1}">
                                <li><a href="fnewsList.do?page=1" >首页</a></li>
                                <li><a href="fnewsList.do?page=${page.page-1 }"> 上一页</a></li>
                                <li><a >下一页</a></li>
                                <li><a >末页</a></li>
                            </c:if>
                            <c:if test="${page.page<page.totalPage}">
                                <li><a >首页</a></li>
                                <li><a > 上一页</a></li>
                                <li><a href="fnewsList.do?page=${page.page+1 }">下一页</a></li>
                                <li><a href="fnewsList.do?page=${page.totalPage }">末页</a></li>
                            </c:if>
                        </c:if>
                    </ul>
                </div>
            </div>


            <%--<!-- Blog Sidebar -->
            <div class="col-lg-4 col-md-8 col-sm-10">
                <div class="sidebar">
                    <!-- About Author Widget -->
                    <div class="widget about-author-widget mb-40">
                        <h5 class="widget-title">About Me</h5>
                        <div class="author-box">
                            <img src="assets/img/author.png" alt="author">
                            <h6>Rosalina D. Willaimson</h6>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                                incididunt ut labore.</p>
                            <ul class="social-icon">
                                <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                                <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fab fa-behance"></i></a></li>
                                <li><a href="#"><i class="fab fa-linkedin"></i></a></li>
                                <li><a href="#"><i class="fab fa-youtube"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <!-- Search Widget -->
                    <div class="widget search-widget mb-40">
                        <h5 class="widget-title">Search Objects</h5>
                        <form action="#">
                            <input type="text" placeholder="Search your keyword...">
                            <button type="submit"><i class="far fa-search"></i></button>
                        </form>
                    </div>
                    <!-- Popular Post Widget -->
                    <div class="widget popular-feeds mb-40">
                        <h5 class="widget-title">Popular Feeds</h5>
                        <div class="popular-feed-loop">
                            <div class="single-popular-feed">
                                <div class="feed-img">
                                    <img src="assets/img/recent-post-wid/04.png" alt="Image">
                                </div>
                                <div class="feed-desc">
                                    <h6><a href="#">Lorem ipsum dolor sit cing elit, sed do.</a></h6>
                                    <span class="time"><i class="far fa-calendar-alt"></i> 24th March 2020</span>
                                </div>
                            </div>
                            <div class="single-popular-feed">
                                <div class="feed-img">
                                    <img src="assets/img/recent-post-wid/05.png" alt="Image">
                                </div>
                                <div class="feed-desc">
                                    <h6><a href="#">Lorem ipsum dolor sit cing elit, sed do.</a></h6>
                                    <span class="time"><i class="far fa-calendar-alt"></i> 24th March 2020</span>
                                </div>
                            </div>
                            <div class="single-popular-feed">
                                <div class="feed-img">
                                    <img src="assets/img/recent-post-wid/06.png" alt="Image">
                                </div>
                                <div class="feed-desc">
                                    <h6><a href="#">Lorem ipsum dolor sit cing elit, sed do.</a></h6>
                                    <span class="time"><i class="far fa-calendar-alt"></i> 24th March 2020</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Categories Widget -->
                    <div class="widget categories-widget mb-40">
                        <h5 class="widget-title">Categories</h5>
                        <ul>
                            <li>
                                <a href="#">Business<span>26</span></a>
                            </li>
                            <li>
                                <a href="#">Consultant<span>26</span></a>
                            </li>
                            <li>
                                <a href="#">Creative<span>26</span></a>
                            </li>
                            <li>
                                <a href="#">UI/UX<span>26</span></a>
                            </li>
                            <li>
                                <a href="#">Technology<span>26</span></a>
                            </li>
                        </ul>
                    </div>
                    <!-- Social Icon Widget -->
                    <div class="widget socail-widget mb-40">
                        <h5 class="widget-title">Never Miss News</h5>
                        <ul>
                            <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                            <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fab fa-behance"></i></a></li>
                            <li><a href="#"><i class="fab fa-linkedin"></i></a></li>
                            <li><a href="#"><i class="fab fa-pinterest"></i></a></li>
                        </ul>
                    </div>
                    <!-- Twitter Feeds Widget -->
                    <div class="widget twitter-feed-widget mb-40">
                        <h5 class="widget-title">Twitter Feeds</h5>
                        <div class="twitter-looop">
                            <div class="single-twitter">
                                <a href="#">
                                    Rescue - #Gutenberg ready @ wordpress Theme for Creative Bloggers available on @
                                    ThemeForest https://t.co/2r1POjOjgVC… https://t.co/rDAnPyClu1
                                </a>
                                <span class="date">November 25, 2018</span>
                            </div>
                            <div class="single-twitter">
                                <a href="#">
                                    Rescue - #Gutenberg ready @ wordpress Theme for Creative Bloggers available on @
                                    ThemeForest https://t.co/2r1POjOjgVC… https://t.co/rDAnPyClu1
                                </a>
                                <span class="date">November 25, 2018</span>
                            </div>
                            <div class="single-twitter">
                                <a href="#">
                                    Rescue - #Gutenberg ready @ wordpress Theme for Creative Bloggers available on @
                                    ThemeForest https://t.co/2r1POjOjgVC… https://t.co/rDAnPyClu1
                                </a>
                                <span class="date">November 25, 2018</span>
                            </div>
                        </div>
                    </div>
                    <!-- Instagram Feeds Widget -->
                    <div class="widget instagram-feed-widget mb-40">
                        <h5 class="widget-title">Instagram Feeds</h5>
                        <ul>
                            <li><img src="assets/img/instagram-wid/01.jpg" alt="Image"></li>
                            <li><img src="assets/img/instagram-wid/02.jpg" alt="Image"></li>
                            <li><img src="assets/img/instagram-wid/03.jpg" alt="Image"></li>
                            <li><img src="assets/img/instagram-wid/04.jpg" alt="Image"></li>
                            <li><img src="assets/img/instagram-wid/05.jpg" alt="Image"></li>
                            <li><img src="assets/img/instagram-wid/06.jpg" alt="Image"></li>
                            <li><img src="assets/img/instagram-wid/07.jpg" alt="Image"></li>
                            <li><img src="assets/img/instagram-wid/08.jpg" alt="Image"></li>
                            <li><img src="assets/img/instagram-wid/09.jpg" alt="Image"></li>
                        </ul>
                    </div>
                    <!-- Popular Tags Widget -->
                    <div class="widget popular-tag-widget mb-40">
                        <h5 class="widget-title">Popular Tags</h5>
                        <ul>
                            <li><a href="#">Popular</a></li>
                            <li><a href="#">design</a></li>
                            <li><a href="#">ux</a></li>
                            <li><a href="#">usability</a></li>
                            <li><a href="#">develop</a></li>
                            <li><a href="#">icon</a></li>
                            <li><a href="#">business</a></li>
                            <li><a href="#">consult</a></li>
                            <li><a href="#">kit</a></li>
                            <li><a href="#">keyboard</a></li>
                            <li><a href="#">mouse</a></li>
                            <li><a href="#">tech</a></li>
                        </ul>
                    </div>
                    <!-- Banner Ad Widget -->
                    <div class="widget banner-ad-widget">
                        <img src="assets/img/banner-widget.jpg" alt="Image">
                    </div>
                </div>
            </div>--%>
        </div>
    </div>
</section>
<!--====== BLOG SECTION END ======-->
<!--====== Back to Top ======-->
<a href="#" class="back-to-top" id="backToTop">
    <i class="fal fa-angle-double-up"></i>
</a>
<!--====== FOOTER PART START ======-->
<jsp:include page="footer.jsp"></jsp:include>
</body>

</html>


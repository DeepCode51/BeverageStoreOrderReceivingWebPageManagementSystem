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
                            </div>
                            <p>
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
                    <c:forEach items="${pageInfo.list }" var="news">
                    <div class="post-box mb-40">
                        <div class="post-media">
                            <img src="upload/${news.img }" alt="Image" style="width: 100%;  height: 500px;">
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
                                        <%-- <c:forEach items="${ulist}" var="u">
                                            <c:if test="${news.uid==u.id}">
                                                <img src="upload/${u.img}" alt="Image" width="50px" height="50px;" >
                                                发布者：${u.tname}
                                            </c:if>
                                        </c:forEach> --%>

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
                        <a  href="#" aria-label="Previous"> 当前第${pageInfo.pageNum}页；总共${pageInfo.pages} 页，共${pageInfo.total} 条数据; &nbsp;</a>
                        <li class="page-item " >
                          <a  href="showNewsList.do?page=1" aria-label="Previous">首页</a>
                        </li>
                        <c:if test="${pageInfo.hasPreviousPage}">
                          <li  ><a  href="showNewsList.do?page=${pageInfo.pageNum-1}">上一页</a></li>
                        </c:if>
                        <c:forEach items="${pageInfo.navigatepageNums}" var="page_num">
                          <c:if test="${page_num==pageInfo.pageNum}">
                            <li><a  href="#">${page_num}</a></li>
                          </c:if>
                          <c:if test="${page_num!=pageInfo.pageNum}">
                            <li><a  href="showNewsList.do?page=${page_num}">${page_num}</a></li>
                          </c:if>
                        </c:forEach>
                        <c:if test="${pageInfo.hasNextPage}">
                          <li  ><a  href="showNewsList.do?page=${pageInfo.pageNum+1}">下一页</a></li>
                        </c:if>
                        <li>
                          <a  href="showNewsList.do?page=${pageInfo.pages}" aria-label="Next">尾页</a>
                        </li>
                      </c:if>
                    </ul>
                </div>
            </div>

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


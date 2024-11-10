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
            <span>饮品列表信息</span>
            <h2 class="page-title">饮品列表</h2>

            <ul class="breadcrumb-nav">
                <li><a href="index">首页</a></li>
                <li class="active">饮品列表</li>
            </ul>
        </div>
    </div>
</section>
<!--====== BREADCRUMB PART END ======-->

<!--====== ROOM-GRIRD START ======-->
<section class="room-section room-grid-style pt-120 pb-120">
    <div class="container">
        <div class="row justify-content-center room-gird-loop">

            <c:forEach items="${list }" var="p">
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="room-box mb-30">
                    <div class="room-img-wrap">
                        <div class="room-img" style="background-image: url(upload/${p.img}); "></div>
                    </div>
                    <div class="room-desc">
                        <%--<ul class="icons">
                            <li><i class="fal fa-bed"></i></li>
                            <li><i class="fal fa-wifi"></i></li>
                            <li><i class="fal fa-car"></i></li>
                            <li><i class="fal fa-coffee"></i></li>
                            <li><i class="fal fa-concierge-bell"></i></li>
                            <li><i class="fal fa-compress-arrows-alt"></i></li>
                            <li><i class="fal fa-swimmer"></i></li>
                        </ul>--%>
                        <h4 class="title"><a href="<%=path%>/GoodsServlet?method=showGoodsx&&id=${p.id }">${p.name}</a></h4>
                       <%-- <p>Lorem ipsum dolor sit amet, consectetur adipi sicing elit, sed do eiusmod tempor.</p>--%>
                        <span class="price">￥：${p.price}/份</span>
                        <a href="<%=path%>/GoodsServlet?method=showGoodsx&&id=${p.id }" class="book-btn">查看</a>
                    </div>
                </div>
            </div>
            </c:forEach>
        </div>
        <div class="pagination-wrap">
            <ul>
                <%--<li><a href="#"><i class="far fa-angle-double-left"></i></a></li>
                <li class="active"><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">...</a></li>
                <li><a href="#">10</a></li>
                <li><a href="#"><i class="far fa-angle-double-right"></i></a></li>--%>
            </ul>
        </div>
    </div>
</section>
<!--====== ROOM-GRIRD END ======-->
<!--====== Back to Top ======-->
<a href="#" class="back-to-top" id="backToTop">
    <i class="fal fa-angle-double-up"></i>
</a>
<!--====== FOOTER PART START ======-->
<jsp:include page="footer.jsp"></jsp:include>


</body>

</html>

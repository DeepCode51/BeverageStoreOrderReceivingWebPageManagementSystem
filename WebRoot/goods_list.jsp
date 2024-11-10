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
<!--====== ROOM-LIST START ======-->
<section class="room-section room-list-style pt-120 pb-120">
    <div class="container">
        <div class="room-list-loop">
<c:forEach items="${pageInfo.list }" var="p">
            <div class="room-box mb-30">
                <div class="row no-gutters justify-content-center">
                    <div class="col-lg-5 col-md-10">
                        <div class="room-img-wrap">
                            <div class="room-img" style="background-image: url(upload/${p.img}); "></div>
                        </div>
                    </div>
                    <div class="col-lg-7 col-md-10">
                        <div class="room-desc" style="height: 350px;">
                            <div class="row align-items-center">
                                <div class="col-sm-8">
                                    <%--<ul class="icons">
                                        <li><i class="fal fa-bed"></i></li>
                                        <li><i class="fal fa-wifi"></i></li>
                                        <li><i class="fal fa-car"></i></li>
                                        <li><i class="fal fa-coffee"></i></li>
                                        <li><i class="fal fa-concierge-bell"></i></li>
                                        <li><i class="fal fa-compress-arrows-alt"></i></li>
                                        <li><i class="fal fa-swimmer"></i></li>
                                    </ul>--%>
                                    <h4 class="title"><a href="showGoods.do?id=${p.id }">${p.name}</a></h4>

                                    <p> </p>
                                </div>
                                <div class="col-sm-4">
                                    <div class="text-sm-center">
                                        <span class="price">¥:${p.price}<span>/份</span> </span>
                                        <a href="showGoods.do?id=${p.id }" class="book-btn">查看</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
</c:forEach>

        </div>
        <div class="pagination-wrap">
            <ul>



               

                
                     <c:if test="${sessionScope.p==1 }">
                         <a  href="#" aria-label="Previous"> 当前第${pageInfo.pageNum}页；总共${pageInfo.pages} 页，共${pageInfo.total} 条数据; &nbsp;</a>
                       <li class="page-item " >
                         <a  href="showGoodsList.do?page=1" aria-label="Previous">首页</a>
                       </li>
                       <c:if test="${pageInfo.hasPreviousPage}">
                         <li  ><a  href="showGoodsList.do?page=${pageInfo.pageNum-1}">上一页</a></li>
                       </c:if>
                       <c:forEach items="${pageInfo.navigatepageNums}" var="page_num">
                         <c:if test="${page_num==pageInfo.pageNum}">
                           <li><a  href="#">${page_num}</a></li>
                         </c:if>
                         <c:if test="${page_num!=pageInfo.pageNum}">
                           <li><a  href="showGoodsList.do?page=${page_num}">${page_num}</a></li>
                         </c:if>
                       </c:forEach>
                       <c:if test="${pageInfo.hasNextPage}">
                         <li  ><a  href="showGoodsList.do?page=${pageInfo.pageNum+1}">下一页</a></li>
                       </c:if>
                       <li>
                         <a  href="showGoodsList.do?page=${pageInfo.pages}" aria-label="Next">尾页</a>
                       </li>
                        </c:if>
               <%-- <li><a href="#"><i class="far fa-angle-double-left"></i></a></li>
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
<!--====== ROOM-LIST END ======-->
<!--====== Back to Top ======-->
<a href="#" class="back-to-top" id="backToTop">
    <i class="fal fa-angle-double-up"></i>
</a>
<!--====== FOOTER PART START ======-->
<jsp:include page="footer.jsp"></jsp:include>


</body>

</html>

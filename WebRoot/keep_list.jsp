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
            <span>收藏</span>
            <h2 class="page-title">收藏</h2>

            <ul class="breadcrumb-nav">
                <li><a href="index">首页</a></li>
                <li class="active">收藏</li>
            </ul>
        </div>
    </div>
</section>






<!--====== BREADCRUMB PART END ======-->

<div class="datalist_show">
    <div class="datatable_height confirm">
        <table class="table table_list table_striped table-bordered" id="covar_list">
            <thead>
            <tr>
                <!-- <th width="25px"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th> -->
                <th >序号</th>
                <th >名称</th>
                <th >收藏人</th>
                <th >收藏时间</th>
                <th width="100px">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${page.pageData }" var="u" varStatus="num">
                <tr>
                    <!--  <td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td> -->
                    <td>${num.count }</td>
                    <td><c:forEach items="${glist}" var="g">
                        <c:if test="${g.id==u.gid}">
                            <a href="GoodsServlet?method=showGoodsx&&id=${g.id}">${g.name}</a>
                        </c:if>
                    </c:forEach></td>
                    <td><c:forEach items="${ulist}" var="g">
                        <c:if test="${g.id==u.uid}">
                           ${g.tname}(${g.uname})
                        </c:if>
                    </c:forEach></td>
                    <td>${u.pubtime }</td>
                    <td>
                        <a title="删除"  href="<%=path%>/KeepServlet?method=deleteKeep&&id=${u.id }"  class="btn btn-xs btn-info" >删除</a>
                    </td>
                </tr>
            </c:forEach>
            <tr>
                <td colspan="11" style="text-align: center">
                
                <%-- <c:if test="${sessionScope.p==1 }"> --%>
                         	当前第${page.currentPage}页；共${page.totalPage}页；总共${page.totalCount}条记录；
                            <c:if test="${page.currentPage>1}">
                                <a href="<%=path%>/KeepServlet?method=keepList&&currentPage=1" >首页</a>
                                <a href="<%=path%>/KeepServlet?method=keepList&&currentPage=${page.currentPage-1 }"> 上一页</a>
                                <a >下一页</a>
                                <a >末页</a>
                            </c:if>
                            <c:if test="${page.currentPage<page.totalPage}">
                                <a >首页</a>
                                <a > 上一页</a>
                                <a href="<%=path%>/KeepServlet?method=keepList&&currentPage=${page.currentPage+1 }">下一页</a>
                                <a href="<%=path%>/KeepServlet?method=keepList&&currentPage=${page.totalPage }">末页</a>
                            </c:if>
                        <%-- </c:if> --%>
                    
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</div>


<!--====== PLACES CONTENT END ======-->
<!--====== Back to Top ======-->


<jsp:include page="footer.jsp"></jsp:include>

</body>

</html>


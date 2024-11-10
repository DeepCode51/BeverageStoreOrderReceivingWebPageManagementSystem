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
            <span>投诉及建议</span>
            <h2 class="page-title">投诉及建议</h2>

            <ul class="breadcrumb-nav">
                <a href="index">首页</a>
                <li class="active">投诉及建议
            </ul>
        </div>
    </div>
</section>






<!--====== BREADCRUMB PART END ======-->

<div class="datalist_show">
    <div class="datatable_height confirm">
        <table class="table table_list table_striped table-bordered" id="covar_list">
            <thead>
            <tr><td colspan="7"><a href="bbs_add.jsp" class="main-btn btn-filled">添加</a></td></tr>
            <tr>
                <!-- <th width="25px"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th> -->
                <th >序号</th>
                <th >标题</th>
                <th >投诉及建议内容</th>
                <th >投诉及建议时间</th>
                <th >回复内容</th>
                <th >回复时间</th>
                <th width="100px">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${pageInfo.list }" var="u" varStatus="num">
                <tr>
                    <!--  <td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td> -->
                    <td>${num.count }</td>
                    <td>${u.name }</td>
                    <td>${u.note }</td>
                    <td>${u.pubtime }</td>
                    <td>${u.note2 }</td>
                    <td>${u.etime }</td>
                    <td>
                        <a title="删除"  href="deleteBbs?id=${u.id }"  class="btn btn-xs btn-info" >删除</a>
                    </td>
                </tr>
            </c:forEach>
            <tr>
                <td colspan="11" style="text-align: center">
                    当前第${pageInfo.pageNum}页；总共${pageInfo.pages} 页，共${pageInfo.total} 条数据; &nbsp;
                    <a  href="bbsList.do?page=1" aria-label="Previous" class="btn btn-xs btn-info">首页</a>
                    <c:if test="${pageInfo.hasPreviousPage}">
                        <a  href="bbsList.do?page=${pageInfo.pageNum-1}" class="btn btn-xs btn-info">上一页</a>
                    </c:if>
                    <c:forEach items="${pageInfo.navigatepageNums}" var="page_num">
                        <c:if test="${page_num==pageInfo.pageNum}">
                            <a  href="#" class="btn btn-xs btn-info">${page_num}</a>
                        </c:if>
                        <c:if test="${page_num!=pageInfo.pageNum}">
                            <a  href="bbsList.do?page=${page_num}" class="btn btn-xs btn-info">${page_num}</a>
                        </c:if>
                    </c:forEach>
                    <c:if test="${pageInfo.hasNextPage}">
                        <a  href="bbsList.do?page=${pageInfo.pageNum+1}" class="btn btn-xs btn-info">下一页</a>
                    </c:if>
                    <a  href="bbsList.do?page=${pageInfo.pages}" aria-label="Next" class="btn btn-xs btn-info">尾页</a>
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


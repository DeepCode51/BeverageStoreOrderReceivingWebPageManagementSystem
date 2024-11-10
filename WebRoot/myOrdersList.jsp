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
            <span>订单详情</span>
            <h2 class="page-title">订单详情</h2>

            <ul class="breadcrumb-nav">
                <li><a href="index">首页</a></li>
                <li class="active">订单详情</li>
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
                <th >订单编号</th>
                <th >饮品名称</th>
                <th >饮品图片</th>
                <th >下单时间</th>
                <th >制作时间</th>
                <th >总价</th>
                <th >定制差价</th>
                <th >数量</th>
                <th >目前状态</th>
                <th >定制说明</th>
                <th width="250px">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${pageInfo.list }" var="o">
                <tr>
                    <!--  <td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td> -->
                    <td>${o.ono}</td>
                    <td>
                        <c:forEach items="${glist }" var="h">
                            <c:if test="${h.id==o.fid }">
                                <a href="showGoods.do?id=${h.id }">${h.name }</a>
                            </c:if>
                        </c:forEach>
                    </td>
                    <td><c:forEach items="${glist }" var="h">
                        <c:if test="${h.id==o.fid }">
                            <img src="upload/${h.img }" width="50" height="30"/>
                        </c:if>
                    </c:forEach>
                    </td>
                    <td>${o.pubtime }</td>
                    <td>${o.ytime }</td>
                    <td>${o.zprice }</td>
                    <td>${o.bprice }</td>
                    <td>${o.amount }</td>
                    <td>${o.status }</td>
                    <td>${o.mark}</td>
                    <td>
                        <a title="查看"  href="orderx.do?id=${o.id }"  class="btn btn-xs btn-info" >查看</a>
                        <c:if test="${o.status=='已支付，待配送' }">
                            <a title="退货"  href="tuiHuo.do?id=${o.id }"  class="btn btn-xs btn-info" >退货</a>
                        </c:if>
                        <c:if test="${o.status=='待支付差价' }">
                            <a title="支付"  href="zhiFu.do?id=${o.id }"  class="btn btn-xs btn-info" >支付</a>
                            <a title="退货"  href="tuiHuo.do?id=${o.id }"  class="btn btn-xs btn-info" >退货</a>
                        </c:if>
                        <c:if test="${o.status=='配送中'||o.status=='配送完成' }">
                            <a title="收货"  href="wanChen.do?id=${o.id }"  class="btn btn-xs btn-info" >收货</a>
                        </c:if>
                        <c:if test="${o.status=='已退货，退款' }">
                            <a title="删除"  href="deleteOrdersF.do?id=${o.id }"  class="btn btn-xs btn-info" >删除</a>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
            <tr>
                <td colspan="20" style="text-align: center">

                        当前第${pageInfo.pageNum}页；总共${pageInfo.pages} 页，共${pageInfo.total} 条数据; &nbsp;
                        <a  href="myOrdersList.do?page=1" aria-label="Previous" class="btn btn-xs btn-info">首页</a>
                        <c:if test="${pageInfo.hasPreviousPage}">
                           <a  href="myOrdersList.do?page=${pageInfo.pageNum-1}" class="btn btn-xs btn-info">上一页</a>
                        </c:if>
                        <c:forEach items="${pageInfo.navigatepageNums}" var="page_num">
                            <c:if test="${page_num==pageInfo.pageNum}">
                               <a  href="#" class="btn btn-xs btn-info">${page_num}</a>
                            </c:if>
                            <c:if test="${page_num!=pageInfo.pageNum}">
                              <a  href="myOrdersList.do?page=${page_num}" class="btn btn-xs btn-info">${page_num}</a>
                            </c:if>
                        </c:forEach>
                        <c:if test="${pageInfo.hasNextPage}">
                            <a  href="myOrdersList.do?page=${pageInfo.pageNum+1}" class="btn btn-xs btn-info">下一页</a>
                        </c:if>
                        <a  href="myOrdersList.do?page=${pageInfo.pages}" aria-label="Next" class="btn btn-xs btn-info">尾页</a>


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


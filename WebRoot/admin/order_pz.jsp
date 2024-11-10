<%@page import="com.util.Info"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-cn">

<jsp:include page="head.jsp"></jsp:include>

<script src="assets/js/reg.js"></script>
<body>
<div class="wrapper">

    <jsp:include page="header.jsp"></jsp:include>

    <!-- Sidebar -->
    <jsp:include page="sidebar.jsp"></jsp:include>




    <div class="main-panel">
        <div class="content">
            <div class="page-inner">
                <div class="page-header">
                    <h4 class="page-title">订单设置差价</h4>
                    <ul class="breadcrumbs">
                        <li class="nav-home">
                            <a href="#">
                                <i class="flaticon-home"></i>
                            </a>
                        </li>
                        <li class="separator">
                            <i class="flaticon-right-arrow"></i>
                        </li>
                        <li class="nav-item">
                            <a href="#">订单设置差价</a>
                        </li>
                        <li class="separator">
                            <i class="flaticon-right-arrow"></i>
                        </li>
                        <li class="nav-item">
                            <a href="#">订单</a>
                        </li>
                    </ul>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <form action="addOrders_pz.do" method="post" ><!-- enctype="multipart/form-data" -->
                            <div class="card-header">
                                <div class="card-title">修改订单</div>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6 col-lg-4">
                                        <div class="form-group">
                                            <label >订单名：</label>
                                            ${order.ono }
                                            <input type="hidden" value="${order.id}" name="id">
                                            <small id="checku" class="form-text text-muted"></small>
                                        </div>
                                        <div class="form-group">
                                            <label >饮品名称：</label>
                                               ${goods.name}
                                        </div>
                                        <div class="form-group">
                                            <label>图片</label>
                                            <img src="../upload/${goods.img}" width="50px;" height="50px;">
                                        </div>
                                        <div class="form-group">
                                            <label >定制说明：</label>
                                            ${order.mark}
                                        </div>
                                        <div class="form-group">
                                            <label >制作时间：</label>
                                            <input type="text" class="form-control"  name="ytime" placeholder="请输入制作时间：" >
                                        </div>
                                        <div class="form-group">
                                            <label >差价：</label>
                                            <input type="text" class="form-control"  name="bprice" placeholder="请输入差价：" >
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="card-action">
                                <button class="btn btn-success">提交</button>
                                <%--<button class="btn btn-danger">Cancel</button>--%>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <jsp:include page="footer.jsp"></jsp:include>

    </div>

    <!-- Custom template | don't include it in your project! -->
    <jsp:include page="set.jsp"></jsp:include>

    <!-- End Custom template -->
</div>
<!--   Core JS Files   -->
<jsp:include page="jscode.jsp"></jsp:include>

</body>
</html>
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

<body>
<div class="wrapper">

    <jsp:include page="header.jsp"></jsp:include>

    <!-- Sidebar -->
    <jsp:include page="sidebar.jsp"></jsp:include>




    <div class="main-panel">
        <div class="content">
            <div class="page-inner">
                <div class="page-header">
                    <h4 class="page-title">新闻查看</h4>
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
                            <a href="#">新闻</a>
                        </li>
                        <li class="separator">
                            <i class="flaticon-right-arrow"></i>
                        </li>
                        <li class="nav-item">
                            <a href="#">查看</a>
                        </li>
                    </ul>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <form action="updateNews.do" method="post" enctype="multipart/form-data" ><!-- enctype="multipart/form-data" -->
                        <div class="card">
                            <div class="card-header">
                                <div class="card-title">新闻查看</div>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6 col-lg-4">
                                        <div class="form-group">
                                            <label for="name">新闻名：</label>
                                            <input type="text" class="form-control" id="name" name="name" value="${news.name}" placeholder="请输入新闻名" readonly >
                                            <input type="hidden" value="${news.id}" name="id">
                                        </div>

                                        <%--<div class="form-group">
                                            <label for="exampleFormControlSelect1">类型：</label>
                                            <select class="form-control" id="exampleFormControlSelect1" name="ntype">
                                                <option value="${news.ntype}">${news.ntype}</option>
                                            </select>
                                        </div>--%>
                                        <div class="form-group">
                                            <label >图片:</label>
                                            <img src="../upload/${news.img}" width="50px;" height="50px;">

                                           <%-- <%=Info.getImgUpInfo(95) %>--%>
                                        </div>
                                        <div class="form-group">
                                            <label >内容</label>
                                           ${news.note}
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-action">
                                <%--<button class="btn btn-success" type="submit" >提交</button>--%>
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
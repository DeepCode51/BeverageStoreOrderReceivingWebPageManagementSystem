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
<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
<body>
<div class="wrapper">

    <jsp:include page="header.jsp"></jsp:include>

    <!-- Sidebar -->
    <jsp:include page="sidebar.jsp"></jsp:include>




    <div class="main-panel">
        <div class="content">
            <div class="page-inner">
                <div class="page-header">
                    <h4 class="page-title">商品添加</h4>
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
                            <a href="#">商品添加</a>
                        </li>
                        <li class="separator">
                            <i class="flaticon-right-arrow"></i>
                        </li>
                        <li class="nav-item">
                            <a href="#">商品</a>
                        </li>
                    </ul>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <form action="addGoods.do" method="post" enctype="multipart/form-data" ><!-- enctype="multipart/form-data" -->
                            <div class="card-header">
                                <div class="card-title">添加商品</div>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6 col-lg-4">
                                        <div class="form-group">
                                            <label for="name">名称：</label>
                                            <input type="text" class="form-control" id="name" name="name" placeholder="请输入名称" >
                                            <small id="checku" class="form-text text-muted"></small>
                                        </div>
                                        <div class="form-group">
                                            <label for="fid">分类：</label>
                                            <select class="form-control" id="exampleFormControlSelect1" name="fid" id="fid">
                                                <c:forEach items="${tlist }" var="t">
                                                    <option value="${t.id }">${t.name }</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="price">价格：</label>
                                            <input type="text" class="form-control" id="price" name="price" placeholder="请输入价格：" >
                                        </div>
                                      <div class="form-group">
                                        <label >推荐：</label>
                                        <select class="form-control"  name="status" >
                                            <option value="正常">正常</option>
                                            <option value="推荐">推荐</option>
                                        </select>
                                      </div>
                                        <div class="form-group">
                                            <label for="file">图片</label>
                                            <input type="file" class="form-control-file" name="file" id="file">
                                        </div>

                                        <div class="form-group">
                                            <label for="note">内容：</label>
                                            <textarea class="form-control" id="note" rows="5" name="note"></textarea>
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
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
                    <h4 class="page-title">${tableNameCn}添加</h4>
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
                            <a href="#">${tableNameCn}列表</a>
                        </li>
                        <li class="separator">
                            <i class="flaticon-right-arrow"></i>
                        </li>
                        <li class="nav-item">
                            <a href="#">${tableNameCn}</a>
                        </li>
                    </ul>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <form action="add${Domain}.do" method="post" enctype="multipart/form-data" ><!-- enctype="multipart/form-data" -->
                                <div class="card-header">
                                    <div class="card-title">添加${tableNameCn}</div>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-12 col-lg-12">
                                            <#list fieldList as field>
                                                <#if field.nameHump!="pubtime" && field.nameHump!="id"&& field.nameHump!="upload"&& field.nameHump!="upload2"
                                                && field.nameHump!="upload3"&& field.nameHump!="note">
                                                  <div class="form-group">
                                                  <label>${field.nameCn}：</label>
                                                  <input   name="${field.nameHump}" class="form-control" placeholder="请输入${field.nameCn}">
                                                  </div>
                                                </#if>
                                                 <#if field.nameHump=="img">
                                                  <div class="form-group">
                                                    <label>${field.nameCn}：</label>
                                                    <input type="file"  name="file" class="form-control">
                                                  </div>
                                                 </#if>
                                                <#if field.nameHump=="upload">
                                                  <div class="form-group">
                                                      <label>${field.nameCn}：</label>
                                                      <input type="file"  name="file" class="form-control">
                                                  </div>
                                                </#if>

                                                <#if field.nameHump=="upload2">
                                                  <div class="form-group">
                                                      <label>${field.nameCn}：</label>
                                                      <input type="file"  name="img2" class="form-control" >
                                                  </div>
                                                </#if>
                                                <#if field.nameHump=="upload3">
                                                  <div class="form-group">
                                                      <label>${field.nameCn}：</label>
                                                      <input type="file"  name="img3" class="form-control">
                                                  </div>
                                                </#if>
                                                <#if field.nameHump=="note">
                                                  <div class="form-group">
                                                      <label>${field.nameCn}：</label>
                                                      <textarea class="form-control" id="note" rows="5" name="note"></textarea>
                                                  </div>
                                                </#if>
                                            </#list>
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
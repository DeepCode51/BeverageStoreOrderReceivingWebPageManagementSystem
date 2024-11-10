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
                    <h4 class="page-title">投诉及建议反馈修改</h4>
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
                            <a href="#">投诉及建议反馈修改</a>
                        </li>
                        <li class="separator">
                            <i class="flaticon-right-arrow"></i>
                        </li>
                        <li class="nav-item">
                            <a href="#">投诉及建议反馈</a>
                        </li>
                    </ul>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <form action="updateBbs.do" method="post" ><!-- enctype="multipart/form-data" -->
                            <div class="card-header">
                                <div class="card-title">修改投诉及建议反馈</div>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6 col-lg-4">
                                        <div class="form-group">
                                            <label for="name">标题：</label>
                                            <input type="text" class="form-control" id="name" name="name" placeholder="请输入投诉及建议反馈名" value="${bbs.name}" >
                                            <input type="hidden" name="id"  value="${bbs.id}" />
                                            <small id="checku" class="form-text text-muted"></small>
                                        </div>

                                        <div class="form-group">
                                            <label for="editor_id">投诉及建议内容：</label>
                                            ${bbs.note}
                                        </div>
                                        <div class="form-group">
                                            <label for="editor_id">回复内容：</label>
                                            <textarea class="form-control" id="editor_id" rows="5" name="note2"></textarea>
                                        </div>
                                        <%--<div class="form-check">
                                            <label class="form-check-label">
                                                <input class="form-check-input" type="checkbox" value="">
                                                <span class="form-check-sign">Agree with terms and conditions</span>
                                            </label>
                                        </div>--%>
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
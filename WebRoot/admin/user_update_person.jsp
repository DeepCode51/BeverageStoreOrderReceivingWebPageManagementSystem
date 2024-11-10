<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.util.Info" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html >

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
                    <h4 class="page-title">用户修改</h4>
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
                            <a href="#">用户修改</a>
                        </li>
                        <li class="separator">
                            <i class="flaticon-right-arrow"></i>
                        </li>
                        <li class="nav-item">
                            <a href="#">用户</a>
                        </li>
                    </ul>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <div class="card-title">用户修改</div>
                            </div>
                            <form action="updatePersonUser.do" method="post" enctype="multipart/form-data">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6 col-lg-4">
                                        <div class="form-group">
                                            <label class="control-label">
                                               		 用户名：
                                            </label>
                                            <p class="form-control-static">${users.uname}</p>
                                            <input type="hidden" value="${users.id}" name="id">
                                        </div>
                                            <div class="form-group">
                                                <label for="tname">姓名：</label>
                                                <input type="text" class="form-control" id="tname" name="tname" value="${users.tname }" placeholder="请输入姓名：">
                                                <small id="checkPwd" class="form-text text-muted"></small>
                                            </div>

                                        <div class="form-group">
                                            <label >密码：</label>
                                            <input type="password" class="form-control" id="pwdc" name="pwd" value="${users.pwd}">
                                            <small id="checkPwdc" class="form-text text-muted"></small>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleFormControlFile1">图片:</label>
                                            <img src="../upload/${users.img}" width="50px;" height="50px;">
                                            <input type="file" class="form-control-file" name="file" id="exampleFormControlFile1">
                                        </div>

                                        <div class="form-check">
                                            <label>性别：</label><br/>
                                            <label class="form-radio-label">
                                                <input class="form-radio-input" type="radio" name="sex" value="男"
                                                <c:if test="${users.sex=='男'}">checked=""</c:if> >
                                                <span class="form-radio-sign">男</span>
                                            </label>
                                            <label class="form-radio-label ml-3">
                                                <input class="form-radio-input" type="radio" name="sex" value="女" <c:if test="${users.sex=='女'}">checked=""</c:if>>
                                                <span class="form-radio-sign">女</span>
                                            </label>
                                        </div>
                                        <div class="form-group">
                                            <label for="tel">电话：</label>
                                            <input type="text" class="form-control" id="tel" name="tel" placeholder="请输入电话" value="${users.tel}" onblur="checkTel();">
                                            <small id="checkTel" class="form-text text-muted"></small>
                                        </div>

                                        <div class="form-group">
                                            <label for="">地址：</label>
                                            <input type="text" class="form-control" id="address" name="address" value="${users.address}" placeholder="请输入地址"  >
                                            <small class="form-text text-muted"></small>
                                        </div>
                                        <div class="form-group">
                                            <label for="email">电子邮箱：</label>
                                            <input type="email" class="form-control" id="email" name="email" value="${users.email}" placeholder="请输入电子邮箱"  >
                                            <small id="" class="form-text text-muted"></small>
                                        </div>

                                    </div>

                                </div>
                            </div>
                            <div class="card-action">
                                <button class="btn btn-success" type="submit">提交</button>
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
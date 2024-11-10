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
                    <h4 class="page-title">类别修改</h4>
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
                            <a href="#">类别</a>
                        </li>
                        <li class="separator">
                            <i class="flaticon-right-arrow"></i>
                        </li>
                        <li class="nav-item">
                            <a href="#">修改</a>
                        </li>
                    </ul>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <form action="#" method="post" >
                        <div class="card">
                            <div class="card-header">
                                <div class="card-title">类别修改</div>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6 col-lg-4">
                                        <div class="form-group">
                                            <label for="name">名称：</label>
                                            <input type="text" class="form-control" id="name" name="name" value="${ftype.name}" placeholder="请输入类别名" onblur="return updateTypeName();" >
                                            <small id="checkTypeName" class="form-text text-muted"></small>
                                            <input type="hidden" value="${ftype.id}" name="id" id="id">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-action">
                                <%--<button class="btn btn-success" type="submit" >提交</button>--%>
                                <%--<button class="btn btn-danger">Cancel</button>--%>
                            </div>
                        </div>
                        </form>
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
<script type="text/javascript">
    function checkName() {
        var name = $("#name").val();
        var tid = $("#tid").val();
        if(name==""||(name.length<1||name.length>12)){
            $("#checku").html("名称不能为空且长度在1～12位之间！");
            $("input[id=name]").focus();
        } else {
            $("#checku").html("");
            $.ajax({
                url : "<%=path%>/FtypeServlet?method=admin/updateFtype",
                type : "post",
                data : {"name":name,"id":tid},
                dataType : "json",
                success:function(result){
                    if(result.info=="ok"){
                        $("#checku").html("名称存在，请更换！");
                        return false;
                    }else{
                        $("#checku").html("更新成功！");
                        return true;
                    }
                },
                error:function(){
                    alert("请求失败！");
                    return false;
                }

            });
        }

    }
</script>

</body>
</html>
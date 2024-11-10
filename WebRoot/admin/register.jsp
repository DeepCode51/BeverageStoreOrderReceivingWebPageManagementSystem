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

   <%--  <jsp:include page="header.jsp"></jsp:include> --%>

    <!-- Sidebar -->
    <%-- <jsp:include page="sidebar.jsp"></jsp:include> --%>




    <div class="main-panel">
        <div class="content">
            <div class="page-inner">
                <div class="page-header">
                    <h4 class="page-title">注册</h4>
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
                            <a href="#">用户</a>
                        </li>
                        <li class="separator">
                            <i class="flaticon-right-arrow"></i>
                        </li>
                        <li class="nav-item">
                            <a href="#">用户信息</a>
                        </li>
                    </ul>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <form action="reg.do" method="post" enctype="multipart/form-data"><!--  -->
                            <div class="card-header">
                                <div class="card-title">注册</div>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6 col-lg-4">
                                        <%--<div class="form-group">
                                            <label for="email2">用户名：</label>
                                            <input type="text" class="form-control" id="username" name="uname" placeholder="请输入用户名"  onblur="checkName()">
                                            <small id="checku" class="form-text text-muted"></small>
                                        </div>--%>
                                        <div class="form-group">
                                            <label for="username">用户名：</label>
                                            <div class="input-icon">
													<span class="input-icon-addon">
														<i class="fa fa-user"></i>
													</span>
                                                <input type="text" class="form-control" id="username" name="uname" placeholder="请输入用户名"  onblur="checkName()">
                                                <small id="checku" class="form-text text-muted"></small>
                                                <input type="hidden" name="isdel" value="在用">
                                                <input type="hidden" name="money" value="0">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="tname">姓名：</label>
                                            <input type="text" class="form-control" id="tname"  name="tname" placeholder="请输入用户姓名" >
                                            <small id="checkName" class="form-text text-muted"></small>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtPwd">密码：</label>
                                            <input type="password" class="form-control" id="txtPwd" placeholder="请输入密码：" onblur="checkPwd();">
                                            <small id="checkPwd" class="form-text text-muted"></small>
                                        </div>
                                        <div class="form-group">
                                            <label >重复密码：</label>
                                            <input type="password" class="form-control" id="txtConfirmPwd" name="pwd" placeholder="请输入确认密码：" onblur="checkPwdc();">
                                            <small id="checkPwdc" class="form-text text-muted"></small>
                                        </div>


                                       <div class="form-check">
                                            <label>性别：</label><br/>
                                            <label class="form-radio-label">
                                                <input class="form-radio-input" type="radio" name="sex" value="男"  checked="">
                                                <span class="form-radio-sign">男</span>
                                            </label>
                                            <label class="form-radio-label ml-3">
                                                <input class="form-radio-input" type="radio" name="sex" value="女">
                                                <span class="form-radio-sign">女</span>
                                            </label>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleFormControlSelect1">角色：</label>
                                            <select class="form-control" id="exampleFormControlSelect1" name="utype">
                                                <option value="顾客">顾客</option>
                                                <option value="员工">员工</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="tel">电话：</label>
                                            <input type="text" class="form-control" id="tel" name="tel" placeholder="请输入电话"  onblur="checkTel();">
                                            <small id="checkTel" class="form-text text-muted"></small>
                                        </div>


                                        <div class="form-group">
                                            <label for="exampleFormControlFile1">图片</label>
                                            <%--<%=Info.getImgUpInfo(95) %>--%>
                                           <input type="file" class="form-control-file" name="file" id="exampleFormControlFile1">
                                        </div>

                                       <div class="form-group">
                                            <label for="address">地址：</label>
                                            <input type="text" class="form-control" id="address" name="address" placeholder="请输入地址"  >
                                            <small class="form-text text-muted"></small>
                                        </div>

                                        <div class="form-group">
                                            <label for="email">邮箱：</label>
                                            <input type="email" class="form-control" id="email" name="email" placeholder="请输入邮箱"  >
                                            <small class="form-text text-muted"></small>
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


<script >
function checkName() {
    var name = $("#username").val();
    if(name==""||(name.length<2||name.length>12)){
        $("#checku").html("用户号不能为空且长度在2——12位！");
        $("input[id=username]").focus();
    } else {
        $("#checku").html("");
        $.ajax({
            url : "checkUname.do",
            type : "post",
            data : "uname=" + name,

            dataType : "json",
            success:function(result){
                if(result.info=="ng"){
                    $("#checku").html("用户名存在，请更换！");
                    $("input[id=username]").html("");
                    return false;
                }else{
                    $("#checku").html("可以用");
                    return true;
                }
            },
            error:function(){
                alert("请求失处理中！");
                return false;
            }

        });
    }

}
    $(document).ready(function() {
        $('#basic-datatables').DataTable({
        });

        $('#multi-filter-select').DataTable( {
            "pageLength": 5,
            initComplete: function () {
                this.api().columns().every( function () {
                    var column = this;
                    var select = $('<select class="form-control"><option value=""></option></select>')
                        .appendTo( $(column.footer()).empty() )
                        .on( 'change', function () {
                            var val = $.fn.dataTable.util.escapeRegex(
                                $(this).val()
                            );

                            column
                                .search( val ? '^'+val+'$' : '', true, false )
                                .draw();
                        } );

                    column.data().unique().sort().each( function ( d, j ) {
                        select.append( '<option value="'+d+'">'+d+'</option>' )
                    } );
                } );
            }
        });

        // Add Row
        $('#add-row').DataTable({
            "pageLength": 5,
        });

        var action = '<td> <div class="form-button-action"> <button type="button" data-toggle="tooltip" title="" class="btn btn-link btn-primary btn-lg" data-original-title="Edit Task"> <i class="fa fa-edit"></i> </button> <button type="button" data-toggle="tooltip" title="" class="btn btn-link btn-danger" data-original-title="Remove"> <i class="fa fa-times"></i> </button> </div> </td>';

        $('#addRowButton').click(function() {
            $('#add-row').dataTable().fnAddData([
                $("#addName").val(),
                $("#addPosition").val(),
                $("#addOffice").val(),
                action
            ]);
            $('#addRowModal').modal('hide');

        });
    });
</script>
</body>
</html>
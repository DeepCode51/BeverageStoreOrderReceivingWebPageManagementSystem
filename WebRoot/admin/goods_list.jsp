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
                    <h4 class="page-title">商品信息列表</h4>
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
                            <a href="#">商品表</a>
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
                            <div class="card-header">
                                <div class="d-flex align-items-center">
                                    <h4 class="card-title">列表</h4>
                                    <button class="btn btn-primary btn-round ml-auto" data-toggle="modal" data-target="#addRowModal" onclick="window.location.href='doAddGoods.do'">
                                        <i class="fa fa-plus">添加</i>
                                    </button>
                                </div>
                            </div>
                            <div class="card-body">
                                <!-- Modal 添加信息-->

                                <div class="table-responsive">
                                    <table id="add-row" class="display table table-striped table-hover" >
                                        <thead>
                                        <tr>
                                          <th>序号</th>
                                          <th>商品名称</th>
                                          <th>分类</th>
                                          <th>图片</th>
                                          <th>价格</th>
                                          <th>销量</th>
                                          <th>状态</th>
                                          <th style="width: 10%">操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>

                                        <c:forEach items="${list }" var="h" varStatus="num">
                                          <tr>
                                            <td >${num.count }</td>
                                            <td >${h.name }</td>
                                            <td>
                                              <c:forEach items="${tlist }" var="t">
                                                <c:if test="${t.id==h.fid }">
                                                  ${t.name }
                                                </c:if>
                                              </c:forEach>
                                            </td>
                                            <td><img src="../upload/${h.img}" width="50" height="50" /></td>
                                            <td>${h.price }</td>
                                            <td>${h.xnum }</td>
                                            <td>${h.status }</td>
                                            <td>
                                              <div class="form-button-action">
                                                <button type="button" data-toggle="tooltip" title="" class="btn btn-link btn-primary btn-lg" data-original-title="编辑">
                                                  <a href="doUpdateGoods.do?id=${h.id }" >编辑</a>
                                                </button>
                                                <button type="button" data-toggle="tooltip" title="" class="btn btn-link btn-primary btn-lg" data-original-title="删除">
                                                  <a href="deleteGoods.do?id=${h.id }" onclick="return del(1,1,1)" >删除</a>
                                                </button>
                                              </div>
                                            </td>
                                          </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
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
    $(document).ready(function() {
       /* $('#basic-datatables').DataTable({
        });*/

        $('#multi-filter-select').DataTable( {
            "pageLength": 2,
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
            "pageLength": 3,
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

    //单个删除
    function del(id,mid,iscid){
        if(confirm("您确定要删除吗?")){
            return true;
        }else{
            return false;
        }

    }
</script>
</body>
</html>
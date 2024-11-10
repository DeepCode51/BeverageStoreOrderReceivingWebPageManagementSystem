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
                    <h4 class="page-title">${tableNameCn}信息列表</h4>
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
                            <a href="#">${tableNameCn}信息表</a>
                        </li>
                        <li class="separator">
                            <i class="flaticon-right-arrow"></i>
                        </li>
                        <li class="nav-item">
                            <a href="#">${tableNameCn}信息</a>
                        </li>
                    </ul>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <div class="d-flex align-items-center">
                                    <h4 class="card-title">列表</h4> <#--onclick="window.location.href='${domain}_add.jsp'"-->
                                    <button class="btn btn-primary btn-round ml-auto" data-toggle="modal" data-target="#addRowModal">
                                        <i class="fa fa-plus">添加</i>
                                    </button>
                                </div>
                            </div>
                            <div class="card-body">
                                <!-- Modal 添加信息-->
                                <div class="modal fade" id="addRowModal" tabindex="-1" role="dialog" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header no-bd">
                                                <h5 class="modal-title">
													<span class="fw-mediumbold">添加</span>
                                                    <span class="fw-light">${tableNameCn}</span>
                                                </h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <p class="small">创建${tableNameCn}</p>
                                                <form method="post" action="add${Domain}.do" >
                                                    <div class="row">

                                                      <#--<#list fieldList as field>
                                                          <#if field.nameHump!="pubtime" && field.nameHump!="id">
                                                          <div class="col-sm-12">
                                                            <div class="form-group form-group-default">
                                                              <label>${field.nameCn}：</label>
                                                              <input  type="text" name="${field.nameHump}" class="form-control" placeholder="请输入${field.nameCn}">
                                                            </div>
                                                          </div>
                                                          </#if>
                                                      </#list>-->
                                                    </div>
                                                </form>
                                            </div>
                                            <div class="modal-footer no-bd">
                                                <button type="submit" id="addRowButton" class="btn btn-primary">添加</button>
                                                <button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="table-responsive">
                                    <table id="add-row" class="display table table-striped table-hover" >
                                        <thead>
                                        <tr>
                                          <th>序号</th>
                                          <#list fieldList as field>
                                            <#if field.nameHump!="pubtime" && field.nameHump!="id">
                                            <th>${field.nameCn}</th>
                                             </#if>
                                          </#list>
                                          <th style="width: 10%">操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>

                                        <c:forEach items=${r'"${'}list${r'}"'} var="u" varStatus="num">
                                            <tr>
                                                <td>${r"${"}num.count${r"}"}</td>
                                                <#list fieldList as field>
                                                    <#if field.nameHump!="pubtime" && field.nameHump!="id">
                                                    <td>${r'${'}u.${field.nameHump}${r'}'}</td>
                                                    </#if>
                                                </#list>
                                                <td>
                                                    <div class="form-button-action">
                                                        <button type="button" data-toggle="tooltip" title="" class="btn btn-link btn-primary btn-lg" data-original-title="编辑">
                                                            <a href="doUpdate${Domain}.do?id=${r"${"}u.id${r"}"}" ><i class="fa fa-edit"></i></a>
                                                        </button>
                                                        <button type="button" data-toggle="tooltip" title="" class="btn btn-link btn-danger" data-original-title="删除">
                                                            <i class="fa fa-times"></i><a onclick="return del(1,1,1)" href="delete${Domain}.do?id=${r"${"}u.id${r"}"}" >删除</a>
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

  
</script>
</body>
</html>
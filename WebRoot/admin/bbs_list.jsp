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
                    <h4 class="page-title">投诉及建议反馈信息列表</h4>
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
                            <a href="#">投诉及建议反馈表</a>
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
                            <div class="card-header">
                                <div class="d-flex align-items-center">
                                    <h4 class="card-title">列表</h4>
                                    <c:if test="${sessionScope.auser.utype=='顾客'}">
                                    <button class="btn btn-primary btn-round ml-auto" data-toggle="modal" data-target="#addRowModal" onclick="window.location.href='doAddServe.do'">
                                        <i class="fa fa-plus">添加</i>
                                    </button>
                                    </c:if>
                                </div>
                            </div>
                            <div class="card-body">
                                <!-- Modal 添加信息-->
                                <%--<div class="modal fade" id="addRowModal" tabindex="-1" role="dialog" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header no-bd">
                                                <h5 class="modal-title">
														<span class="fw-mediumbold">
														添加</span>
                                                    <span class="fw-light">
															投诉及建议反馈
														</span>
                                                </h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <p class="small">创建新投诉及建议反馈</p>
                                                <form>
                                                    <div class="row">
                                                        <div class="col-sm-12">
                                                            <div class="form-group form-group-default">
                                                                <label>投诉及建议反馈名：</label>
                                                                <input id="addName" type="text" class="form-control" placeholder="fill name">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 pr-0">
                                                            <div class="form-group form-group-default">
                                                                <label>Position</label>
                                                                <input id="addPosition" type="text" class="form-control" placeholder="fill position">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group form-group-default">
                                                                <label>Office</label>
                                                                <input id="addOffice" type="text" class="form-control" placeholder="fill office">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                            <div class="modal-footer no-bd">
                                                <button type="button" id="addRowButton" class="btn btn-primary">Add</button>
                                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>--%>

                                <div class="table-responsive">
                                    <table id="add-row" class="display table table-striped table-hover" >
                                        <thead>
                                        <tr>
                                            <th>序号</th>
                                            <th>名称</th>
                                            <th>发布人</th>
                                            <th>内容</th>
                                            <th>发布时间</th>
                                            <%--<th>用户</th>--%>
                                            <th>回复内容</th>
                                            <th>回复时间</th>
                                            <th>目前状态</th>
                                            <th style="width: 10%">操作</th>
                                        </tr>
                                        </thead>
                                        <%--<tfoot>
                                        <tr>
                                            <th>投诉及建议反馈名</th>
                                            <th>密码</th>
                                            <th>真实姓名</th>
                                            <th>性别</th>
                                            <th>电话</th>
                                            <th>邮箱</th>
                                            <th>地址</th>
                                            <th>加入时间</th>
                                            <th>角色</th>
                                            <!-- <th>状态</th> -->
                                            <th >操作</th>
                                        </tr>
                                        </tfoot>--%>
                                        <tbody>

                                        <c:forEach items="${list }" var="jz" varStatus="num">
                                            <tr>
                                                <td >${num.count }</td>
                                                <td>${jz.name}</td>
                                                <td><c:forEach items="${ulist }" var="ad">
                                                    <c:if test="${jz.uid==ad.id }">
                                                        ${ad.tname}
                                                    </c:if>
                                                </c:forEach></td>
                                                <td>${jz.note}</td>
                                                <td>${jz.pubtime}</td>
                                                <%--<td><c:forEach items="${ulist }" var="ad">
                                                    <c:if test="${jz.yid==ad.id }">
                                                        ${ad.tname}
                                                    </c:if>
                                                </c:forEach></td>--%>
                                                <td>${jz.note2 }</td>
                                                <td>${jz.etime }</td>
                                                <td>${jz.status }</td>
                                                <td>
                                                    <div class="form-button-action">
                                                        <c:if test="${sessionScope.auser.utype=='管理员'}">
                                                        <c:if test="${jz.status=='待回复'}">
                                                            <button type="button" data-toggle="tooltip" title="" class="btn btn-link btn-primary btn-lg" data-original-title="回复">
                                                                <a href="doUpdateBbs.do?id=${jz.id }" ><i class="fa fa-edit">回复</i></a>
                                                            </button>
                                                        </c:if>
                                                        </c:if>
                                                        <c:if test="${sessionScope.auser.utype=='管理员'}">
                                                                <button type="button" data-toggle="tooltip" title="" class="btn btn-link btn-danger" data-original-title="删除">
                                                                    <i class="fa fa-times"></i><a onclick="return del(1,1,1)" href="deleteBbs.do?id=${jz.id }" >删除</a>
                                                                </button>
                                                        </c:if>

                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        <%--<tr>
                                            <c:if test="${sessionScope.p==1 }">
                                                <td colspan="15"> <c:if test="${page.page>1}">
                                                    <a href="ServeList.do?page=1" >首页</a>
                                                    <a href="ServeList.do?page=${page.page-1 }"> 上一页</a>
                                                </c:if>
                                                    <c:if test="${page.page<page.totalPage}">
                                                        <a href="ServeList.do?page=${page.page+1 }">下一页</a>
                                                        <a href="ServeList.do?page=${page.totalPage }">末页</a>
                                                    </c:if>
                                                </td>
                                            </c:if>
                                            <c:if test="${sessionScope.p==2 }">
                                                <td colspan="15"> <c:if test="${page.page>1}">
                                                    <a href="vagueServeList.do?page=1" >首页</a>
                                                    <a href="vagueServeList.do?page=${page.page-1 }"> 上一页</a>
                                                </c:if>
                                                    <c:if test="${page.page<page.totalPage}">
                                                        <a href="vagueServeList.do?page=${page.page+1 }">下一页</a>
                                                        <a href="vagueServeList.do?page=${page.totalPage }">末页</a>
                                                    </c:if>
                                                </td>
                                            </c:if>
                                        </tr>--%>
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
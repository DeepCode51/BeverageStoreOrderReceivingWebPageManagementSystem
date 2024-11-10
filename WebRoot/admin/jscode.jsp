<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%--解决jsp页面中文乱码--%>


<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<%--<!-- Chart JS -->
<script src="assets/js/plugin/chart.js/chart.min.js"></script>
<!-- Chart Circle -->
<script src="assets/js/plugin/chart-circle/circles.min.js"></script>
<!-- Bootstrap Notify -->
<script src="assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>
<!-- jQuery Vector Maps -->
<script src="assets/js/plugin/jqvmap/jquery.vmap.min.js"></script>
<script src="assets/js/plugin/jqvmap/maps/jquery.vmap.world.js"></script>

<!-- Sweet Alert -->
<script src="assets/js/plugin/sweetalert/sweetalert.min.js"></script>

<!-- Atlantis JS -->
<script src="assets/js/atlantis.min.js"></script>

<!-- Atlantis DEMO methods, don't include it in your project! -->
<script src="assets/js/setting-demo.js"></script>
<script src="assets/js/demo.js"></script>--%>


<!--   Core JS Files   -->
<script src="<%=path%>/admin/assets/js/core/jquery.3.2.1.min.js"></script>
<script src="<%=path%>/admin/assets/js/core/popper.min.js"></script>
<script src="<%=path%>/admin/assets/js/core/bootstrap.min.js"></script>
<!-- jQuery UI -->
<script src="<%=path%>/admin/assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
<script src="<%=path%>/admin/assets/js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>

<!-- jQuery Scrollbar -->
<script src="<%=path%>/admin/assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
<!-- Atlantis JS -->
<script src="<%=path%>/admin/assets/js/atlantis.min.js"></script>
<!-- Atlantis DEMO methods, don't include it in your project! -->
<script src="<%=path%>/admin/assets/js/setting-demo2.js"></script>
<!-- 添加验证 -->
<script src="<%=path%>/admin/assets/js/reg.js"></script>
<%--商品分类--%>
<script src="<%=path%>/admin/assets/js/ftype.js"></script>

<!-- Datatables -->
<script src="<%=path%>/admin/assets/js/plugin/datatables/datatables.min.js"></script>


<script charset="utf-8" src="<%=path%>/js/popup.js"></script>

<script charset="utf-8" src="<%=path%>/kindeditor/kindeditor.js"></script>
<script charset="utf-8" src="<%=path%>/kindeditor/lang/en.js"></script>
<script charset="utf-8" src="<%=path%>/kindeditor/lang/zh-CN.js"></script>
<script>
    KindEditor.ready(function(K) {
        window.editor = K.create('#note');
    });
    KindEditor.ready(function(K) {
        window.editor = K.create('#editor_id');
    });
</script>
<script>

    KindEditor.ready(function(K) {

        K.create('textarea[name="note"]', {

            uploadJson : '<%=path%>/kindeditor/jsp/upload_json.jsp',

            fileManagerJson : '<%=path%>/kindeditor/jsp/file_manager_json.jsp',

            allowFileManager : true,

            allowImageUpload : true,

            autoHeightMode : true,

            afterCreate : function() {this.loadPlugin('autoheight');},

            afterBlur : function(){ this.sync(); }  //Kindeditor下获取文本框信息

        });

    });

    KindEditor.ready(function(K) {

        K.create('textarea[id="editor_id"]', {

            uploadJson : '<%=path%>/kindeditor/jsp/upload_json.jsp',

            fileManagerJson : '<%=path%>/kindeditor/jsp/file_manager_json.jsp',

            allowFileManager : true,

            allowImageUpload : true,

            autoHeightMode : true,

            afterCreate : function() {this.loadPlugin('autoheight');},

            afterBlur : function(){ this.sync(); }  //Kindeditor下获取文本框信息

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
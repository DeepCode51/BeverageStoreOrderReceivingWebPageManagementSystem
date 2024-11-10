<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%--解决jsp页面中文乱码--%>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
    <%--<meta http-equiv="X-UA-Compatible" content="IE=edge" />--%>
    <title>首页</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <%--<meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />--%>
    <link rel="icon" href="<%=path%>/admin/assets/img/icon.ico" type="image/x-icon"/>

    <!-- Fonts and icons -->
    <script src="<%=path%>/admin/assets/js/plugin/webfont/webfont.min.js"></script>
    <script>
        WebFont.load({
            google: {"families":["Lato:300,400,700,900"]},
            custom: {"families":["Flaticon", "Font Awesome 5 Solid", "Font Awesome 5 Regular", "Font Awesome 5 Brands", "simple-line-icons"], urls: ['<%=path%>/admin/assets/css/fonts.min.css']},
            active: function() {
                sessionStorage.fonts = true;
            }
        });
    </script>

    <!-- CSS Files -->
    <link rel="stylesheet" href="<%=path%>/admin/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=path%>/admin/assets/css/atlantis.min.css">



    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link rel="stylesheet" href="<%=path%>/admin/assets/css/demo.css">
</head>
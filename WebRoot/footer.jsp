<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!--====== FOOTER PART START ======-->
<footer class="footer-two">
    <%--<div class="footer-subscibe-area style-2 pt-50 pb-50">
        <div class="container">
            <div class="row justify-content-center align-items-center">
                <div class="col-lg-3">
                    <div class="subscribe">
                        <h3 class="mb-0 text-white">Subscribe</h3>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="subscribe-text">
                        <form action="#" class="subscribe-form">
                            <div class="row">
                                <div class="col-lg-4 col-md-4">
                                    <input type="text" placeholder="Your name">
                                </div>
                                <div class="col-lg-5 col-md-5">
                                    <input type="email" placeholder="Your email">
                                </div>
                                <div class="col-lg-3 col-md-3">
                                    <button type="submit" class="main-btn btn-filled">subscribe</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>--%>
    <%--<div class="contact-maps" id="map"></div>--%>
    <div class="footer-widget-area pt-100 pb-50">
        <div class="container">
            <div class="row">
                <%--<div class="col-lg-3 col-sm-6 order-1">
                    <!-- Site Info Widget -->
                    <div class="widget site-info-widget mb-50">
                        <div class="footer-logo mb-50">
                            <img src="assets/img/footer-logo.png" alt="Logo">
                        </div>
                        <p>
                            Lorem ipsum dolor sit amet, consect etur adipisicing elit, sed doing eius mod
                            tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                            quis nostrud exercitat ion ullamco laboris nisi.
                        </p>
                        <div class="social-links mt-40">
                            <a href="#"><i class="fab fa-facebook-f"></i></a>
                            <a href="#"><i class="fab fa-twitter"></i></a>
                            <a href="#"><i class="fab fa-behance"></i></a>
                            <a href="#"><i class="fab fa-linkedin"></i></a>
                            <a href="#"><i class="fab fa-youtube"></i></a>
                        </div>
                    </div>
                </div>--%>
                <%--<div class="col-lg-6 order-3 order-lg-2">
                    <!-- Nav Widget -->
                    <div class="widget nav-widget mb-50">
                        <div>
                            <h4 class="widget-title">Services.</h4>
                            <ul>
                                <li><a href="#">Resturent & Bar</a></li>
                                <li><a href="#">Gaming Zone</a></li>
                                <li><a href="#">Swimming Pool</a></li>
                                <li><a href="#">Marrige Party</a></li>
                                <li><a href="#">Restaurant</a></li>
                                <li><a href="#">Party Planning</a></li>
                                <li><a href="#">Conference Apartment</a></li>
                                <li><a href="#">Tour Consultancy</a></li>
                                <li><a href="#">Coctail Party Houses</a></li>
                            </ul>
                        </div>
                    </div>
                </div>--%>
               <%-- <div class="col-lg-3 col-sm-6 order-2 order-lg-3">
                    <!-- Contact Widget -->
                    <div class="widget contact-widget mb-50">
                        <h4 class="widget-title">Contact Us.</h4>
                        <div class="contact-lists">
                            <div class="contact-box">
                                <div class="icon">
                                    <i class="flaticon-call"></i>
                                </div>
                                <div class="desc">
                                    <h6 class="title">Phone Number</h6>
                                    +987 876 765 76 577
                                </div>
                            </div>
                            <div class="contact-box">
                                <div class="icon">
                                    <i class="flaticon-message"></i>
                                </div>
                                <div class="desc">
                                    <h6 class="title">Email Address</h6>
                                    <a href="#">info@webmail.com</a>
                                </div>
                            </div>
                            <div class="contact-box">
                                <div class="icon">
                                    <i class="flaticon-location-pin"></i>
                                </div>
                                <div class="desc">
                                    <h6 class="title">Office Address</h6>
                                    14/A, Miranda City, NYC
                                </div>
                            </div>
                        </div>
                    </div>
                </div>--%>
            </div>
        </div>
    </div>
    <div class="copyright-area pt-30 pb-30">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-5 order-2 order-md-1">
                    <p class="copyright-text copyright-two">Copyright &copy;  饮品店接单网页 </p>
                </div>
                <div class="col-lg-6 col-md-7 order-1 order-md-2">
                    <div class="footer-menu text-center text-md-right">
                        <%--<ul>
                            <li><a href="#">Terms of use</a></li>
                            <li><a href="#">Privacy Environmental Policy</a></li>
                        </ul>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
<!--====== FOOTER PART END ======-->
<!--====== jquery js ======-->
<script src="assets/js/vendor/modernizr-3.6.0.min.js"></script>
<script src="assets/js/vendor/jquery-1.12.4.min.js"></script>
<!--====== Bootstrap js ======-->
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/popper.min.js"></script>
<!--====== Slick js ======-->
<script src="assets/js/slick.min.js"></script>
<!--====== Isotope js ======-->
<script src="assets/js/isotope.pkgd.min.js"></script>
<!--====== Magnific Popup js ======-->
<script src="assets/js/jquery.magnific-popup.min.js"></script>
<!--====== inview js ======-->
<script src="assets/js/jquery.inview.min.js"></script>
<!--====== counterup js ======-->
<script src="assets/js/jquery.countTo.js"></script>
<!--====== Nice Select ======-->
<script src="assets/js/jquery.nice-select.min.js"></script>
<!--====== Bootstrap datepicker ======-->
<script src="assets/js/bootstrap-datepicker.js"></script>
<!--====== Wow JS ======-->
<script src="assets/js/wow.min.js"></script>
<!--====== Mapbox Map ======-->
<script src="assets/js/leaflet.js"></script>
<script src="assets/js/mapbox-gl.min.js"></script>
<script src="assets/js/map.js"></script>
<!--====== Main js ======-->
<script src="assets/js/main.js"></script>


<script charset="utf-8" src="<%=path%>/kindeditor/kindeditor.js"></script>
<script charset="utf-8" src="<%=path%>/kindeditor/lang/en.js"></script>
<script charset="utf-8" src="<%=path%>/kindeditor/lang/zh-CN.js"></script>
<script>
    KindEditor.ready(function(K) {
        window.editor = K.create('#note');
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
</script>